from flask import Flask, request, jsonify, send_from_directory,render_template,redirect, url_for
import pyodbc
#connectin string 
conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=DESKTOP-Q95UTEC\SQLEXPRESS;'
                      'Database=AccountsDB;'
                      'Trusted_Connection=yes;')

app = Flask(__name__)
host_ip='127.0.0.1'
host_port='5000'

@app.route('/')
def hello_world():
    return render_template('login.html')

@app.route('/accountList/<UID>')
def accountList(UID):
    cursor = conn.cursor()
    cursor.execute("select FirstName, LastName, Role from tbl_account where " +
        "UID='" + UID + "'")
    name = cursor.fetchall()

    db_fl = ""
    db_role = ""
    for col in name:
        db_fl =col[0].strip() + " " + col[1].strip()
        db_role=col[2]

    return render_template('users.html',user_ID=UID,full_name=db_fl,user_role=db_role,host_ip=host_ip,host_port=host_port)

@app.route('/roleList/<UID>')
def roleList(UID):
    cursor = conn.cursor()
    cursor.execute("select FirstName, LastName, Role from tbl_account where " +
        "UID='" + UID + "'")
    name = cursor.fetchall()

    db_fl = ""
    db_role = ""
    for col in name:
        db_fl =col[0].strip() + " " + col[1].strip()
        db_role=col[2]

    return render_template('role.html',user_ID=UID,full_name=db_fl,user_role=db_role,host_ip=host_ip,host_port=host_port)

@app.route('/permissionList/<UID>')
def permissionList(UID):
    cursor = conn.cursor()
    cursor.execute("select FirstName, LastName, Role from tbl_account where " +
        "UID='" + UID + "'")
    name = cursor.fetchall()

    db_fl = ""
    db_role = ""
    for col in name:
        db_fl =col[0].strip() + " " + col[1].strip()
        db_role=col[2]
        
    return render_template('permissions.html',user_ID=UID,full_name=db_fl,user_role=db_role,host_ip=host_ip,host_port=host_port)



@app.route('/signup')
def signup():
    #return sign up html
    SignupPage = open('templates/signup.html').read()

    return SignupPage

@app.route('/api/signup',methods=["POST"])
def api_signup():
    #Get data from user
    input_json = request.get_json(force=True) 
    username = input_json['username']
    password = input_json['password']
    FirstName = input_json['FirstName']
    LastName = input_json['LastName']
    Email = input_json['Email']

    cursor = conn.cursor()
    cursor.execute("INSERT INTO tbl_account (Username,[Password],FirstName,LastName,Email,CreatedDate,UID )" +
        "VALUES"+
        "('"+username+"','"+password+"','"+FirstName+"','"+LastName+"','"+Email+"',GETDATE(),NEWID())")
    conn.commit()

    cursor.execute("select Username, Password, UID from tbl_account where " +
        "Username='" + username + "' and Password='" + password + "'")
    name = cursor.fetchall()

    db_un = ""
    db_ps = ""
    db_uid = ""
    for col in name:
        db_un =col[0].strip()
        db_ps=col[1].strip()
        db_uid=col[2]

    return db_uid


@app.route('/api/login',methods = ['POST'])
def api_login():
    cursor = conn.cursor()
    cursor.execute("select Username, Password, UID from tbl_account where " +
        "Username='" + request.form['username'] + "' and Password='" + request.form['password'] + "'")
    name = cursor.fetchall()

    db_un = ""
    db_ps = ""
    db_uid = ""
    for col in name:
        db_un =col[0].strip()
        db_ps=col[1].strip()
        db_uid=col[2]

    error = None
    if request.form['username'] != db_un or request.form['password'] != db_ps:
        error = 'Invalid Credentials. Please try again.'
    else:
        return redirect(url_for('accountList',UID=db_uid))
    return render_template('login.html', error=error)

@app.route('/red/<name>')
def red(name):
    return 'welcome %s' % name

#Accounts
@app.route('/accounts')
def getToDB():
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM tbl_account')
    names = cursor.fetchall()
    
    mydict = create_dict()
    for col in names:
        mydict.add(col[0],({"firstname":col[3],"lastname":col[4],"role":col[6]}))

    return jsonify(mydict)    

@app.route('/account/delete', methods=["POST"])
def Account_Delete():
    input_json = request.get_json(force=True) 
    accountid=input_json["ID"]

    cursor = conn.cursor()
    cursor.execute("delete tbl_account where accountID="+accountid)
    conn.commit()

    return "Deleted Successfully"


@app.route('/api/permissions',methods = ['POST','GET'])
def api_permissions():
    if request.method == 'GET':
        cursor = conn.cursor()
        cursor.execute('select PID, UID, Pname, Pdesc from tbl_permissions order by PID desc')
        permissions = cursor.fetchall()
        
        mydict = create_dict()
        for col in permissions:
            mydict.add(col[0],({"PID":col[0],"Pname":col[2],"Pdesc":col[3],"UID":col[1]}))

        return jsonify(mydict)
    else:
        input_json = request.get_json(force=True) 
        permission = input_json['permission']
        description = input_json['description']

        cursor = conn.cursor()
        cursor.execute("insert into tbl_permissions (Pname,Pdesc,CreatedDate,UID)"
                "values('"+permission+"','"+description+"',GETDATE(), NEWID())")
        conn.commit()
        return "Successfully saved"

    return "permission"

@app.route('/api/permissions/delete',methods = ['POST'])
def api_permissions_delete():
    input_json = request.get_json(force=True) 
    input_UID = input_json['UID']

    cursor = conn.cursor()
    cursor.execute("delete tbl_permissions where UID='"+input_UID+"'")
    conn.commit()

    cursor = conn.cursor()
    cursor.execute("delete tbl_roles where [Permissions] in" +
        "(select PID from tbl_permissions where UID='"+input_UID+"')")
    conn.commit()
    return "Deleted successfully"

@app.route('/api/roles',methods = ['POST','GET'])
def api_roles():
    if request.method == 'GET':
        cursor = conn.cursor()
        cursor.execute('select rolename from tbl_roles group by rolename')
        roles = cursor.fetchall()
        
        mydict = create_dict()
        for row in roles:
            cursor2 = conn.cursor()
            cursor2.execute("select Pname from tbl_permissions left join tbl_roles on tbl_permissions.pid=tbl_roles.[permissions] where rolename = '"+row[0].rstrip()+"'")
            per = cursor2.fetchall()
            mydict2 = create_dict()
            permissionid=0
            for row2 in per:
                mydict2.add(permissionid,row2[0].rstrip())
                permissionid = permissionid+1
            mydict.add(row[0].rstrip(),mydict2)

        return jsonify(mydict)
    else:
        input_json = request.get_json(force=True) 
        role = input_json['role']
        Permission = input_json['permission']
        # UID=

        for per in Permission:
            cursor = conn.cursor()
            cursor.execute("insert into tbl_roles (RoleName,[Permissions],UID)"
                "values('"+role+"','"+per+"',NEWID())")
        conn.commit()

        return 'Successfull'
    
    return "roles"


@app.route('/api/roles/delete',methods = ['POST'])
def api_roles_delete():
    input_json = request.get_json(force=True) 
    input_role = input_json['RoleName']

    cursor = conn.cursor()
    cursor.execute("delete tbl_roles where RoleName='"+input_role+"'")
    conn.commit()
    return "deleted successfully"    

@app.route('/api/users/addrole',methods = ['POST'])
def api_users_addrole():
    input_json = request.get_json(force=True) 
    user = input_json['user']
    role = input_json['role']

    cursor = conn.cursor()
    cursor.execute("update tbl_account set Role= '"+role+"' where AccountID = "+user+"")
    conn.commit()
    return "Successfully Added"    


@app.route('/permission/<permission>',methods = ['GET'])
def permissions_roles(permission):
    cursor = conn.cursor()
    cursor.execute("select Pname from tbl_permissions left join tbl_roles on tbl_permissions.pid=tbl_roles.[permissions] where rolename = '"+permission+"'")
    roles = cursor.fetchall()
    
    mydict = create_dict()
    for col in roles:
        mydict.add(col[0].rstrip(),col[0].rstrip())

    return jsonify(mydict)


@app.route("/static/<path:path>")
def test(path):
    return send_from_directory("static", path)


@app.route("/<path:path>")
def static_dir(path):
    return send_from_directory("templates", path)

class create_dict(dict): 
    # __init__ function 
    def __init__(self): 
        self = dict() 
          
    # Function to add key:value 
    def add(self, key, value): 
        self[key] = value

if __name__ == '__main__': 
    app.run(host=host_ip, port=host_port, debug=True) 
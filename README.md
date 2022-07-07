<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# System Application

This is a Python-based application built using the Flask framework where users may sign in with a username and password and each user can be given a role with corresponding permissions.


## Getting Started

These instructions will get you a local copy of the project up and running for development and testing. For information on how to install the project on a live system, see deployment.

### REQUIREMENTS

Modules and libraries required to run the system:

```
Flask, request, jsonify, send_from_directory,render_template,redirect, url_for,  pyodbc
```

### How To Install

Please follow the following steps to be able to run the system in your machine. 

1. Make a flask director. In your command window type:

```
#Make a flask firectory
mkdir flask-test
#Go to the directory
cd flask-test
```

2. Install a virtual environment and run it. From the directory go to Scripts and look for activate and run by typing activate to the cmd

```
#Creating virtual environment
virtualenv .
#Running virtualenv
>Scripts\activate
```

3. Using command window, install flask in the virtual environment and run the API.

```
#To install Flask in virtual environment
Python -m pip install Flask
#To run the API
flask run
```


Installation is successful when this message is shown:
```
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://127.0.0.1:5000 (Press CTRL+C to quit)
 ```
4. Lastly, install the PYODBCS module. In the command window type,

```
#To install PYODBCS
pip install pyodbc
```


## USAGE

1. Users are first taken to the login page when the application loads. He can log in using his registered username and password. 
2. However, if a user doesn't already have an account, he can create one by clicking "Create an Account," which will take him to the sign-up page. A user needs to provide a username, password, his first and last name and an email address to be able to sign up. upon signing up, he will be directed to the main page of the application. 
3. There are three pages available, including a users page that displays all user information. A user can be given a specific role on this page. A user may be removed as well.
4. On the roles page, the available roles as well as their corresponding permissions can be seen. New roles can be created using the Add button and specific permissions for the role will be can be assigned as well. When additional permissions are created in the permissions page, it will also reflect in the roles page. 
5. Lastly, the permissions page contains all the available permissions that can be assigned to a user. Additional permissions can be created using the add button and existing permissions can be deleted as well. Once a permission has been deleted, it will no longer reflect on the roles pages.  
6. To make the application look cleaner, the add and remove buttons are first hidden. Modal forms are then called to specify the exact roles and permissions that will be created. The delete buttons for each row will appear when the delete button is pushed.
7. There are three databases connected to the application, an account table containing the information of the users such as their user names, password, full name and email. A secodn table is created containing the roles and assigned permission to thes roles. Last table contains the permissions available to be assigned to a user. 


## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

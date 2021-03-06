USE [AccountsDB]
GO
/****** Object:  Table [dbo].[tbl_account]    Script Date: 7/7/2022 6:54:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nchar](50) NOT NULL,
	[Password] [nchar](50) NOT NULL,
	[FirstName] [nchar](50) NOT NULL,
	[LastName] [nchar](50) NOT NULL,
	[Email] [nchar](50) NOT NULL,
	[Role] [nchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[DeletedBy] [nchar](50) NULL,
	[UID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_tbl_account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_permissions]    Script Date: 7/7/2022 6:54:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_permissions](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [uniqueidentifier] NOT NULL,
	[Pname] [nchar](50) NULL,
	[Pdesc] [nchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nchar](50) NULL,
 CONSTRAINT [PK_tbl_permissions] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_roles]    Script Date: 7/7/2022 6:54:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_roles](
	[RoleName] [nchar](20) NULL,
	[Permissions] [int] NULL,
	[UID] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_account] ON 

INSERT [dbo].[tbl_account] ([AccountID], [Username], [Password], [FirstName], [LastName], [Email], [Role], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [DeletedDate], [DeletedBy], [UID]) VALUES (3, N'Admin                                             ', N'Admin                                             ', N'Admin                                             ', N'Admin                                             ', N'Admin                                             ', N'HR                  ', NULL, NULL, NULL, NULL, NULL, NULL, N'e9a38f2b-eda3-4911-947a-2fc815cf0a30')
INSERT [dbo].[tbl_account] ([AccountID], [Username], [Password], [FirstName], [LastName], [Email], [Role], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [DeletedDate], [DeletedBy], [UID]) VALUES (5, N'RachCordero                                       ', N'ihateyou                                          ', N'Rachell                                           ', N'Cordero                                           ', N'rmcordero2@up.edu.ph                              ', NULL, CAST(N'2022-07-03T19:05:33.247' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'41ba9286-81c1-435d-bbf5-5384e982f2ac')
INSERT [dbo].[tbl_account] ([AccountID], [Username], [Password], [FirstName], [LastName], [Email], [Role], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [DeletedDate], [DeletedBy], [UID]) VALUES (53, N'Gerald                                            ', N'Ferald                                            ', N'Gerald                                            ', N'Bautista                                          ', N'gerald.bautista@gmail.com                         ', N'Downloader          ', CAST(N'2022-07-07T18:50:04.080' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'521a0049-e2e9-4bfe-a10c-1c64e7eea3b0')
SET IDENTITY_INSERT [dbo].[tbl_account] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_permissions] ON 

INSERT [dbo].[tbl_permissions] ([PID], [UID], [Pname], [Pdesc], [CreatedDate], [CreatedBy]) VALUES (20, N'44b65315-d8dd-44df-9fcd-e6ced31fa2b3', N'Edit                                              ', N'Edit Information                                  ', CAST(N'2022-07-06T18:16:45.947' AS DateTime), NULL)
INSERT [dbo].[tbl_permissions] ([PID], [UID], [Pname], [Pdesc], [CreatedDate], [CreatedBy]) VALUES (21, N'6f8f9d6a-5c43-46a8-a701-26e7153dda5d', N'Read                                              ', N'Read data                                         ', CAST(N'2022-07-06T18:18:21.717' AS DateTime), NULL)
INSERT [dbo].[tbl_permissions] ([PID], [UID], [Pname], [Pdesc], [CreatedDate], [CreatedBy]) VALUES (22, N'7606d74b-8472-4a82-b7d4-74d33b641954', N'Modify                                            ', N'Modify all available data                         ', CAST(N'2022-07-06T18:20:24.757' AS DateTime), NULL)
INSERT [dbo].[tbl_permissions] ([PID], [UID], [Pname], [Pdesc], [CreatedDate], [CreatedBy]) VALUES (25, N'8af9e708-0d00-4cd0-bcbc-3edb79e26d34', N'Write                                             ', N'Write file                                        ', CAST(N'2022-07-06T21:30:13.720' AS DateTime), NULL)
INSERT [dbo].[tbl_permissions] ([PID], [UID], [Pname], [Pdesc], [CreatedDate], [CreatedBy]) VALUES (27, N'09c12b2d-8dde-4fab-b9d3-6edf2cb04d3e', N'Download                                          ', N'Downlaod file                                     ', CAST(N'2022-07-07T18:51:23.347' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tbl_permissions] OFF
GO
INSERT [dbo].[tbl_roles] ([RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (N'Downloader          ', 27, N'57121a27-9e6d-4826-9e35-615072a0834c', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (N'HR                  ', 5, N'bc9b8b56-730c-4fb9-9c46-732e44382a78', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (N'HR                  ', 15, N'7a4c1bcb-0c0f-4648-8cab-4d175500dbdc', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (N'HR                  ', 19, N'b1833a7e-e7f5-4656-b959-d2870e64c14e', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (N'HR                  ', 20, N'5ae51888-c8f9-420a-b7c5-99601f33e79a', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (N'HR                  ', 21, N'b915a504-0c04-4246-9d5d-1d53732b380d', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (N'Employee            ', 20, N'1bb8e91c-4a1f-46f0-b3db-1b87757a7fdd', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (N'Employee            ', 21, N'5569cd70-ae37-4c9c-a081-3fe57b3107a3', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (N'Employee            ', 22, N'1f5684d2-f088-496d-b648-6b02b21d6be5', NULL, NULL)
INSERT [dbo].[tbl_roles] ([RoleName], [Permissions], [UID], [CreatedDate], [CreatedBy]) VALUES (N'Employee            ', 25, N'd3d4e7b7-8e48-4efe-a24a-0bca091897e4', NULL, NULL)
GO

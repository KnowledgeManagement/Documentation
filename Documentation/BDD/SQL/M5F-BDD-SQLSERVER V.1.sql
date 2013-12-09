USE [M5F]
GO
/****** Object:  Table [dbo].[M5F_categorie]    Script Date: 26/11/2013 15:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M5F_categorie](
	[idCat] [int] NOT NULL,
	[nomCat] [char](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M5F_contact]    Script Date: 26/11/2013 15:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M5F_contact](
	[idFormContact] [int] IDENTITY(1,1) NOT NULL,
	[objet] [varchar](1) NOT NULL,
	[contenu] [varchar](1) NOT NULL,
	[date] [varchar](1) NOT NULL,
	[idUser] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFormContact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M5F_document]    Script Date: 26/11/2013 15:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M5F_document](
	[idDoc] [int] IDENTITY(1,1) NOT NULL,
	[intituleDoC] [varchar](1) NOT NULL,
	[date] [date] NOT NULL,
	[description] [text] NOT NULL,
	[validee] [tinyint] NOT NULL,
	[exemple] [text] NOT NULL,
	[idSousCat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M5F_message]    Script Date: 26/11/2013 15:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M5F_message](
	[idMessage] [int] IDENTITY(1,1) NOT NULL,
	[intitule] [varchar](1) NOT NULL,
	[contenu] [varchar](1) NOT NULL,
	[date] [date] NOT NULL,
	[etat] [varchar](1) NOT NULL,
	[commentaires] [varchar](1) NOT NULL,
	[idUser] [int] NOT NULL,
	[idSousCat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMessage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M5F_sous_categorie]    Script Date: 26/11/2013 15:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M5F_sous_categorie](
	[idSousCat] [int] IDENTITY(1,1) NOT NULL,
	[nomSousCat] [varchar](1) NOT NULL,
	[idCat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSousCat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M5F_tmp]    Script Date: 26/11/2013 15:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M5F_tmp](
	[idTmp] [int] IDENTITY(1,1) NOT NULL,
	[intituleTmp] [varchar](1) NOT NULL,
	[descriptionTmp] [varchar](1) NOT NULL,
	[dateTmp] [date] NOT NULL,
	[desTmp] [text] NOT NULL,
	[valideeTmp] [tinyint] NOT NULL,
	[exempleTmp] [varchar](1) NOT NULL,
	[idSousCat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTmp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M5F_user]    Script Date: 26/11/2013 15:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M5F_user](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](20) NOT NULL,
	[mdp] [varchar](20) NOT NULL,
	[nom] [varchar](20) NOT NULL,
	[prenom] [varchar](30) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[fonction] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[M5F_contact]  WITH CHECK ADD FOREIGN KEY([idUser])
REFERENCES [dbo].[M5F_user] ([idUser])
GO
ALTER TABLE [dbo].[M5F_document]  WITH CHECK ADD FOREIGN KEY([idSousCat])
REFERENCES [dbo].[M5F_sous_categorie] ([idSousCat])
GO
ALTER TABLE [dbo].[M5F_message]  WITH CHECK ADD FOREIGN KEY([idSousCat])
REFERENCES [dbo].[M5F_sous_categorie] ([idSousCat])
GO
ALTER TABLE [dbo].[M5F_sous_categorie]  WITH CHECK ADD FOREIGN KEY([idCat])
REFERENCES [dbo].[M5F_categorie] ([idCat])
GO
ALTER TABLE [dbo].[M5F_sous_categorie]  WITH CHECK ADD FOREIGN KEY([idCat])
REFERENCES [dbo].[M5F_categorie] ([idCat])
GO
ALTER TABLE [dbo].[M5F_tmp]  WITH CHECK ADD FOREIGN KEY([idSousCat])
REFERENCES [dbo].[M5F_sous_categorie] ([idSousCat])
GO
ALTER TABLE [dbo].[M5F_tmp]  WITH CHECK ADD FOREIGN KEY([idSousCat])
REFERENCES [dbo].[M5F_sous_categorie] ([idSousCat])
GO
ALTER TABLE [dbo].[M5F_user]  WITH CHECK ADD FOREIGN KEY([idUser])
REFERENCES [dbo].[M5F_user] ([idUser])
GO

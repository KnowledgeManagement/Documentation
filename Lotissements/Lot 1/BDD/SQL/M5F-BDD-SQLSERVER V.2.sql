USE [m5f]
GO
/****** Object:  Table [dbo].[m5f_categorie]    Script Date: 28/11/2013 14:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[m5f_categorie](
	[idCat] [int] NOT NULL,
	[nomCat] [varchar](70) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[m5f_contact]    Script Date: 28/11/2013 14:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[m5f_contact](
	[idFormContact] [int] IDENTITY(1,1) NOT NULL,
	[objet] [varchar](70) NOT NULL,
	[contenu] [text] NOT NULL,
	[lu] [bit] NOT NULL,
	[date] [datetime] NOT NULL,
	[idUser] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFormContact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[m5f_document]    Script Date: 28/11/2013 14:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[m5f_document](
	[idDoc] [int] IDENTITY(1,1) NOT NULL,
	[intituleDoC] [varchar](70) NOT NULL,
	[date] [datetime] NOT NULL,
	[description] [text] NOT NULL,
	[validee] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[m5f_message]    Script Date: 28/11/2013 14:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[m5f_message](
	[idMessage] [int] IDENTITY(1,1) NOT NULL,
	[intitule] [varchar](70) NOT NULL,
	[contenu] [varchar](500) NOT NULL,
	[date] [datetime] NOT NULL,
	[etat] [varchar](32) NOT NULL,
	[commentaires] [text] NOT NULL,
	[idUser] [int] NOT NULL,
	[idSousCat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMessage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[m5f_sous_categorie]    Script Date: 28/11/2013 14:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[m5f_sous_categorie](
	[idSousCat] [int] IDENTITY(1,1) NOT NULL,
	[nomSousCat] [varchar](60) NOT NULL,
	[idCat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSousCat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[m5f_tmp]    Script Date: 28/11/2013 14:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[m5f_tmp](
	[idTmp] [int] IDENTITY(1,1) NOT NULL,
	[intituleTmp] [varchar](70) NOT NULL,
	[descriptionTmp] [text] NOT NULL,
	[dateTmp] [datetime] NOT NULL,
	[valideeTmp] [tinyint] NOT NULL,
	[exempleTmp] [text] NOT NULL,
	[idSousCat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTmp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[m5f_user]    Script Date: 28/11/2013 14:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[m5f_user](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[mdp] [varchar](255) NOT NULL,
	[nom] [varchar](70) NOT NULL,
	[prenom] [varchar](70) NOT NULL,
	[mail] [varchar](255) NOT NULL,
	[fonction] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[m5f_contact]  WITH CHECK ADD FOREIGN KEY([idUser])
REFERENCES [dbo].[m5f_user] ([idUser])
GO
ALTER TABLE [dbo].[m5f_document]  WITH CHECK ADD FOREIGN KEY([idSousCat])
REFERENCES [dbo].[m5f_sous_categorie] ([idSousCat])
GO
ALTER TABLE [dbo].[m5f_message]  WITH CHECK ADD FOREIGN KEY([idSousCat])
REFERENCES [dbo].[m5f_sous_categorie] ([idSousCat])
GO
ALTER TABLE [dbo].[m5f_sous_categorie]  WITH CHECK ADD FOREIGN KEY([idCat])
REFERENCES [dbo].[m5f_categorie] ([idCat])
GO
ALTER TABLE [dbo].[m5f_sous_categorie]  WITH CHECK ADD FOREIGN KEY([idCat])
REFERENCES [dbo].[m5f_categorie] ([idCat])
GO
ALTER TABLE [dbo].[m5f_tmp]  WITH CHECK ADD FOREIGN KEY([idSousCat])
REFERENCES [dbo].[m5f_sous_categorie] ([idSousCat])
GO
ALTER TABLE [dbo].[m5f_tmp]  WITH CHECK ADD FOREIGN KEY([idSousCat])
REFERENCES [dbo].[m5f_sous_categorie] ([idSousCat])
GO
ALTER TABLE [dbo].[m5f_user]  WITH CHECK ADD FOREIGN KEY([idUser])
REFERENCES [dbo].[m5f_user] ([idUser])
GO
ALTER TABLE [dbo].[m5f_message]  WITH CHECK ADD CHECK  (([etat]='Refusé' OR [etat]='Accepté' OR [etat]='Non Lu' OR [etat]='Lu'))
GO
ALTER TABLE [dbo].[m5f_user]  WITH CHECK ADD CHECK  (([fonction]='Accesseur' OR [fonction]='Contributeur' OR [fonction]='Administrateur'))
GO

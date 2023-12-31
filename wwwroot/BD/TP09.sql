USE [master]
GO
/****** Object:  Database [TP09]    Script Date: 9/10/2023 10:31:06 ******/
CREATE DATABASE [TP09]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP09', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP09.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP09_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP09_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP09] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP09].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP09] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP09] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP09] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP09] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP09] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP09] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP09] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP09] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP09] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP09] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP09] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP09] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP09] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP09] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP09] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP09] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP09] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP09] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP09] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP09] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP09] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP09] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP09] SET RECOVERY FULL 
GO
ALTER DATABASE [TP09] SET  MULTI_USER 
GO
ALTER DATABASE [TP09] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP09] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP09] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP09] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP09] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP09', N'ON'
GO
ALTER DATABASE [TP09] SET QUERY_STORE = OFF
GO
USE [TP09]
GO
/****** Object:  User [alumno]    Script Date: 9/10/2023 10:31:07 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 9/10/2023 10:31:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([ID], [Username], [Password], [Nombre], [Email], [Telefono]) VALUES (1, N'Urielcw', N'vicenteruiz1234', N'Uriel', N'urielcw54@gmail.com', N'+54 9 11 3792 7834')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
/****** Object:  StoredProcedure [dbo].[ActualizarContraseña]    Script Date: 9/10/2023 10:31:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarContraseña]
	-- Add the parameters for the stored procedure here
	(
		@IdUsuario int,
		@NuevaContraseña varchar(50)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[Usuarios]
   SET [Password] = @NuevaContraseña
 WHERE ID = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarUsuario]    Script Date: 9/10/2023 10:31:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BuscarUsuario]
	-- Add the parameters for the stored procedure here
	(
		@Email varchar(50)
		,@Contraseña varchar(50)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT TOP 1 [ID]
      ,[Username]
      ,[Password]
      ,[Nombre]
      ,[Email]
      ,[Telefono]
  FROM [dbo].[Usuarios]
  WHERE Email = @email AND Password = @contraseña
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarUsuario]    Script Date: 9/10/2023 10:31:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertarUsuario]
	-- Add the parameters for the stored procedure here
	(
		@Username varchar(50),
		@Password varchar(50),
		@Nombre varchar(50),
		@Email varchar(50),
		@Telefono varchar(50)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[Usuarios]
           ([Username]
           ,[Password]
           ,[Nombre]
           ,[Email]
           ,[Telefono])
     VALUES
           (@Username,
		   @Password,
		   @Nombre,
		   @Email,
		   @Telefono)
END
GO
/****** Object:  StoredProcedure [dbo].[LevantarUsuarios]    Script Date: 9/10/2023 10:31:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LevantarUsuarios]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [ID]
      ,[Username]
      ,[Password]
      ,[Nombre]
      ,[Email]
      ,[Telefono]
  FROM [dbo].[Usuarios]
END
GO
USE [master]
GO
ALTER DATABASE [TP09] SET  READ_WRITE 
GO

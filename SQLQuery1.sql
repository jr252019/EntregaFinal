USE [master]
GO
/****** Object:  Database [COLEGIO]    Script Date: 07/25/2019 13:25:07 ******/
CREATE DATABASE [COLEGIO] ON  PRIMARY 
( NAME = N'COLEGIO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\COLEGIO.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'COLEGIO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\COLEGIO_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [COLEGIO] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [COLEGIO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [COLEGIO] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [COLEGIO] SET ANSI_NULLS OFF
GO
ALTER DATABASE [COLEGIO] SET ANSI_PADDING OFF
GO
ALTER DATABASE [COLEGIO] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [COLEGIO] SET ARITHABORT OFF
GO
ALTER DATABASE [COLEGIO] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [COLEGIO] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [COLEGIO] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [COLEGIO] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [COLEGIO] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [COLEGIO] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [COLEGIO] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [COLEGIO] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [COLEGIO] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [COLEGIO] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [COLEGIO] SET  DISABLE_BROKER
GO
ALTER DATABASE [COLEGIO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [COLEGIO] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [COLEGIO] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [COLEGIO] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [COLEGIO] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [COLEGIO] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [COLEGIO] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [COLEGIO] SET  READ_WRITE
GO
ALTER DATABASE [COLEGIO] SET RECOVERY SIMPLE
GO
ALTER DATABASE [COLEGIO] SET  MULTI_USER
GO
ALTER DATABASE [COLEGIO] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [COLEGIO] SET DB_CHAINING OFF
GO
USE [COLEGIO]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[TipoId] [nvarchar](50) NOT NULL,
	[Identificacion] [int] NOT NULL,
	[Contraseña] [int] NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[Telefono] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nota]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nota](
	[Id] [int] NOT NULL,
	[Nota1] [decimal](18, 0) NOT NULL,
	[Nota2] [decimal](18, 0) NOT NULL,
	[Nota3] [decimal](18, 0) NOT NULL,
	[Nota4] [decimal](18, 0) NOT NULL,
	[Definitiva] [decimal](18, 0) NOT NULL,
	[AnioLectivo_ania] [int] NOT NULL,
	[Curso_nombre] [nvarchar](50) NOT NULL,
	[Estudiante_identificacion] [nvarchar](50) NOT NULL,
	[Asignatura_codigo] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MateriaEstudiante]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MateriaEstudiante](
	[Id] [int] NOT NULL,
	[Asignatura_id] [int] NOT NULL,
	[Grado_id] [int] NOT NULL,
	[Estudiante_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grado]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grado](
	[Nombre] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstudianteCurso]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstudianteCurso](
	[Id] [int] NOT NULL,
	[Estudiante_id] [int] NOT NULL,
	[Curso_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiante](
	[TipoId] [int] NOT NULL,
	[Identificacion] [int] NOT NULL,
	[Contrasenia] [int] NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL,
	[Grado_nombre] [nvarchar](50) NOT NULL,
	[Curso_nombre] [nvarchar](50) NOT NULL,
	[AnioLectivo_anio] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Docente]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Docente](
	[TipoId] [nvarchar](50) NOT NULL,
	[Identificacion] [int] NOT NULL,
	[Contraseña] [int] NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Estado] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[Nombre] [nvarchar](50) NOT NULL,
	[Capacidad] [int] NOT NULL,
	[Grado_nombre] [nvarchar](50) NOT NULL,
	[AnioLectivo_anio] [int] NOT NULL,
	[Docente_identificacion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsignaturaDocente]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsignaturaDocente](
	[Id] [int] NOT NULL,
	[Docente_identifiacion] [int] NOT NULL,
	[Asignatura_codigo] [int] NOT NULL,
	[Grado_nombre] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsignaturaCurso]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsignaturaCurso](
	[Id] [int] NOT NULL,
	[Aniolectivo_anio] [int] NOT NULL,
	[Curso_nombre] [nvarchar](50) NOT NULL,
	[Asignatura_codigo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignatura]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignatura](
	[Codigo] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[IntensidadHoraria] [int] NOT NULL,
	[Naturaleza] [nvarchar](50) NOT NULL,
	[Estado] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnioLectivo]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnioLectivo](
	[Anio] [int] NOT NULL,
	[Fechainicio] [datetime] NOT NULL,
	[Fechafin] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 07/25/2019 13:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[TipoId] [nvarchar](50) NULL,
	[Identificacion] [int] NULL,
	[Contraseña] [nvarchar](50) NULL,
	[Nombres] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Correo] [nvarchar](50) NULL,
	[Telefono] [int] NULL,
	[Cargo] [nvarchar](50) NULL
) ON [PRIMARY]
GO

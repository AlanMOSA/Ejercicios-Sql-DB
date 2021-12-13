USE master;
GO
IF DB_ID (N'CODIGOSPOSTALES') IS NOT NULL
DROP DATABASE CODIGOSPOSTALES;
GO
CREATE DATABASE CODIGOSPOSTALES 
ON 
(NAME = CODIGOSPOSTALES_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CODIGOSPOSTALES.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = CODIGOSPOSTALES_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CODIGOSPOSTALES.ldf',
SIZE = 20MB,
MAXSIZE = 250MB,
FILEGROWTH = 20MB);
GO
USE CODIGOSPOSTALES;
GO
--------------------------------------TABLAS----------------------------------------------
CREATE TABLE Usuario
(
idUsuario int IDENTITY(1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
correo varchar (50) UNIQUE not null,
clave varchar (50) not null,
estatus bit default 1 not null, 
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Usuario PRIMARY KEY(idUsuario)
);
CREATE TABLE Asentamiento
(
idAsentamiento int IDENTITY(1,1),
nombre varchar (50) not null,
codigoPostal char (5) not null,
idTipo int not null,
idMunicipio not null,
idZona int not null,
idEstado int not null,
estatus bit default 1 not null, 
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Asentamiento PRIMARY KEY(idAsentamiento)
);
CREATE TABLE Ciudad
(
idCiudad int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null, 
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Ciudad PRIMARY KEY(idCiudad)
);
CREATE TABLE Estado
(
idEstado int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null, 
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Estado PRIMARY KEY(idEstado)
);
CREATE TABLE Municipio
(
idMunicipio int IDENTITY(1,1),
nombre varchar (50) not null,
codigo int not null,
idEstado int not null,
idCiudad int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Municipio PRIMARY KEY(idMunicipio)
); 
 CREATE TABLE Tipo
(
idTipo int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null, 
idUsuarioCrea int null, 
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Tipo PRIMARY KEY(idTipo)
);
-------------------------------------------------------------------------------------
select * from CPdescarga

select distinct c_estado, d_estado into EstadoBorrar from CPdescarga
go

select distinct c_mnpio, D_mnpio,c_estado into MunicipioBorrar from CPdescarga
go






---------------------------------------------------------
insert into Zona(nombre,codigo) select distinct d_zona from CPdescarga

insert into Estado(idEstado,nombre) select distinct c_estado, d_estado from CPdescarga

insert into Tipo(idTipo,nombre) select distinct c_tipo_asenta, d_tipo_asenta from CPdescarga

truncate table Municipio;

insert into Municipio(nombre, idEstado, codigo) select distinct D_mnpio c_estado,  c_mnpio from CPdescarga

insert into Asentamiento(nombre, codigoPostal, idTipo, idMunicipio, idZona, idEstado) select distinct d_asenta d_codigo, c_mnpio, c_tipo_asenta, 0, c_estado from CPdescarga


select * from CPdescarga













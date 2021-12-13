USE master;
GO
IF DB_ID (N'Carreteras') IS NOT NULL
DROP DATABASE Carreteras;
GO
CREATE DATABASE Carreteras 
ON 
(NAME = Carreteras_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Carreteras.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = Carreteras_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Carreteras.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE Carreteras;
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
CREATE TABLE Carretera
(
idCarretera int IDENTITY(1,1),
Numero char (10) not null,
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Carretera PRIMARY KEY(idCarretera)
);
CREATE TABLE Municipio
(
idMunicipio int IDENTITY(1,1),
Numero char (10) not null,
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Municipio PRIMARY KEY(idMunicipio)
);
CREATE TABLE Tramo
(
idTramo int IDENTITY(1,1),
nombre varchar (50) not null,
idCarretera int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Tramo PRIMARY KEY(idTramo)
);
CREATE TABLE MunicipioTramo
(
idMunicipioTramo int IDENTITY(1,1),
idMunicipio int null,
idTramo int null,
KilometroEntrada varchar (15) not null,
KilometroSalida varchar (15) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_MunicipioTramo PRIMARY KEY(idMunicipioTramo)
);
GO
--------------------------------INDEX------------------------------
CREATE INDEX IX_Carretera ON Carretera(idCarretera);
GO
CREATE INDEX IX_Municipio ON Municipio(idMunicipio);
GO
CREATE INDEX IX_Tramo ON Tramo(idTramo);
GO
CREATE INDEX IX_MunicipioTramo ON MunicipioTramo(idMunicipioTramo);
GO
---------------------------------RELACIONES--------------------------------
ALTER TABLE Usuario
ADD CONSTRAINT FK_UsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Usuario
ADD CONSTRAINT FK_UsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Carretera 
ADD CONSTRAINT FK_CarreteraUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario (idUsuario)
GO
ALTER TABLE Carretera
ADD CONSTRAINT FK_CarreteraUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Municipio 
ADD CONSTRAINT FK_MunicipioUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario (idUsuario)
GO
ALTER TABLE Municipio
ADD CONSTRAINT FK_MunicipioUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Tramo 
ADD CONSTRAINT FK_TramoCarretera
FOREIGN KEY (idCarretera) REFERENCES Carretera (idCarretera)
GO
ALTER TABLE Tramo 
ADD CONSTRAINT FK_TramoUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario (idUsuario)
GO
ALTER TABLE Tramo
ADD CONSTRAINT FK_TramoUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE MunicipioTramo
ADD CONSTRAINT FK_MunicipioTramoMunicipio
FOREIGN KEY (idMunicipio) REFERENCES Municipio(idMunicipio)
GO
ALTER TABLE MunicipioTramo
ADD CONSTRAINT FK_MunicipioTramoTramo
FOREIGN KEY (idTramo) REFERENCES Tramo(idTramo)
GO
ALTER TABLE MunicipioTramo
ADD CONSTRAINT FK_MunicipioTramoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE MunicipioTramo
ADD CONSTRAINT FK_MunicipioTramoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica)
VALUES ('Alan Geovannie','Morales','Salazar','I19050458@monclova.tecnm.mx','Tec12345.',1,GETDATE(),1,GETDATE())

INSERT INTO Carretera(nombre,Numero)
VALUES ('Torres', '26'),
       ('Pape', '45'),
	   ('Monclova', '22'),
	   ('Montesori', '15'),
	   ('Federal', '13'),
	   ('Panamericana', '48')

INSERT INTO Municipio(Numero,nombre)
VALUES ('498', 'Monclova'),
        ('499', 'Acuña'),
		('448', 'Piedras'),
		('426', 'Saltillo'),
		('428', 'Ocampo'),
		('438', 'Torreon')

INSERT INTO Tramo(nombre,idCarretera)
VALUES  ('aaomoa',1),
        ('rkmrfr',1),
        ('kmdkr',1),
		('dndld',1),
        ('mvmofm',1),
		('rkrmrk',1)

INSERT INTO MunicipioTramo(idMunicipio,idTramo,KilometroEntrada,KilometroSalida)
VALUES    (1,2,'57', '87'),
          (1,2,'77',' 41'),
		  (1,2,'57', '12'),
		  (1,2,'58', '78'),
		  (1,2,'27', '98')


       
-----SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----

--SELECT * FROM MunicipioTramo
--SELECT * FROM Municipio


-------------------------ACTUALIZAR ALGUNOS DATOS----------------------------

--UPDATE MunicipioTramo SET KilometroEntrada = '8888' WHERE idMunicipioTramo = 1

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Carretera
--SELECT * FROM Municipio

-------PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------

--DELETE FROM MunicipioTramo WHERE idMunicipioTramo=1
--DELETE FROM Municipio WHERE idMunicipio=1

----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------
--SELECT * FROM Carretera
--SELECT * FROM MunicipioTramo


---TRUNCATE TABLE Cuerpo

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()

select count(idMunicipio)from Municipio
GO
--Tipos de Vistas
--select idCarretera, CONCAT(nombre,' ',numero) as 'Carretera' from Carretera

----Vista
--CREATE VIEW vwListaCarretera as
--select idCarretera, concat (nombre,' ',numero) as 'Carretera Nombre Numero' from Carretera where estatus = 1
--GO

--select * from vwListaCarretera


--select t1.nombre,t2.nombre from Municipio as t1 inner join Carretera as t2 on t1.idMunicipio = t2.idCarretera             

--select t1.nombre,t2.nombre from Tramo as t1 inner join Carretera as t2 on t1.idTramo = t2.idCarretera             

--select t1.nombre,t2.numero from Municipio as t1 inner join Carretera as t2 on t1.idMunicipio = t2.idCarretera             

--select t1.KilometroEntrada,t2.nombre from MunicipioTramo as t1 inner join Carretera as t2 on t1.idMunicipioTramo = t2.idCarretera             

--select t1.KilometroSalida,t2.nombre from MunicipioTramo as t1 inner join Carretera as t2 on t1.idMunicipioTramo = t2.idCarretera             



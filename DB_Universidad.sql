USE master;
GO
IF DB_ID (N'Universidad') IS NOT NULL
DROP DATABASE Universidad;
GO
CREATE DATABASE Universidad
ON 
(NAME = Universidad_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Universidad.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = Universidad_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Universidad.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE Universidad;
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
CONSTRAINT PKUsuario PRIMARY KEY(idUsuario)
);
CREATE TABLE Area  
(
idArea int IDENTITY(1,1),
nombre varchar (25) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Area PRIMARY KEY (idArea)
);
CREATE TABLE Catedra  
(
idCatedra int IDENTITY(1,1),
nombre varchar (25) not null,
codigo char (25) not null,
idFacultad int null,
idDepartamento int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Catedra PRIMARY KEY (idCatedra)
);
CREATE TABLE Departamento  
(
idDepartamento int IDENTITY(1,1),
nombre varchar (25) not null,
idFacultad int null,
idArea int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Departamento PRIMARY KEY (idDepartamento)
);
CREATE TABLE Facultad  
(
idFacultad int IDENTITY(1,1),
nombre varchar (25) not null,
numero char (15) not null,
calle varchar (50) not null,
colonia varchar (50) not null,
ciudad varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Facultad PRIMARY KEY (idFacultad)
);
CREATE TABLE Profesor
(
idProfesor int IDENTITY (1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
calle varchar (50) not null,
numero char (10) not null,
colonia varchar (50) not null,
ciudad varchar (50) not null,
CURP char (25) not null,
idDepartamento int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Profesor PRIMARY KEY (idProfesor)
);
CREATE TABLE CatedraProfesor
(
idCatedraProfesor int IDENTITY(1,1),
idCatedra int not null,
idProfesor int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_CatedraProfesor PRIMARY KEY (idCatedraProfesor)
);
GO
--------------------------------INDEX------------------------------
CREATE INDEX IX_Area ON Area(idArea);
GO
CREATE INDEX IX_Catedra ON Catedra(idCatedra);
GO
CREATE INDEX IX_Departamento ON Departamento(idDepartamento);
GO
CREATE INDEX IX_Facultad ON Facultad(idFacultad);
GO
CREATE INDEX IX_Profesor ON Profesor(idProfesor);
GO
CREATE INDEX IX_CatedraProfesor ON CatedraProfesor(idCatedraProfesor);
GO
---------------------------------RELACIONES--------------------------------
ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Area
ADD CONSTRAINT FK_AreaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Area
ADD CONSTRAINT FK_AreaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Catedra
ADD CONSTRAINT FK_CatedraFacultad 
FOREIGN KEY (idFacultad) REFERENCES Facultad(idFacultad);
GO
ALTER TABLE Catedra
ADD CONSTRAINT FK_CatedraDepartamento
FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento);
GO
ALTER TABLE Catedra
ADD CONSTRAINT FK_CatedraUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Catedra
ADD CONSTRAINT FK_CatedraUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Departamento
ADD CONSTRAINT FK_DepartamentoFacultad 
FOREIGN KEY (idFacultad) REFERENCES Facultad(idFacultad);
GO
ALTER TABLE Departamento
ADD CONSTRAINT FK_DepartamentoArea
FOREIGN KEY (idArea) REFERENCES Area(idArea);
GO
ALTER TABLE Departamento
ADD CONSTRAINT FK_DepartamentoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Departamento
ADD CONSTRAINT FK_DepartamentoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Facultad
ADD CONSTRAINT FK_FacultadUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Facultad
ADD CONSTRAINT FK_FacultadUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Profesor
ADD CONSTRAINT FK_ProfesorDepartamento
FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento);
GO
ALTER TABLE Profesor
ADD CONSTRAINT FK_ProfesorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Profesor
ADD CONSTRAINT FK_ProfesorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CatedraProfesor
ADD CONSTRAINT FK_CatedraProfesorCatedra
FOREIGN KEY (idCatedra) REFERENCES Catedra(idCatedra);
GO
ALTER TABLE CatedraProfesor
ADD CONSTRAINT FK_CatedraProfesorProfesor
FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor);
GO
ALTER TABLE CatedraProfesor
ADD CONSTRAINT FK_CatedraProfesorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CatedraProfesor
ADD CONSTRAINT FK_CatedraProfesorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave)
VALUES ('Alan Geovannie', 'Morales' ,'Salazar' ,'I19050458@monclova.tecnm.mx' ,'12345677')	

INSERT INTO Area(nombre)
VALUES    ('iwIPXIJWP'),
          ('iwIPXIJWP'),
		  ('iwIPXIJWP'),
		  ('iwIPXIJWP'),
		  ('iwIPXIJWP'),
		  ('iwIPXIJWP')

INSERT INTO Facultad(nombre,numero,calle,colonia,ciudad)
VALUES    ('Medicina','8292','Ventura','samandie','Torreon'),
          ('Adiministracion','8292','Ventura','samandie','Torreon'),
		  ('Contabilidad','8292','Ventura','samandie','Torreon'),
		  ('Ingieneria','8292','Ventura','samandie','Torreon'),
		  ('Licienciatura','8292','Ventura','samandie','Torreon'),
		  ('Derecho','8292','Ventura','samandie','Torreon')

INSERT INTO Departamento(nombre,idFacultad,idArea)
VALUES    ('SMOKOEK',1,2),
          ('SMOKOEK',1,2),
		  ('SMOKOEK',1,2),
		  ('SMOKOEK',1,2),
		  ('SMOKOEK',1,2),
		  ('SMOKOEK',1,2)

INSERT INTO Catedra(nombre,codigo,idFacultad,idDepartamento)
VALUES    ('matematicas','W5W8W8W',1,2),
          ('Ciencias','Q54QSA',1,2),
		  ('Costos','48Q212',1,2),
		  ('Contabilidad','NDJE728',1,2),
		  ('Administracion','92JWMBB',1,2),
		  ('Etica','HDHDY6',1,2)

INSERT INTO Profesor(nombre,apellidoPaterno,apellidoMaterno,calle,numero,colonia,ciudad,CURP,idDepartamento)
VALUES ('Pepe Geovannie','Morales','Salazar','Calle 4',', 1929','lomas heroes','frontera','MOSAUUAU555',1),
        ('Jose Geovannie','Lopez','Salas','Calle Azteca','1977','villa heroes','san buena','DE4E4EE44E6',1),
		('Sabino Jorge','Gutierrez','Torres','Calle 1','1277','valle heroes','sabinas','DQ22WWWWWWW',1),
		('Arturo Pepe','Garcia','Salcido','Calle Loma','7877','heroes','rosita','QW12W555551',1),
		('Luis Edgar','Casillas','Orosco','Calle 32','1211','mirador','saltillo','79A5A5A55',1),
		('Raul Jose','Montano','Marquez','Calle 10 ','1999','deportivo','ocampo','1QSE34FR',1)

INSERT INTO CatedraProfesor(idCatedra,idProfesor)
VALUES  (1,2),
        (1,2),
		(1,2),
		(1,2),
		(1,2),
		(1,2)

-----SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----

--SELECT * FROM Profesor
--SELECT * FROM Facultad
--SELECT * FROM Departamento

-------------------------ACTUALIZAR ALGUNOS DATOS----------------------------

--UPDATE Profesor SET nombre = 'cambio' WHERE idProfesor = 1

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Profesor
--SELECT * FROM Facultad
--SELECT * FROM Departamento


-------OTRA MANERA PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------
--DELETE FROM Profesor WHERE idProfesor=1
--DELETE FROM Facultad WHERE idFacultad=1

------SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------
---SELECT * FROM Profesor
--SELECT * FROM Facultad
--SELECT * FROM Departamento

---TRUNCATE TABLE Cuerpo

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()


--COUNT MAX MIN AVG
--select count(*)from Compañia

--Tipos de Vistas
--select idProfesor, CONCAT(nombre,'    ',apellidoPaterno,'     ',apellidoMaterno) as 'Nombre Completo' from Profesor
--GO
--Vista
--CREATE VIEW vwListaProfesor as
--select idProfesor, concat (nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Profesor where estatus = 1
--GO

--select * from vwListaProfesor




select t1.nombre,codigo,t2.nombre,apellidoPaterno,apellidoMaterno from Catedra as t1 inner join Profesor as t2 on t1.idCatedra = t2.idProfesor

select t1.nombre,codigo,t2.nombre from Catedra as t1 inner join Facultad as t2 on t1.idCatedra = t2.idFacultad

select t1.nombre,t2.nombre from Departamento as t1 inner join Facultad as t2 on t1.idDepartamento = t2.idFacultad

select t1.nombre,t2.nombre,apellidoPaterno,apellidoMaterno from Departamento as t1 inner join Profesor as t2 on t1.idDepartamento = t2.idProfesor

select t1.nombre,t2.nombre from Departamento as t1 inner join Area as t2 on t1.idDepartamento = t2.idArea






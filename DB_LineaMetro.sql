USE master;
GO
IF DB_ID (N'LineaMetro') IS NOT NULL
DROP DATABASE LineaMetro;
GO
CREATE DATABASE LineaMetro
ON 
(NAME = LineaMetro_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LineaMetro.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = LineaMetro_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LineaMetro.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE LineaMetro;
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
CREATE TABLE Acceso 
(
idAcceso int IDENTITY(1,1),
nombre varchar (50) not null,
numero char (15) not null,
calle varchar (50) not null,
colonia varchar (50) not null,
ciudad varchar (50) not null,
idEstacion int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Acceso PRIMARY KEY (idAcceso)
);
CREATE TABLE Cochera 
(
idCochera int IDENTITY(1,1),
numero char (15) not null,
calle varchar (50) not null,
colonia varchar (50) not null,
ciudad varchar (50) not null,
idEstacion int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Cochera PRIMARY KEY (idCochera)
);
CREATE TABLE Estacion 
(
idEstacion int IDENTITY(1,1),
nombre varchar (50) not null,
numero char (15) not null,
calle varchar (50) not null,
colonia varchar (50) not null,
ciudad varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Estacion PRIMARY KEY (idEstacion)
);
CREATE TABLE Linea 
(
idLinea int IDENTITY(1,1),
nombre varchar (50) not null,
numero char (15) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Linea PRIMARY KEY (idLinea)
);
CREATE TABLE Tren 
(
idTren int IDENTITY(1,1),
descripcion varchar (50) not null, 
numero char (20) not null,
idLinea int null,
idCochera int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Tren PRIMARY KEY (idTren)
);
CREATE TABLE LineaEstacion
(
idLineaEstacion int IDENTITY(1,1),
idLinea int not null,
idEstacion int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_LineaEstacion PRIMARY KEY (idLineaEstacion)
);
GO
--------------------------------INDEX------------------------------
CREATE INDEX IX_Acceso ON Acceso(idAcceso);
GO
CREATE INDEX IX_Cochera ON Cochera(idCochera);
GO
CREATE INDEX IX_Estacion ON Estacion(idEstacion);
GO
CREATE INDEX IX_Linea ON Linea(idLinea);
GO
CREATE INDEX IX_Tren ON Tren(idTren);
GO
CREATE INDEX IX_LineaEstacion ON LineaEstacion(idLineaEstacion);
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
ALTER TABLE Acceso
ADD CONSTRAINT FK_AccesoEstacion
FOREIGN KEY (idEstacion) REFERENCES Estacion(idEstacion);
GO
ALTER TABLE Acceso
ADD CONSTRAINT FK_AccesoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Acceso
ADD CONSTRAINT FK_AccesoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Cochera
ADD CONSTRAINT FK_CocheraEstacion
FOREIGN KEY (idEstacion) REFERENCES Estacion(idEstacion);
GO
ALTER TABLE Cochera
ADD CONSTRAINT FK_CocheraUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Cochera
ADD CONSTRAINT FK_CocheraUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Estacion
ADD CONSTRAINT FK_EstacionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Estacion
ADD CONSTRAINT FK_EstacionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Linea
ADD CONSTRAINT FK_LineaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Linea
ADD CONSTRAINT FK_LineaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Tren
ADD CONSTRAINT FK_TrenLinea
FOREIGN KEY (idLinea) REFERENCES Linea(idLinea);
GO
ALTER TABLE Tren
ADD CONSTRAINT FK_TrenCochera
FOREIGN KEY (idCochera) REFERENCES Cochera(idCochera);
GO
ALTER TABLE Tren
ADD CONSTRAINT FK_TrenUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Tren
ADD CONSTRAINT FK_TrenUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE LineaEstacion
ADD CONSTRAINT FK_LineaEstacionLinea
FOREIGN KEY (idLinea) REFERENCES Linea(idLinea);
GO
ALTER TABLE LineaEstacion
ADD CONSTRAINT FK_LineaEstacionEstacion
FOREIGN KEY (idEstacion) REFERENCES Estacion(idEstacion);
GO
ALTER TABLE LineaEstacion
ADD CONSTRAINT FK_LineaEstacionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE LineaEstacion
ADD CONSTRAINT FK_LineaEstacionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave)
VALUES ('Alan Geovannie', 'Morales' ,'Salazar' ,'I19050458@monclova.tecnm.mx' ,'12345677')	

INSERT INTO Estacion(nombre,numero,calle,colonia,ciudad)
VALUES    ('AV torres','161132','12','AMAA','llalala'),
          ('AV torres','161132','12','AKSKSKS','akakak'),
		  ('AV torres','161132','12','akakak','aaaak'),
          ('AV torres','161132','12','monaaa','akakak'),
          ('AV torres','161132','12','nananan','akakka')

INSERT INTO Acceso(nombre,numero,calle,colonia,ciudad,idEstacion)
VALUES    ('ajanana','1499949','599','campa','guadalajara',1),
          ('dldmdml','444446','10','campa','guadalajara',1),
		  ('bdbsmms','1116332','kxkeme','campa','guadalajara',1),
		  ('sswñlw','16161116','llslsl','campa','guadalajara',1),
		  ('sksksks','1316161','3030','campa','guadalajara',1)

INSERT INTO Cochera(numero,calle,colonia,ciudad,idEstacion)
VALUES    ('48852','2112','palma','guadalajara',1),
          ('48852','2112','palma','guadalajara',1),
		  ('48852','2112','palma','guadalajara',1),
		  ('48852','2112','palma','guadalajara',1),
		  ('48852','2112','palma','guadalajara',1)


INSERT INTO Linea(nombre,numero)
VALUES    ('Luz','15111231'),
          ('Luz','15111231'),
		  ('Luz','15111231'),
		  ('Luz','15111231'),
		  ('Luz','15111231')

INSERT INTO Tren(descripcion,numero,idLinea,idCochera)
VALUES     ('Color rojo grande ','516666',1,2),
           ('Color rojo grande ','516666',1,2),
		   ('Color rojo grande ','516666',1,2),
		   ('Color rojo grande ','516666',1,2),
		   ('Color rojo grande ','516666',1,2)

INSERT INTO LineaEstacion(idLinea,idEstacion)
VALUES     (1,2),
           (1,2),
		   (1,2),
		   (1,2),
		   (1,2),
		   (1,2)

GO
--select * from LineaEstacion

-----SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----

--SELECT * FROM Acceso
--SELECT * FROM Cochera
--SELECT * FROM Estacion

-------------------------ACTUALIZAR ALGUNOS DATOS----------------------------

--UPDATE Acceso SET nombre = 'cambio' WHERE idAcceso = 1

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Acceso
--SELECT * FROM Cochera
--SELECT * FROM Estacion

-------OTRA MANERA PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------
--DELETE FROM Acceso WHERE idAcceso=1
--DELETE FROM Cuartel WHERE idCuartel=1

------SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------
--SELECT * FROM Acceso
--SELECT * FROM Cochera
--SELECT * FROM Estacion

---TRUNCATE TABLE Cuerpo

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()


--COUNT MAX MIN AVG
--select count(*)from Acceso

--Tipos de Vistas
--select idAcceso, CONCAT(calle,'      ',ciudad,'    ',numero) as 'Domicilio' from Acceso
--GO
--Vista
--CREATE VIEW vwDomicilio as
--select idAcceso, CONCAT(calle,'      ',ciudad,'    ',numero) as 'Domicilio' from Acceso where estatus = 1
--GO

--select * from vwDomicilio



select t1.numero,t2.calle,ciudad,colonia from Tren as t1 inner join Cochera as t2 on t1.idTren = t2.idCochera

select t1.numero,t2.numero from Tren as t1 inner join Linea as t2 on t1.idTren = t2.idLinea

select t1.numero,t2.numero,calle,colonia from Tren as t1 inner join Cochera as t2 on t1.idTren = t2.idCochera

select t1.nombre,t2.numero from Estacion as t1 inner join Cochera as t2 on t1.idEstacion = t2.idCochera

select t1.numero,calle,colonia,ciudad,t2.numero from Estacion as t1 inner join Linea as t2 on t1.idEstacion = t2.idLinea








USE master;
GO
IF DB_ID (N'AgenciaViajes') IS NOT NULL
DROP DATABASE AgenciaViajes;
GO
CREATE DATABASE AgenciaViajes 
ON 
(NAME = AgenciaViajes_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AgenciaViajes.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = AgenciaViajes_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AgenciaViajes.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE AgenciaViajes;
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
idUsuarioCrea int  null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Usuario PRIMARY KEY(idUsuario)
);

CREATE TABLE Hotel
(
idHotel int IDENTITY(1,1),
nombre varchar (50) not null,
Numplaza char (10) not null,
telefono char (20) not null,
pais varchar (50) not null,
estado varchar (50) not null,
CodigoPostal varchar (10) not null,
NumHotel char (10) not null,
codigoHotel char (10) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Hotel PRIMARY KEY(idHotel)
);

CREATE TABLE Sucursal
(
idSucursal int IDENTITY(1,1),
Numplaza char (6) not null,
telefono char (10) not null,
CodigoPostal varchar (5) not null,
numcasa char (10) not null,
calle varchar (30) not null,
estatus bit default 1 not null,
idUsuarioCrea int  null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Sucursal PRIMARY KEY(idSucursal)
);

CREATE TABLE Turista
(
idTurista int IDENTITY(1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
telefono char (12) not null,
CodigoPostal varchar (5) not null,
Numcasa char (7) not null,
calle varchar (30) not null,
idVuelo int null,
idSucursal int null,
idHotel int null,
estatus bit default 1 not null,
idUsuarioCrea int  null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Turista PRIMARY KEY(idTurista)
);
CREATE TABLE Vuelo
(
idVuelo	int IDENTITY(1,1),
Fecha varchar (15) not null,
Hora varchar (50) not null,	
PlazasT	varchar	(50) not null,
paisdestino	varchar	(50) not null,
ciudaddestino varchar (50) not null,
estadodestino varchar (50) not null,
paisorigen varchar (50) not null,
ciudadorigen varchar (50) not null,
estadoorigen varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int  null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Vuelo PRIMARY KEY(idVuelo)
);
GO
--------------------------------INDEX------------------------------
CREATE INDEX IX_Hotel ON Hotel(idHotel);
GO
CREATE INDEX IX_Sucursal ON Sucursal(idSucursal);
GO
CREATE INDEX IX_Turista ON Turista (idTurista );
GO
CREATE INDEX IX_Vuelo ON Vuelo(idVuelo);
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
ALTER TABLE Hotel  
ADD CONSTRAINT FKHotelUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario (idUsuario);
GO
ALTER TABLE Hotel  
ADD CONSTRAINT FKHotelUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario (idUsuario);
GO
ALTER TABLE Sucursal  
ADD CONSTRAINT FKSucursalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario (idUsuario);
GO
ALTER TABLE Sucursal  
ADD CONSTRAINT FKSucursalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario (idUsuario);
GO
ALTER TABLE Turista
ADD CONSTRAINT FKTuristaVuelo 
FOREIGN KEY (idVuelo) REFERENCES Vuelo (idVuelo);
GO
ALTER TABLE Turista
ADD CONSTRAINT FKTuristaSucursal 
FOREIGN KEY (idSucursal) REFERENCES Sucursal (idSucursal);
GO
ALTER TABLE Turista
ADD CONSTRAINT FKTuristaHotel 
FOREIGN KEY (idHotel) REFERENCES Hotel (idHotel);
GO
ALTER TABLE Turista  
ADD CONSTRAINT FKTuristaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario (idUsuario);
GO
ALTER TABLE Turista  
ADD CONSTRAINT FKTuristaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario (idUsuario);
GO
ALTER TABLE Vuelo
ADD CONSTRAINT FKVueloUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario (idUsuario);
GO
ALTER TABLE Vuelo  
ADD CONSTRAINT FKVueloUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario (idUsuario);
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave)
VALUES ('Alan Geovannie','Morales','Salazar','I19050458@monclova.tecnm.mx','Tec12345.')

INSERT INTO Hotel(nombre,Numplaza,telefono,pais,CodigoPostal,NumHotel,estado,codigoHotel)
VALUES ('Palmas','5','8661416291','Mexico','48258','5','DF','93I3J9'),
       ('Rio','2','8661503545','España','48488','4','Madrid','9EEEE9'),
       ('Luna','3','8665519449','EstadosUnidos','44399','289','Texas','93IDE9'),
       ('Marte','4','8661942232','Canada','47188','147','Toronto','9W23J9'),
       ('Sol','5','8661499984','Brasil','48999','166','San paulo','93AJ9')

INSERT INTO Sucursal(Numplaza,telefono,CodigoPostal,numcasa,calle)
VALUES ('12','87956464','25488','1900','Verte'),
       ('4','87343364','25421','1595','Estralla'),
	   ('5','87943264','25433','1789','Sunal'),
	   ('3','82222264','25333','1952','Arsos'),
	   ('8','87923264','25422','1788','Polos')

INSERT INTO Vuelo(Fecha,Hora,PlazasT,paisdestino,estadodestino,ciudaddestino,paisorigen,ciudadorigen,estadoorigen)
VALUES ('14-02-21','20:30','OOOO','Mexico','DF','centro','Brasil','San paulo','centro'),
       ('30-03-21','15:30','ssss','Mexico','DF','centro','Brasil','San paulo','centro'),
       ('10-02-21','16:30','dddd','Mexico','DF','centro','Brasil','San paulo','centro'),
       ('08-10-21','12:30','cddd','Mexico','DF','centro','Brasil','San paulo','centro'),
       ('24-08-21','10:30','wwqq','Mexico','DF','centro','Brasil','San paulo','centro'),
       ('01-04-21','07:30','qqqq','Mexico','DF','centro','Brasil','San paulo','centro')

INSERT INTO Turista(nombre,apellidoPaterno,apellidoMaterno,telefono,CodigoPostal,Numcasa,calle,idVuelo,idSucursal,idHotel)
VALUES ('Alan Geovannie','Morales','Salazar','78451221','74633','2343','Suso',1,2,3),
        ('Alan Geovannie','Lopez','Salas','4454554','74588','1546','28',1,2,3),
		('Adam Jorge','Gutierrez','Torres','4458813','74448','3598','Pinos',1,2,3),
		('Luis Pepe','Garcia','Salcido','7997988','74788','7855','Pilos',1,2,3),
		('Jesus Edgar','Casillas','Orosco','136497','74111','9522','Loder',1,2,3),
		('Lalo Jose','Montano','Marquez','4976222','71455','5587','Colon',1,2,3)

      
     
---SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----

--SELECT * FROM Hotel
--SELECT * FROM Sucursal
--SELECT * FROM Turista
--SELECT * FROM Vuelo
---------------------------------------ACTUALIZAR ALGUNOS DATOS----------------------------

--UPDATE Hotel SET nombre = 'cambio' WHERE idHotel = 1

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Hotel
--SELECT * FROM Sucursal
--SELECT * FROM Turista
--SELECT * FROM Vuelo

-------PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------------------------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------------

--DELETE FROM Hotel WHERE idHotel=1
--DELETE FROM Sucursal WHERE idSucursal=1

----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------
--SELECT * FROM Hotel
--SELECT * FROM Sucursal
--SELECT * FROM Turista
--SELECT * FROM Vuelo
---TRUNCATE TABLE Cuerpo

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()

--select count(idHotel)from Hotel

--Tipos de Vistas
--select idHotel, CONCAT(nombre,'    ',Numplaza,'   ',telefono) as 'Detalles' from Hotel
--GO
--Vista
--CREATE VIEW vwDetalles as
--select idHotel, concat (nombre,'    ',Numplaza,'   ',telefono) as 'Detalles' from Hotel where estatus = 1
--GO

--select * from vwDetalles

--select t1.nombre,t2.fecha from Turista as t1 inner join Vuelo as t2 on t1.idTurista = t2.idVuelo             

--select t1.nombre,t2.telefono from Hotel as t1 inner join Sucursal as t2 on t1.idHotel = t2.idSucursal             

--select t1.nombre,t2.paisdestino from Turista as t1 inner join Vuelo as t2 on t1.idTurista = t2.idVuelo             

--select t1.nombre,t2.paisorigen from Turista as t1 inner join Vuelo as t2 on t1.idTurista = t2.idVuelo             

--select t1.nombre,t2.paisorigen,estadoorigen,ciudadorigen from Turista as t1 inner join Vuelo as t2 on t1.idTurista = t2.idVuelo             






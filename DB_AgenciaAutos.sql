USE master;
GO
IF DB_ID (N'AgenciaAutos') IS NOT NULL
DROP DATABASE AgenciaAutos;
GO
CREATE DATABASE AgenciaAutos
ON 
(NAME = AgenciaAutos_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AgenciaAutos.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = AgenciaAutos_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AgenciaAutos.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE AgenciaAutos;
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
CREATE TABLE Agencia 
(
idAgencia int IDENTITY(1,1),
nombre varchar (50) not null,
clave char (20) not null,
numero char (20) not null,
calle varchar (50) not null, 
colonia varchar (50) not null,
CodigoPostal char (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Agencia PRIMARY KEY (idAgencia)
);
CREATE TABLE Cliente
(
idCliente int IDENTITY (1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
CURP char (30) not null,
Clave char (30) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Cliente PRIMARY KEY (idCliente)
);
CREATE TABLE Garaje
(
idGaraje int IDENTITY (1,1),
clave char (25) not null,
descripcion varchar (50) not null,
numero char (15) not null,
tipo varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Garaje PRIMARY KEY (idGaraje)
);
CREATE TABLE Coche
(
idCoche int IDENTITY (1,1),
clave char (25) not null,
descripcion varchar (50) not null,
modelo char (20) not null,
marca varchar (30) not null,
precio numeric (10,2) not null,
idGaraje int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Coche PRIMARY KEY (idCoche)
);
CREATE TABLE Reserva
(
idReserva int IDENTITY (1,1),
clave char (25) not null,
descripcion varchar (50) not null,
nombre varchar (50) not null,
tipo varchar (50) not null,
idCliente int null,
idAgencia int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Reserva PRIMARY KEY (idReserva)
);
CREATE TABLE CocheReserva
(
idCocheReserva int IDENTITY (1,1),
idCoche int null,
idReserva int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_CocheReserva PRIMARY KEY (idCocheReserva)
);
GO
--------------------------------INDEX------------------------------
CREATE INDEX IX_Agencia ON Agencia(idAgencia);
GO
CREATE INDEX IX_Cliente ON Cliente(idCliente);
GO
CREATE INDEX IX_Coche ON Coche(idCoche);
GO
CREATE INDEX IX_Garaje ON Garaje(idGaraje);
GO
CREATE INDEX IX_Reserva ON Reserva(idReserva);
GO
CREATE INDEX IX_CocheReserva ON CocheReserva(idCocheReserva);
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
ALTER TABLE Agencia
ADD CONSTRAINT FK_AgenciaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Agencia
ADD CONSTRAINT FK_AgenciaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Cliente
ADD CONSTRAINT FK_ClienteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Cliente
ADD CONSTRAINT FK_ClienteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Coche
ADD CONSTRAINT FK_CocheGaraje
FOREIGN KEY (idGaraje) REFERENCES Garaje(idGaraje);
GO
ALTER TABLE Coche
ADD CONSTRAINT FK_CocheUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Coche
ADD CONSTRAINT FK_CocheUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Garaje
ADD CONSTRAINT FK_GarajeUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Garaje
ADD CONSTRAINT FK_GarajeUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Reserva
ADD CONSTRAINT FK_ReservaCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);
GO
ALTER TABLE Reserva
ADD CONSTRAINT FK_ReservaAgencia
FOREIGN KEY (idAgencia) REFERENCES Agencia(idAgencia);
GO
ALTER TABLE Reserva
ADD CONSTRAINT FK_ReservaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Reserva
ADD CONSTRAINT FK_ReservaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CocheReserva
ADD CONSTRAINT FK_CocheReservaCoche
FOREIGN KEY (idCoche) REFERENCES Coche(idCoche);
GO
ALTER TABLE CocheReserva
ADD CONSTRAINT FK_CocheReservaReserva
FOREIGN KEY (idReserva) REFERENCES Reserva(idReserva);
GO
ALTER TABLE CocheReserva
ADD CONSTRAINT FK_CocheReservaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CocheReserva
ADD CONSTRAINT FK_CocheReservaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave)
VALUES ('Alan Geovannie', 'Morales' ,'Salazar' ,'I19050458@monclova.tecnm.mx' ,'12345677')	

INSERT INTO Agencia(nombre,clave,numero,calle,colonia,codigopostal)
VALUES    ('AV','3ER33334','1254','42','centro','18877'),
          ('TR','6373HHEE','8700','03','centro','69595'),
		  ('EW','DKKRKR6R','3020','9','centro','14155'),
		  ('AX','BDHD3383','1544','20','centro','31615'),
		  ('ER','63J383JK','9875','90','centro','49452')
		  
INSERT INTO Cliente(nombre,apellidoPaterno,apellidoMaterno,Clave,CURP)
VALUES      ('Pepe Geovannie','Morales','Salazar','AJ8383J','MOSAUUAU555'),
            ('Jose Geovannie','Lopez','Salas','3837UEENN','DE4E4EE44E6'),
		    ('Sabino Jorge','Gutierrez','Torres','EEKE8837','DQ22WWWWWWW'),
		    ('Arturo Pepe','Garcia','Salcido','O39383IKK','QW12W555551'),
		    ('Luis Edgar','Casillas','Orosco','3LEI83U2','79A5A5OEA55'),
		    ('Raul Jose','Montano','Marquez','EKEO9202','1QSE34FKDKDKR')

INSERT INTO Garaje(clave,descripcion,numero,tipo)
VALUES   ('NDNN333333','grande','22','carro'),
         ('93993I3KJJ','grande','23','carro'),
		 ('3993DJJJJK','chico','24','carro'),
		 ('DKKDK31111','chico','25','carro'),
		 ('NNDDJJ0000','grande','26','carro')

INSERT INTO Coche(Clave,descripcion,modelo,marca,precio,idGaraje)
VALUES    ('83UE8399E93','carro azul','2020','mazda',888000,1),
          ('83UE8399E93','carro azul','2020','mazda',144000,1),
		  ('83UE8399E93','carro azul','2020','mazda',100000,1),
		  ('83UE8399E93','carro azul','2020','mazda',500000,1),
		  ('83UE8399E93','carro azul','2020','mazda',999000,1)

INSERT INTO Reserva(clave,descripcion,nombre,tipo,idCliente,idAgencia)
VALUES   ('83I3J930','autos nuevos','URR','LLMDMM',1,2),
         ('83I3J930','autos nuevos','URR','LLMDMM',1,2),
		 ('83I3J930','autos nuevos','URR','LLMDMM',1,2),
		 ('83I3J930','autos nuevos','URR','LLMDMM',1,2),
		 ('83I3J930','autos nuevos','URR','LLMDMM',1,2)

INSERT INTO CocheReserva(idCoche,idReserva)
VALUES         (1,2),
               (1,2),
			   (1,2),
			   (1,2),
			   (1,2),
			   (1,2)

-----SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----

--SELECT * FROM Agencia
--SELECT * FROM Coche
--SELECT * FROM Cliente

-------------------------ACTUALIZAR ALGUNOS DATOS----------------------------

--UPDATE Agencia SET clave = '98I8UY6Y' WHERE idAgencia = 2

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Agencia
--SELECT * FROM Coche
--SELECT * FROM Cliente


-------OTRA MANERA PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------
--DELETE FROM Agencia WHERE idAgencia=1
--DELETE FROM Cliente WHERE idCliente=1

------SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------

--SELECT * FROM Agencia
--SELECT * FROM Coche
--SELECT * FROM Cliente

---TRUNCATE TABLE Cuerpo

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()


--COUNT MAX MIN AVG
--select count(*)from Agencia

--Tipos de Vistas
--select idCoche, CONCAT(marca,'    ',modelo,'     ',descripcion) as 'descripcion' from Coche
--GO
----Vista
--CREATE VIEW vwListaDescripcion as
--select idCoche, concat (marca,'    ',modelo,'     ',descripcion) as 'descripcion' from Coche where estatus = 1
--GO

--select * from vwListaDescripcion


select t1.nombre,t2.nombre from Agencia as t1 inner join Reserva as t2 on t1.idAgencia = t2.idReserva

select t1.marca,t2.nombre from Coche as t1 inner join Reserva as t2 on t1.idCoche = t2.idReserva

select t1.marca,t2.numero from Coche as t1 inner join Garaje as t2 on t1.idCoche = t2.idGaraje

select t1.descripcion,t2.tipo from Coche as t1 inner join Garaje as t2 on t1.idCoche = t2.idGaraje

select t1.calle,colonia,CodigoPostal,t2.clave from Agencia as t1 inner join Reserva as t2 on t1.idAgencia = t2.idReserva






























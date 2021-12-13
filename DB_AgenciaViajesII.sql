USE master;
GO
IF DB_ID (N'AgenciaViajesII') IS NOT NULL
DROP DATABASE AgenciaViajesII;
GO
CREATE DATABASE AgenciaViajesII 
ON 
(NAME = AgenciaViajesII_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AgenciaViajesII.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = AgenciaViajesII_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AgenciaViajesII.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE AgenciaViajesII;
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
fechaCrea datetime not null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Usuario PRIMARY KEY(idUsuario)
);
CREATE TABLE Cliente
(
idCliente int IDENTITY (1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
telefono char (15) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Cliente PRIMARY KEY (idCliente)
);
CREATE TABLE Hotel
(
idHotel int IDENTITY (1,1),
nombre varchar (50) not null,
plazasDisponibles varchar (50) not null,
CodigoPostal char (6) not null,
numExterior char (15) not null,
calle varchar (50) not null,
colonia varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Hotel PRIMARY KEY (idHotel)
);
CREATE TABLE Puntoderuta
(
idPuntoderuta int IDENTITY (1,1),
descripcion varchar (50) not null,
tipo varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Puntoderuta PRIMARY KEY (idPuntoderuta)
);
CREATE TABLE Tour
(
idTour int IDENTITY (1,1),
fecha datetime not null,
finalidad varchar (50) not null,
costo numeric (10,2) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Tour PRIMARY KEY (idTour)
);
CREATE TABLE ClienteTour
(
idClienteTour int IDENTITY (1,1),
idCliente int null,
idTour int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ClienteTour PRIMARY KEY (idClienteTour)
);
CREATE TABLE HotelPuntoderuta
(
idHotelPuntoderuta int IDENTITY (1,1),
idHotel int null,
idPuntoderuta int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_HotelPuntoderuta PRIMARY KEY (idHotelPuntoderuta)
);
CREATE TABLE PuntoderutaTour
(
idPuntoderutaTour int IDENTITY (1,1),
idPuntoderuta int null,
idTour int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_PuntoderutaTour PRIMARY KEY (idPuntoderutaTour)
);
CREATE TABLE ClienteHotel
(
idClienteHotel int IDENTITY (1,1),
idCliente int null,
idHotel int null,
fecha datetime not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ClienteHotel PRIMARY KEY (idClienteHotel)
);
--------------------------------INDEX------------------------------
CREATE INDEX IX_Cliente ON Cliente(idCliente);
GO
CREATE INDEX IX_Hotel ON Hotel(idHotel);
GO
CREATE INDEX IX_PuntodeRuta ON PuntodeRuta(idPuntodeRuta);
GO
CREATE INDEX IX_Tour ON Tour(idTour);
GO
CREATE INDEX IX_ClienteTour ON ClienteTour(idClienteTour);
GO
CREATE INDEX IX_HotelPuntoderuta ON HotelPuntoderuta(idHotelPuntoderuta);
GO
CREATE INDEX IX_HPuntodeRutaTour ON PuntodeRutaTour(idPuntodeRutaTour);
GO
CREATE INDEX IX_ClienteHotel ON ClienteHotel(idClienteHotel);
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
ALTER TABLE Cliente
ADD CONSTRAINT FKClienteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Cliente
ADD CONSTRAINT FKClienteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Hotel
ADD CONSTRAINT FKHotelUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Hotel
ADD CONSTRAINT FKHotelUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Puntoderuta
ADD CONSTRAINT FKPuntoderutaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Puntoderuta
ADD CONSTRAINT FKPuntoderutaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Tour
ADD CONSTRAINT FKTourUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Tour
ADD CONSTRAINT FKTourUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ClienteTour
ADD CONSTRAINT FKClienteTourCliente 
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);
GO
ALTER TABLE ClienteTour
ADD CONSTRAINT FKClienteTourTour
FOREIGN KEY (idTour) REFERENCES Tour(idTour);
GO
ALTER TABLE ClienteTour
ADD CONSTRAINT FKClienteTourUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ClienteTour
ADD CONSTRAINT FKClienteTourUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE HotelPuntoderuta
ADD CONSTRAINT FKHotelPuntoderutaHotel
FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel);
GO
ALTER TABLE HotelPuntoderuta
ADD CONSTRAINT FKHotelPuntoderutaPuntoderuta
FOREIGN KEY (idPuntoderuta) REFERENCES Puntoderuta(idPuntoderuta);
GO
ALTER TABLE HotelPuntoderuta
ADD CONSTRAINT FKHotelPuntoderutaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE HotelPuntoderuta
ADD CONSTRAINT FKHotelPuntoderutaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PuntoderutaTour
ADD CONSTRAINT FKPuntoderutaTourPuntoderuta
FOREIGN KEY (idPuntoderuta) REFERENCES Puntoderuta(idPuntoderuta);
GO
ALTER TABLE PuntoderutaTour
ADD CONSTRAINT FKPuntoderutaTourTour
FOREIGN KEY (idTour) REFERENCES Tour(idTour);
GO
ALTER TABLE PuntoderutaTour
ADD CONSTRAINT FKPuntoderutaTourUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PuntoderutaTour
ADD CONSTRAINT FKPuntoderutaTourUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ClienteHotel
ADD CONSTRAINT FKClienteHotelCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);
GO
ALTER TABLE ClienteHotel
ADD CONSTRAINT FKClienteHotelHotel
FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel);
GO
ALTER TABLE ClienteHotel
ADD CONSTRAINT FKClienteHotelUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ClienteHotel
ADD CONSTRAINT FKClienteHotelUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica)
VALUES ('Alan Geovannie','Morales','Salazar','I19050458@monclova.tecnm.mx','Tec12345.',1,GETDATE(),1,GETDATE())

INSERT INTO Cliente(nombre,apellidoPaterno,apellidoMaterno,telefono)
VALUES    ('Pepe Geovannie','Morales','Salazar','8661458523'),
        ('Jose Geovannie','Lopez','Salas','8661457893'),
		('Sabino Jorge','Gutierrez','Torres','8661416423'),
		('Arturo Pepe','Garcia','Salcido','8661447123'),
		('Luis Edgar','Casillas','Orosco','8661458000'),
		('Raul Jose','Montano','Marquez','8661444878')

INSERT INTO Hotel(nombre,plazasDisponibles,CodigoPostal,numExterior,calle,colonia)
VALUES ('Luna','lksmlk','49955','1475','16','Astrazeneca'),
       ('Monte','sksks','5495','6655','Pinos','Monte'),
	   ('Sol','sjnsjns','44666','5544','buaa','Polo'),
	   ('Posada','sknskn','12111','4454','mona','Azteca'),
	   ('luz','sksss','11111','4022','8','Apache'),
	   ('Cielo','isjis','62222','1784','5','Cecyte')

INSERT INTO Puntoderuta(descripcion,tipo)
VALUES ('eaddmdd','A'),
       ('dknedke','C'),
	   ('kdmekde','B'),
	   ('kwmdemk','E'),
	   ('ednede','F'),
	   ('dkemde','A')

INSERT INTO Tour(fecha,finalidad,costo)
VALUES    (1,'Paseo',300),
          (1,'Trabajo',300),
		  (1,'Vij',300),
		  (1,'Paseo',300),
		  (1,'Paseo',300)

INSERT INTO ClienteTour(idCliente,idTour)
VALUES    (1,2),
          (1,2),
		  (1,2),
		  (1,2),
		  (1,2),
		  (1,2)

INSERT INTO HotelPuntoderuta(idHotel,idPuntoderuta)
VALUES    (1,2),
          (1,2),
		  (1,2),
		  (1,2),
		  (1,2),
		  (1,2)

INSERT INTO PuntoderutaTour(idPuntoderuta,idTour)
VALUES    (1,2),
          (1,2),
		  (1,2),
		  (1,2),
		  (1,2),
		  (1,2)

INSERT INTO ClienteHotel(idCliente,idHotel,fecha)
VALUES    (1,2,getdate()),
          (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate())






-----SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----


--SELECT * FROM Cliente

-------------------------ACTUALIZAR ALGUNOS DATOS----------------------------

--UPDATE Cliente SET nombre = 'Lalo Jose' WHERE idCliente = 1

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Cliente


-------PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------

--DELETE FROM Cliente WHERE idCliente=1

------SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------

--SELECT * FROM Cliente

---TRUNCATE TABLE Cliente

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()

--select count(idCliente)from Cliente

--Tipos de Vistas
--select idCliente, CONCAT(nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Cliente
--GO
--Vista
--CREATE VIEW vwListaCliente as
--select idCliente, concat (nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Cliente where estatus = 1
--GO

--select * from vwListaCliente



select t1.nombre,t2.nombre from Cliente as t1 inner join Hotel as t2 on t1.idCliente = t2.idHotel

select t1.nombre,t2.finalidad from Cliente as t1 inner join Tour as t2 on t1.idCliente = t2.idTour

select t1.costo,t2.nombre,apellidoPaterno,apellidoMaterno from Tour as t1 inner join Cliente as t2 on t1.idTour = t2.idCliente

select t1.fecha,t2.plazasDisponibles from Tour as t1 inner join Hotel as t2 on t1.idTour = t2.idHotel

select t1.nombre,t2.tipo from Cliente as t1 inner join Puntoderuta as t2 on t1.idCliente = t2.idPuntoderuta




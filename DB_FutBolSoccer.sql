USE master;
GO
IF DB_ID (N'FutBolSoccer') IS NOT NULL
DROP DATABASE FutBolSoccer;
GO
CREATE DATABASE FutBolSoccer
ON 
(NAME = FutBolSoccer_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FutBolSoccer.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = FutBolSoccer_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FutBolSoccer.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE FutBolSoccer;
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
CREATE TABLE Colegiado
(
idColegiado int IDENTITY (1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
tipo varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Colegiado PRIMARY KEY (idColegiado)
);
CREATE TABLE Equipo
(
idEquipo int IDENTITY (1,1),
nombre varchar (50) not null,
ciudad varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Equipo PRIMARY KEY (idEquipo)
);
CREATE TABLE Jugador
(
idJugador int IDENTITY (1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
calle varchar (50) not null,
numero char (10) not null,
colonia varchar (50) not null,
ciudad varchar (50) not null,
CURP char (25) not null,
idEquipo int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Jugador PRIMARY KEY (idJugador)
);
CREATE TABLE Partido
(
idPartido int IDENTITY (1,1),
nombre varchar (50) not null,
tipo varchar (50) not null,
idEquipo int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Partido PRIMARY KEY (idPartido)
);
CREATE TABLE Puesto
(
idPuesto int IDENTITY (1,1),
nombre varchar (50) not null,
descripcion varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Puesto PRIMARY KEY (idPuesto)
);
CREATE TABLE JugadorPuesto
(
idJugadorPuesto int IDENTITY(1,1),
idJugador int null,
idPuesto int null,
feche datetime not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_JugadorPuesto PRIMARY KEY (idJugadorPuesto)
);
CREATE TABLE ColegiadoPartido
(
idColegiadoPartido int IDENTITY(1,1),
idColegiado int null,
idPartido int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ColegiadoPartido PRIMARY KEY (idColegiadoPartido)
);
GO
--------------------------------INDEX------------------------------
CREATE INDEX IX_Colegiado ON Colegiado(idColegiado);
GO
CREATE INDEX IX_Equipo ON Equipo(idEquipo);
GO
CREATE INDEX IX_Jugador ON Jugador(idJugador);
GO
CREATE INDEX IX_Partido ON Partido(idPartido);
GO
CREATE INDEX IX_Puesto ON Puesto(idPuesto);
GO
CREATE INDEX IX_JugadorPuesto ON JugadorPuesto(idJugadorPuesto);
GO
CREATE INDEX IX_ColegiadoPartido ON ColegiadoPartido(idColegiadoPartido);
GO
---------------------------------RELACIONES--------------------------------
ALTER TABLE Usuario
ADD CONSTRAINT FK_UsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Usuario
ADD CONSTRAINT FK_UsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Colegiado
ADD CONSTRAINT FK_ColegiadoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Colegiado
ADD CONSTRAINT FK_ColegiadoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Equipo
ADD CONSTRAINT FK_EquipoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Equipo
ADD CONSTRAINT FK_EquipoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Jugador
ADD CONSTRAINT FK_JugadorEquipo
FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo);
GO
ALTER TABLE Jugador
ADD CONSTRAINT FK_JugadorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Jugador
ADD CONSTRAINT FK_JugadorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Partido
ADD CONSTRAINT FK_PartidoEquipo
FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo);
GO
ALTER TABLE Partido
ADD CONSTRAINT FK_PartidoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Partido
ADD CONSTRAINT FK_PartidoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Puesto
ADD CONSTRAINT FK_PuestoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Puesto
ADD CONSTRAINT FK_PuestoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE JugadorPuesto
ADD CONSTRAINT FK_JugadorPuestoJugador
FOREIGN KEY (idJugador) REFERENCES Jugador(idJugador);
GO
ALTER TABLE JugadorPuesto
ADD CONSTRAINT FK_JugadorPuestoPuesto
FOREIGN KEY (idPuesto) REFERENCES Puesto(idPuesto);
GO
ALTER TABLE JugadorPuesto
ADD CONSTRAINT FK_JugadorPuestoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE JugadorPuesto
ADD CONSTRAINT FK_JugadorPuestoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ColegiadoPartido
ADD CONSTRAINT FK_ColegiadoPartidoColegiado
FOREIGN KEY (idColegiado) REFERENCES Colegiado(idColegiado);
GO
ALTER TABLE ColegiadoPartido
ADD CONSTRAINT FK_ColegiadoPartidoPartido
FOREIGN KEY (idPartido) REFERENCES Partido(idPartido);
GO
ALTER TABLE ColegiadoPartido
ADD CONSTRAINT FK_ColegiadoPartidoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ColegiadoPartido
ADD CONSTRAINT FK_ColegiadoPartidoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave)
VALUES ('Alan Geovannie', 'Morales' ,'Salazar' ,'I19050458@monclova.tecnm.mx' ,'12345677')	

INSERT INTO Colegiado(nombre,apellidoPaterno,apellidoMaterno,tipo)
VALUES     ('Alan Geovannie','Morales','Salazar','Co¿ampo'),
           ('Alan Geovannie','Lopez','Salas','esquina'),
		   ('Adam Jorge','Gutierrez','Torres','campo'),
		   ('Luis Pepe','Garcia','Salcido','campo'),
		   ('Jesus Edgar','Casillas','Orosco','campo'),
		   ('Lalo Jose','Montano','Marquez','campo')
INSERT INTO Equipo(ciudad,nombre)
VALUES      ('tampico','loadaa'),
            ('monterrey','dddd'),
			('torreon','dkkdk'),
			('guadalajara','loaaa'),
			('dijeij','dddd'),
			('eieiei','ddee')

INSERT INTO Jugador(nombre,apellidoPaterno,apellidoMaterno,calle,numero,colonia,ciudad,CURP,idEquipo)
VALUES      ('Pepe Geovannie','Morales','Salazar','Calle 4',', 1929','lomas heroes','frontera','MOSAUUAU555',1),
            ('Jose Geovannie','Lopez','Salas','Calle Azteca','1977','villa heroes','san buena','DE4E4EE44E6',1),
		    ('Sabino Jorge','Gutierrez','Torres','Calle 1','1277','valle heroes','sabinas','DQ22WWWWWWW',1),
		    ('Arturo Pepe','Garcia','Salcido','Calle Loma','7877','heroes','rosita','QW12W555551',1),
		    ('Luis Edgar','Casillas','Orosco','Calle 32','1211','mirador','saltillo','79A5A5A55',1),
		    ('Raul Jose','Montano','Marquez','Calle 10 ','1999','deportivo','ocampo','1QSE34FR',1)

INSERT INTO Partido(nombre,tipo,idEquipo)
VALUES    ('amistoso','somdmd',1),
          ('final','smdmd',1),
		  ('amistoso','48Q212',1),
		  ('clasico','NDJE728',1),
		  ('eliminacion','92JWMBB',1),
		  ('torneo','HDHDY6',1)

INSERT INTO Puesto(descripcion,nombre)
VALUES    ('ksmmaak','lateral'),
          ('aoaokaa','delantero'),
		  ('aamamall','medio'),
		  ('alalala','portero'),
		  ('kamamkak','capitan'),
		  ('akmamaa','defensa')

INSERT INTO JugadorPuesto(idJugador,idPuesto,feche)
VALUES    (1,2,getdate()),
          (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate())

INSERT INTO ColegiadoPartido(idColegiado,idPartido)
VALUES    (1,2),
          (1,2),
		  (1,2),
		  (1,2),
		  (1,2),
		  (1,2)

-----SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----

--SELECT * FROM Colegiado
--SELECT * FROM Equipo
--SELECT * FROM Jugador

-------------------------ACTUALIZAR ALGUNOS DATOS----------------------------

--UPDATE Jugador SET calle = 'Azteca' WHERE idJugador = 2

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Colegiado
--SELECT * FROM Equipo
--SELECT * FROM Jugador


-------OTRA MANERA PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------
--DELETE FROM Jugador WHERE idJugador=1
--DELETE FROM Equipo WHERE idEquipo=1

------SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------

--SELECT * FROM Colegiado
--SELECT * FROM Equipo
--SELECT * FROM Jugador

---TRUNCATE TABLE Cuerpo

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()


--COUNT MAX MIN AVG
--select count(*)from Jugador

--Tipos de Vistas
--select idJugador, CONCAT(nombre,'    ',apellidoPaterno,'     ',apellidoMaterno) as 'Nombre Completo' from Jugador
--GO
----Vista
--CREATE VIEW vwListaJugador as
--select idJugador, concat (nombre,'    ',apellidoPaterno,'     ',apellidoMaterno) as 'Nombre Completo' from Jugador where estatus = 1
--GO

--select * from vwListaJugador

select t1.nombre,t2.nombre from Equipo as t1 inner join Jugador as t2 on t1.idEquipo = t2.idJugador             

select t1.nombre,t2.nombre from Equipo as t1 inner join Puesto as t2 on t1.idEquipo = t2.idPuesto             

select t1.nombre,t2.nombre from Equipo as t1 inner join Partido as t2 on t1.idEquipo = t2.idPartido          

select t1.nombre,t2.nombre from Colegiado as t1 inner join Partido as t2 on t1.idColegiado = t2.idPartido            

select t1.nombre,t2.nombre from Colegiado as t1 inner join Jugador as t2 on t1.idColegiado = t2.idJugador           







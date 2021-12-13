USE master;
GO
IF DB_ID (N'ServicioMilitar') IS NOT NULL
DROP DATABASE ServicioMilitar;
GO
CREATE DATABASE ServicioMilitar
ON 
(NAME = ServicioMilitar_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ServicioMilitar.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = ServicioMilitar_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ServicioMilitar.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE ServicioMilitar;
GO
--------------------------------------TABLAS----------------------------------------------
CREATE TABLE Usuario
(
idUsuario int IDENTITY(1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
correo varchar (50) UNIQUE not null,
clave char (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Usuario PRIMARY KEY(idUsuario)
);
CREATE TABLE Compa�ia 
(
idCompa�ia int IDENTITY(1,1),
numeroCompa�ia varchar (25) not null,
actividadPricipal varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Compa�ia PRIMARY KEY (idCompa�ia)
);
CREATE TABLE Cuartel
(
idCuartel int IDENTITY(1,1),
codigoCuartel varchar (25) not null,
ubicacion varchar (50) not null,
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Cuartel PRIMARY KEY (idCuartel)
);
CREATE TABLE Cuerpo
(
idCuerpo int IDENTITY(1,1),
codigoCuerpo varchar (25)not null,
denominacion varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default  null,
fechaModifica datetime default null
CONSTRAINT PK_Cuerpo PRIMARY KEY (idCuerpo)
);
CREATE TABLE Servicio
(
idServicio int IDENTITY(1,1),
codigoServicio varchar (25) not null,
descripcion varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Servicio PRIMARY KEY (idServicio)
);
CREATE TABLE Soldado
(
idSoldado int IDENTITY (1,1),
codigoSoldado varchar (25) not null,
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
grado varchar (50) not null,
idCuerpo int null,
idCompa�ia int null,
idCuartel int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Soldado PRIMARY KEY (idSoldado)
);
CREATE TABLE ServicioSoldado
(
idServicioSoldado int IDENTITY(1,1),
idServicio int not null,
idSoldado int not null,
fecha datetime not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ServicioSoldado PRIMARY KEY (idServicioSoldado)
);
CREATE TABLE Compa�iaCuartel
(
idCompa�iaCuartel int IDENTITY(1,1),
idCompa�ia int not null,
idCuartel int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Compa�iaCuartel PRIMARY KEY (idCompa�iaCuartel)
);
GO
--------------------------------INDEX------------------------------
CREATE INDEX IX_Compa�ia ON Compa�ia(idCompa�ia);
GO
CREATE INDEX IX_Cuartel ON Cuartel(idCuartel);
GO
CREATE INDEX IX_Cuerpo ON Cuerpo(idCuerpo);
GO
CREATE INDEX IX_Servicio ON Servicio(idServicio);
GO
CREATE INDEX IX_Soldado ON Soldado(idSoldado);
GO
CREATE INDEX IX_ServicioSoldado ON ServicioSoldado(idServicioSoldado);
GO
CREATE INDEX IX_Compa�iaCuartel ON Compa�iaCuartel(idCompa�iaCuartel);
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
ALTER TABLE Compa�ia
ADD CONSTRAINT FK_Compa�iaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Compa�ia
ADD CONSTRAINT FK_Compa�iaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Cuartel
ADD CONSTRAINT FK_CuartelUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Cuartel
ADD CONSTRAINT FK_CuartelUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Cuerpo
ADD CONSTRAINT FK_CuerpoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Cuerpo
ADD CONSTRAINT FK_CuerpoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Servicio
ADD CONSTRAINT FK_ServicioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Servicio
ADD CONSTRAINT FK_ServicioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Soldado
ADD CONSTRAINT FK_SoldadoCuerpo 
FOREIGN KEY (idCuerpo) REFERENCES Cuerpo(idCuerpo);
GO
ALTER TABLE Soldado
ADD CONSTRAINT FK_SoldadoCompa�ia 
FOREIGN KEY (idCompa�ia) REFERENCES Compa�ia(idCompa�ia);
GO
ALTER TABLE Soldado
ADD CONSTRAINT FK_SoldadoCuartel 
FOREIGN KEY (idCuartel) REFERENCES Cuartel(idCuartel);
GO
ALTER TABLE Soldado
ADD CONSTRAINT FK_SoldadoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Soldado
ADD CONSTRAINT FK_SoldadoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ServicioSoldado
ADD CONSTRAINT FK_ServicioSoldadoServcio 
FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio);
GO
ALTER TABLE ServicioSoldado
ADD CONSTRAINT FK_ServicioSoldadoSoldado 
FOREIGN KEY (idSoldado) REFERENCES Soldado(idSoldado);
GO
ALTER TABLE ServicioSoldado
ADD CONSTRAINT FK_ServicioSoldadoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ServicioSoldado
ADD CONSTRAINT FK_ServicioSoldadoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Compa�iaCuartel
ADD CONSTRAINT FK_Compa�iaCuartelCompa�ia 
FOREIGN KEY (idCompa�ia) REFERENCES Compa�ia(idCompa�ia);
GO
ALTER TABLE Compa�iaCuartel
ADD CONSTRAINT FK_Compa�iaCuartelCuartel 
FOREIGN KEY (idCuartel) REFERENCES Cuartel(idCuartel);
GO
ALTER TABLE Compa�iaCuartel
ADD CONSTRAINT FK_Compa�iaCuartelUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Compa�iaCuartel
ADD CONSTRAINT FK_Compa�iaCuartelUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave)
VALUES ('Alan Geovannie','Morales','Salazar','I19050458@monclova.tecnm.mx','Tec12345.'),
       ('Luis Adrian','Ganzalo','Alvarez','Admin','Tec12345.') 
       
select * from Usuario
INSERT INTO Compa�ia(numeroCompa�ia,actividadPricipal)
VALUES ('C 1', 'D1'),
       ('C 2', 'D2'),
       ('C 3', 'D3'),
       ('C 4', 'D4'),
       ('C 5', 'D5')

INSERT INTO Cuerpo (codigoCuerpo, denominacion)
VALUES ('Cuerpo 1', 'D1'),
       ('Cuerpo 2', 'D2'),
       ('Cuerpo 3', 'D3'),
       ('Cuerpo 4', 'D4'),
       ('Cuerpo 5', 'D5')

INSERT INTO Cuartel(codigoCuartel,nombre,ubicacion)
VALUES ('Cuartel1','Prueba','Monclova'),
       ('Cuartel2','Heroes','Frontera'),
	   ('Cuartel3','Valiente','Casta�os'),
	   ('Cuartel4','Justo','Candela'),
	   ('Cuartel5','Valioso','Rosita')

INSERT INTO Servicio(codigoServicio,descripcion)
VALUES ('OI45', 'Barrer'),
       ('87VF', 'Trabajar'),
	   ('ONV5', 'Correr'),
	   ('OI97', 'Nadar'),
	   ('ORTR', 'Lavar')

INSERT INTO Soldado(codigoSoldado,nombre,apellidoPaterno,apellidoMaterno,grado,idCuerpo,idCompa�ia,idCuartel)
VALUES  ('798E','Alan Geovannie','Morales','Salazar','cadete',1,2,3),
        ('7RTE','Alan Geovannie','Lopez','Salas','coronel',1,2,3),
		('78RE','Adam Jorge','Gutierrez','Torres','coronel',1,2,3),
		('78XS','Luis Pepe','Garcia','Salcido','coronel',1,2,3),
		('78WW','Jesus Edgar','Casillas','Orosco','coronel',1,2,3),
		('78CW','Lalo Jose','Montano','Marquez','coronel',1,2,3)

INSERT INTO ServicioSoldado(idServicio,idSoldado,fecha)
VALUES  (2,2,getdate()),
		(2,2,getdate()),
		(2,2,getdate()),
		(2,2,getdate()),
		(2,2,getdate()),
		(2,2,getdate())



INSERT INTO Compa�iaCuartel(idCompa�ia,idCuartel)
VALUES (1,2),
       (1,2),
	   (1,2),
	   (1,2),
	   (1,2)



-----SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----

--SELECT * FROM Compa�ia
--SELECT * FROM Cuerpo
--SELECT * FROM Cuerpo

-------------------------ACTUALIZAR ALGUNOS DATOS----------------------------

--UPDATE Compa�ia SET actividadPricipal = 'cambio' WHERE idCompa�ia = 1

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Compa�ia
--SELECT * FROM Cuerpo
--SELECT * FROM Cuartel

-------OTRA MANERA PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

------------------------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------
--DELETE FROM Compa�ia WHERE idCompa�ia=1
--DELETE FROM Cuartel WHERE idCuartel=1

------SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------
--SELECT * FROM Compa�ia
--SELECT * FROM Cuerpo
--SELECT * FROM Cuartel

---TRUNCATE TABLE Cuerpo

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()


--COUNT MAX MIN AVG
--select count(*)from Compa�ia

----------------------------------------------------Tipos de Vistas----------------------------------------------

--select idSoldado, CONCAT(nombre,'  ',apellidoPaterno,'  ',apellidoMaterno) as 'Nombre Completo' from Soldado
--GO
--Vista
--CREATE VIEW vwListaSoldados as
--select codigoSoldado, concat (nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Soldado where estatus = 1
--GO

 
--select t1.nombre,t2.nombre from soldado as t1 inner join Cuartel as t2 on t1.idCuartel = t2.idCuartel             

--select t1.codigoCuerpo,t2.nombre from Cuerpo as t1 inner join Cuartel as t2 on t1.idCuerpo = t2.idCuartel

--select t1.numeroCompa�ia,t2.nombre,apellidoMaterno from Compa�ia as t1 inner join Soldado as t2 on t1.idCompa�ia = t2.idSoldado

--select t1.descripcion,t2.nombre,apellidoPaterno,apellidoMaterno from Servicio as t1 inner join Soldado as t2 on t1.idServicio = t2.idSoldado

--select t1.ubicacion,t2.nombre from Cuartel as t1 inner join Soldado as t2 on t1.idCuartel = t2.idSoldado


select * from Usuario
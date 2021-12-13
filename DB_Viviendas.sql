
USE master;
GO
IF DB_ID (N'Viviendas') IS NOT NULL
DROP DATABASE Viviendas;
GO
CREATE DATABASE Viviendas 
ON 
(NAME = Viviendas_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Viviendas.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = Viviendas_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Viviendas.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE Viviendas;
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
CREATE TABLE Persona
(
idPersona int IDENTITY(1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
telefono char (12) not null,
FechaNacimiento varchar (10) not null,
CURP varchar (20) not null,
idMunicipio int null,
idVivienda  int null,
idPersonaDirige int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Persona PRIMARY KEY(idPersona)
);
CREATE TABLE Vivienda
(
idVivienda int IDENTITY(1,1),
colonia varchar (50) not null,
calle char (15) not null,
numero char (12) not null,
codigoPostal char (6) not null,
idMunicipio int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Vivienda PRIMARY KEY(idVivienda)
);
CREATE TABLE PersonaVivienda
(
idPersonaVivienda int IDENTITY(1,1),
idPersona int null,
idVivienda int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_PersonaVivienda PRIMARY KEY(idPersonaVivienda)
);
GO
--------------------------------INDEX------------------------------
CREATE INDEX IX_Municipio ON Municipio(idMunicipio);
GO
CREATE INDEX IX_Persona ON Persona(idPersona);
GO
CREATE INDEX IX_Vivienda ON Vivienda(idVivienda);
GO
CREATE INDEX IX_PersonaVivienda ON PersonaVivienda(idPersonaVivienda);
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
ALTER TABLE Municipio
ADD CONSTRAINT FK_MunicipioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Municipio
ADD CONSTRAINT FK_MunicipioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Persona 
ADD CONSTRAINT FK_PersonaMunicipio
FOREIGN KEY (idMunicipio) REFERENCES Municipio (idMunicipio)
GO
ALTER TABLE Persona
ADD CONSTRAINT FK_PersonaVivienda
FOREIGN KEY (idVivienda) REFERENCES Vivienda(idVivienda)
GO
--ALTER TABLE Persona
--ADD CONSTRAINT FK_PersonaPersonaDirige
--FOREIGN KEY (idPersonaDirige) REFERENCES PersonaDirige(idPersonaDirige)
--GO
ALTER TABLE Persona
ADD CONSTRAINT FK_PersonaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Persona
ADD CONSTRAINT FK_PersonaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Vivienda 
ADD CONSTRAINT FK_ViviendaMunicipio
FOREIGN KEY (idMunicipio) REFERENCES Municipio (idMunicipio)
GO
ALTER TABLE Vivienda
ADD CONSTRAINT FK_ViviendaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Vivienda
ADD CONSTRAINT FK_ViviendaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE PersonaVivienda
ADD CONSTRAINT FK_PersonaViviendaPersona
FOREIGN KEY (idPersona) REFERENCES Persona(idPersona)
GO
ALTER TABLE PersonaVivienda
ADD CONSTRAINT FK_PersonaViviendaVivienda
FOREIGN KEY (idVivienda) REFERENCES Vivienda(idVivienda)
GO
ALTER TABLE PersonaVivienda
ADD CONSTRAINT FK_PersonaViviendaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE PersonaVivienda
ADD CONSTRAINT FK_PersonaViviendaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica)
VALUES ('Alan Geovannie','Morales','Salazar','I19050458@monclova.tecnm.mx','Tec12345.',1,GETDATE(),1,GETDATE())

INSERT INTO Municipio(Numero,nombre)
VALUES ('8484', 'Frontera'),
       ('8211', 'San buena'),
	   ('8222', 'Castaños'),
	   ('8432', 'Monclova'),
	   ('8333', 'Sabinas')


INSERT INTO Vivienda(colonia,calle,numero,codigoPostal,idMunicipio)
VALUES   ('venturas ','Pinos','1587','26599',1),
         ('noras ','15','2644','95955',1),
		 ('azaeta ','23','3264','48222',1),
		 ('lomas ','48','2154','15455',1),
		 ('campa ','12','3012','65959',1),
		 ('zapata ','9','1899','32221',1)

INSERT INTO Persona(nombre,apellidoPaterno,apellidoMaterno,telefono,CURP,FechaNacimiento,idMunicipio,idVivienda)
VALUES  ('Pepe Geovannie','Morales','Salazar','8661458523','MOSAUUAU555','15-02-88',1,2),
        ('Jose Geovannie','Lopez','Salas','8661457893','AOAOKA8A84','14-08-85',1,2),
		('Sabino Jorge','Gutierrez','Torres','8661416423','1215AAQQ','02-02-94',1,2),
		('Arturo Pepe','Garcia','Salcido','8661447123','BAHAJ589','11-05-89',1,2),
		('Luis Edgar','Casillas','Orosco','8661458000','KDIRIREE','19-08-64',1,2),
		('Raul Jose','Montano','Marquez','8661444878','BDJHR8R8R','20-12-82',1,2)
      

INSERT INTO PersonaVivienda(idPersona,idVivienda)
VALUES   (1,2),
         (1,2),
		 (1,2),
		 (1,2),
		 (1,2),
		 (1,2)

-----SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----

--SELECT * FROM Municipio
--SELECT * FROM Persona


-------------------------ACTUALIZAR ALGUNOS DATOS----------------------------

--UPDATE Municipio SET numero = 'cambio' WHERE idMunicipio = 2

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Municipio
--SELECT * FROM Persona


-------PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------

--DELETE FROM Municipio WHERE idMunicipio=2
--DELETE FROM Persona WHERE idPersona=1

----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------
--SELECT * FROM Municipio
--SELECT * FROM Persona


---TRUNCATE TABLE Cuerpo

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()

--select count(idMunicipio)from Municipio

-------------------------------------------------Tipos de Vistas----------------------------------------------------------
--select idPersona, CONCAT(nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Persona
--GO
--Vista
--CREATE VIEW vwListaPersona as
--select idPersona, concat (nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Persona where estatus = 1
--GO

--select * from vwListaPersona

--select t1.nombre,t2.colonia,numero,calle from Persona as t1 inner join Vivienda as t2 on t1.idPersona = t2.idVivienda             

--select t1.nombre,t2.codigoPostal from Municipio as t1 inner join Vivienda as t2 on t1.idMunicipio = t2.idVivienda             

--select t1.nombre,t2.nombre,telefono from Municipio as t1 inner join Persona as t2 on t1.idMunicipio = t2.idPersona             

--select t1.colonia,calle,numero,codigoPostal,t2.nombre,telefono from Vivienda as t1 inner join Persona as t2 on t1.idVivienda = t2.idPersona             

--select t1.Numero,t2.codigoPostal from Municipio as t1 inner join Vivienda as t2 on t1.idMunicipio = t2.idVivienda             







USE master;
GO
IF DB_ID (N'Hospitalizacion') IS NOT NULL
DROP DATABASE Hospitalizacion;
GO
CREATE DATABASE Hospitalizacion
ON 
(NAME = Hospitalizacion_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Hospitalizacion.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = Hospitalizacion_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Hospitalizacion.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE Hospitalizacion;
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
CREATE TABLE Cama
(
idCama int IDENTITY(1,1),
numero char (10) not null,
idPlanta int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Cama PRIMARY KEY(idCama)
);
CREATE TABLE Diagnostico
(
idDiagnostico int IDENTITY(1,1),
codigo char (10) not null,
descripcion varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Diagnostico PRIMARY KEY(idDiagnostico)
);
CREATE TABLE Medico
(
idMedico int IDENTITY (1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
numficha varchar (30) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Medico PRIMARY KEY (idMedico)
);
CREATE TABLE Paciente
(
idPaciente int IDENTITY (1,1),
NSS char (30) not null,
RFC char (30) not null,
fechaNacimiento varchar (20) not null, 
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Paciente PRIMARY KEY (idPaciente)
);
CREATE TABLE Pase
(
idPase int IDENTITY (1,1),
numero varchar (30) not null,
horaInicio datetime not null,
horaFinal datetime not null,
idPaciente int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Pase PRIMARY KEY (idPase)
);
CREATE TABLE Planta
(
idPlanta int IDENTITY (1,1),
numero varchar (30) not null,
nombre varchar (50) not null,
numdeCamas varchar (10) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Planta PRIMARY KEY (idPlanta)
);
CREATE TABLE DiagnosticoMedico
(
idDiagnosticoMedico int IDENTITY (1,1),
idDiagnostico int null,
idMedico int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_DiagnosticoMedico PRIMARY KEY (idDiagnosticoMedico)
);
CREATE TABLE PacienteDiagnostico
(
idPacienteDiagnostico int IDENTITY (1,1),
idPaciente int null,
idDiagnostico int null,
fecha datetime not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_PacienteDiagnostico PRIMARY KEY (idPacienteDiagnostico)
);
CREATE TABLE PacienteMedico
(
idPacienteMedico int IDENTITY (1,1),
idPaciente int null,
idMedico int null,
fecha datetime not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_PacienteMedico PRIMARY KEY (idPacienteMedico)
);
CREATE TABLE PacienteCama
(
idPacienteCama int IDENTITY (1,1),
idPaciente int null,
idCama int null,
fecha datetime not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_PacienteCama PRIMARY KEY (idPacienteCama)
);
GO
--------------------------------INDEX------------------------------
CREATE INDEX IX_Cama ON Cama(idCama);
GO
CREATE INDEX IX_Diagnostico ON Diagnostico(idDiagnostico);
GO
CREATE INDEX IX_Medico ON Medico(idMedico);
GO
CREATE INDEX IX_Paciente ON Paciente(idPaciente);
GO
CREATE INDEX IX_Pase ON Pase(idPase);
GO
CREATE INDEX IX_Planta ON Planta(idPlanta);
GO
CREATE INDEX IX_DiagnosticoMedico ON DiagnosticoMedico(idDiagnosticoMedico);
GO
CREATE INDEX IX_PacienteDiagnostico ON PacienteDiagnostico(idPacienteDiagnostico);
GO
CREATE INDEX IX_PacienteMedico ON PacienteMedico(idPacienteMedico);
GO
CREATE INDEX IX_PacienteCama ON PacienteCama(idPacienteCama);
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
ALTER TABLE Cama
ADD CONSTRAINT FK__CamaPlanta 
FOREIGN KEY (idPlanta) REFERENCES Planta(idPlanta);
GO
ALTER TABLE Cama
ADD CONSTRAINT FK__CamaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Cama
ADD CONSTRAINT FK_CamaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Diagnostico
ADD CONSTRAINT FK_DiagnosticoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Diagnostico
ADD CONSTRAINT FK_DiagnosticoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Medico
ADD CONSTRAINT FK_MedicoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Medico
ADD CONSTRAINT FK_MedicoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Paciente
ADD CONSTRAINT FK_PacienteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Paciente
ADD CONSTRAINT FK_PacienteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Pase
ADD CONSTRAINT FK_PasePaciente
FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente);
GO
ALTER TABLE Pase
ADD CONSTRAINT FK_PaseUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Pase
ADD CONSTRAINT FK_PaseUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Planta
ADD CONSTRAINT FK_PlantaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Planta
ADD CONSTRAINT FK_PlantaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE DiagnosticoMedico
ADD CONSTRAINT FK_DiagnosticoMedicoDiagnostico
FOREIGN KEY (idDiagnostico) REFERENCES Diagnostico(idDiagnostico);
GO
ALTER TABLE DiagnosticoMedico
ADD CONSTRAINT FK_DiagnosticoMedicoMedico
FOREIGN KEY (idMedico) REFERENCES Medico(idMedico);
GO
ALTER TABLE DiagnosticoMedico
ADD CONSTRAINT FK_DiagnosticoMedicoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE DiagnosticoMedico
ADD CONSTRAINT FK_DiagnosticoMedicoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PacienteDiagnostico
ADD CONSTRAINT FK_PacienteDiagnosticoPaciente
FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente);
GO
ALTER TABLE PacienteDiagnostico
ADD CONSTRAINT FK_PacienteDiagnosticoDiagnostico
FOREIGN KEY (idDiagnostico) REFERENCES Diagnostico(idDiagnostico);
GO
ALTER TABLE PacienteDiagnostico
ADD CONSTRAINT FK_PacienteDiagnosticoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PacienteDiagnostico
ADD CONSTRAINT FK_PacienteDiagnosticoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PacienteMedico
ADD CONSTRAINT FK_PacienteMedicoPaciente
FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente);
GO
ALTER TABLE PacienteMedico
ADD CONSTRAINT FK_PacienteMedicoMedico
FOREIGN KEY (idMedico) REFERENCES Medico(idMedico);
GO
ALTER TABLE PacienteMedico
ADD CONSTRAINT FK_PacienteMedicoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PacienteMedico
ADD CONSTRAINT FK_PacienteMedicoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PacienteCama
ADD CONSTRAINT FK_PacienteCamaPaciente
FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente);
GO
ALTER TABLE PacienteCama
ADD CONSTRAINT FK_PacienteCamaCama
FOREIGN KEY (idCama) REFERENCES Cama(idCama);
GO
ALTER TABLE PacienteCama
ADD CONSTRAINT FK_PacienteCamaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PacienteCama
ADD CONSTRAINT FK_PacienteCamaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica)
VALUES ('Alan Geovannie','Morales','Salazar','I19050458@monclova.tecnm.mx','Tec12345.',1,GETDATE(),1,GETDATE())

INSERT INTO Planta(numero,nombre,numdecamas)
VALUES    ('2','Jardines','16'),
          ('1','Lomas','16'),
		  ('3','AAA','16'),
		  ('4','Osla','16'),
		  ('5','Luz','16')

INSERT INTO Cama(numero,idPlanta)
VALUES ('115',1),
       ('189',1),
	   ('147',1),
       ('133',1),
	   ('122',1),
       ('144',1)

INSERT INTO Diagnostico(codigo,descripcion)
VALUES ('4990SA0', 'Embarazo'),
       ('UWUQ000', 'Operacion'),
	   ('KDID88D', 'Coma'),
	   ('ABSV232', 'Emoragia'),
	   ('EIEEBE2', 'Lesion'),
	   ('4PD9EOI', 'Cirujia')

INSERT INTO Medico(nombre,apellidoPaterno,apellidoMaterno,numficha)
VALUES ('Alan Geovannie','Morales','Salazar','49899122'),
        ('Alan Geovannie','Lopez','Salas','26494921'),
		('Adam Jorge','Gutierrez','Torres','1254000'),
		('Luis Pepe','Garcia','Salcido','4949132'),
		('Jesus Edgar','Casillas','Orosco','1620000'),
		('Lalo Jose','Montano','Marquez','1669494')

INSERT INTO Paciente(NSS,RFC,fechaNacimiento,nombre,apellidoPaterno,apellidoMaterno)
VALUES    ('4949494','RRTU75RRR','20-04-90','Pedro Geovannie','Garcia','Salazar'),
          ('4078955','UTU755R5R','20-04-90','Salomon Geovannie','Lopez','Salas'),
		  ('7894555','URT55R5RR','20-04-90','Alex Jorge','Gutierrez','Garcia'),
		  ('4070808','UTT755R5R','20-04-90','Ulices Pepe','Garcia','Salcido'),
		  ('4144118','UTU7GGR5R','20-04-90','Victor Edgar','Garcia','Orosco'),
		  ('8875558','URERRRR5R','20-04-90','Roberto Jose','Garcia','Marquez')

INSERT INTO Pase(numero,horaInicio,horaFinal,idPaciente)
VALUES    ('484848',getdate(),getdate(),1),
          ('151515',getdate(),getdate(),1),
		  ('142222',getdate(),getdate(),1),
		  ('994944',getdate(),getdate(),1),
		  ('300020',getdate(),getdate(),1),
		  ('255115',getdate(),getdate(),1)


INSERT INTO DiagnosticoMedico(idDiagnostico,idMedico)
VALUES    (1,2),
          (1,2),
		  (1,2),
		  (1,2),
		  (1,2),
		  (1,2)

INSERT INTO PacienteDiagnostico(idPaciente,idDiagnostico,fecha)
VALUES    (1,2,getdate()),
          (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate())

INSERT INTO PacienteMedico(idPaciente,idMedico,fecha)
VALUES    (1,2,getdate()),
          (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate())

INSERT INTO PacienteCama(idPaciente,idCama,fecha)
VALUES    (1,2,getdate()),
          (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate()),
		  (1,2,getdate())



-----SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----


--SELECT * FROM Cama

-------------------------ACTUALIZAR ALGUNOS DATOS----------------------------

--UPDATE Cama SET numero = '000' WHERE idCama = 1

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Cama


-------PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------

--DELETE FROM Cama WHERE idCama=1

------SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------

--SELECT * FROM Cama

---TRUNCATE TABLE Cuerpo

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()

select count(*)from Cama

--Tipos de Vistas
--select idPaciente, CONCAT(nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Paciente
--GO
--Vista
--CREATE VIEW vwListaPaciente as
--select idPaciente, concat (nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Paciente where estatus = 1
--GO

--select * from vwListaPaciente



--select t1.nombre,t2.numero from Paciente as t1 inner join Cama as t2 on t1.idPaciente = t2.idCama             

--select t1.nombre,t2.descripcion from Medico as t1 inner join Diagnostico as t2 on t1.idMedico = t2.idDiagnostico             

--select t1.nombre,t2.numero from Paciente as t1 inner join Pase as t2 on t1.idPaciente = t2.idPase            

--select t1.nombre,t2.numero from Planta as t1 inner join Cama as t2 on t1.idPlanta = t2.idCama             

--select t1.nombre,t2.descripcion from Paciente as t1 inner join Diagnostico as t2 on t1.idPaciente = t2.idDiagnostico             










































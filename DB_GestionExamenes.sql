USE master;
GO
IF DB_ID (N'GestionExamenes') IS NOT NULL
DROP DATABASE GestionExamenes;
GO
CREATE DATABASE GestionExamenes
ON 
(NAME = GestionExamenes_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GestionExamenes.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = GestionExamenes_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GestionExamenes.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE GestionExamenes;
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
CREATE TABLE Alumno
(
idAlumno int IDENTITY (1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
seccionGrupo char (5) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Alumno PRIMARY KEY(idAlumno)
);
CREATE TABLE Examen
(
idExamen int IDENTITY (1,1),
numero char (10) not null,
numPreguntas char (10) not null,
Fecha varchar (15) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Examen PRIMARY KEY(idExamen)
);
CREATE TABLE Profesor
(
idProfesor int IDENTITY (1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
CURP char (30) not null,
matricula char (15) not null,
codigoPostal char (6) not null,
numCasa char (10) not null,
calle varchar (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Profesor PRIMARY KEY(idProfesor)
);
CREATE TABLE Practica
(
idPractica int IDENTITY (1,1),
codigo char (15) not null,
gradodificultad varchar (15) not null,
nombre varchar (50) not null,
calificacion char (4) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Practica PRIMARY KEY(idPractica)
);
CREATE TABLE AlumnoExamen
(
idAlumnoExamen int IDENTITY (1,1),
idAlumno int null,
idExamen int null,
notaAlumno char (4) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_AlumnoExamen PRIMARY KEY(idAlumnoExamen)
);
CREATE TABLE AlumnoPractica
(
idAlumnoPractica int IDENTITY (1,1),
idAlumno int null,
idPractica int null,
notaAlumno char (4) not null,
Fecha datetime not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_AlumnoPractica PRIMARY KEY(idAlumnoPractica)
);
CREATE TABLE ProfesorPractica
(
idProfesorPractica int IDENTITY (1,1),
idProfesor int null,
idPractica int null,
Fecha datetime not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ProfesorPractica PRIMARY KEY(idProfesorPractica)
);
GO
--------------------------------INDEX------------------------------
CREATE INDEX IX_Alumno ON Alumno(idAlumno);
GO
CREATE INDEX IX_Examen ON Examen(idExamen);
GO
CREATE INDEX IX_Profesor ON Profesor(idProfesor);
GO
CREATE INDEX IX_Practica ON Practica(idPractica);
GO
CREATE INDEX IX_AlumnoExamen ON AlumnoExamen(idAlumnoExamen);
GO
CREATE INDEX IX_AlumnoPractica ON AlumnoPractica(idAlumnoPractica);
GO
CREATE INDEX IX_ProfesorPractica ON ProfesorPractica(idProfesorPractica);
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
ALTER TABLE Alumno
ADD CONSTRAINT FK_AlumnoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Alumno
ADD CONSTRAINT FK_AlumnoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Examen
ADD CONSTRAINT FK_ExamenUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Examen
ADD CONSTRAINT FK_ExamenUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Profesor
ADD CONSTRAINT FK_ProfesorUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Profesor
ADD CONSTRAINT FK_ProfesorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Practica
ADD CONSTRAINT FK_PracticaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Practica
ADD CONSTRAINT FK_PracticaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE AlumnoExamen
ADD CONSTRAINT FK_AlumnoExamenAlumno
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
GO
ALTER TABLE AlumnoExamen
ADD CONSTRAINT FK_AlumnoExamenExamen
FOREIGN KEY (idExamen) REFERENCES Examen(idExamen)
GO
ALTER TABLE AlumnoExamen
ADD CONSTRAINT FK_AlumnoExamenUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE AlumnoExamen
ADD CONSTRAINT FK_AlumnoExamenUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE AlumnoPractica
ADD CONSTRAINT FK_AlumnoPracticaAlumno 
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
GO
ALTER TABLE AlumnoPractica
ADD CONSTRAINT FK_AlumnoPracticaPractica
FOREIGN KEY (idPractica) REFERENCES Practica(idPractica)
GO
ALTER TABLE AlumnoPractica
ADD CONSTRAINT FK_AlumnoPracticaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE AlumnoPractica
ADD CONSTRAINT FK_AlumnoPracticaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE ProfesorPractica
ADD CONSTRAINT FK_ProfesorPracticaProfesor 
FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)
GO
ALTER TABLE ProfesorPractica
ADD CONSTRAINT FK_ProfesorPracticaPractica
FOREIGN KEY (idPractica) REFERENCES Practica(idPractica)
GO
ALTER TABLE ProfesorPractica
ADD CONSTRAINT FK_ProfesorPracticaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE ProfesorPractica
ADD CONSTRAINT FK_ProfesorPracticaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
-------------------------------------------------------INSERTAR REGISTROS-------------------------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica)
VALUES ('Alan Geovannie','Morales','Salazar','I19050458@monclova.tecnm.mx','Tec12345.',1,GETDATE(),1,GETDATE())


INSERT INTO Alumno(nombre, apellidoPaterno,apellidoMaterno,seccionGrupo)
VALUES ('Alan Geovannie','Morales','Salazar','1 A'),
        ('Alan Geovannie','Lopez','Salas','2 A'),
		('Adam Jorge','Gutierrez','Torres','1 C'),
		('Luis Pepe','Garcia','Salcido','4 B'),
		('Jesus Edgar','Casillas','Orosco','5 A'),
		('Lalo Jose','Montano','Marquez','1 C')
GO

INSERT INTO Examen(numero, numPreguntas, Fecha)
VALUES     ('02','60','30-11-21'), 
           ('15','60','12-11-21'), 
		   ('24','60','23-11-21'), 
		   ('05','60','13-11-21'), 
		   ('01','60','11-11-21') 
       
INSERT INTO Profesor(nombre,apellidoPaterno, apellidoMaterno,CURP,matricula, CodigoPostal,numCasa,calle)
VALUES  ('Joaquin Geovannie','Morales','Salazar','MAOMOSW66662','W1QQ41','26526','1457','48'),
        ('Gil Geovannie','Lopez','Salas','EDWDD55454545','Q121N','45587','7852','Alamo'),
		('Pepe Jorge','Gutierrez','Torres','DEE4555E55E','BSH21','11406','8999','10'),
		('Edgar Pepe','Garcia','Salcido','EEWDD544545','NA111','78807','9599','Palmas'),
		('Mano Edgar','Casillas','Orosco','ERE144S4S4S4S','MXZ00','11454','6564','Mirador'),
		('Sabino Jose','Montano','Marquez','DD3E37777777','ZA191','44777','2544','13')

INSERT INTO Practica(codigo,gradodificultad,nombre,calificacion)
VALUES   ('A2299','Medio','redes','84'),
         ('A2987','Facil','Gestion','84'),
		 ('A2OWW','Dificil','balance','84'),
		 ('ASSSA','facil','algebra','84'),
		 ('A22WW','Medio','probabilidad','84')

INSERT INTO AlumnoExamen(idAlumno,idExamen,notaAlumno)
VALUES (1,2,'54'),
       (1,2,'64'),
	   (1,2,'70'),
	   (1,2,'82'),
	   (1,2,'47'),
	   (5,2,'90')

INSERT INTO AlumnoPractica(idAlumno,idPractica,notaAlumno,Fecha)
VALUES (1,2,'80',getdate()),
       (1,2,'90',getdate()),
	   (1,2,'100',getdate()),
	   (1,2,'100',getdate()),
	   (1,2,'30',getdate()),
	   (1,2,'100',getdate())

INSERT INTO ProfesorPractica(idProfesor,idPractica,Fecha)
VALUES (1,2,getdate()),
       (1,2,getdate()),
       (1,2,getdate()),
	   (1,2,getdate()),
	   (1,2,getdate()),
	   (1,2,getdate())


-----SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----

--SELECT * FROM Usuario
--SELECT * FROM Examen


-----------------------------------------------ACTUALIZAR ALGUNOS DATOS------------------------------------------------

--UPDATE Alumno SET nombre = 'Jose padilla' WHERE idAlumno = 3

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Alumno
--SELECT * FROM Examen


-------PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------

--DELETE FROM Alumno WHERE idAlumno=3
--DELETE FROM Examen WHERE idExamen=1

----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------
--SELECT * FROM Alumno
--SELECT * FROM Examen


---TRUNCATE TABLE Cuerpo

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()

select count(idAlumno)from Alumno
GO
--Tipos de Vistas
--select idAlumno, CONCAT(nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Alumno
--GO
--Vista
--CREATE VIEW vwListaAlumnos as
--select idAlumno, concat (nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Alumno where estatus = 1
--GO

--select * from vwListaAlumnos 

--select t1.nombre,t2.nombre from Alumno as t1 inner join Profesor as t2 on t1.idAlumno = t2.idProfesor             

--select t1.nombre,apellidoPaterno,apellidoMaterno,t2.numero from Alumno as t1 inner join Examen as t2 on t1.idAlumno = t2.idExamen            

--select t1.nombre,apellidoPaterno,apellidoMaterno,t2.calificacion from Alumno as t1 inner join Practica as t2 on t1.idAlumno = t2.idPractica          

--select t1.nombre,apellidoPaterno,apellidoMaterno,t2.nombre from Profesor as t1 inner join Practica as t2 on t1.idProfesor = t2.idPractica             

--select t1.notaAlumno,t2.nombre,apellidoPaterno,apellidoMaterno from AlumnoPractica as t1 inner join Alumno as t2 on t1.idAlumnoPractica = t2.idAlumno            




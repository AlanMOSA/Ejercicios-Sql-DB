USE master;
GO
IF DB_ID (N'TESIS') IS NOT NULL
DROP DATABASE TESIS;
GO
CREATE DATABASE TESIS
ON 
(NAME = TESIS_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TESIS.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = TESIS_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TESIS.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE TESIS;
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
fechaCrea datetime  null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Usuario PRIMARY KEY(idUsuario)
);

CREATE TABLE Alumno 
(
idAlumno int IDENTITY(1,1),
matricula char (15) not null,
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
rfc char (13) not null,
fechaIngreso datetime default null,
idGrupo int null,
idProfesor int null,
estatus bit default 1 not null,
idUsuariocrea int  null,
fechaCrea datetime  null,
idUsuarioModifica int default null,
fechaModifica datetime default null,	
CONSTRAINT PK_Alumno PRIMARY KEY (idAlumno)
);

CREATE TABLE Grupo
 (
 idGrupo int IDENTITY(1,1),
 nombre varchar (50) not null,
 numeroComponentes char (10) not null,
 estatus bit default 1 not null,
 idUsuarioCrea int null,
 fechaCrea datetime  null,
 idUsuarioModifica int default null,
 fechaModifica datetime default null,	
 CONSTRAINT PK_Grupo PRIMARY KEY (idGrupo)
 );

 CREATE TABLE Profesor 
 (
 idProfesor int IDENTITY(1,1),
 Nombre varchar(50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
 RFC varchar (13) not null,
 idTFC int  null,
 estatus bit default 1 not null,
 idUsuarioCrea int null,
 fechaCrea datetime  null,
 idUsuarioModifica int default null,
 fechaModifica datetime default null
 CONSTRAINT PK_Profesor PRIMARY KEY(idProfesor) 
 );

 CREATE TABLE TFC
(
idTFC int IDENTITY(1,1),
Tema varchar (50) not null,
NumeroOrden char (15) not null,
fecha datetime not null,
idAlumno int  null,
 estatus bit default 1 not null,
 idUsuarioCrea int null,
 fechaCrea datetime  null,
 idUsuarioModifica int default null,
 fechaModifica datetime default null
 CONSTRAINT PK_TFC PRIMARY KEY(idTFC)
);
CREATE TABLE Tribunal
(
idTribunal int IDENTITY(1,1),
Edificio char (10) not null,
Salon varchar (15) not null,
fechapresenta varchar (15) not null,
numeroComponentes char (10) not null,
idAlumno int  null,
estatus bit default 1 not null,
 idUsuarioCrea int null,
 fechaCrea datetime  null,
 idUsuarioModifica int default null,
 fechaModifica datetime default null
 CONSTRAINT PK_Tribunal PRIMARY KEY(idTribunal)
);
CREATE TABLE AlumnoProfesor
(
idAlumnoProfesor int IDENTITY(1,1),
idAlumno int null,
idProfesor int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime  null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_AlumnoProfesor PRIMARY KEY(idAlumnoProfesor)
);

CREATE TABLE ProfesorTribunal
(
idProfesorTribunal int IDENTITY(1,1),
idProfesor int null,
idTribunal int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime  null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ProfesorTribunal PRIMARY KEY(idProfesorTribunal)
);
GO
--------------------------------INDEX------------------------------
CREATE INDEX IX_Alumno ON Alumno(idAlumno);
GO
CREATE INDEX IX_Grupo ON Grupo(idGrupo);
GO
CREATE INDEX IX_Profesor ON Profesor(idProfesor);
GO
CREATE INDEX IX_TFC ON TFC(idTFC);
GO
CREATE INDEX IX_Tribunal ON Tribunal(idTribunal);
GO
CREATE INDEX IX_AlumnoProfesor ON AlumnoProfesor(idAlumnoProfesor);
GO
CREATE INDEX IX_ProfesorTribunal ON ProfesorTribunal(idProfesorTribunal);
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
ALTER TABLE Alumno 
ADD CONSTRAINT FK_AlumnoGrupo 
FOREIGN KEY (idGrupo) REFERENCES Grupo (idGrupo)
GO
ALTER TABLE Alumno
ADD CONSTRAINT FK_AlumnoProfesor 
FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)
GO
ALTER TABLE Alumno
ADD CONSTRAINT FK_AlumnoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Alumno
ADD CONSTRAINT FK_AlumnoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Grupo
ADD CONSTRAINT FK_GrupoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Grupo
ADD CONSTRAINT FK_GrupoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Profesor
ADD CONSTRAINT FK_ProfesorTFC
FOREIGN KEY (idTFC) REFERENCES TFC(idTFC)
GO
ALTER TABLE Profesor
ADD CONSTRAINT FK_ProfesorUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Profesor
ADD CONSTRAINT FK_ProfesorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE TFC
ADD CONSTRAINT FK_TFCAlumno 
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
GO
ALTER TABLE TFC
ADD CONSTRAINT FK_TFCUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE TFC
ADD CONSTRAINT FK_TFCUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Tribunal
ADD CONSTRAINT FK_TribunalAlumno 
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
GO
ALTER TABLE Tribunal
ADD CONSTRAINT FK_TribunalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Tribunal
ADD CONSTRAINT FK_TribunalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Usuario
ADD CONSTRAINT FK_UsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Usuario
ADD CONSTRAINT FK_UsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE AlumnoProfesor
ADD CONSTRAINT FK_AlumnoProfesorAlumno 
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
GO
ALTER TABLE AlumnoProfesor
ADD CONSTRAINT FK_AlumnoProfesorProfesor 
FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)
GO
ALTER TABLE AlumnoProfesor
ADD CONSTRAINT FK_AlumnoProfesorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE AlumnoProfesor
ADD CONSTRAINT FK_AlumnoProfesorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE ProfesorTribunal
ADD CONSTRAINT FK_ProfesorTribunalProfesor 
FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)
GO
ALTER TABLE ProfesorTribunal
ADD CONSTRAINT FK_ProfesorTribunalTribunal 
FOREIGN KEY (idTribunal) REFERENCES Tribunal(idTribunal)
GO
ALTER TABLE ProfesorTribunal
ADD CONSTRAINT FK_ProfesorTribunalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE ProfesorTribunal
ADD CONSTRAINT FK_ProfesorTribunalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave)
VALUES ('Alan Geovannie','Morales','Salazar','I19050458@monclova.tecnm.mx','Tec12345.')

INSERT INTO Grupo(nombre,numeroComponentes)
VALUES ('ala', '166'),
       ('ale', '213'),
       ('ake', '2612'),
       ('nnn', '1616'),
       ('ask', '262')

INSERT INTO Profesor(Nombre, apellidoPaterno, apellidoMaterno,RFC)
VALUES  ('Alan Geovannie','Morales','Salazar','FD38383JJ'),
        ('Alan Geovannie','Lopez','Salas','FD3KDIE3J'),
		('Adam Jorge','Gutierrez','Torres','FDLOD83JJ'),
		('Luis Pepe','Garcia','Salcido','SKDD383JJ'),
		('Jesus Edgar','Casillas','Orosco','FDSLSJEKK'),
		('Lalo Jose','Montano','Marquez','SKRR83JJJ')

INSERT INTO Alumno(matricula,nombre,apellidoPaterno,apellidoMaterno,rfc,fechaIngreso,idGrupo,idProfesor)
VALUES ('166', 'NIANI' ,'AKAKA' ,'fedc' ,'161616',getdate(),1,2),
       ('55', 'ALAA' ,'ALALLA' ,'sss' ,'23232',getdate(),1,2),
       ('456', 'AKAKA' ,'ALALA' ,'ssss' ,'24894',getdate(),1,2),
       ('132', 'AJAKAK' ,'AJSHW' ,'drd' ,'4955',getdate(),1,2),
       ('477', 'AKAKA' ,'AAKAK' ,'desff' ,'161616',getdate(),1,2),
	   ('487', 'AlalaA' ,'Alajab' ,'dajabbb' ,'10988',getdate(),1,2)

INSERT INTO TFC(Tema, NumeroOrden,Fecha,idAlumno)
VALUES   ('medicina','58455555',GETDATE(),1),   
          ('Programacion','885522211',GETDATE(),1),
          ('Sistemas','114555222',GETDATE(),1),
		  ('Redes','25585522',GETDATE(),1),
		  ('Telecomunicaciones','25546556',GETDATE(),1)

INSERT INTO Tribunal(Edificio, Salon, fechapresenta, numeroComponentes,idAlumno)
VALUES  ('1','1','05-06-21','12322',1),
        ('2','5','05-06-21','12442',1),
		('3','1','06-06-21','14442',1),
		('4','2','10-06-21','77782',1),
		('5','2','15-06-21','18552',1),
		('6','3','20-06-21','12552',1)



INSERT INTO AlumnoProfesor(idAlumno,idProfesor)
VALUES       (1,2),
             (3,4),
			 (2,1),
			 (2,3),
			 (1,4),
			 (1,5)

INSERT INTO ProfesorTribunal(idProfesor,idTribunal)
VALUES       (1,2),
             (3,4),
			 (2,1),
			 (2,3),
			 (1,4),
			 (1,5)




-----SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----

--SELECT * FROM Tribunal
--SELECT * FROM Grupo


-------------------------ACTUALIZAR ALGUNOS DATOS----------------------------

--UPDATE Tribunal SET fechapresenta = '01-06-21' WHERE idTribunal = 1

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Alumno
--SELECT * FROM Grupo


-------PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------

--DELETE FROM Tribunal WHERE idTribunal=1
--DELETE FROM Grupo WHERE idGrupo=1

----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------
--SELECT * FROM Alumno
--SELECT * FROM Grupo


---TRUNCATE TABLE Cuerpo

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()

--COUNT MAX MIN AVG
--select count(*)from Tribunal

--Tipos de Vistas
--select idTribunal, CONCAT(fechaPresenta,'    ',Salon,'   ',Edificio) as 'Fechas' from Tribunal
--GO
--Vista
--CREATE VIEW vwFecha as
--select idTribunal, concat (fechaPresenta,'    ',Salon,'   ',Edificio) as 'Fechas' from Tribunal where estatus = 1
--GO

--select * from vwFecha


--select t1.nombre,t2.nombre from Alumno as t1 inner join Profesor as t2 on t1.idAlumno = t2.idProfesor             

--select t1.Salon,t2.nombre from Tribunal as t1 inner join Profesor as t2 on t1.idTribunal = t2.idProfesor             

--select t1.nombre,t2.Salon from Alumno as t1 inner join Tribunal as t2 on t1.idAlumno = t2.idTribunal           

--select t1.nombre,apellidoPaterno,apellidoMaterno,t2.nombre from Alumno as t1 inner join Grupo as t2 on t1.idAlumno = t2.idGrupo            

--select t1.Tema,t2.nombre from TFC as t1 inner join Alumno as t2 on t1.idTFC = t2.idAlumno             






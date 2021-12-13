USE master;
GO
IF DB_ID (N'Bancos') IS NOT NULL
DROP DATABASE Bancos;
GO
CREATE DATABASE Bancos 
ON 
(NAME = Bancos_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bancos.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = Bancos_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bancos.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE Bancos;
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
CREATE TABLE Cliente
(
idCliente int IDENTITY(1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
direccion varchar (50) not null,
CURP char (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Cliente PRIMARY KEY(idCliente)
);
CREATE TABLE ClienteCuentaPrivilegio
(
idClienteCuentaPrivilegio int IDENTITY(1,1),
nombre varchar (50) not null,
descripcion varchar (50) not null,
fecha datetime not null,
idPrivilegio int null,
idCuenta int null,
idCliente int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ClienteCuentaPrivilegio PRIMARY KEY(idClienteCuentaPrivilegio)
);
CREATE TABLE Cuenta
(
idCuenta int IDENTITY(1,1),
nombre varchar (50) not null,
numero varchar (25) not null,
codigo char (15) not null,
fecha datetime not null,
idSucursal int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Cuenta PRIMARY KEY(idCuenta)
);
CREATE TABLE Domiciliacion
(
idDomiciliacion int IDENTITY(1,1),
nombre varchar (50) not null,
descripcion varchar (50) not null,
fecha datetime not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Domiciliacion PRIMARY KEY(idDomiciliacion)
);
CREATE TABLE Prestamo
(
idPrestamo int IDENTITY(1,1),
nombre varchar (50) not null,
descripcion varchar (50) not null,
fecha datetime not null,
idCliente int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Prestamo PRIMARY KEY(idPrestamo)
);
CREATE TABLE Privilegio
(
idPrivilegio int IDENTITY(1,1),
nombre varchar (50) not null,
descripcion varchar (50) not null,
fecha datetime not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Privilegio PRIMARY KEY(idPrivilegio)
);
CREATE TABLE Sucursal
(
idSucursal int IDENTITY(1,1),
nombre varchar (50) not null,
direccion varchar (50) not null,
codigo char (15) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Sucursal PRIMARY KEY(idSucursal)
);
CREATE TABLE CuentaDomiciliacion
(
idCuentaDomiciliacion int IDENTITY(1,1),
idCuenta int null,
idDomiciliacion int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_CuentaDomiciliacion PRIMARY KEY(idCuentaDomiciliacion)
);
CREATE TABLE ClienteCuenta
(
idClienteCuenta int IDENTITY(1,1),
idCliente int null,
idCuenta int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ClienteCuenta PRIMARY KEY(idClienteCuenta)
);
--------------------------------INDEX------------------------------
CREATE INDEX IX_Cliente ON Cliente(idCliente);
GO
CREATE INDEX IX_ClienteCuentaPrivilegio ON ClienteCuentaPrivilegio(idClienteCuentaPrivilegio);
GO
CREATE INDEX IX_Cuenta ON Cuenta(idCuenta);
GO
CREATE INDEX IX_Domiciliacion ON Domiciliacion(idDomiciliacion);
GO
CREATE INDEX IX_Prestamo ON Prestamo(idPrestamo);
GO
CREATE INDEX IX_Privilegio ON Privilegio(idPrivilegio);
GO
CREATE INDEX IX_Sucursal  ON Sucursal (idSucursal );
GO
CREATE INDEX IX_CuentaDomiciliacion ON CuentaDomiciliacion(idCuentaDomiciliacion);
GO
CREATE INDEX IX_ClienteCuenta ON ClienteCuenta(idClienteCuenta);
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
ALTER TABLE Cliente
ADD CONSTRAINT FK_ClienteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Cliente
ADD CONSTRAINT FK_ClienteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE ClienteCuentaPrivilegio 
ADD CONSTRAINT FK_ClienteCuentaPrivilegioPrivilegio
FOREIGN KEY (idPrivilegio) REFERENCES Privilegio (idPrivilegio)
GO
ALTER TABLE ClienteCuentaPrivilegio
ADD CONSTRAINT FK_ClienteCuentaPrivilegioCuenta
FOREIGN KEY (idCuenta) REFERENCES Cuenta(idCuenta)
GO
ALTER TABLE ClienteCuentaPrivilegio
ADD CONSTRAINT FK_ClienteCuentaPrivilegioCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
GO
ALTER TABLE ClienteCuentaPrivilegio
ADD CONSTRAINT FK_ClienteCuentaPrivilegioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE ClienteCuentaPrivilegio
ADD CONSTRAINT FK_ClienteCuentaPrivilegioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Cuenta
ADD CONSTRAINT FK_CuentaSucursal
FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal)
GO
ALTER TABLE Cuenta
ADD CONSTRAINT FK_CuentaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Cuenta
ADD CONSTRAINT FK_CuentaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Domiciliacion
ADD CONSTRAINT FK_DomiciliacionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Domiciliacion
ADD CONSTRAINT FK_DomiciliacionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Prestamo
ADD CONSTRAINT FK_PrestamoCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
GO
ALTER TABLE Prestamo
ADD CONSTRAINT FK_PrestamoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Prestamo
ADD CONSTRAINT FK_PrestamoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Privilegio
ADD CONSTRAINT FK_PrivilegioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Privilegio
ADD CONSTRAINT FK_PrivilegioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Sucursal
ADD CONSTRAINT FK_SucursalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Sucursal
ADD CONSTRAINT FK_SucursalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE CuentaDomiciliacion
ADD CONSTRAINT FK_CuentaDomiciliacionCuenta
FOREIGN KEY (idCuenta) REFERENCES Cuenta(idCuenta)
GO
ALTER TABLE CuentaDomiciliacion
ADD CONSTRAINT FK_CuentaDomiciliacionDomiciliacion
FOREIGN KEY (idDomiciliacion) REFERENCES Domiciliacion(idDomiciliacion)
GO
ALTER TABLE CuentaDomiciliacion
ADD CONSTRAINT FK_CuentaDomiciliacionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE CuentaDomiciliacion
ADD CONSTRAINT FK_CuentaDomiciliacionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE ClienteCuenta
ADD CONSTRAINT FK_ClienteCuentaCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
GO
ALTER TABLE ClienteCuenta
ADD CONSTRAINT FK_ClienteCuentaCuenta
FOREIGN KEY (idCuenta) REFERENCES Cuenta(idCuenta)
GO
ALTER TABLE ClienteCuenta
ADD CONSTRAINT FK_ClienteCuentaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE ClienteCuenta
ADD CONSTRAINT FK_ClienteCuentaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave)
VALUES ('Alan Geovannie', 'Morales' ,'Salazar' ,'I19050458@monclova.tecnm.mx' ,'12345677')	

INSERT INTO Cliente(nombre,apellidoPaterno,apellidoMaterno,direccion,CURP)
VALUES ('Pepe Geovannie','Morales','Salazar','Calle 4 lomas heroes 1929','MOSAUUAU555'),
        ('Jose Geovannie','Lopez','Salas','Calle Azteca zapata 9383','AOAOKA8A84'),
		('Sabino Jorge','Gutierrez','Torres','Calle 1 villa heroes 1919','1215AAQQ'),
		('Arturo Pepe','Garcia','Salcido','Calle Loma roma 4755','BAHAJ589'),
		('Luis Edgar','Casillas','Orosco','Calle 32 valle ejercito 9282','KDIRIREE'),
		('Raul Jose','Montano','Marquez','Calle 10 luna azul 1998','BDJHR8R8R')

INSERT INTO Sucursal(nombre,direccion,codigo)
VALUES ('monclova','calle 2 lssk 1652','WEW2W22'),
       ('frontera','calle bolo aviente 2494','0W0W022'),
       ('rosita','calle 7 topoe 1155','1W1W1WW'),
       ('saltilllo','calle astro nulea 4888','W2W2WW2'),
       ('torreon','calle 16 zapoa 1578','W5W4W4'),
       ('castaños','calle 17 verso 9996','EE66W6')

INSERT INTO Cuenta(nombre,numero,codigo,fecha,idSucursal)
VALUES ('jose','48994','416WWQ6',getdate(),1),
       ('pepe','48444','41QWQ11',getdate(),1),
	   ('alonso','00311','Q5QQW25',getdate(),1),
	   ('juan','15144','2WE35Y',getdate(),1)


INSERT INTO Privilegio(nombre,descripcion,fecha)
VALUES ('ywyww','sksmksmsk',1),
       ('ajaaja','slalamam',1),
	   ('aaajja','ajannaaj',1),
       ('aajja','aaknkaa',1),
       ('ajnaaa','anakanka',1)

INSERT INTO ClienteCuentaPrivilegio(descripcion,nombre,fecha,idPrivilegio,idCuenta,idCliente)
VALUES ('bhvvvyvv','Bonos',getdate(),1,2,3),
       ('koppooo','despensa',getdate(),1,2,3),
	   ('bhbhgyy','ahorro',getdate(),1,2,3),
	   ('kooojoo','salario',getdate(),1,2,3),
	   ('mnjhbbb','pension',getdate(),1,2,3)



INSERT INTO Domiciliacion(nombre,descripcion,fecha)
VALUES ('luz','Agua',getdate()),
        ('maria','cable',getdate()),
		('iris','luz',getdate()),
		('paola','renta',getdate()),
		('luisa','internet',getdate())

INSERT INTO Prestamo(nombre,descripcion,fecha,idCliente)
VALUES ('Pension','para mayoes de edad',getdate(),1),
       ('Ayuda','para ayudar',getdate(),1),
       ('jubilado','para jubilados',getdate(),1),
       ('estudiante','para estudiantes',getdate(),1),
       ('Familia','para la familia',getdate(),1)

INSERT INTO CuentaDomiciliacion(idCuenta,idDomiciliacion)
VALUES (1,2),
       (1,2),
	   (1,2),
	   (1,2),
	   (1,2),
	   (1,2)

INSERT INTO ClienteCuenta(idCliente,idCuenta)
VALUES (1,2),
       (1,2),
	   (1,2),
	   (1,2),
	   (1,2),
	   (1,2)


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

select t1.nombre,apellidoPaterno,apellidoPaterno,t2.nombre from Cliente as t1 inner join Prestamo as t2 on t1.idCliente = t2.idPrestamo

select t1.nombre,apellidoPaterno,apellidoPaterno,t2.nombre,codigo from Cliente as t1 inner join Cuenta as t2 on t1.idCliente = t2.idCuenta

select t1.nombre,apellidoPaterno,apellidoPaterno,t2.nombre,descripcion,fecha from Cliente as t1 inner join ClienteCuentaPrivilegio as t2 on t1.idCliente = t2.idClienteCuentaPrivilegio

select t1.nombre, t2.nombre from ClienteCuentaPrivilegio as t1 inner join Privilegio as t2 on t1.idClienteCuentaPrivilegio = t2.idPrivilegio

select t1.nombre,descripcion,t2.nombre,codigo from Domiciliacion as t1 inner join Cuenta as t2 on t1.idDomiciliacion = t2.idCuenta










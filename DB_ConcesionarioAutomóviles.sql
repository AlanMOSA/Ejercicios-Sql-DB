USE master;
GO
IF DB_ID (N'ConcesionarioAutomoviles') IS NOT NULL
DROP DATABASE ConcesionarioAutomoviles;
GO
CREATE DATABASE ConcesionarioAutomoviles
ON 
(NAME = ConcesionarioAutomoviles_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ConcesionarioAutomoviles.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = ConcesionarioAutomoviles_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ConcesionarioAutomoviles.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE ConcesionarioAutomoviles;
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
idUsuariocrea int null,
fechacrea datetime null,
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
telefono char (10) not null,
direccion varchar (50) not null,
rfc char (13) not null,
estatus bit default 1 not null,
idUsuariocrea int null,
fechacrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null,	
CONSTRAINT PK_Cliente PRIMARY KEY (idCliente)
);
CREATE TABLE CocheUsado
(
idCocheUsado int IDENTITY(1,1),
marca varchar (50) not null,
modelo char (20) not null,
matricula char (20) not null,
precio numeric (10,2) not null,
descripcion varchar (50) not null,
idCliente int null,
estatus bit default 1 not null,
idUsuariocrea int null,
fechacrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null,	
CONSTRAINT PK_CocheUsado PRIMARY KEY (idCocheUsado)
);
CREATE TABLE Opcion
(
idOpcion int IDENTITY(1,1),
nombre varchar (50) not null,
descripcion varchar (50) not null,
estatus bit default 1 not null,
idUsuariocrea int null,
fechacrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null,	
CONSTRAINT PK_Opcion PRIMARY KEY (idOpcion)
);
CREATE TABLE Vehiculo
(
idVehiculo int IDENTITY(1,1),
marca varchar (50) not null,
modelo char (20) not null,
cilindros varchar (30) not null,
precio numeric (10,2) not null,
descripcion varchar (50) not null,
estatus bit default 1 not null,
idUsuariocrea int null,
fechacrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null,	
CONSTRAINT PK_Vehiculo PRIMARY KEY (idVehiculo)
);
CREATE TABLE Vendedor 
(
idVendedor int IDENTITY(1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
telefono char (10) not null,
direccion varchar (50) not null,
rfc char (13) not null,
estatus bit default 1 not null,
idUsuariocrea int null,
fechacrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null,	
CONSTRAINT PK_Vendedor PRIMARY KEY (idVendedor)
);
CREATE TABLE Venta 
(
idVenta int IDENTITY(1,1),
fecha datetime not null,
matricula char (25) not null,
idCliente int null,
idVendedor int null,
idVehiculo int null,
estatus bit default 1 not null,
idUsuariocrea int null,
fechacrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null,	
CONSTRAINT PK_Venta PRIMARY KEY (idVenta)
);
CREATE TABLE OpcionVehiculo 
(
idOpcionVehiculo int IDENTITY(1,1),
idOpcion int null,
idVehiculo int null,
precio numeric (10,2) not null,
estatus bit default 1 not null,
idUsuariocrea int null,
fechacrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null,	
CONSTRAINT PK_OpcionVehiculo PRIMARY KEY (idOpcionVehiculo)
);
CREATE TABLE OpcionVenta
(
idOpcionVenta int IDENTITY(1,1),
idOpcion int null,
idVenta int null,
estatus bit default 1 not null,
idUsuariocrea int null,
fechacrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null,	
CONSTRAINT PK_OpcionVenta PRIMARY KEY (idOpcionVenta)
);
GO
--------------------------------INDEX------------------------------
CREATE INDEX IX_Cliente ON Cliente(idCliente);
GO
CREATE INDEX IX_CocheUsado ON CocheUsado(idCocheUsado);
GO
CREATE INDEX IX_Opcion ON Opcion(idOpcion);
GO
CREATE INDEX IX_Vehiculo ON Vehiculo(idVehiculo);
GO
CREATE INDEX IX_Vendedor ON Vendedor(idVendedor);
GO
CREATE INDEX IX_Venta ON Venta(idVenta);
GO
CREATE INDEX IX_OpcionVehiculo ON OpcionVehiculo(idOpcionVehiculo);
GO
CREATE INDEX IX_OpcionVenta ON OpcionVenta(idOpcionVenta);
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
ALTER TABLE CocheUsado
ADD CONSTRAINT FK_CocheUsadoCliente 
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
GO
ALTER TABLE CocheUsado
ADD CONSTRAINT FK_CocheUsadoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE CocheUsado
ADD CONSTRAINT FK_CocheUsadoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Opcion
ADD CONSTRAINT FK_OpcionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Opcion
ADD CONSTRAINT FK_OpcionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Vehiculo
ADD CONSTRAINT FK_VehiculoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Vehiculo
ADD CONSTRAINT FK_VehiculoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Vendedor
ADD CONSTRAINT FK_VendedorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Vendedor
ADD CONSTRAINT FK_VendedorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Venta
ADD CONSTRAINT FK_VentaCliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
GO
ALTER TABLE Venta
ADD CONSTRAINT FK_VentaVendedor
FOREIGN KEY (idVendedor) REFERENCES Vendedor(idVendedor)
GO
ALTER TABLE Venta
ADD CONSTRAINT FK_VentaVehiculo
FOREIGN KEY (idVehiculo) REFERENCES Vehiculo(idVehiculo)
GO
ALTER TABLE Venta
ADD CONSTRAINT FK_VentaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE Venta
ADD CONSTRAINT FK_VentaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE OpcionVehiculo
ADD CONSTRAINT FK_OpcionVehiculoOpcion
FOREIGN KEY (idOpcion) REFERENCES Opcion(idOpcion)
GO
ALTER TABLE OpcionVehiculo
ADD CONSTRAINT FK_OpcionVehiculoVehiculo
FOREIGN KEY (idVehiculo) REFERENCES Vehiculo(idVehiculo)
GO
ALTER TABLE OpcionVehiculo
ADD CONSTRAINT FK_OpcionVehiculoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE OpcionVehiculo
ADD CONSTRAINT FK_OpcionVehiculoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE OpcionVenta
ADD CONSTRAINT FK_OpcionVentaOpcion
FOREIGN KEY (idOpcion) REFERENCES Opcion(idOpcion)
GO
ALTER TABLE OpcionVenta
ADD CONSTRAINT FK_OpcionVentaVenta
FOREIGN KEY (idVenta) REFERENCES Venta(idVenta)
GO
ALTER TABLE OpcionVenta
ADD CONSTRAINT FK_OpcionVentaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario)
GO
ALTER TABLE OpcionVenta
ADD CONSTRAINT FK_OpcionVentaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario)
GO
----------------------------INSERTAR REGISTROS---------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave,idUsuarioCrea,fechaCrea,idUsuarioModifica,fechaModifica)
VALUES ('Alan Geovannie','Morales','Salazar','I19050458@monclova.tecnm.mx','Tec12345.',1,GETDATE(),1,GETDATE())

INSERT INTO Cliente(nombre,apellidoPaterno,apellidoMaterno,telefono,direccion,rfc)
VALUES ('Alan Geovannie','Morales','Salazar','8661458523','calle mirrador 1547 colonia bosques','MAN5484844'),
        ('Alan Geovannie','Lopez','Salas','8661457893','calle 4  1417 colonia Heroes','SWSW484848'),
		('Adam Jorge','Gutierrez','Torres','8661416423','calle lomas 1699  colonia pulpito','SWSW515111'),
		('Luis Pepe','Garcia','Salcido','8661447123','calle 2 1114 colonia octavo','SSWQQ454545'),
		('Jesus Edgar','Casillas','Orosco','8661458000','calle 9 1787 colonia barrio','WWQ212112'),
		('Lalo Jose','Montano','Marquez','8661444878','calle Lato 4777 colonia Zaeta','WQWQ12000')

INSERT INTO CocheUsado(marca,modelo,matricula,precio,descripcion,idCliente)
VALUES ('Ford','2015','5ASBLS',60000,'carro rojo',1),
       ('Chevrolet','2017','A23ESD',80000,'camioneta blanca',1),
	   ('Honda','2010','994EEE',90000,'carro azul',1),
	   ('BMW','2016','587WWW',100000,'carro blanco',1),
	   ('Mercedes','2012','8IEY46',120000,'carro negro',1),
	   ('Masarati','2011','8SSS6',11500,'carro gris',1)

     
 INSERT INTO Opcion(nombre,descripcion)
VALUES  ('Motor','6 cilindros'),
        ('Aciento','de cuero'),
		('Rines','Aluminio'),
        ('Llantas','antiderrapante'),
		('Frenos','ABS'),
        ('Luces','LED')

INSERT INTO Vehiculo(marca,modelo,cilindros,precio,descripcion)
VALUES   ('Mazda','2015','YASBLS',60000,'carro rojo'),
       ('KIA','2017','E23ESD',80000,'camioneta blanca'),
	   ('volkswagen','2010','P94EEE',90000,'carro azul'),
	   ('Toyota','2016','Z87WWW',100000,'carro blanco'),
	   ('Nizzan','2012','XIEY46',120000,'carro negro')
     
INSERT INTO Vendedor(nombre,apellidoPaterno,apellidoMaterno,telefono,direccion,rfc)
VALUES  ('Pepe Geovannie','Morales','Salazar','8661458523','calle mirrador 1547 colonia bosques','MAN5484844'),
        ('Jose Geovannie','Lopez','Salas','8661457893','calle 4  1417 colonia Heroes','SWSW484848'),
		('Sabino Jorge','Gutierrez','Torres','8661416423','calle lomas 1699  colonia pulpito','SWSW515111'),
		('Arturo Pepe','Garcia','Salcido','8661447123','calle 2 1114 colonia octavo','SSWQQ454545'),
		('Luis Edgar','Casillas','Orosco','8661458000','calle 9 1787 colonia barrio','WWQ212112'),
		('Raul Jose','Montano','Marquez','8661444878','calle Lato 4777 colonia Zaeta','WQWQ12000')

INSERT INTO Venta(fecha,matricula,idCliente,idVendedor,idVehiculo)
VALUES    (getdate(),'494SAQQQQ',1,2,3),
          (getdate(),'AAA47A77A',1,2,3),
		  (getdate(),'XA7877A7A',1,2,3),
		  (getdate(),'LLLA8A8A8',1,2,3),
		  (getdate(),'QQ7A7A7AA',1,2,3),
		  (getdate(),'Qakakaasa',1,2,3)

INSERT INTO OpcionVehiculo(idOpcion,idVehiculo,precio)
VALUES  (1,2,20000),
        (1,2,50000),
		(5,2,100000),
		(1,2,40000),
		(1,2,80000),
		(1,2,70000)

INSERT INTO OpcionVenta(idOpcion,idVenta)
VALUES  (1,2),
        (1,2),
		(1,2),
		(1,2),
		(1,2),
		(1,2)


-----SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-----

--SELECT * FROM Cliente
--SELECT * FROM CocheUsado


-------------------------ACTUALIZAR ALGUNOS DATOS----------------------------

--UPDATE Cliente SET nombre = 'Javier Luna' WHERE idCliente = 6

-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Cliente
--SELECT * FROM CocheUsado


-------PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-------------------

--DELETE FROM Cliente WHERE idCliente=6
--DELETE FROM CocheUsado WHERE idCocheUsado=1

----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------
--SELECT * FROM Cliente
--SELECT * FROM CocheUsado


---TRUNCATE TABLE Cuerpo

---NORMALIZACION O FORMAS NORMALES, 1FN, 2FN,....


select GETDATE()

select count(*)from Cliente
--------------------------------------------------Tipos de Vistas----------------------------------------------------------
--select idVendedor, CONCAT(nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Vendedor
--GO
--Vista
--CREATE VIEW vwListaVendedor as
--select idVendedor, concat (nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Vendedor where estatus = 1
--GO

--select * from vwListaVendedor

--select t1.nombre,t2.nombre from Cliente as t1 inner join Vendedor as t2 on t1.idCliente = t2.idVendedor             

--select t1.nombre,t2.modelo,marca from Cliente as t1 inner join CocheUsado as t2 on t1.idCliente = t2.idCocheUsado             

--select t1.precio,t2.nombre from CocheUsado as t1 inner join Vendedor as t2 on t1.idCocheUsado = t2.idVendedor             

--select t1.descripcion,t2.nombre from CocheUsado as t1 inner join Cliente as t2 on t1.idCocheUsado = t2.idCliente           

--select t1.descripcion,t2.marca from Opcion as t1 inner join CocheUsado as t2 on t1.idOpcion = t2.idCocheUsado             

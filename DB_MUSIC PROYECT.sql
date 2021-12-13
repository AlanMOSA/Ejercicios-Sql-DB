USE master;
GO
IF DB_ID (N'Music') IS NOT NULL
DROP DATABASE Music;
GO
CREATE DATABASE Music
ON 
(NAME = Music_dat,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Music.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = Music_log,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Music.ldf',
SIZE = 20MB,
MAXSIZE = 50MB,
FILEGROWTH = 20MB);
GO
USE Music;
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
CREATE TABLE Album 
(
idAlbum int IDENTITY(1,1),
nombre varchar (25) not null,
numCanciones char (15) not null,
genero varchar (50) not null,
fechaCreacion varchar (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Album PRIMARY KEY (idAlbum)
);
CREATE TABLE Artista
(
idArtista int IDENTITY(1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
NSS char (14) not null,
CURP char (20) not null,
RFC char (16) not null,
fechaNacimiento varchar (20) not null,
direccion varchar (150) not null,
idPatrimonio int null,
idEstadoCivil int null,
idEstado int null,
idNacionalidad int null,
idDisquera int null,
idMarca int null,
idBanda int null,
idContrato int null,
idEstudio int null,
idEmpresaPatrocina int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Artista PRIMARY KEY (idArtista)
);
CREATE TABLE Asentamiento 
(
idAsentamiento int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idMunicipio int null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Asentamiento PRIMARY KEY (idAsentamiento)
);
CREATE TABLE TipoAsentamiento 
(
idTipoAsentamiento int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idAsentamiento int null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_TipoAsentamiento PRIMARY KEY (idTipoAsentamiento)
);
CREATE TABLE AsistentePersonal
(
idAsistentePersonal int IDENTITY(1,1),
nombre varchar (25) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
fechaNacimiento varchar (20) not null,
idArtista int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_AsistentePersonal PRIMARY KEY (idAsistentePersonal)
);
CREATE TABLE Banda 
(
idBanda int IDENTITY(1,1),
nombre varchar (50) not null,
numIntegrantes char (20) not null,
fechaCreacion varchar (20) not null,
idDisquera int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Banda PRIMARY KEY (idBanda)
);
CREATE TABLE Cancion 
(
idCancion int IDENTITY(1,1),
nombre varchar (25) not null,
genero varchar (30) not null,
duracion varchar (30) not null,
fechaCreacion varchar (20) not null,
idVideoClip int null,
idAlbum int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Cancion PRIMARY KEY (idCancion)
);
CREATE TABLE Club 
(
idClub int IDENTITY(1,1),
nombre varchar (25) not null,
numIntegrantes varchar (30) not null,
fechaCreacion varchar (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Club PRIMARY KEY (idClub)
);
CREATE TABLE Compositor
(
idCompositor int IDENTITY(1,1),
nombre varchar (25) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
NSS char (14) not null,
CURP char (20) not null,
RFC char (16) not null,
fechaNacimiento varchar (20) not null,
direccion varchar (150) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Compositor PRIMARY KEY (idCompositor)
);
CREATE TABLE Concierto 
(
idConcierto int IDENTITY(1,1),
nombre varchar (100) not null,
numero char (30) not null,
descripcion varchar (100) not null,
lugar varchar (150) not null,
fecha varchar (20) not null,
idGira int null,
idEstadio int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Concierto PRIMARY KEY (idConcierto)
);
CREATE TABLE Contrato 
(
idContrato int IDENTITY(1,1),
nombre varchar (25) not null,
numero varchar (30) not null,
codigo char (20) not null,
descripcion varchar (30) not null,
fechaInicio varchar (20) null,
fechaTermina varchar (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Contrato PRIMARY KEY (idContrato)
);
CREATE TABLE DerechosAutor 
(
idDerechosAutor int IDENTITY(1,1),
nombre varchar (25) not null,
codigo char (30) not null,
descripcion varchar (30) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_DerechosAutor PRIMARY KEY (idDerechosAutor)
);
CREATE TABLE Disquera 
(
idDisquera int IDENTITY(1,1),
nombre varchar (50) not null,
telefono char (15) not null,
ubicacion varchar (100) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Disquera PRIMARY KEY (idDisquera)
);
CREATE TABLE Empleado
(
idEmpleado int IDENTITY(1,1),
nombre varchar (25) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
NSS char (14) not null,
CURP char (20) not null,
fechaNacimiento varchar (20) not null,
idDisquera int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Empleado PRIMARY KEY (idEmpleado)
);
CREATE TABLE EmpresaPatrocina 
(
idEmpresaPatrocina int IDENTITY(1,1),
nombre varchar (25) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_EmpresaPatrocina PRIMARY KEY (idEmpresaPatrocina)
);
CREATE TABLE Entrevista 
(
idEntrevista int IDENTITY(1,1),
descripcion varchar (100) not null,
lugar varchar (50) not null,
hora varchar (30) not null,
fecha varchar (20) not null,
idEvento int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Entrevista PRIMARY KEY (idEntrevista)
);
CREATE TABLE EquipoComputo 
(
idEquipoComputo int IDENTITY(1,1),
nombre varchar (50) not null,
marca varchar (30) not null,
precio numeric (10,2) not null,
idEstudio int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_EquipoComputo PRIMARY KEY (idEquipoComputo)
);
CREATE TABLE EquipoSonido 
(
idEquipoSonido int IDENTITY(1,1),
nombre varchar (50) not null,
idEstudio int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_EquipoSonido PRIMARY KEY (idEquipoSonido)
);
CREATE TABLE Estadio 
(
idEstadio int IDENTITY(1,1),
nombre varchar (50) not null,
ubicacion varchar (150) not null,
numCapacidad char (30) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Estadio PRIMARY KEY (idEstadio)
);
CREATE TABLE Estado 
(
idEstado int IDENTITY(1,1),
nombre varchar (50) not null,
numero char (12) not null,
clave char (30) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Estado PRIMARY KEY (idEstado)
);
CREATE TABLE EstadoCivil
(
idEstadoCivil int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_EstadoCivil PRIMARY KEY (idEstadoCivil)
);
CREATE TABLE Estudio 
(
idEstudio int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Estudio PRIMARY KEY (idEstudio)
);
CREATE TABLE Estudios
(
idEstudios int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Estudios PRIMARY KEY (idEstudios)
);
CREATE TABLE Evento 
(
idEvento int IDENTITY(1,1),
nombre varchar (50) not null,
lugar varchar (30) not null,
hora varchar (30) not null,
fecha varchar (20) not null,
idGira int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Evento PRIMARY KEY (idEvento)
);
CREATE TABLE GeneroMusical
(
idGeneroMusical int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_GeneroMusical PRIMARY KEY (idGeneroMusical)
);
CREATE TABLE Gira 
(
idGira int IDENTITY(1,1),
nombre varchar (25) not null,
descripcion varchar (100) not null,
fechaInicio varchar (20) not null,
fechaTermina varchar (20) not null,
lugar varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Gira PRIMARY KEY (idGira)
);
CREATE TABLE Idioma
(
idIdioma int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Idioma PRIMARY KEY (idIdioma)
);
CREATE TABLE Instrumento
(
idInstrumento int IDENTITY(1,1),
nombre varchar (50) not null,
idEstudio int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Instrumento PRIMARY KEY (idInstrumento)
);
CREATE TABLE Interprete
(
idInterprete int IDENTITY(1,1),
nombre varchar (25) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
fechaNacimiento varchar (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Interprete PRIMARY KEY (idInterprete)
);
CREATE TABLE Marca
(
idMarca int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Marca PRIMARY KEY (idMarca)
);
CREATE TABLE MedioComunicacion
(
idMedioComunicacion int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_MedioComunicacion PRIMARY KEY (idMedioComunicacion)
);
CREATE TABLE Mercancia
(
idMercancia int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Mercancia PRIMARY KEY (idMercancia)
);
CREATE TABLE Moviliario
(
idMoviliario int IDENTITY(1,1),
nombre varchar (50) not null,
idDisquera int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Moviliario PRIMARY KEY (idMoviliario)
);
CREATE TABLE Municipio
(
idMunicipio int IDENTITY(1,1),
nombre varchar (50) not null,
numero char (15) not null,
idEstado int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Municipio PRIMARY KEY (idMunicipio)
);
CREATE TABLE Nacionalidad
(
idNacionalidad int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Nacionalidad PRIMARY KEY (idNacionalidad)
);
CREATE TABLE Patrimonio
(
idPatrimonio int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Patrimonio PRIMARY KEY (idPatrimonio)
);
CREATE TABLE Pelicula
(
idPelicula int IDENTITY(1,1),
nombre varchar (50) not null,
genero varchar (50) not null,
fecha varchar (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Pelicula PRIMARY KEY (idPelicula)
);
CREATE TABLE PlataformaDigital
(
idPlataformaDigital int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_PlataformaDigital PRIMARY KEY (idPlataformaDigital)
);
CREATE TABLE Premio
(
idPremio int IDENTITY(1,1),
nombre varchar (50) not null,
descripcion varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Premio PRIMARY KEY (idPremio)
);
CREATE TABLE ProductorEjecutivo
(
idProductorEjecutivo int IDENTITY(1,1),
nombre varchar (25) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
fechaNacimiento varchar (20) not null,
idDisquera int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ProductorEjecutivo PRIMARY KEY (idProductorEjecutivo)
);
CREATE TABLE ProductorMusical
(
idProductorMusical int IDENTITY(1,1),
nombre varchar (25) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
fechaNacimiento varchar (20) not null,
idDisquera int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ProductorMusical PRIMARY KEY (idProductorMusical)
);
CREATE TABLE Proveedor
(
idProveedor int IDENTITY(1,1),
nombre varchar (25) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
fechaNacimiento varchar (20) not null,
descripcion varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Proveedor PRIMARY KEY (idProveedor)
);
CREATE TABLE Publicidad
(
idPublicidad int IDENTITY(1,1),
tipo varchar (50) not null,
descripcion varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Publicidad PRIMARY KEY (idPublicidad)
);
CREATE TABLE Regalia
(
idRegalia int IDENTITY(1,1),
descripcion varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Regalia PRIMARY KEY (idRegalia)
);
CREATE TABLE Representante
(
idRepresentante int IDENTITY(1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
NSS char (30) not null,
CURP char (30) not null,
fechaNacimiento varchar (20) not null,
dirrecion varchar (150) not null,
idArtista int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Representante PRIMARY KEY (idRepresentante)
);
CREATE TABLE TipoEmpleado
(
idTipoEmpleado int IDENTITY(1,1),
nombre varchar (50) not null,
idEmpleado int null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_TipoEmpleado PRIMARY KEY (idTipoEmpleado)
);
CREATE TABLE TipoTransporte
(
idTipoTransporte int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_TipoTransporte PRIMARY KEY (idTipoTransporte)
);
CREATE TABLE Transporte
(
idTransporte int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Transporte PRIMARY KEY (idTransporte)
);
CREATE TABLE Vestuario
(
idVestuario int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Vestuario PRIMARY KEY (idVestuario)
);
CREATE TABLE VideoClip
(
idVideoClip int IDENTITY(1,1),
nombre varchar (50) not null,
duracion char (50) not null, 
fechaCreacion varchar (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_VideoClip PRIMARY KEY (idVideoClip)
);
CREATE TABLE Zona
(
idZona int IDENTITY(1,1),
nombre varchar (50) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_Zona PRIMARY KEY (idZona)
);
---------------------------------------------------------------------------------------------
CREATE TABLE ArtistaVestuario
(
idArtistaVestuario int IDENTITY(1,1),
idArtista int not null,
idVestuario int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ArtistaVestuario PRIMARY KEY (idArtistaVestuario)
);
CREATE TABLE PeliculaArtista
(
idPeliculaArtista int IDENTITY(1,1),
idPelicula int not null,
idArtista int not null,
fechaActuo varchar (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_PeliculaArtista PRIMARY KEY (idPeliculaArtista)
);
CREATE TABLE EstudiosArtista
(
idEstudiosArtista int IDENTITY(1,1),
idEstudios int not null,
idArtista int not null,
fechaRealizo varchar (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_EstudiosArtista PRIMARY KEY (idEstudiosArtista)
);
CREATE TABLE ArtistaIdioma
(
idArtistaIdioma int IDENTITY(1,1),
idArtista int not null,
idIdioma int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ArtistaIdioma PRIMARY KEY (idArtistaIdioma)
);
CREATE TABLE ArtistaClub
(
idArtistaClub int IDENTITY(1,1),
idArtista int not null,
idClub int not null,
fechaCreacion varchar (20) not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ArtistaClub PRIMARY KEY (idArtistaClub)
);
CREATE TABLE ArtistaGira
(
idArtistaGira int IDENTITY(1,1),
idArtista int not null,
idGira int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ArtistaGira PRIMARY KEY (idArtistaGira)
);
CREATE TABLE ArtistaProveedor
(
idArtistaProveedor int IDENTITY(1,1),
idArtista int not null,
idProveedor int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ArtistaProveedor PRIMARY KEY (idArtistaProveedor)
);
CREATE TABLE ArtistaPublicidad
(
idArtistaPublicidad int IDENTITY(1,1),
idArtista int not null,
idPublicidad int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ArtistaPublicidad PRIMARY KEY (idArtistaPublicidad)
);
CREATE TABLE MercanciaArtista
(
idMercanciaArtista int IDENTITY(1,1),
idMercancia int not null,
idArtista int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_MercanciaArtista PRIMARY KEY (idMercanciaArtista)
);
CREATE TABLE CompositorArtista
(
idCompositorArtista int IDENTITY(1,1),
idCompositor int not null,
idArtista int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_CompositorArtista PRIMARY KEY (idCompositorArtista)
);
CREATE TABLE RegaliaArtista
(
idRegaliaArtista int IDENTITY(1,1),
idRegalia int not null,
idArtista int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_RegaliaArtista PRIMARY KEY (idRegaliaArtista)
);
CREATE TABLE TransporteArtista
(
idTransporteArtista int IDENTITY(1,1),
idTransporte int not null,
idArtista int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_TransporteArtista PRIMARY KEY (idTransporteArtista)
);
CREATE TABLE TransporteTipoTransporte
(
idTransporteTipoTransporte int IDENTITY(1,1),
idTransporte int not null,
idTipoTransporte int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_TransporteTipoTransporte PRIMARY KEY (idTransporteTipoTransporte)
);
CREATE TABLE DerechosAutorArtista
(
idDerechosAutorArtista int IDENTITY(1,1),
idDerechosAutor int not null,
idArtista int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_DerechosAutorArtista PRIMARY KEY (idDerechosAutorArtista)
);
CREATE TABLE ArtistaPremio
(
idArtistaPremio int IDENTITY(1,1),
idArtista int not null,
idPremio int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_ArtistaPremio PRIMARY KEY (idArtistaPremio)
);
CREATE TABLE CancionPremio
(
idCancionPremio int IDENTITY(1,1),
idCancion int not null,
idPremio int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_CancionPremio PRIMARY KEY (idCancionPremio)
);
CREATE TABLE CancionArtista
(
idCancionArtista int IDENTITY(1,1),
idCancion int not null,
idArtista int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_CancionArtista PRIMARY KEY (idCancionArtista)
);
CREATE TABLE GeneroMusicalArtista
(
idGeneroMusicalArtista int IDENTITY(1,1),
idGeneroMusical int not null,
idArtista int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_GeneroMusicalArtista PRIMARY KEY (idGeneroMusicalArtista)
);
CREATE TABLE AlbumArtista
(
idAlbumArtista int IDENTITY(1,1),
idAlbum int not null,
idArtista int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_AlbumArtista PRIMARY KEY (idAlbumArtista)
);
CREATE TABLE PlataformaDigitalCancion   
(
idPlataformaDigitalCancion int IDENTITY(1,1),
idPlataformaDigital int not null,
idCancion int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_PlataformaDigitalCancion PRIMARY KEY (idPlataformaDigitalCancion)
);
CREATE TABLE MedioComunicacionCancion
(
idMedioComunicacionCancion int IDENTITY(1,1),
idMedioComunicacion int not null,
idCancion int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_MedioComunicacionCancion PRIMARY KEY (idMedioComunicacionCancion)
);
CREATE TABLE TipoAsentamientoZona
(
idTipoAsentamientoZona int IDENTITY(1,1),
idTipoAsentamiento int not null,
idZona int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_TipoAsentamientoZona PRIMARY KEY (idTipoAsentamientoZona)
);
GO
CREATE TABLE CancionInterprete
(
idCancionInterprete int IDENTITY(1,1),
idCancion int not null,
idInterprete int not null,
estatus bit default 1 not null,
idUsuarioCrea int null,
fechaCrea datetime null,
idUsuarioModifica int default null,
fechaModifica datetime default null
CONSTRAINT PK_CancionInterprete PRIMARY KEY (idCancionInterprete)
);
GO
----------------------------------------INDEX----------------------------------------
CREATE INDEX IX_Album ON Album(idAlbum);
GO
CREATE INDEX IX_Artista ON Artista(idArtista);
GO
CREATE INDEX IX_Asentamiento ON Asentamiento(idAsentamiento);
GO
CREATE INDEX IX_TipoAsentamiento ON TipoAsentamiento(idTipoAsentamiento);
GO
CREATE INDEX IX_AsistentePersonal ON AsistentePersonal(idAsistentePersonal);
GO
CREATE INDEX IX_Banda ON Banda(idBanda);
GO
CREATE INDEX IX_Cancion ON Cancion(idCancion);
GO
CREATE INDEX IX_Club ON Club(idClub);
GO
CREATE INDEX IX_Compositor ON Compositor(idCompositor);
GO
CREATE INDEX IX_Concierto ON Concierto(idConcierto);
GO
CREATE INDEX IX_Contrato ON Contrato(idContrato);
GO
CREATE INDEX IX_DerechosAutor ON DerechosAutor(idDerechosAutor);
GO
CREATE INDEX IX_Disquera ON Disquera(idDisquera);
GO
CREATE INDEX IX_Empleado ON Empleado(idEmpleado);
GO
CREATE INDEX IX_EmpresaPatrocina ON EmpresaPatrocina(idEmpresaPatrocina);
GO
CREATE INDEX IX_Entrevista ON Entrevista(idEntrevista);
GO
CREATE INDEX IX_EquipoComputo ON EquipoComputo(idEquipoComputo);
GO
CREATE INDEX IX_EquipoSonido ON EquipoSonido(idEquipoSonido);
GO
CREATE INDEX IX_Estadio ON Estadio(idEstadio);
GO
CREATE INDEX IX_Estado ON Estado(idEstado);
GO
CREATE INDEX IX_EstadoCivil ON EstadoCivil(idEstadoCivil);
GO
CREATE INDEX IX_Estudio ON Estudio(idEstudio);
GO
CREATE INDEX IX_Estudios ON Estudios(idEstudios);
GO
CREATE INDEX IX_Evento ON Evento(idEvento);
GO
CREATE INDEX IX_GeneroMusical ON GeneroMusical(idGeneroMusical);
GO
CREATE INDEX IX_Gira ON Gira(idGira);
GO
CREATE INDEX IX_Idioma ON Idioma(idIdioma);
GO
CREATE INDEX IX_Instrumento ON Instrumento(idInstrumento);
GO
CREATE INDEX IX_Interprete ON Interprete(idInterprete);
GO
CREATE INDEX IX_Marca ON Marca(idMarca);
GO
CREATE INDEX IX_MedioComunicacion ON MedioComunicacion(idMedioComunicacion);
GO
CREATE INDEX IX_Mercancia ON Mercancia(idMercancia);
GO
CREATE INDEX IX_Moviliario ON Moviliario(idMoviliario);
GO
CREATE INDEX IX_Municipio ON Municipio(idMunicipio);
GO
CREATE INDEX IX_Nacionalidad ON Nacionalidad(idNacionalidad);
GO
CREATE INDEX IX_Patrimonio ON Patrimonio(idPatrimonio);
GO
CREATE INDEX IX_Pelicula ON Pelicula(idPelicula);
GO
CREATE INDEX IX_PlataformaDigital ON PlataformaDigital(idPlataformaDigital);
GO
CREATE INDEX IX_ProductorEjecutivo ON ProductorEjecutivo(idProductorEjecutivo);
GO
CREATE INDEX IX_ProductorMusical ON ProductorMusical(idProductorMusical);
GO
CREATE INDEX IX_Proveedor ON Proveedor(idProveedor);
GO
CREATE INDEX IX_Publicidad ON Publicidad(idPublicidad);
GO
CREATE INDEX IX_Regalia ON Regalia(idRegalia);
GO
CREATE INDEX IX_Representante ON Representante(idRepresentante);
GO
CREATE INDEX IX_TipoEmpleado ON TipoEmpleado(idTipoEmpleado);
GO
CREATE INDEX IX_TipoTransporte ON TipoTransporte(idTipoTransporte);
GO
CREATE INDEX IX_Transporte ON Transporte(idTransporte);
GO
CREATE INDEX IX_Vestuario ON Vestuario(idVestuario);
GO
CREATE INDEX IX_VideoClip ON VideoClip(idVideoClip);
GO
CREATE INDEX IX_Zona ON Zona(idZona);
GO
CREATE INDEX IX_ArtistaVestuario ON ArtistaVestuario(idArtistaVestuario);
GO
CREATE INDEX IX_PeliculaArtista ON PeliculaArtista(idPeliculaArtista);
GO
CREATE INDEX IX_EstudiosArtista ON EstudiosArtista(idEstudiosArtista);
GO
CREATE INDEX IX_ArtistaIdioma ON ArtistaIdioma(idArtistaIdioma);
GO
CREATE INDEX IX_ArtistaClub ON ArtistaClub(idArtistaClub);
GO
CREATE INDEX IX_ArtistaGira ON ArtistaGira(idArtistaGira);
GO
CREATE INDEX IX_ArtistaProveedor ON ArtistaProveedor(idArtistaProveedor);
GO
CREATE INDEX IX_ArtistaPublicidad ON ArtistaPublicidad(idArtistaPublicidad);
GO
CREATE INDEX IX_MercanciaArtista ON MercanciaArtista(idMercanciaArtista);
GO
CREATE INDEX IX_CompositorArtista ON CompositorArtista(idCompositorArtista);
GO
CREATE INDEX IX_RegaliaArtista ON RegaliaArtista(idRegaliaArtista);
GO
CREATE INDEX IX_TransporteArtista ON TransporteArtista(idTransporteArtista);
GO
CREATE INDEX IX_TransporteTipoTransporte ON TransporteTipoTransporte(idTransporteTipoTransporte);
GO
CREATE INDEX IX_DerechosAutorArtista ON DerechosAutorArtista(idDerechosAutorArtista);
GO
CREATE INDEX IX_ArtistaPremio ON ArtistaPremio(idArtistaPremio);
GO
CREATE INDEX IX_CancionPremio ON CancionPremio(idCancionPremio);
GO
CREATE INDEX IX_CancionArtista ON CancionArtista(idCancionArtista);
GO
CREATE INDEX IX_GeneroMusicalArtista ON GeneroMusicalArtista(idGeneroMusicalArtista);
GO
CREATE INDEX IX_AlbumArtista ON AlbumArtista(idAlbumArtista);
GO
CREATE INDEX IX_PlataformaDigitalCancion ON PlataformaDigitalCancion(idPlataformaDigitalCancion);
GO
CREATE INDEX IX_MedioComunicacionCancion ON MedioComunicacionCancion(idMedioComunicacionCancion);
GO
CREATE INDEX IX_CancionInterprete ON CancionInterprete(idCancionInterprete);   
GO
CREATE INDEX IX_TipoAsentamientoZona ON TipoAsentamientoZona(idTipoAsentamientoZona);   
GO

-----------------------------------------RELACIONES-----------------------------------------
ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Album
ADD CONSTRAINT FK_AlbumUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Album
ADD CONSTRAINT FK_AlbumUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Artista
ADD CONSTRAINT FK_ArtistaPatrimonio 
FOREIGN KEY (idPatrimonio) REFERENCES Patrimonio(idPatrimonio);
GO
ALTER TABLE Artista
ADD CONSTRAINT FK_ArtistaEstadoCivil 
FOREIGN KEY (idEstadoCivil) REFERENCES EstadoCivil(idEstadoCivil);
GO
ALTER TABLE Artista
ADD CONSTRAINT FK_ArtistaEstado 
FOREIGN KEY (idEstado) REFERENCES Estado(idEstado);
GO
ALTER TABLE Artista
ADD CONSTRAINT FK_ArtistaNacionalidad  
FOREIGN KEY (idNacionalidad ) REFERENCES Nacionalidad (idNacionalidad);
GO
ALTER TABLE Artista
ADD CONSTRAINT FK_ArtistaDisquera  
FOREIGN KEY (idDisquera) REFERENCES Disquera(idDisquera);
GO
ALTER TABLE Artista
ADD CONSTRAINT FK_ArtistaMarca  
FOREIGN KEY (idMarca) REFERENCES Marca (idMarca);
GO
ALTER TABLE Artista
ADD CONSTRAINT FK_ArtistaBanda  
FOREIGN KEY (idBanda) REFERENCES Banda(idBanda);
GO
ALTER TABLE Artista
ADD CONSTRAINT FK_ArtistaContrato  
FOREIGN KEY (idContrato) REFERENCES Contrato (idContrato);
GO
ALTER TABLE Artista
ADD CONSTRAINT FK_ArtistaEstudio  
FOREIGN KEY (idEstudio) REFERENCES Estudio(idEstudio);
GO
ALTER TABLE Artista
ADD CONSTRAINT FK_ArtistaEmpresaPatrocina  
FOREIGN KEY (idEmpresaPatrocina) REFERENCES EmpresaPatrocina(idEmpresaPatrocina);
GO
ALTER TABLE Artista
ADD CONSTRAINT FK_ArtistaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Artista
ADD CONSTRAINT FK_ArtistaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Asentamiento
ADD CONSTRAINT FK_AsentamientoMunicipio  
FOREIGN KEY (idMunicipio ) REFERENCES Municipio (idMunicipio );
GO
ALTER TABLE Asentamiento
ADD CONSTRAINT FK_AsentamientoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Asentamiento
ADD CONSTRAINT FK_AsentamientoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE TipoAsentamiento
ADD CONSTRAINT FK_TipoAsentamientoAsentamiento  
FOREIGN KEY (idAsentamiento) REFERENCES Asentamiento(idAsentamiento);
GO
ALTER TABLE TipoAsentamiento
ADD CONSTRAINT FK_TipoAsentamientoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE TipoAsentamiento
ADD CONSTRAINT FK_TipoAsentamientoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE AsistentePersonal
ADD CONSTRAINT FK_AsistentePersonalArtista  
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE AsistentePersonal
ADD CONSTRAINT FK_AsistentePersonalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE AsistentePersonal
ADD CONSTRAINT FK_AsistentePersonalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Banda
ADD CONSTRAINT FK_BandaDisquera  
FOREIGN KEY (idDisquera) REFERENCES Disquera(idDisquera);
GO
ALTER TABLE Banda
ADD CONSTRAINT FK_BandaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Banda
ADD CONSTRAINT FK_BandaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Cancion
ADD CONSTRAINT FK_CancionVideoClip   
FOREIGN KEY (idVideoClip ) REFERENCES VideoClip (idVideoClip );
GO
ALTER TABLE Cancion
ADD CONSTRAINT FK_CancionAlbum  
FOREIGN KEY (idAlbum) REFERENCES Album(idAlbum);
GO
ALTER TABLE Cancion
ADD CONSTRAINT FK_CancionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Cancion
ADD CONSTRAINT FK_CancionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Club
ADD CONSTRAINT FK_ClubUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Club
ADD CONSTRAINT FK_ClubUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Compositor 
ADD CONSTRAINT FK_CompositorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Compositor 
ADD CONSTRAINT FK_CompositorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Concierto
ADD CONSTRAINT FK_ConciertoGira    
FOREIGN KEY (idGira  ) REFERENCES Gira(idGira  );
GO
ALTER TABLE Concierto
ADD CONSTRAINT FK_ConciertoEstadio  
FOREIGN KEY (idEstadio) REFERENCES Estadio(idEstadio);
GO
ALTER TABLE Concierto
ADD CONSTRAINT FK_ConciertoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Concierto
ADD CONSTRAINT FK_ConciertoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Contrato
ADD CONSTRAINT FK_ContratoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Contrato
ADD CONSTRAINT FK_ContratoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE DerechosAutor
ADD CONSTRAINT FK_DerechosAutorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE DerechosAutor
ADD CONSTRAINT FK_DerechosAutorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Disquera
ADD CONSTRAINT FK_DisqueraUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Disquera
ADD CONSTRAINT FK_DisqueraUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Empleado
ADD CONSTRAINT FK_EmpleadoDisquera  
FOREIGN KEY (idDisquera) REFERENCES Disquera(idDisquera);
GO
ALTER TABLE Empleado
ADD CONSTRAINT FK_EmpleadoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Empleado
ADD CONSTRAINT FK_EmpleadoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE EmpresaPatrocina
ADD CONSTRAINT FK_EmpresaPatrocinaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE EmpresaPatrocina
ADD CONSTRAINT FK_EmpresaPatrocinaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Entrevista
ADD CONSTRAINT FK_EntrevistaEvento 
FOREIGN KEY (idEvento) REFERENCES Evento(idEvento);
GO
ALTER TABLE Entrevista
ADD CONSTRAINT FK_EntrevistaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Entrevista
ADD CONSTRAINT FK_EntrevistaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE EquipoComputo
ADD CONSTRAINT FK_EquipoComputoEstudio 
FOREIGN KEY (idEstudio) REFERENCES Estudio(idEstudio);
GO
ALTER TABLE EquipoComputo
ADD CONSTRAINT FK_EquipoComputoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE EquipoComputo
ADD CONSTRAINT FK_EquipoComputoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE EquipoSonido
ADD CONSTRAINT FK_EquipoSonidoEstudio 
FOREIGN KEY (idEstudio) REFERENCES Estudio(idEstudio);
GO
ALTER TABLE EquipoSonido
ADD CONSTRAINT FK_EquipoSonidoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE EquipoSonido
ADD CONSTRAINT FK_EquipoSonidoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Estadio
ADD CONSTRAINT FK_EstadioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Estadio
ADD CONSTRAINT FK_EstadioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Estado
ADD CONSTRAINT FK_EstadoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Estado
ADD CONSTRAINT FK_EstadoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE EstadoCivil
ADD CONSTRAINT FK_EstadoCivilUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE EstadoCivil
ADD CONSTRAINT FK_EstadoCivilUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Estudio
ADD CONSTRAINT FK_EstudioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Estudio
ADD CONSTRAINT FK_EstudioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Estudios
ADD CONSTRAINT FK_EstudiosUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Estudios
ADD CONSTRAINT FK_EstudiosUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Evento
ADD CONSTRAINT FK_EventoGira 
FOREIGN KEY (idGira) REFERENCES Gira(idGira);
GO
ALTER TABLE Evento
ADD CONSTRAINT FK_EventoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Evento
ADD CONSTRAINT FK_EventoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE GeneroMusical
ADD CONSTRAINT FK_GeneroMusicalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE GeneroMusical
ADD CONSTRAINT FK_GeneroMusicalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Gira
ADD CONSTRAINT FK_GiraUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Gira
ADD CONSTRAINT FK_GiraUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Idioma
ADD CONSTRAINT FK_IdiomaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Idioma
ADD CONSTRAINT FK_IdiomaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Instrumento
ADD CONSTRAINT FK_InstrumentoEstudio 
FOREIGN KEY (idEstudio) REFERENCES Estudio(idEstudio);
GO
ALTER TABLE Instrumento
ADD CONSTRAINT FK_InstrumentoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Instrumento
ADD CONSTRAINT FK_InstrumentoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Interprete
ADD CONSTRAINT FK_InterpreteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Interprete
ADD CONSTRAINT FK_InterpreteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Marca
ADD CONSTRAINT FK_MarcaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Marca
ADD CONSTRAINT FK_MarcaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE MedioComunicacion
ADD CONSTRAINT FK_MedioComunicacionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE MedioComunicacion
ADD CONSTRAINT FK_MedioComunicacionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Mercancia
ADD CONSTRAINT FK_MercanciaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Mercancia
ADD CONSTRAINT FK_MercanciaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Moviliario
ADD CONSTRAINT FK_MoviliarioDisquera
FOREIGN KEY (idDisquera) REFERENCES Disquera(idDisquera);
GO
ALTER TABLE Moviliario
ADD CONSTRAINT FK_MoviliarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Moviliario
ADD CONSTRAINT FK_MoviliarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Municipio
ADD CONSTRAINT FK_MunicipioEstado
FOREIGN KEY (idEstado) REFERENCES Estado(idEstado);
GO
ALTER TABLE Municipio
ADD CONSTRAINT FK_MunicipioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Municipio
ADD CONSTRAINT FK_MunicipioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Nacionalidad
ADD CONSTRAINT FK_NacionalidadUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Nacionalidad
ADD CONSTRAINT FK_NacionalidadUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Patrimonio
ADD CONSTRAINT FK_PatrimonioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Patrimonio
ADD CONSTRAINT FK_PatrimonioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Pelicula
ADD CONSTRAINT FK_PeliculaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Pelicula
ADD CONSTRAINT FK_PeliculaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PlataformaDigital
ADD CONSTRAINT FK_PlataformaDigitalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PlataformaDigital
ADD CONSTRAINT FK_PlataformaDigitalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Premio
ADD CONSTRAINT FK_PremioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Premio
ADD CONSTRAINT FK_PremioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ProductorEjecutivo
ADD CONSTRAINT FK_ProductorEjecutivoDisquera
FOREIGN KEY (idDisquera) REFERENCES Disquera(idDisquera);
GO
ALTER TABLE ProductorEjecutivo
ADD CONSTRAINT FK_ProductorEjecutivoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ProductorEjecutivo
ADD CONSTRAINT FK_ProductorEjecutivoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ProductorMusical
ADD CONSTRAINT FK_ProductorMusicalDisquera
FOREIGN KEY (idDisquera) REFERENCES Disquera(idDisquera);
GO
ALTER TABLE ProductorMusical
ADD CONSTRAINT FK_ProductorMusicalUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ProductorMusical
ADD CONSTRAINT FK_ProductorMusicalUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Proveedor
ADD CONSTRAINT FK_ProveedorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Proveedor
ADD CONSTRAINT FK_ProveedorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Publicidad
ADD CONSTRAINT FK_PublicidadUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Publicidad
ADD CONSTRAINT FK_PublicidadUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Regalia
ADD CONSTRAINT FK_RegaliaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Regalia
ADD CONSTRAINT FK_RegaliaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Representante
ADD CONSTRAINT FK_RepresentanteArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE Representante
ADD CONSTRAINT FK_RepresentanteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Representante
ADD CONSTRAINT FK_RepresentanteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE TipoEmpleado
ADD CONSTRAINT FK_TipoEmpleadoEmpleado
FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);
GO
ALTER TABLE TipoEmpleado
ADD CONSTRAINT FK_TipoEmpleadoUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE TipoEmpleado
ADD CONSTRAINT FK_TipoEmpleadoUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE TipoTransporte
ADD CONSTRAINT FK_TipoTransporteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE TipoTransporte
ADD CONSTRAINT FK_TipoTransporteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Transporte
ADD CONSTRAINT FK_TransporteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Transporte
ADD CONSTRAINT FK_TransporteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Vestuario
ADD CONSTRAINT FK_VestuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Vestuario
ADD CONSTRAINT FK_VestuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE VideoClip
ADD CONSTRAINT FK_VideoClipUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE VideoClip
ADD CONSTRAINT FK_VideoClipUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Zona
ADD CONSTRAINT FK_ZonaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE Zona
ADD CONSTRAINT FK_ZonaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
-------------------------------------------------------------------------------------------------------
ALTER TABLE ArtistaVestuario
ADD CONSTRAINT FK_ArtistaVestuarioArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE ArtistaVestuario
ADD CONSTRAINT FK_ArtistaVestuarioVestuario 
FOREIGN KEY (idVestuario ) REFERENCES Vestuario(idVestuario );
GO
ALTER TABLE ArtistaVestuario
ADD CONSTRAINT FK_ArtistaVestuarioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaVestuario
ADD CONSTRAINT FK_ArtistaVestuarioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PeliculaArtista
ADD CONSTRAINT FK_PeliculaArtistaPelicula
FOREIGN KEY (idPelicula) REFERENCES Pelicula(idPelicula);
GO
ALTER TABLE PeliculaArtista
ADD CONSTRAINT FK_PeliculaArtistaArtista 
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE PeliculaArtista
ADD CONSTRAINT FK_PeliculaArtistaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PeliculaArtista
ADD CONSTRAINT FK_PeliculaArtistaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE EstudiosArtista
ADD CONSTRAINT FK_EstudiosArtistaEstudios
FOREIGN KEY (idEstudios) REFERENCES Estudios(idEstudios);
GO
ALTER TABLE EstudiosArtista
ADD CONSTRAINT FK_EstudiosArtistaArtista 
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE EstudiosArtista
ADD CONSTRAINT FK_EstudiosArtistaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE EstudiosArtista
ADD CONSTRAINT FK_EstudiosArtistaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaIdioma
ADD CONSTRAINT FK_ArtistaIdiomaArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE ArtistaIdioma
ADD CONSTRAINT FK_ArtistaIdiomaIdioma
FOREIGN KEY (idIdioma) REFERENCES Idioma(idIdioma);
GO
ALTER TABLE ArtistaIdioma
ADD CONSTRAINT FK_ArtistaIdiomaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaIdioma
ADD CONSTRAINT FK_ArtistaIdiomaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaClub
ADD CONSTRAINT FK_ArtistaClubArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE ArtistaClub
ADD CONSTRAINT FK_ArtistaClubClub
FOREIGN KEY (idClub) REFERENCES Club(idClub);
GO
ALTER TABLE ArtistaClub
ADD CONSTRAINT FK_ArtistaClubUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaClub
ADD CONSTRAINT FK_ArtistaClubUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaGira
ADD CONSTRAINT FK_ArtistaGiraArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE ArtistaGira
ADD CONSTRAINT FK_ArtistaGiraGira
FOREIGN KEY (idGira) REFERENCES Gira(idGira);
GO
ALTER TABLE ArtistaGira
ADD CONSTRAINT FK_ArtistaGiraUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaGira
ADD CONSTRAINT FK_ArtistaGiraUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaProveedor
ADD CONSTRAINT FK_ArtistaProveedorArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE ArtistaProveedor
ADD CONSTRAINT FK_ArtistaProveedorProveedor
FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor);
GO
ALTER TABLE ArtistaProveedor
ADD CONSTRAINT FK_ArtistaProveedorUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaProveedor
ADD CONSTRAINT FK_ArtistaProveedorUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaPublicidad
ADD CONSTRAINT FK_ArtistaPublicidadArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE ArtistaPublicidad
ADD CONSTRAINT FK_ArtistaPublicidadPublicidad
FOREIGN KEY (idPublicidad) REFERENCES Publicidad(idPublicidad);
GO
ALTER TABLE ArtistaPublicidad
ADD CONSTRAINT FK_ArtistaPublicidadUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaPublicidad
ADD CONSTRAINT FK_ArtistaPublicidadUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE MercanciaArtista
ADD CONSTRAINT FK_MercanciaArtistaMercancia
FOREIGN KEY (idMercancia) REFERENCES Mercancia(idMercancia);
GO
ALTER TABLE MercanciaArtista
ADD CONSTRAINT FK_MercanciaArtistaArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE MercanciaArtista
ADD CONSTRAINT FK_MercanciaArtistaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE MercanciaArtista
ADD CONSTRAINT FK_MercanciaArtistaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CompositorArtista
ADD CONSTRAINT FK_CompositorArtistaCompositor
FOREIGN KEY (idCompositor) REFERENCES Compositor(idCompositor);
GO
ALTER TABLE CompositorArtista
ADD CONSTRAINT FK_CompositorArtistaArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE CompositorArtista
ADD CONSTRAINT FK_CompositorArtistaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CompositorArtista
ADD CONSTRAINT FK_CompositorArtistaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE RegaliaArtista
ADD CONSTRAINT FK_RegaliaArtistaRegalia
FOREIGN KEY (idRegalia) REFERENCES Regalia(idRegalia);
GO
ALTER TABLE RegaliaArtista
ADD CONSTRAINT FK_RegaliaArtistaArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE RegaliaArtista
ADD CONSTRAINT FK_RegaliaArtistaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE RegaliaArtista
ADD CONSTRAINT FK_RegaliaArtistaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE TransporteArtista
ADD CONSTRAINT FK_TransporteArtistaTransporte
FOREIGN KEY (idTransporte) REFERENCES Transporte(idTransporte);
GO
ALTER TABLE TransporteArtista
ADD CONSTRAINT FK_TransporteArtistaArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE TransporteArtista
ADD CONSTRAINT FK_TransporteArtistaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE TransporteArtista
ADD CONSTRAINT FK_TransporteArtistaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE TransporteTipoTransporte
ADD CONSTRAINT FK_TransporteTipoTransporteTransporte
FOREIGN KEY (idTransporte) REFERENCES Transporte(idTransporte);
GO
ALTER TABLE TransporteTipoTransporte
ADD CONSTRAINT FK_TransporteTipoTransporteTipoTransporte
FOREIGN KEY (idTipoTransporte) REFERENCES TipoTransporte(idTipoTransporte);
GO
ALTER TABLE TransporteTipoTransporte
ADD CONSTRAINT FK_TransporteTipoTransporteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE TransporteTipoTransporte
ADD CONSTRAINT FK_TransporteTipoTransporteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE DerechosAutorArtista
ADD CONSTRAINT FK_DerechosAutorArtistaDerechosAutor
FOREIGN KEY (idDerechosAutor) REFERENCES DerechosAutor(idDerechosAutor);
GO
ALTER TABLE DerechosAutorArtista
ADD CONSTRAINT FK_DrechosAutorArtistaArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE DerechosAutorArtista
ADD CONSTRAINT FK_DerechosAutorArtistaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE DerechosAutorArtista
ADD CONSTRAINT FK_DerechosAutorArtistaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaPremio
ADD CONSTRAINT FK_ArtistaPremioArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE ArtistaPremio
ADD CONSTRAINT FK_ArtistaPremioPremio
FOREIGN KEY (idPremio) REFERENCES Premio(idPremio);
GO
ALTER TABLE ArtistaPremio
ADD CONSTRAINT FK_ArtistaPremioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE ArtistaPremio
ADD CONSTRAINT FK_ArtistaPremioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CancionPremio
ADD CONSTRAINT FK_CancionPremioCancion
FOREIGN KEY (idCancion) REFERENCES Cancion(idCancion);
GO
ALTER TABLE CancionPremio
ADD CONSTRAINT FK_CancionPremioPremio
FOREIGN KEY (idPremio) REFERENCES Premio(idPremio);
GO
ALTER TABLE CancionPremio
ADD CONSTRAINT FK_CancionPremioUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CancionPremio
ADD CONSTRAINT FK_CancionPremioUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CancionArtista
ADD CONSTRAINT FK_CancionArtistaCancion
FOREIGN KEY (idCancion) REFERENCES Cancion(idCancion);
GO
ALTER TABLE CancionArtista
ADD CONSTRAINT FK_CancionArtistaArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE CancionArtista
ADD CONSTRAINT FK_CancionArtistaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CancionArtista
ADD CONSTRAINT FK_CancionArtistaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE GeneroMusicalArtista
ADD CONSTRAINT FK_GeneroMusicalArtistaGeneroMusical
FOREIGN KEY (idGeneroMusical) REFERENCES GeneroMusical(idGeneroMusical);
GO
ALTER TABLE GeneroMusicalArtista
ADD CONSTRAINT FK_GeneroMusicalArtistaArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE GeneroMusicalArtista
ADD CONSTRAINT FK_GeneroMusicalArtistaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE GeneroMusicalArtista
ADD CONSTRAINT FK_GeneroMusicalArtistaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE AlbumArtista
ADD CONSTRAINT FK_AlbumArtistaAlbum
FOREIGN KEY (idAlbum) REFERENCES Album(idAlbum);
GO
ALTER TABLE AlbumArtista
ADD CONSTRAINT FK_AlbumArtistaArtista
FOREIGN KEY (idArtista) REFERENCES Artista(idArtista);
GO
ALTER TABLE AlbumArtista
ADD CONSTRAINT FK_AlbumArtistaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE AlbumArtista
ADD CONSTRAINT FK_AlbumArtistaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PlataformaDigitalCancion
ADD CONSTRAINT FK_PlataformaDigitalCancionPlataformaDigital
FOREIGN KEY (idPlataformaDigital) REFERENCES PlataformaDigital(idPlataformaDigital);
GO
ALTER TABLE PlataformaDigitalCancion
ADD CONSTRAINT FK_PlataformaDigitalCancionCancion
FOREIGN KEY (idCancion) REFERENCES Cancion(idCancion);
GO
ALTER TABLE PlataformaDigitalCancion
ADD CONSTRAINT FK_PlataformaDigitalCancionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE PlataformaDigitalCancion
ADD CONSTRAINT FK_PlataformaDigitalCancionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE MedioComunicacionCancion
ADD CONSTRAINT FK_MedioComunicacionCancionMedioComunicacion
FOREIGN KEY (idMedioComunicacion) REFERENCES MedioComunicacion(idMedioComunicacion);
GO
ALTER TABLE MedioComunicacionCancion
ADD CONSTRAINT FK_MedioComunicacionCancionCancion
FOREIGN KEY (idCancion) REFERENCES Cancion(idCancion);
GO
ALTER TABLE MedioComunicacionCancion
ADD CONSTRAINT FK_MedioComunicacionCancionUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE MedioComunicacionCancion
ADD CONSTRAINT FK_MedioComunicacionCancionUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CancionInterprete
ADD CONSTRAINT FK_CancionInterpreteCancion
FOREIGN KEY (idCancion) REFERENCES Cancion(idCancion);
GO
ALTER TABLE CancionInterprete
ADD CONSTRAINT FK_CancionInterpreteInterprete
FOREIGN KEY (idInterprete) REFERENCES Interprete(idInterprete);
GO
ALTER TABLE CancionInterprete
ADD CONSTRAINT FK_CancionInterpreteUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CancionInterprete
ADD CONSTRAINT FK_CancionInterpreteUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE TipoAsentamientoZona
ADD CONSTRAINT FK_TipoAsentamientoZonaUsuarioCrea 
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(idUsuario);
GO
ALTER TABLE CancionInterprete
ADD CONSTRAINT FK_TipoAsentamientoZonaUsuarioModifica 
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(idUsuario);
GO

------------------------------------------INSERTAR REGISTROS-------------------------------------------
INSERT INTO Usuario(nombre,apellidoPaterno,apellidoMaterno,correo,clave)
VALUES ('Alan Geovannie','Morales','Salazar','I19050458@monclova.tecnm.mx','Tec12345.')

INSERT INTO Patrimonio(nombre)
VALUES ('Autos'),
       ('Terrenos'),
       ('Restaurantes'),
       ('Empresas'),
       ('Joyas'),
	   ('Casas'),
       ('Acciones'),
       ('Departamentos'),
       ('Tiendas'),
       ('Muebles')

INSERT INTO EstadoCivil(nombre)
VALUES ('Soltero'),
       ('Casado'),
       ('Divorciado'),
       ('Viudo'),
       ('Viuda'),
	   ('Separado'),
       ('Juntado'),
       ('En Relacion'),
       ('Juntada'),
       ('Divorciado')

INSERT INTO Estado(nombre,numero,clave)
VALUES ('Coahuila','7','LWSKOWSO'),
       ('Nuevo Leon','19','LWSMKWS'),
       ('Tamaulipas','28','WSOWKSW'),
       ('Sinaloa','25','O21I22W'),
       ('Durango','10','SKSN2992'),
	   ('Zacatecas','3','SWKSW990'),
       ('Guadalajara','4','SMSV727S'),
       ('Sonora','9','02OW9KKW'),
       ('Guerrero','11','MNZ422WW'),
       ('Mexico','30','NZA129WK')

INSERT INTO Municipio(nombre,numero,idEstado)
VALUES ('Monclova','11',3),
       ('Saltillo','2',4),
       ('Ocampo','3',2),
       ('Piedras Negras','4',6),
       ('Castaños','7',6),
	   ('Sabinas','8',7),
       ('Torreon','12',8),
       ('Acuña','14',1),
       ('Nadadores','10',10),
       ('Muzquiz','6',4)

INSERT INTO Zona(nombre)
VALUES ('Urbana'),
       ('Rural'),
       ('Rural'),
       ('Urbana'),
       ('Urbana'),
	   ('Urbana'),
       ('Rural'),
       ('Urbana'),
       ('Urbana'),
       ('Rural')

INSERT INTO Asentamiento(nombre)
VALUES ('Puerto blanco'),
       ('Tierra y Libertad'),
       ('Emiliano Zapata'),
       ('Flores'),
       ('Borjas'),
	   ('Arturias'),
       ('Estancias'),
       ('Rivera'),
       ('Del Rio'),
       ('Centro')
	   
INSERT INTO TipoAsentamiento(nombre,idAsentamiento)
VALUES ('Rancheria',2),
       ('Residencia',3),
       ('Colonia',4),
       ('Pueblo',5),
       ('Barrio',6),
	   ('Fraccionamiento',7),
       ('Ejido',1),
       ('Zona industrial',8),
       ('Unidad habitacional',9),
       ('Equipamiento',10)

INSERT INTO Nacionalidad(nombre)
VALUES ('Mexicana'),
       ('Americana'),
       ('Brasileña'),
       ('Europea'),
       ('Canadiense'),
	   ('Rusa'),
       ('Africana'),
       ('China'),
       ('Alemana'),
       ('Española')

INSERT INTO Disquera(nombre,ubicacion,telefono)
VALUES ('Revancha','Colima 110, Roma Nte., Cuauhtémoc, 06700 Ciudad de México, CDMX','525555056394'),
       ('Umor Rex','San Miguel Chapultepec I Secc, Miguel Hidalgo, 11850 Ciudad de México, CDMX','525554448494'),
       ('Noiselab Records','Parque España 47, Colonia Condesa, Cuauhtémoc, 06140 Ciudad de México, CDMX','525552116942'),
       ('Aboli Pop','Juan de la Barrera 38, Colonia Condesa, Cuauhtémoc, 06140 Ciudad de México, CDMX','525532226942'),
       ('Finesse Records','Fernando Montes de Oca 14, Colonia Condesa, Cuauhtémoc, 06140 Ciudad de México, CDMX','525559133269'),
	   ('DaFuture','Palo Santo 22-Piso 2, Lomas Altas, Miguel Hidalgo, 11950 Ciudad de México, CDMX','525555705865'),
       ('Electrique Music','C. Pensilvania 309, Cd. de los Deportes, Benito Juárez, 03710 Ciudad de México, CDMX','525556877392'),
       ('Rock Juvenil','Constitución de la República 221-I Sec, Pradera I Secc, Gustavo A. Madero, 07550 Ciudad, CDMX','525551305730'),
       ('DURO','Félix Parra 35, San José Insurgentes, Benito Juárez, 03900 Ciudad de México, CDMX','525555638908'),
       ('Amuse','Carr. Picacho-Ajusco Km 1.5, Jardines del Ajusco, Tlalpan, 14200 Ciudad de México, CDMX','525553393600')

INSERT INTO Marca(nombre)
VALUES ('Nike'),
       ('Puma'),
       ('Adidas'),
       ('Reebok'),
       ('Converse'),
	   ('Under Armour'),
       ('Skechers'),
       ('Lee'),
       ('Levis'),
       ('Lacoste')

INSERT INTO Banda(nombre,numIntegrantes,fechaCreacion,idDisquera)
VALUES ('Los Acosta','5','03-11-79',2),
       ('Los Temerarios','3','13-01-77',1),
       ('Bronco','6','19-07-79',3),
       ('La Mafia','7','15-12-80',1),
       ('Liberacion','7','25-08-85',6),
	   ('Los Caminantes','6','20-04-82',3),
       ('Brindis','6','29-09-78',9),
       ('Conjunto Primavera','8','29-09-83',4),
       ('Los Tigres del Norte','5','16-11-88',8),
       ('Yndio','5','10-02-88',10)

INSERT INTO Contrato(nombre,numero,codigo,descripcion,fechaInicio,fechaTermina)
VALUES ('Temporal','12','NL93K3','solo tempora','20-05-21','25-06-22'),
       ('Indefinido','2','5SES0Z','Indefinido','26-11-21','21-09-22'),
       ('Exclusivo','5','JU7888','Exclusividad','01-05-21','09-10-23'),
       ('Planta','8','JU7888','Exclusividad','01-05-21','09-10-23'),
       ('Indeterminado','9','00QWS','Indeterminado','08-04-21','28-13-22'),
	   ('Determinado','7','23MIE','Determinda','09-12-21','03-07-22'),
       ('Pureba','10','25WEX','Prueba','07-08-21','09-04-30'),
       ('Temporal','16','0X0Z0','Temporal','01-12-21','01-01-23'),
       ('Capcitacion','1','MN321','Capacitacion','08-10-21','30-12-21'),
       ('Premium','13','IO87U','Primium','22-05-21','09-12-21')

INSERT INTO Estudio(nombre)
VALUES ('Polo'),
       ('Azul'),
       ('BBB'),
       ('MKL'),
       ('Joses'),
	   ('N.A'),
       ('2CLA'),
       ('Circo'),
       ('XLA'),
       ('UML')

INSERT INTO EmpresaPatrocina(nombre)
VALUES ('Soriana'),
       ('Fud'),
       ('Mabe'),
       ('Famsa'),
       ('Coppel'),
	   ('Cemex'),
       ('Femsa'),
       ('Telmex'),
       ('Pemex'),
       ('CFE')


INSERT INTO Artista(nombre,apellidoPaterno,apellidoMaterno,NSS,CURP,RFC,fechaNacimiento,direccion,idPatrimonio,idEstadoCivil,idEstado,idNacionalidad,idDisquera,idMarca,idBanda,idContrato,idEstudio,idEmpresaPatrocina)
VALUES ('Luis Jose','Alvarez','Elizondo','45556222','LOOS1455SW66W','5YYT5TLL','11-02-92','Valle Soleado (FOMERREY-107), 67130 Guadalupe, N.L.',2,2,4,8,1,3,2,4,6,8),
       ('Pepe Armando','Zapata','Garza','12355588','LPETE39HSN','29SJ13','12-07-90','Mexicali, Valle Alto, 87380 Heroica Matamoros, Tamps.',5,7,6,9,10,1,2,3,4,4),
       ('Josep Gilberto','Saucedo','Lopez','3698666','JOAP45A8Q5','4P5J22H2','01-09-89','C. Ramos Arizpe 229, Zona Centro, 25000 Saltillo, Coah.',5,6,7,2,1,5,6,8,9,8),
       ('Alberto Jesus','Gonzales','Vazquez','2250055','ALO42IWEBE5','ALO98I7Y','28-06-93','C. Cordillera del Caucaso 504, La Cuesta II, Cd Juárez, Chih.',5,3,2,6,7,4,3,3,1,2),
       ('Jorge Paulo','Sanchez','Cruz','2554481','JO4EOE7EESS','5D5RL5E','09-12-80','Cuba 667-599, Amp Lázaro Cárdenas, 35064 Gómez Palacio, Dgo.',1,2,2,7,7,9,8,7,6,9),
	   ('Manolo Gerardo','Acosta','Montero','00125566','MO4SLO4EE0','4M1DOLO5','03-12-79','P.º de Los Laureles 146, Prados Glorieta 3ra Secc, San Luis, S.L.P.',7,4,4,1,4,5,6,7,8,9),
       ('Alonso Uriel','Juarez','Mendez','9850144','AL58LO33E3','5LO122366','13-22-90','Jiquilpan 28, Janitzio, Venustiano Carranza, 15200 Ciudad de México, CDMX',7,4,6,6,7,9,9,10,1,2),
       ('Mario Edie','Bravo','Socorro','0302011','ME5DLOE0A','22EE50E3D','28-12-88','Dr. J. Navarro 164, Doctores, Cuauhtémoc, 06720 Ciudad de México, CDMX',3,3,10,5,3,2,2,5,8,9),
       ('Jose Luis','Lubo','Morillo','9650022','J5LOD20555','11SDCDSS','10-06-89','C. Enrique Flores Sarcia 225, Delegación Capultitlán, 50260 Toluca de Lerdo, Méx.',5,3,2,9,5,4,8,2,5,6),
       ('Luis Saul','Villar','Quintero','0226686','L477S852S','0D0D55EE','05-04-95','C. 5 Sur 505b, Centro histórico de Puebla, 72000 Puebla, Pue.',2,8,9,4,6,6,5,2,1,10)


INSERT INTO Album(nombre,numCanciones,genero,fechaCreacion)
VALUES ('Unidos','10','Norteño','10-05-95'),
       ('Separados','9','Corrido','11-08-96'),
       ('Juntos','12','Ranchera','10-12-91'),
       ('Amor','15','Mariachi','20-04-00'),
       ('Luz','13','Norteño','29-01-90'),
	   ('Bonito','12','Corrido','30-11-12'),
       ('Mar','10','Mariachi','26-10-92'),
       ('Cielo','9','Ranchera','07-02-89'),
       ('Cosas bellas','13','Mariachi','19-05-98'),
       ('Mudo','10','Norteño','18-08-01')

INSERT INTO AsistentePersonal(nombre,apellidoPaterno,apellidoMaterno,fechaNacimiento,idArtista)
VALUES ('Mateo Aldo','Rivero','Ortis','20-12-97',3),
       ('Santiago','Jose','Ortis','24-11-87',5),
       ('Sebastian Carlos','Amaya','Hernandez','22-02-00',4),
       ('Leonardo Maria','Rios','Salazar','28-12-01',2),
       ('Matias Brayan','Rivero','Jimenez','04-06-99',1),
	   ('Cesar Pedro','Diaz','Alvarado','20-12-95',8),
       ('Victor Ricardo','Salim','Castillo','15-09-00',7),
       ('Ulices Mariano','Solis','Luna','21-12-99',6),
       ('Arturo Gael','Aguirre','Aguilar','23-12-97',10),
       ('Mayco Miguel','Martinez','Estrada','11-06-98',9)

INSERT INTO Club(nombre,numIntegrantes,fechaCreacion)
VALUES ('Mejores','20','22-06-02'),
       ('Geniales','29','25-06-09'),
       ('Asombrosos','30','20-06-07'),
       ('Malvados','60','29-06-99'),
       ('Buenos','45','25-06-09'),
	   ('Limpios','30','15-06-06'),
       ('Admiradores','46','05-06-02'),
       ('MMM','40','05-12-00'),
       ('NWE','50','09-09-00'),
       ('SSS','60','07-06-10')

INSERT INTO Compositor(nombre,apellidoPaterno,apellidoMaterno,fechaNacimiento,NSS,CURP,RFC,direccion)
VALUES ('Luis Jose','Alvarez','Elizondo','45556222','LOOS1455SW66W','5YYT5TLL','11-02-92','Valle Soleado (FOMERREY-107), 67130 Guadalupe, N.L.'),
       ('Pepe Armando','Zapata','Garza','12355588','LPETE39HSN','29SJ13','12-07-90','Mexicali, Valle Alto, 87380 Heroica Matamoros, Tamps.'),
       ('Josep Gilberto','Saucedo','Lopez','3698666','JOAP45A8Q5','4P5J22H2','01-09-89','C. Ramos Arizpe 229, Zona Centro, 25000 Saltillo, Coah.'),
       ('Alberto Jesus','Gonzales','Vazquez','2250055','ALO42IWEBE5','ALO98I7Y','28-06-93','C. Cordillera del Caucaso 504, La Cuesta II, Cd Juárez, Chih.'),
       ('Jorge Paulo','Sanchez','Cruz','2554481','JO4EOE7EESS','5D5RL5E','09-12-80','Cuba 667-599, Amp Lázaro Cárdenas, 35064 Gómez Palacio, Dgo.'),
	   ('Manolo Gerardo','Acosta','Montero','00125566','MO4SLO4EE0','4M1DOLO5','03-12-79','P.º de Los Laureles 146, Prados Glorieta 3ra Secc, San Luis, S.L.P.'),
       ('Alonso Uriel','Juarez','Mendez','9850144','AL58LO33E3','5LO122366','13-22-90','Jiquilpan 28, Janitzio, Venustiano Carranza, 15200 Ciudad de México, CDMX'),
       ('Mario Edie','Bravo','Socorro','0302011','ME5DLOE0A','22EE50E3D','28-12-88','Dr. J. Navarro 164, Doctores, Cuauhtémoc, 06720 Ciudad de México, CDMX'),
       ('Jose Luis','Lubo','Morillo','9650022','J5LOD20555','11SDCDSS','10-06-89','C. Enrique Flores Sarcia 225, Delegación Capultitlán, 50260 Toluca de Lerdo, Méx.'),
       ('Luis Saul','Villar','Quintero','0226686','L477S852S','0D0D55EE','05-04-95','C. 5 Sur 505b, Centro histórico de Puebla, 72000 Puebla, Pue.')


INSERT INTO DerechosAutor(nombre,descripcion,codigo)
VALUES ('Restriccion','Propiedad','55S332C'),
       ('Restriccion','Propiedad','DKRU62D'),
       ('CRestriccion','Propiedad','837EHEE3'),
       ('Restriccion','Propiedad','ND72633J'),
       ('Restriccion','Propiedad','KDI38373'),
	   ('Restriccion','Propiedad','LSJE832J2'),
       ('Restriccion','Propiedad','JDU6522M'),
       ('Restriccion','Propiedad','937NRW33'),
       ('Restriccion','Propiedad','KRJ73N2J'),
       ('Restriccion','Propiedad','MSK38K3J3')

INSERT INTO Empleado(nombre,apellidoPaterno,apellidoMaterno,NSS,CURP,fechaNacimiento,idDisquera)
VALUES ('Saul Ismael','Campos','Briones','88533666','C49DRUR6665','31-05-95',6),
       ('Edwin Jose','Farias','Barba','2662644','5AEESSSS','25-08-90',2),
       ('Ana Laura','Flores','Gomez','55959592','48SSS222S2','08-10-96',1),
       ('Nayeli Maria','Franco','Rosas','9855333','S22S2S2S5','30-11-92',8),
       ('Angela Anahi','Fierros','Robles','151848','1W89RRFS','26-12-89',7),
	   ('Jouse Alonso','Escalante','Olivares','02321466','SD55S5S5S5','24-11-95',5),
       ('Martha karina','Loma','Esquivel','33222','S0S2S22S2','24-03-93',6),
       ('Daniel Eber','Carrilo','Muñiz','093254','S22X00DDD','24-02-98',10),
       ('Toño Jesus','Casillas','Muñoz','78855599','S002S5S5566','30-01-87',8),
       ('Chema Maria','Calderon','Torres','00505055','S885W5W55W','29-09-30',2)

INSERT INTO EquipoComputo(nombre,marca,precio,idEstudio)
VALUES ('Minitor','Hp',7000,1),
       ('Raton','Lenovo',1000,3),
       ('Fuente','HCL',5000,10),
       ('CPU','Dell',9000,7),
       ('RAMM','Acer',900,9),
	   ('Procesador','Intel',15000,5),
       ('Placa','FLA',6000,1),
       ('Cabledo','xx',500,8),
       ('Teclado','Acer',600,9),
       ('Bocina','Steren',1000,10)

INSERT INTO EquipoSonido(nombre,idEstudio)
VALUES ('Bocinas',5),
       ('Amplificadores',6),
       ('Microfonos',1),
       ('Sistema de Audio',2),
       ('Mezcladores',3),
	   ('Cableado',1),
       ('Cargadores',6),
       ('Bajos',8),
       ('Ecualizador',9),
       ('Afinador',10)

INSERT INTO Estadio(nombre,ubicacion,numCapacidad)
VALUES ('Azteca','Calz. de Tlalpan 3465, Sta. Úrsula Coapa, Coyoacán, 04650 Ciudad de México, CDMX','87,523'),
       ('BBVA','Av. Pablo Livas 2011, La Pastora, 67140 Guadalupe, N.L.','51,000'),
       ('Jalisco','C. Siete Colinas 1772, Independencia, 44290 Guadalajara, Jal.','55,110'),
       ('Olimpico Universitario','Av. Heroico Colegio Militar 51, Chamizal, Cd Juárez, Chih.','19,703'),
       ('Chivas','C. Cto. JVC 2800, El Bajío, 45019 Zapopan, Jal.','46,355'),
	   ('Cuauhtémoc','Calz. Ignacio Zaragoza 666, Parque Industrial Puebla 2000, 72220 Puebla, Pue.','51,726'),
       ('Akron','34080, Av. 20 de Noviembre 1603A, Nueva Vizcaya, 34080 Durango, Dgo.','60,222'),
       ('Azul','León Tolstoi 2541-2510, Justo Sierra, 21380 Mexicali, B.C.','30,500'),
       ('Cielo','Infonavitlomas del Porvenir, 22535 Tijuana, B.C.',',50,400'),
       ('Dokon','Río Pánuco 1322, Las Fuentes Secc Lomas, 88703 Reynosa, Tamps.','40,100')

INSERT INTO Estudios(nombre)
VALUES ('Kinder'),
       ('Primaria'),
       ('Secundaria'),
       ('Preparatoria'),
       ('Universidad'),
       ('Maestria'),
	   ('Doctorardo'),
       ('Posgrado'),
       ('Posdoctorado'),
       ('Cientifico')

INSERT INTO GeneroMusical(nombre)
VALUES ('Rock'),
       ('Rap'),
       ('Pop'),
       ('Cumbia'),
       ('Corridos'),
	   ('Ranchera'),
       ('Bachata'),
       ('Hip Hop'),
       ('Regional Mexicano'),
       ('Grupero')

INSERT INTO Gira(nombre,descripcion,fechaInicio,fechaTermina,lugar)
VALUES ('Noreste','Gira por el estado de Mexico','12-03-22','12-05-22','Toluca'),
       ('Sureña','Gira por el estado de Nueva Leon','15-04-22','15-06-22','Monterrey'),
       ('Costeña','Gira por el estado de Guadalajara','25-05-22','29-06-22','Jalisco'),
       ('Costa','Gira por el estado de Saltillo','08-07-22','08-08-22','Saltillo'),
       ('Panamericana','Gira por el estado Guerrero','20-09-22','20-10-22','Acapulco'),
	   ('Latina','Gira por el estado de Yucatan','20-11-22','01-12-22','Merida'),
       ('Regional','Gira por el estado de Baja California','25-01-23','12-02-23','Tijuana'),
       ('Hispana','Gira por el estado de Sinaloa','20-02-23','10-03-23','Culiacan'),
       ('Grupera','Gira por el estado de Veracruz','20-04-23','28-05-23','Xalapa'),
       ('Nacional','Gira por el estado de Nayarit','20-06-23','12-07-23','Tepic')

INSERT INTO Evento(nombre,lugar,fecha,hora,idGira)
VALUES ('&YA','Monterrey','18-04-22','2:00 pm',2),
       ('PS','Jalisco','29-05-22','3:30 pm',3),
       ('MMM','Toluca','15-03-22','6:00 pm',1),
       ('NNNS','Acapulco','25-09-22','7:00 pm',5),
       ('M.A','Tijuana','28-01-23','6:30 pm',7),
	   ('W.Q','Xalapa','26-04-23','9:00 pm',9),
       ('O.P','Tepic','29-06-23','8:00 pm',10),
       ('N.A','Culiacan','22-04-23','9:00 pm',8),
       ('M.A','Merida','22-11-22','10:00 pm',6),
       ('V.T','Saltillo','10-07-22','7:00 pm',4)

INSERT INTO Idioma(nombre)
VALUES ('Español'),
       ('Ingles'),
       ('Portugues'),
       ('Aleman'),
       ('Ruso'),
	   ('Italiano'),
       ('Chino'),
       ('Coreano'),
       ('Arabe'),
       ('Japones')

INSERT INTO Instrumento(nombre,idEstudio)
VALUES ('Guitarra',5),
       ('Bateria',6),
       ('Bajo',8),
       ('Violin',1),
       ('Tambor',3),
	   ('Piano',7),
       ('Trompeta',4),
       ('Acordeon',9),
       ('Flauta',5),
       ('Clarinete',1)

INSERT INTO Interprete(nombre,apellidoPaterno,apellidoMaterno,fechaNacimiento)
VALUES ('Luis Alvarez','Garza','Borro','15-06-98'),
       ('Kevin Alonso','Garza','Borro','15-07-99'),
       ('Fabian','Roberto','Borro','17-06-00'),
       ('Fernanda','Maria','Borro','14-06-98'),
       ('Luisa Edith','Nuñuz','Borro','25-06-95'),
	   ('Pedro Carlos ','Palma','Borro','25-06-97'),
       ('Arron Richy','Garza','Veliz','19-06-97'),
       ('Saida Selena','Vazquez','Borro','30-06-93'),
       ('Laura Beatriz','Garcia','Jimenez','30-06-98'),
       ('Jesus Adan','Lopez','Salas','31-06-98')

INSERT INTO MedioComunicacion(nombre)
VALUES ('Televicion'),
       ('Radio'),
       ('Telefono Movil'),
       ('Internet'),
       ('Cable'),
	   ('Telegrama'),
       ('Periodico'),
       ('Bocero'),
       ('Anuncio'),
       ('Linea')

INSERT INTO Mercancia(nombre)
VALUES ('Playera'),
       ('Figuras'),
       ('Mesas'),
       ('Tennis'),
       ('Platos'),
	   ('Aretes'),
       ('Portadas'),
       ('Estampas'),
       ('Mochilas'),
       ('Vasos')

INSERT INTO Moviliario(nombre,idDisquera)
VALUES ('Sillas',1),
       ('Mesas',3),
       ('Escritorios',4),
       ('Puertas',2),
       ('Sofas,',7),
	   ('Estanterias',8),
       ('Armarios',9),
       ('Sillones',6),
       ('Baules',10),
       ('Lamparas',5)

INSERT INTO Pelicula(nombre,genero,fecha)
VALUES ('Los Invensibles','Terror','16-02-2015'),
       ('Tu y Yo','Comedia','20-02-2013'),
       ('No Volvere','Suspenso','21-09-2018'),
       ('Por que','Comedia','28-08-2017'),
       ('Solo TU','Romance','14-07-2011'),
	   ('Volvere','Drama','09-03-2016'),
       ('Una mas','Terror','03-08-2019'),
       ('Regresare','Romance','05-07-2010'),
       ('Tan Solo','Drama','16-09-2016'),
       ('No Volviste','Romance','30-05-2020')

INSERT INTO PlataformaDigital(nombre)
VALUES ('You Tube'),
       ('Facebook'),
       ('Google'),
       ('Spotify'),
       ('spotify'),
	   ('Amazon Music'),
       ('Deezer'),
       ('Apple Music'),
       ('Itunes Music'),
       ('Shazam')

INSERT INTO Premio(nombre,descripcion)
VALUES ('Grammy','La Mejor Cancion'),
       ('Billboard','El mejor Album'),
       ('Juventud','El Mejor Artista'),
       ('MTV Video Music Awards','Mejor Compositor'),
       ('American Music Awards','Mejor Cantante'),
	   ('Lo Nuestro','Mejor Banda'),
       ('Grammy Latinos','Mejor Cancion'),
       ('Latin American Music Awards','Mejor Album'),
       ('World Music Awards','Mejor Artista'),
       ('iHeartRadio Music Awards','Mejor Banda')

INSERT INTO ProductorEjecutivo(nombre,apellidoPaterno,apellidoMaterno,fechaNacimiento,idDisquera)
VALUES ('Jesus Adan','Lopez','Salas','31-06-98',4),
       ('Laura Beatriz','Garcia','Jimenez','30-06-98',6),
       ('Saida Selena','Vazquez','Borro','30-06-93',2),
       ('Arron Richy','Garza','Veliz','19-06-97',7),
       ('Pedro Carlos ','Palma','Borro','25-06-97',10),
	   ('Luisa Edith','Nuñuz','Borro','25-06-95',1),
       ('Fernanda','Maria','Borro','14-06-98',8),
       ('Fabian','Roberto','Borro','17-06-00',9),
       ('Luis Alvarez','Garza','Borro','15-06-98',3),
       ('Kevin Alonso','Garza','Borro','15-07-99',5)

INSERT INTO ProductorMusical(nombre,apellidoPaterno,apellidoMaterno,fechaNacimiento,idDisquera)
VALUES ('Salomon Edu','Garza','Borro','15-04-98',1),
       ('Dario Jose','Garza','Borro','15-01-99',2),
       ('Roberto Damian','Roberto','Borro','17-11-00',8),
       ('Luis Aldo','Maria','Borro','14-02-98',5),
       ('Gabriel Owen','Nuñuz','Borro','25-07-95',3),
       ('Victor Hugo','Palma','Borro','25-09-97',6),
       ('Paco Alonso','Garza','Veliz','19-02-97',7),
       ('Emaneul Adian','Vazquez','Borro','30-02-93',8),
       ('Carlos Adrian','Garcia','Jimenez','30-03-98',1),
       ('Alan Mario','Lopez','Salas','31-09-98',3)

INSERT INTO Proveedor(nombre,apellidoPaterno,apellidoMaterno,fechaNacimiento,descripcion)
VALUES ('Santigo Rene','Garza','Borro','15-06-98','Proveedor de Instrumentos'),
       ('Osrcarin Federico','Garza','Borro','15-07-99','Proveedor de Instrumentos'),
       ('Ricardo Oscar','Roberto','Borro','17-06-00','Proveedor de Instrumentos'),
       ('Gerardo Salas','Maria','Borro','14-06-98','Proveedor de Instrumentos'),
       ('Gil Jose','Nuñuz','Borro','25-06-95','Proveedor de Instrumentos'),
       ('Edgar Aldo','Palma','Borro','25-06-97','Proveedor de Instrumentos'),
       ('Paulo Daniel','Garza','Veliz','19-06-97','Proveedor de Instrumentos'),
       ('Ernesto Saul','Vazquez','Borro','30-06-93','Proveedor de Instrumentos'),
       ('Orlando Alan','Garcia','Jimenez','30-06-98','Proveedor de Instrumentos'),
       ('Alex Ulises','Lopez','Salas','31-06-98','Proveedor de Instrumentos')

INSERT INTO Publicidad(tipo,descripcion)
VALUES ('A','EN Internet'),
       ('B','En Televicion'),
       ('C','En la Radio'),
       ('D','En el Periodico'),
       ('E','En You Tube'),
	   ('F','En facebook'),
       ('G','En Comerciales'),
       ('H','En Revistas'),
       ('I','En Anuncios'),
       ('J','En Bolantes')

INSERT INTO Regalia(descripcion)
VALUES ('C1'),
       ('C2'),
       ('C'),
       ('C4'),
       ('C5'),
	   ('C1'),
       ('C2'),
       ('C3'),
       ('C4'),
       ('C5')

INSERT INTO Representante(nombre,apellidoPaterno,apellidoMaterno,dirrecion,NSS,CURP,fechaNacimiento,idArtista)
VALUES ('Edwin Ismael','Campos','Briones','Calz. Francisco L. Montejano 2143, Residencias, 21280 Mexicali, B.C.','88533666','C49DRUR6665','31-05-95',6),
       ('Pedro Jose','Farias','Barba','Av. Miguel F. Martinez 1350-1302, Zona Centro, 22000 Tijuana, B.C.','2662644','5AEESSSS','25-08-90',2),
       ('Milton Laura','Flores','Gomez','C. Juventino Rosas 1116-1118, Bolívar, 84060 Nogales, Son.','55959592','48SSS222S2','08-10-96',1),
       ('Daniela Maria','Franco','Rosas','Gral. Ricardo Peña 9402, Oasis Revolución I, 32674 Cd Juárez, Chih.','9855333','S22S2S2S5','30-11-92',9),
       ('Anahi Brenda','Fierros','Robles','C. Bellavista 1198-1290, El Porvenir, 26279 Cd Acuña, Coah.','151848','1W89RRFS','26-12-89',3),
       ('Maria Luisa','Escalante','Olivares','Calle José María González 3814, Sector Centro, 88000 Nuevo Laredo, Tamps.','02321466','SD55S5S5S5','24-11-95',8),
       ('Martha karina','Loma','Esquivel','Querétaro 530_1, Rodríguez, 88630 Reynosa, Tamps.','33222','S0S2S22S2','24-03-93',7),
       ('Mario Eber','Carrilo','Muñiz','Alvaro Obregón 111, Centro, 64000 Monterrey, N.L.','093254','S22X00DDD','24-02-98',5),
       ('Victor Jesus','Casillas','Muñoz','Ignacio Allende 1866, Zona Centro, 87000 Cd Victoria, Tamps.','78855599','S002S5S5566','30-01-87',10),
       ('Alfredo Mariano','Calderon','Torres','Arteaga 290, Barrio de San Sebastian, 78349 San Luis, S.L.P.','00505055','S885W5W55W','29-09-30',4)

INSERT INTO TipoEmpleado(nombre,idEmpleado)
VALUES ('A',5),
       ('B',2),
       ('C',3),
       ('D',4),
       ('E',9),
	   ('F',10),
       ('G',7),
       ('H',1),
       ('I',4),
       ('J',9)

INSERT INTO TipoTransporte(nombre)
VALUES ('Terreno'),
       ('Aereo'),
       ('Acuatico'),
       ('Terreno'),
       ('Terreno'),
	   ('Acuatico'),
       ('Aereo'),
       ('Terreno'),
       ('Acuatico'),
       ('Aereo')

INSERT INTO Transporte(nombre)
VALUES ('Avion'),
       ('Auto'),
       ('Moto'),
       ('Barco'),
       ('Helicoptero'),
	   ('Jet'),
       ('Camion'),
       ('Lancha'),
       ('Trailer'),
       ('Tren')

INSERT INTO Vestuario(nombre)
VALUES ('Pantalon'),
       ('Camisa'),
       ('Playera'),
       ('Calceta'),
       ('Sueter'),
	   ('Chaqueta'),
       ('Camiseta'),
       ('Zapatos'),
       ('Botas'),
       ('Tenis')

INSERT INTO VideoClip(nombre,duracion,fechaCreacion)
VALUES ('Luz','3:30 min','15-06-2005'),
       ('Cielo','3:00 min','19-08-2012'),
       ('Imperdonable','4:00 min','16-02-2010'),
       ('Nada mas importa','5:45 min','04-12-2001'),
       ('Vagando','6:00 min','13-01-1999'),
	   ('Loco por ti','2:00 min','15-06-2000'),
       ('Perdido','3:50 min','03-09-2002'),
       ('Hasta luego','4:30 min','29-02-2010'),
       ('Prisionero','6:12 min','30-10-1998'),
       ('Lo que fui','7:00 min','28-07-2000')

INSERT INTO Entrevista(descripcion,fecha,lugar,hora,idEvento)
VALUES ('Entrevista al Artista','18-04-22','Monterrey','1:00 pm',2),
       ('Entrevista al Artista','29-05-22','Jalisco','3:30 pm',3),
       ('Entrevista al Artista','15-03-22','Toluca','10:00 am',1),
       ('Entrevista al Artista','25-09-22','Acapulco','12:30 am',5),
       ('Entrevista al Artista','28-01-23','Tijuana','8:00 pm',7),
	   ('Entrevista al Artista','26-04-23','Xalapa','6:00 pm',9),
       ('Entrevista al Artista','29-06-23','Tepic','7:00 pm',10),
       ('Entrevista al Artista','22-04-23','Culiacan','2:30 pm',8),
       ('Entrevista al Artista','22-11-22','Merida','6:30 pm',6),
       ('Entrevista al Artista','10-07-22','Saltillo','9:20 pm',4)

INSERT INTO Concierto(nombre,numero,descripcion,lugar,fecha,idGira,idEstadio)
VALUES ('DD','1','En el estado de Guadalajara','Jalisco','15-02-2021',5,8),
       ('Juis','2','En el estado de Nuevo Leon','Monterrey','25-02-2021',9,7),
       ('Latino','3','En el estado de Coahuila','Saltillo','22-03-2021',2,1),
       ('Moster','6','En el estado de Gurrero','Acapulco','28-03-2021',10,2),
       ('KK','5','En el estado de Baja California','Tijuana','01-04-2021',5,3),
	   ('Anahuac','7','En el estado de Mexico','CDMX','26-04-2021',7,6),
       ('Vivo','9','En el estado de Tamaulipas','Ciudad Victoria','21-05-2021',1,8),
       ('Vive','8','En el estado de Chihuahua','Ciudad Juarez','28-05-2021',4,6),
       ('MAA','10','En el estado de Sinaloa','Culiacan','20-06-2021',9,10),
       ('LLL','4','En el estado de Yucatan','Merida','27-06-2021',7,2)

INSERT INTO Cancion(nombre,genero,duracion,fechaCreacion,idVideoClip,idAlbum)
VALUES ('Luz','Regional','3:30 min','15-06-2005',1,1),
       ('Cielo','Grupero','3:00 min','19-08-2012',2,4),
       ('Imperdonable','Cumbia','4:00 min','16-02-2010',3,2),
       ('Nada mas importa','Cumbia','5:45 min','04-12-2001',4,3),
       ('Vagando','Grupero','6:00 min','13-01-1999',5,9),
	   ('Loco por ti','Cumbia','2:00 min','15-06-2000',6,1),
       ('Perdido','Cumbia','3:50 min','',7,1),
       ('Hasta luego','Regional','4:30 min','03-09-2002',8,9),
       ('Prisionero','Grupero','6:12 min','30-10-1998',9,7),
       ('Lo que fui','Cumbia','7:00 min','28-07-2000',10,1)
-----------------------------------------------------------------------------------------------------
INSERT INTO ArtistaVestuario(idArtista,idVestuario)
VALUES (2,5),
       (2,8),
       (3,7),
       (5,7),
       (4,1),
	   (9,10),
       (8,6),
       (2,6),
       (10,2),
       (6,8)

INSERT INTO PeliculaArtista(idPelicula,idArtista,fechaActuo)
VALUES (3,8,'01-02-2009'),
       (4,3,'12-07-2005'),
       (3,9,'14-10-2003'),
       (5,8,'03-09-2004'),
       (2,5,'09-01-2003'),
	   (1,1,'08-11-2010'),
       (8,4,'27-12-2011'),
       (1,4,'26-04-2014'),
       (10,2,'23-09-2013'),
       (10,8,'24-08-2015')

INSERT INTO EstudiosArtista(idEstudios,idArtista,fechaRealizo)
VALUES (5,5,'11-04-1984'),
       (7,8,'12-03-1981'),
       (8,7,'21-01-1994'),
       (5,7,'02-07-1985'),
       (9,1,'09-06-1989'),
	   (2,10,'11-07-1992'),
       (6,3,'28-12-1980'),
       (5,4,'24-11-1979'),
       (4,2,'15-09-1978'),
       (1,2,'30-07-1988')

INSERT INTO ArtistaIdioma(idArtista,idIdioma)
VALUES (3,5),
       (4,8),
       (6,5),
       (4,8),
       (3,1),
	   (3,10),
       (1,6),
       (7,2),
       (9,2),
       (2,8)

INSERT INTO ArtistaClub(idArtista,idClub,fechaCreacion)
VALUES (5,5,'15-01-1999'),
       (7,8,'11-03-1999'),
       (8,7,'30-07-2003'),
       (5,7,'08-07-2006'),
       (9,1,'19-11-2008'),
	   (2,10,'28-10-2004'),
       (6,3,'27-11-2011'),
       (5,4,'24-10-2010'),
       (4,2,'13-09-2000'),
       (1,2,'30-07-2014')

INSERT INTO ArtistaGira(idArtista,idGira)
VALUES (3,5),
       (4,3),
       (4,3),
       (4,8),
       (2,10),
	   (1,1),
       (1,4),
       (8,5),
       (9,3),
       (2,1)

INSERT INTO ArtistaProveedor(idArtista,idProveedor)
VALUES (9,5),
       (6,8),
       (7,5),
       (4,8),
       (6,1),
	   (2,10),
       (3,6),
       (4,2),
       (3,2),
       (1,8)

INSERT INTO ArtistaPublicidad(idArtista,idPublicidad)
VALUES (3,5),
       (4,3),
       (4,3),
       (4,8),
       (2,10),
	   (1,1),
       (1,4),
       (8,5),
       (9,3),
       (2,1)

INSERT INTO MercanciaArtista(idMercancia,idArtista)
VALUES (9,5),
       (6,8),
       (7,5),
       (4,8),
       (6,1),
	   (2,10),
       (3,6),
       (4,2),
       (3,2),
       (1,8)

INSERT INTO CompositorArtista(idCompositor,idArtista)
VALUES (3,5),
       (6,9),
       (2,1),
       (4,2),
       (6,1),
	   (5,10),
       (4,6),
       (4,2),
       (4,5),
       (1,8)

INSERT INTO RegaliaArtista(idRegalia,idArtista)
VALUES (3,4),
       (6,2),
       (2,1),
       (1,2),
       (6,1),
	   (5,10),
       (4,6),
       (1,2),
       (2,2),
       (1,7)

INSERT INTO TransporteArtista(idTransporte,idArtista)
VALUES (2,1),
       (6,2),
       (2,1),
       (1,2),
       (6,1),
	   (5,1),
       (4,6),
       (1,2),
       (2,1),
       (1,2)

INSERT INTO TransporteTipoTransporte(idTransporte,idTipoTransporte)
VALUES (2,1),
       (7,2),
       (2,1),
       (1,2),
       (7,5),
	   (3,4),
       (3,6),
       (1,2),
       (2,1),
       (1,2)

INSERT INTO DerechosAutorArtista(idDerechosAutor,idArtista)
VALUES (2,1),
       (9,2),
       (2,1),
       (9,2),
       (7,5),
	   (8,5),
       (5,3),
       (5,8),
       (4,1),
       (3,2)

INSERT INTO ArtistaPremio(idArtista,idPremio)
VALUES (2,3),
       (3,2),
       (4,1),
       (3,2),
       (8,10),
	   (2,5),
       (5,7),
       (3,5),
       (4,2),
       (3,1)

INSERT INTO CancionPremio(idCancion,idPremio)
VALUES (10,4),
       (3,2),
       (7,1),
       (3,2),
       (8,10),
	   (2,5),
       (5,9),
       (10,5),
       (4,2),
       (10,1)

INSERT INTO CancionArtista(idCancion,idArtista)
VALUES (10,10),
       (7,9),
       (7,1),
       (5,2),
       (4,10),
	   (2,5),
       (5,9),
       (1,5),
       (1,2),
       (4,3)

INSERT INTO GeneroMusicalArtista(idGeneroMusical,idArtista)
VALUES (2,10),
       (3,9),
       (5,1),
       (3,10),
       (7,10),
	   (8,5),
       (9,9),
       (2,10),
       (1,2),
       (4,10)

INSERT INTO AlbumArtista(idAlbum,idArtista)
VALUES (6,1),
       (7,9),
       (2,1),
       (6,10),
       (9,10),
	   (10,5),
       (1,9),
       (9,10),
       (2,2),
       (3,3)

INSERT INTO PlataformaDigitalCancion(idPlataformaDigital,idCancion)
VALUES (4,2),
       (7,9),
       (6,3),
       (5,1),
       (4,10),
	   (10,5),
       (1,9),
       (9,10),
       (2,2),
       (10,2)

INSERT INTO MedioComunicacionCancion(idMedioComunicacion,idCancion)
VALUES (6,1),
       (7,9),
       (2,1),
       (6,10),
       (9,10),
	   (10,5),
       (1,9),
       (9,10),
       (2,2),
       (3,3)

INSERT INTO CancionInterprete(idCancion,idInterprete)
VALUES (2,1),
       (2,9),
       (6,1),
       (8,10),
       (6,10),
	   (1,5),
       (4,9),
       (3,10),
       (2,2),
       (3,2)

INSERT INTO TipoAsentamientoZona(idTipoAsentamiento,idZona)
VALUES (2,1),
       (2,9),
       (6,1),
       (1,10),
       (6,10),
	   (1,5),
       (4,9),
       (3,10),
       (7,2),
       (8,2)

----------------SELECIONAR LA INFORMACION DE LAS TABLAS PARA VERIFICAR QUE LOS DATOS EN LAS REGISTROS SEAN CORRECTOS-------------

--SELECT * FROM Artista
--SELECT * FROM AsistentePersonal
--SELECT * FROM Banda
--SELECT * FROM Cancion
--SELECT * FROM Compositor
--SELECT * FROM GeneroMusical
--SELECT * FROM Estudios
--SELECT * FROM Contrato
--SELECT * FROM Instrumento
--SELECT * FROM MedioComunicacion
--SELECT * FROM Nacionalidad
--SELECT * FROM PlataformaDigital

-----------------------------------------------ACTUALIZAR ALGUNOS DATOS---------------------------------------------------
--UPDATE Nacionalidad SET nombre = 'Cambio' WHERE idNacionalidad = 1
--UPDATE Album SET nombre = 'Cambio' WHERE idNacionalidad = 3
--UPDATE Club SET nombre = 'Cambio' WHERE idNacionalidad = 3
--UPDATE Banda SET nombre = 'Cambio' WHERE idNacionalidad = 3
--UPDATE Cancion SET nombre = 'Cambio' WHERE idNacionalidad = 3
--UPDATE Contrato SET nombre = 'Cambio' WHERE idNacionalidad = 3
--UPDATE Estudios SET nombre = 'Cambio' WHERE idNacionalidad = 3
--UPDATE Evento SET nombre = 'Cambio' WHERE idNacionalidad = 3
--UPDATE Estudio SET nombre = 'Cambio' WHERE idNacionalidad = 3


-----SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS EN LAS REGISTOS MODIFICADOS SEAN LOS CORRECTOS-----

--SELECT * FROM Nacionalidad
--SELECT * FROM Album
--SELECT * FROM Club
--SELECT * FROM Banda
--SELECT * FROM Cancion
--SELECT * FROM Contrato
--SELECT * FROM Estudios
--SELECT * FROM Evento
--SELECT * FROM Estudio


-------OTRA MANERA PARA CAMBIAR EL VALOR DEL CAMPO IDENTITY 
-------DBCC CHECKIDENT (Cuerpo, RESEED,0)

-----------------------------------------------BORRAR REGISTROS CUIDADO!!!!!!!!!!!!!!!!!!!!!-----------------------------------------
--DELETE FROM Nacionalidad WHERE idNacionalidad = 10
--DELETE FROM Interprete WHERE idInterprete=3
--DELETE FROM Instrumento WHERE idInstrumento=2
--DELETE FROM Mercancia WHERE idMercancia=5
--DELETE FROM Municipio WHERE idMunicipio=2
--DELETE FROM Moviliario WHERE idMoviliario=5
--DELETE FROM Patrimonio WHERE idPatrimonio=4
--DELETE FROM Nacionalidad WHERE idNacionalidad=3

------SELECCIONAR LA INFORMACION DE LAS TABLAS, PARA VERIFICAR QUE LOS DATOS BORRADOS EN LOS REGISTROS SEAN LOS CORRECTOS------
--SELECT * FROM Nacionalidad
--SELECT * FROM Interprete
--SELECT * FROM Instrumento
--SELECT * FROM Mercancia
--SELECT * FROM Municipio
--SELECT * FROM Moviliario
--SELECT * FROM Patrimonio
--SELECT * FROM Nacionalidad

--------------------------------------------------------------------------------------------------------------------------------------

--COUNT MAX MIN AVG
--select count(*)from Compañia

----------------------------------------------------Tipos de Vistas----------------------------------------------

--select idArtista, CONCAT(nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Artista
--GO
--Vista
--CREATE VIEW vwListasArtistas as
--select idArtista, concat (nombre,' ',apellidoPaterno,' ',apellidoMaterno) as 'Nombre Completo' from Artista where estatus = 1
--GO

-- select * from vwListasArtistas



--select t1.nombre,t2.nombre from Artista as t1 inner join Album as t2 on t1.idArtista = t2.idAlbum             

--select t1.nombre,t2.nombre from Cancion as t1 inner join Artista as t2 on t1.idCancion = t2.idArtista

--select t1.nombre,t2.nombre,apellidoPaterno,apellidoMaterno from Disquera as t1 inner join ProductorMusical as t2 on t1.idDisquera = t2.idProductorMusical

--select t1.nombre,t2.nombre from Banda as t1 inner join Disquera as t2 on t1.idBanda = t2.idDisquera

--select t1.nombre,t2.nombre from Gira as t1 inner join Concierto as t2 on t1.idGira = t2.idConcierto

--select t1.nombre,t2.nombre from Cancion as t1 inner join PlataformaDigital as t2 on t1.idCancion = t2.idPlataformaDigital

--select t1.nombre,apellidoPaterno,apellidoMaterno,t2.nombre from Artista as t1 inner join Nacionalidad as t2 on t1.idArtista = t2.idNacionalidad

--select t1.nombre,apellidoPaterno,apellidoMaterno,t2.nombre from Artista as t1 inner join EstadoCivil as t2 on t1.idArtista = t2.idEstadoCivil

--select t1.nombre,t2.nombre,marca from Estudio as t1 inner join EquipoComputo as t2 on t1.idEstudio = t2.idEquipoComputo

--select t1.nombre,apellidoPaterno,apellidoMaterno,t2.nombre from Marca as t1 inner join Artista as t2 on t1.idMarca = t2.idArtista

--select t1.nombre,t2.nombre from Artista as t1 inner join Patrimonio as t2 on t1.idArtista = t2.idPatrimonio


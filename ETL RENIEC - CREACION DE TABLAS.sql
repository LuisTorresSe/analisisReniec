CREATE TABLE BaseRegistro(
	ANIO_REGISTRO nvarchar(4),
	MES_REGISTRO nvarchar (9),
	TIPO_ACTA nvarchar (25),
	DE_GENERO nvarchar (15),
	DEPART_CIUDAD_ESTADO_DOM_SOL nvarchar(150),
	PROVINCIA_DOM_SOL nvarchar(40),
	CANT_COPIAS_EMITIDAS nvarchar(10)
);

---------

CREATE TABLE Dim_tipoActa(
 id_tipo nvarchar(10) NOT NULL PRIMARY KEY,
 acta nvarchar(30)
)

CREATE TABLE Dim_fecha(
	id_fecha nvarchar(30) NOT NULL PRIMARY KEY,
	anio nvarchar(10),
	mes nvarchar(30)
)

CREATE TABLE Dim_paises(
	id_pais INT not null PRIMARY KEY, 
	pais nvarchar(20)
)

CREATE TABLE Dim_zonas(
	id_zona INT NOT NULL PRIMARY KEY,
	id_pais INT NOT NULL, 
	zona nvarchar(50),
	FOREIGN KEY (id_pais) REFERENCES Dim_paises(id_pais)
)

CREATE TABLE Dim_Genero(
	id_genero nvarchar (2) NOT NULL PRIMARY KEY , 
	genero nvarchar(20)
)


CREATE TABLE Fact_copias_emitidas_reniec(
	id_emisiones INT NOT NULL PRIMARY KEY ,
	id_calendario nvarchar(30) NOT NULL,
	id_tipo_acta nvarchar(10) NOT NULL, 
	id_zona INT NOT NULL,
	id_sexo nvarchar(2) NOT NULL,
	cantidad INT,
	FOREIGN KEY (id_zona) REFERENCES Dim_zonas(id_zona),
	FOREIGN KEY (id_sexo) REFERENCES Dim_sexo(id_sexo),
	FOREIGN KEY (id_tipo_acta) REFERENCES Dim_tipoActa(id_tipo),
	FOREIGN KEY (id_calendario) REFERENCES Dim_calendario(id_calendario)
)



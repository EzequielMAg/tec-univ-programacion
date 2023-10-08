# -----------  Dos formas de crear una BD  -----------------
CREATE DATABASE `utn-com5`;	
CREATE SCHEMA utn;


# -----------  SELECCIONO UNA BD ---------------------------
USE `utn-com5`;
USE utn;
USE jugos;


# -----------  ELIMINANDO OBJETOS  -------------------------
DROP SCHEMA utn;
DROP DATABASE UTN;	# MySQL NO es CASE SENSITIVE 
DROP DATABASE `utn-com5`;

-- Elimino una columna
ALTER TABLE empleado DROP COLUMN  domicilio;

-- Elimino una tabla
DROP TABLE departamento;
DROP TABLE empleado;

-- Eliminando una foreign key
ALTER TABLE empleado 
DROP FOREIGN KEY fkDep;


# -----------  CREANDO TABLAS  -----------------------------
-- CREATE TABLE <nombreDeLaTabla>
CREATE TABLE empleado
(
	idEmpleado int auto_increment PRIMARY KEY,
	nombre varchar(50)
);

CREATE TABLE departamento
(
	idDepartamento int AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(50)
);
 

# -----------  MODIFICANDO UNA TABLA  ----------------------
-- Agregando una columna
ALTER TABLE empleado 
ADD COLUMN idDepartamento int;

ALTER TABLE empleado 
ADD COLUMN domicilio varchar(50);

-- Agregando una FK (foreing key)
ALTER TABLE empleado 
ADD CONSTRAINT fkDep FOREIGN KEY(idDepartamento) REFERENCES departamento(idDepartamento);

-- Igualmente se puede agregar una foreign key sin ponerle un nombre:
-- (CONSTRAINT <nombre> es opcional, pero igualmente el motor le va a poner un nombre default raro).
ALTER TABLE empleado 
ADD FOREIGN KEY(idDepartamento) REFERENCES departamento(idDepartamento);

-- Agregando un atributo unico (UQ, unique)
ALTER TABLE departamento 
ADD CONSTRAINT uqNombre UNIQUE(nombre);

-- Modificando un atributo a NOT NULL
ALTER TABLE empleado 
MODIFY COLUMN nombre varchar(50) NOT NULL;

ALTER TABLE empleado
MODIFY COLUMN domicilio varchar(50) NOT NULL;
 

# NOTA: puedo anidar varios ADD en el mismo ALTER, ejemplo: ----------------------------------------
ALTER TABLE empleado 
ADD CONSTRAINT fkDep FOREIGN KEY(idDepartamento) REFERENCES departamento(idDepartamento),
ADD CONSTRAINT uqNombre UNIQUE(nombre);


# NOTA: cuando creo una tabla, al final de todo, luego de terminar de definir todos los atributos, puedo
# 		escribir todas las restricciones
CREATE TABLE proveedor 
(
	idProveedor int  AUTO_INCREMENT PRIMARY KEY
	nombre varchar(50),
	tipoDocumento tinyint,
	numeroDocumento char(8),

	-- De esta forma agrupamos dos atributos para que la combinacion de ambos atributos, sea unica
	CONSTRAINT uqDocumento UNIQUE(tipoDocumento, numeroDocumento);
);


# ----------------------------------------------------------------------------------------------------------------

# POSIBLE EJERC DE PARCIAL:
-- Borrar la columna nombre y apellido, y crear la columna nombreApellido todo junto
DROP TABLE empleado ;
CREATE TABLE empleado
(
	idEmpleado int auto_increment PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	apellido varchar(50) NOT NULL,
	
	idDepartamento int REFERENCES departamento(idDepartamento)
);

-- RTA:
ALTER TABLE empleado 
ADD COLUMN nombreApellido varchar(100),
-- Si la tabla tiene datos, en esta linea irian la funcion de agarrar y copiar los datos concatenados y luego recien borrar
DROP COLUMN nombre,
DROP COLUMN apellido;

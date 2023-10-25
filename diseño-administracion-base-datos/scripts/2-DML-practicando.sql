
# El comando describe seguido del nombre de una tabla, nos permite ver la estructura completa de una tabla.
DESCRIBE empleado;

CREATE DATABASE test;
DROP DATABASE test;

CREATE SCHEMA `utn-repasando`;	# Cuando la BD en su nombre, tiene un '-', hay que usar `` (comillas invertidas).
USE `utn-repasando`;

CREATE TABLE Persona 
(
	idPersona INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20) NOT NULL ,
	apellido VARCHAR(20) NOT NULL,
	dni CHAR(8) UNIQUE ,
	fechaNacimiento DATE ,
	numeroTelefono VARCHAR(15),
	direccion VARCHAR(50)
);

RENAME TABLE persona TO Persona; #Tira error, por que NO es CASE SENSITIVE, entonces es lo mismo para MySQL

CREATE TABLE Profesor 
( 
	numeroLegajo INT PRIMARY KEY AUTO_INCREMENT,
	idPersona int,
	sueldo DECIMAL(10, 2)
);

/*
# Agrego FK
ALTER TABLE profesor 
ADD CONSTRAINT fk_profesor_persona 
FOREIGN KEY (idPersona) REFERENCES Persona(idPersona);


# Borro la FK
ALTER TABLE profesor 
DROP FOREIGN KEY fk_profesor_persona;*/

# Creo de nuevo la FK, pero con otro nombre...
ALTER TABLE Profesor 
ADD CONSTRAINT fk_idPersona_Persona 
FOREIGN KEY (idPersona) REFERENCES Persona(idPersona);


CREATE TABLE Alumno
(
	numeroLegajo INT PRIMARY KEY AUTO_INCREMENT,
	idPersona INT
);

/*
ALTER TABLE Alumno 
ADD CONSTRAINT fk_idPersona_Persona2
FOREIGN KEY (idPersona) REFERENCES Persona(idPersona);

ALTER TABLE alumno 
DROP FOREIGN KEY fk_idPersona_Persona2;*/

ALTER TABLE Alumno 
ADD CONSTRAINT fk_idPersona_Person
FOREIGN KEY (idPersona) REFERENCES Persona(idPersona);


CREATE TABLE Modulo 
(
	codigo int PRIMARY KEY AUTO_INCREMENT,
	idNombreModulo varchar(30), -- Aca tenia que ser un int, pero lo corrijo despues con una query
	idDelegado int,
	idProfesor int
);

CREATE TABLE NombreModulo 
(
	idNombreModulo int AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(30)
);

# Me equivoque en uno de los atributos de la tabla Modulo -> lo edito
ALTER TABLE Modulo 
MODIFY COLUMN idNombreModulo int;	 -- Verificar si es NOT NULL por DEFAULT al agregar le FK, supongo que NO


ALTER TABLE Modulo
ADD CONSTRAINT fk_idNombreModulo FOREIGN KEY (idNombreModulo) REFERENCES NombreModulo(idNombreModulo),
ADD CONSTRAINT fk_idDelegado FOREIGN KEY (idDelegado) REFERENCES Alumno(numeroLegajo),
ADD CONSTRAINT fk_idProfesor FOREIGN KEY (idProfesor) REFERENCES Profesor(numeroLegajo);


# Me di cuenta que al atributo "nombre" de la tabla "NombreModulo" no le puse las restricciones NOT NULL y UNIQUE
ALTER TABLE NombreModulo  
MODIFY COLUMN nombre varchar(30) UNIQUE NOT NULL;

CREATE TABLE modulo_alumno
( 
	id int AUTO_INCREMENT PRIMARY KEY,
	idAlumno int,
	idModulo int,
	
	CONSTRAINT uqModuloAlumno UNIQUE(idAlumno, idModulo)
);

ALTER TABLE modulo_alumno 
ADD CONSTRAINT fk_idAlumno FOREIGN KEY (idAlumno) REFERENCES Alumno(numeroLegajo), 
ADD CONSTRAINT fk_idModulo FOREIGN KEY (idModulo) REFERENCES Modulo(codigo);


# ---------  practicando mas......
ALTER TABLE Persona  
ADD COLUMN edad int;

ALTER TABLE Persona 
DROP COLUMN edad;













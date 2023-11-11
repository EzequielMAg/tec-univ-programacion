/*  
 * 
 *	REPASO GENERAL
 * 
 */

## --------------------------------------
CREATE DATABASE test;
DROP DATABASE test;

CREATE SCHEMA test;
USE test;

CREATE DATABASE utncom5;
CREATE DATABASE utn-com5;	# NO DEJA CREAR esta BD, por el signo -
CREATE DATABASE `utn-com5`; # Entonces debo hacerlo de esta forma... con las comillas simples invertidas..
DROP DATABASE `utn-com5`;
DROP DATABASE utncom5;
## --------------------------------------
CREATE TABLE empleado
(
	id int PRIMARY KEY AUTO_INCREMENT, 
	nombre varchar(50)
);

CREATE TABLE departamento
(
	id int PRIMARY KEY AUTO_INCREMENT,
	nombre varchar(50)
);

DROP TABLE departamento;
DROP TABLE empleado;

# ------------------  ACA EMPECE A VER EL EJERCICIO DE MI PARCIAL que tenia dudas ------------------ 
CREATE TABLE provincias
(
	id_provincia int AUTO_INCREMENT,
	provincia varchar(50),
	CONSTRAINT pk_provincia PRIMARY KEY (id_provincia)
);

DROP TABLE provincia;
DROP TABLE provincia2; 

# Definir la constraint PK aca de una sola vez, es lo mismo que la anterior, definirla despues al final.. 
-- Creo que es una buena practica, algunos acostumbran primero definir todas las variables, 
-- y al final definir todas las constraints (PK, FK, UQ)
CREATE TABLE provincia2
(
	id_provincia int AUTO_INCREMENT PRIMARY KEY,
	provincia varchar(50)
);

CREATE TABLE ciudades (id_ciudad int AUTO_INCREMENT,
					   ciudad varchar(50),
					   id_provincia int,
					   CONSTRAINT pk_ciudad	PRIMARY KEY (id_ciudad),
					   CONSTRAINT fk_ciudades_provincias FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia));

CREATE TABLE mesas (id_mesa int auto_increment,
					mesa varchar(5),
					id_ciudad int,
					CONSTRAINT pk_mesa PRIMARY KEY (id_mesa),
					CONSTRAINT fk_mesas_ciudades FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad));

CREATE TABLE partidos (id_partido int AUTO_INCREMENT,
					   partido varchar(50) NOT NULL,
					   CONSTRAINT pk_partido PRIMARY KEY (id_partido));
				
CREATE TABLE votos (id_mesa int, 
					id_partido int,
					votos int,
				CONSTRAINT chk_votos CHECK (votos >= 0 AND votos <= 2000), 
					CONSTRAINT pk_votos PRIMARY KEY (id_mesa, id_partido),
					CONSTRAINT fk_votos_partidos FOREIGN KEY (id_partido) REFERENCES partidos(id_partido) ON DELETE CASCADE,
					CONSTRAINT fk_votos_mesas FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa) ON DELETE CASCADE);				

-- CARGANDO DATOS...............................
-- PARTIDOS....................				
INSERT INTO partidos 
(partido) VALUES 
("UTN"),
("CAUCES"),
("FRANJA MORADA"),
("MOVIMIENTO EVITA");

SELECT * FROM partidos;

-- PROVINCIAS....................				
INSERT INTO provincias 
(provincia) VALUES 
("Buenos Aires"),
("Cordoba"),
("Santa Fe"),
("Misiones"),
("Salta"),
("Jujuy");

SELECT * FROM provincias;

-- CIUDADES....................				
INSERT INTO ciudades 
(ciudad, id_provincia) VALUES
("Pinamar", 1),
("Mar del Plata", 1),
("Villa Maria", 2),
("Villa Carlos Paz", 2),
("Santa Fe de la Vera Cruz", 3),
("Rosario", 3);

SELECT * FROM ciudades;

SELECT * FROM ciudades c 
INNER JOIN provincias p 
ON c.id_provincia = p.id_provincia;

-- MESAS....................				
INSERT INTO mesas 
(mesa, id_ciudad) VALUES
("esb2", 1),
("escu1", 1),
("fiunp", 2),
("utn", 2),
("uncvm", 3);

-- aca quiero ver todas las mesas
SELECT * FROM mesas;

-- aca lo mismo, pero tambien quiero ver a q ciudad pertenecen
SELECT * FROM mesas m
INNER JOIN ciudades c 
ON m.id_ciudad = c.id_ciudad;

-- Aca esta bueno, descomentando y probando una a una, puedo mejorar la impresion de la informacion
#SELECT * FROM mesas m
SELECT m.id_mesa, m.mesa, m.id_ciudad, c.ciudad, c.id_provincia, p.provincia FROM mesas m
#SELECT m.id_mesa, m.mesa, c.ciudad, p.provincia FROM mesas m
INNER JOIN ciudades c
ON m.id_ciudad = c.id_ciudad 
INNER JOIN provincias p 
ON c.id_provincia = p.id_provincia;

-- VOTOS....................	
INSERT INTO votos  
(id_mesa, id_partido, votos) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5);

SELECT * FROM votos;

-- Prueba de la PK 
INSERT INTO votos 
(id_mesa, id_partido, votos) VALUES 
(1, 1, 2);	-- FUNCIONO! NO deja ingresar otro registro con votos, para la misma mesa y partido

SELECT * FROM votos v
INNER JOIN mesas m 
ON v.id_mesa = m.id_mesa;

-- yo intentandolo:
SELECT * 
FROM votos v
INNER JOIN mesas m 
ON v.id_mesa = m.id_mesa
INNER JOIN partidos p 
ON v.id_partido = p.id_partido
WHERE p.partido = 'UTN';

-- d) ESTA ES LA OPCION QUE MARQUE, que esta OK
SELECT v.votos, m.mesa 
FROM votos AS v
INNER JOIN mesas AS m 
ON v.id_mesa = m.id_mesa
INNER JOIN partidos AS p 
ON v.id_partido = p.id_partido
WHERE p.partido = 'UTN';

-- b) ESTA ES LA OPCION QUE NO MARQUE, dice que tambien esta OK -> y SI, realmente esta OK... F
SELECT v.votos AS 'cantidad de votos del partido', m.mesa 
FROM partidos AS p
INNER JOIN votos AS v 
ON p.id_partido = v.id_partido 
INNER JOIN mesas AS m
ON m.id_mesa = v.id_mesa 
WHERE p.partido = 'UTN';

-- a) Esta opcion, es incorrecta porque le falta agregarle un ALIAS a la tabla "partidos" e igualmente en 
-- algunas partes no accede al atributo a traves del alias definido. 
-- (PD: no la marque, solo marque la d) )Comprobandolo:
SELECT v.votos AS 'cantidad de votos del partido', m.mesa 
FROM partidos 					# <- ACA falto declarar el alias: "AS p"
INNER JOIN votos AS v 	
ON id_partido = v.id_partido 	# <- ACA falto acceder a traves del alias: "p.". Igualmente NO se declaro :v
INNER JOIN mesas AS m 
ON id_mesa = m.id_mesa 			# <- ACA lo mismo, falto acceder a traves del alias: "v.""
WHERE p.partido = 'UTN';		# <- ACA esta perfecto, pero ese alias p NO fue definido..

-- Aca corrijo el anterior como tendria que ser para que tambien sea una respuesta valida.
-- Luego me di cuenta que asi, correjido, es exactamente igual que la opcion que no marque, que tambien era correcta: b)
SELECT v.votos AS 'cantidad de votos del partido', m.mesa 
FROM partidos AS p
INNER JOIN votos AS v 	
ON p.id_partido = v.id_partido 
INNER JOIN mesas AS m 
ON v.id_mesa = m.id_mesa 
WHERE p.partido = 'UTN';	






USE utn;

# Agregando algunos atributos a la tabla 
ALTER TABLE Empleado 
ADD COLUMN sueldo decimal(10, 2); 

ALTER TABLE Empleado
ADD COLUMN activo bit;


# Agregando FK idDepartamento a la tabla Empleado
ALTER TABLE Empleado
ADD CONSTRAINT fk_idDepartamento FOREIGN KEY(idDepartamento) REFERENCES Departamento(idDepartamento);

# Modificando uno de los atributos de la tabla Empleado. Se me ocurrio que por dafault sea inicializado en 1
ALTER TABLE Empleado 
MODIFY COLUMN activo bit DEFAULT 1;	-- Al hacer esto, ya tenia un registro cargado. Pero NO se actualizo su atributo "activo"
									-- Por lo que hay si tuviera muchos registros, deberia recorrer todos los registros
									-- para asignarle tal valor a cada uno con la siguiente query;
UPDATE Empleado
SET activo = 1		-- Por DEFAULT, todos estan activos.
WHERE activo IS NULL; 


/*
 * 
 * 
 *	A PARTIR DE AQUI EMPIEZO A REPLICAR LA CLASE n° 5... 
 *
 *
 */

# ----------------------------  Ingresando un registro a la BD  ----------------------------
INSERT INTO empleado
(nombre, apellido, sueldo, activo) VALUES	-- estos atributos se corresponden con los de la tabla, obvio y el orden NO importa
('Adrian', 'Mamani', 10000, 0); 			-- es decir, no hace falta que sea el mismo orden de la tabla. Si lo pongo de otra 
											-- forma, igual MySQL busca el atributo y le asigna el valor pasado en el argumento.

# Comprobando lo comentado anteriormente. Notar, que antes no se usaban todos los atributos de la tabla y se puede tranquilamente.
INSERT INTO Empleado 
(apellido, sueldo, activo, nombre) VALUES
('Aguilar', 100000, 1, "Ilda");		-- Es lo mismo usar comillas simples o dobles.


# Puedo ingresar varios registros al mismo tiempo
INSERT INTO Empleado 
(nombre, apellido) VALUES
('Daniela', "Mamani"),
('Juan', 'Perez'),
('Pepe', 'Cruz');	


 # No hace falta poner la lista de parentesis con los nombres de los atributos, pero en su lugar debo poner si o si todos los 
 # valores de los atributos
INSERT INTO Empleado VALUES
(6, 'Daniela', "Jum", 1, 100, 0),
(7, 'Juan', 'Llanos', 2, 200, 0),
(8, 'Pepe', 'Ruiz', 3, 300, 0);	


#Esto lo agregue yo...
INSERT INTO Departamento  
(nombre) VALUES
('Sistemas'),
('Marketing'),
('Ventas'),
('Soporte');	


# ----------------------------  MOSTRAR REGISTROS  ----------------------------
# Traer registros de las tablas y mostrarlos
-- Debo poner los atributos que quiero ver y NO tiene porq ser todos los atrib.
SELECT  idEmpleado, nombre, apellido FROM Empleado;	

-- Con el * (asterisco) traigo y muestros TODOS los atributos de la tabla
SELECT * FROM Empleado;

 
# ----------------------------  MOSTRAR REGISTROS FILTRANDO SEGUN UN ATIRBUTO  ----------------------------
-- Buscamos por el ID un empleado espefico
SELECT * FROM Empleado WHERE idEmpleado = 1;

SELECT * FROM Empleado WHERE idEmpleado = 3;

-- concat -> por default el nombre de la columna queda con la funcion + sus parametros
SELECT concat(apellido, " ", nombre), sueldo 
FROM empleado 
WHERE idEmpleado = 1;

-- concat, formateando la cabecera, el nombre de la columna (con AS)
SELECT concat(nombre, " ", apellido) AS nombreApellido, sueldo 
FROM empleado 
WHERE idEmpleado = 1;

SELECT concat(nombre, " ", apellido) AS "Nombre y Apellido", sueldo 
FROM empleado 
WHERE idEmpleado = 1;

-- Se puede concatenar varios argumento dentro de concat
SELECT concat(nombre, " ", apellido, " ", sueldo) AS "Nombre y Apellido", sueldo 
FROM empleado 
WHERE idEmpleado = 1;


# Aca tira error, que no encuentra la columna, por que la estamos buscando a traves del alias. ------------------
-- El where se ejecuta antes que todo lo demas.. Y no encuentra tal alias.
SELECT concat(nombre, " ", apellido) AS nombreApellido, sueldo 
FROM empleado 
WHERE nombreApellido = "Adrian Mateo";

-- Pense que capaz se guardaba el alias, pero no
SELECT * FROM empleado WHERE nombreApellido = "Adrian Mamani;"


-- Aca estamos buscando por las columnas, como antes.. Y no por el alias
SELECT concat(nombre, " ", apellido) AS nombreApellido, sueldo 
FROM empleado 
WHERE nombre = "Adrian" and apellido = "Mamani";


# Buscar por palabras o letras, ocurrencias etc.. OPERADOR 'like' -> busca por similitdu, no por exactitud como el =.  ------
-- Usamos el %, que es como un comodin, y dice que, lo que busque tiene que empezar por p, lo demas no importa
SELECT concat(nombre, " " , apellido) AS "Nombre y Apellido", sueldo 
FROM empleado 
WHERE apellido LIKE "p%";	

SELECT * FROM Empleado;

-- Los que tengan un apellido que empieza con 'm' o 'a'
SELECT concat(nombre, " " , apellido) AS "Nombre y Apellido", sueldo 
FROM empleado 
WHERE apellido LIKE "m%" OR apellido LIKE "a%";	

-- Los que en su apellido tengan una letra 'z'
SELECT concat(nombre, " " , apellido) AS "Nombre y Apellido", sueldo 
FROM empleado 
WHERE apellido LIKE "%z%";	

-- Los que en su apellido tengan una letra 'u'
SELECT concat(nombre, " " , apellido) AS "Nombre y Apellido", sueldo 
FROM empleado 
WHERE apellido LIKE "%u%";	

-- Los que en su apellido tengan como segunda letra una 'a', con el guion bajo indico que la pimera letra
-- puede ser cualquiera, y con el % lo mismo que antes, que todo el resto del atirbuto puede ser cualquier cosa
SELECT concat(nombre, " " , apellido) AS "Nombre y Apellido", sueldo 
FROM empleado 
WHERE apellido LIKE "_a%";	

-- Los que en su apellido tengan como tercer letra una 'a'
SELECT concat(nombre, " " , apellido) AS "Nombre y Apellido", sueldo 
FROM empleado 
WHERE apellido LIKE "__a%";

-- Los que en su apellido tengan como ultima letra una 'z'
SELECT concat(nombre, " " , apellido) AS "Nombre y Apellido", sueldo 
FROM empleado 
WHERE apellido LIKE "%z";

-- ...
INSERT INTO empleado 
(nombre, apellido) VALUES 
("Ana", "Frank");

# -------------------------------  ATRIBUTOS NULOS  -------------------------------  
-- Hacer lo siguiente, estaria mal.. No nos retorna ningun registro.. Porque ninguno es "igual" a null. Porque todos 
-- los atributos que tengan null, son distintos, osea, almacenan algo, que es una direccion de memoria, y porspuesto,
-- todos tenen una direccion de memoria distinta.
SELECT nombre, apellido, sueldo 
FROM empleado 
WHERE sueldo = null;

-- Buscando atributos nulos. Esta seria la forma correcta respecto a la anterior.
SELECT nombre, apellido, sueldo 
FROM empleado 
WHERE sueldo IS NULL;


-- Trabajando con los nulos. Concat no puede concatenar un atributo que tenga valor null,
-- y queda finalmente toda null, esa concatenacion
SELECT concat(nombre, " " , apellido) AS "Nombre y Apellido", 
concat(idDepartamento, " ", sueldo) AS "idDepartamento y Sueldo"
FROM empleado;

SELECT concat(nombre, " " , apellido, " ", sueldo) AS "Nombre y Apellido y sueldo", 
concat(idDepartamento, " ", sueldo) AS "idDepartamento y Sueldo"
FROM empleado;

-- Solucionado el tema de los atributos nulos. Por default puse que nombre y apellido no pueden ser nulos.
-- Asi que con esos atributos no voy a tener problemas.
SELECT concat(nombre, " " , apellido, " - ", ifnull(sueldo, "sueldo sin asignar")) AS "Nombre y Apellido y sueldo", 
concat(ifnull(idDepartamento, "Departamente sin asignar"), " - ", ifnull(sueldo, "$0")) AS "idDepartamento y Sueldo"
FROM empleado;

-- NOTA: todos los atributos que puedan aceptar nulos, y los uso en un concat, deberian usar la funcion ifnull() para
-- 		 que no ocurra algo inesperado como que si encuentra algun null, vuelva null toda la concatenacion.
-- 		 El segundo parametro del ifnull() es el valor que se reemplaza cuando encuentra el null, o lo que retorna.



# Trayendo para mostrar, registros con atributos distintos, segun los que se pasen..
SELECT DISTINCT idEmpleado, nombre, apellido
FROM empleado;	-- Trae todos por que todos tienene un ID distinto
	
SELECT DISTINCT nombre, apellido
FROM empleado;	-- Agregue varias "Ana Frank" a proposito al FINAL, y me trae solo 1

SELECT nombre, apellido
FROM empleado;	-- En cambio, recordar que de eswta forma me trae a todos los registros


# Otras operaciones con select
SELECT nombre, apellido, sueldo * 2	 -- multiplica el sueldo y muestra el resultado para todos los registros
FROM empleado;						 -- pero NO modifica la tabla original.

SELECT nombre, apellido, sueldo 
FROM empleado;


# Quiero ver todos los empleados que no tienen un sueldo asignado
SELECT nombre, apellido, sueldo
FROM empleado
WHERE sueldo IS NULL;

 


# ----------------------  MODIFICANDO REGISTROS DE LAS TABLAS  ----------------------
-- Modificando un atributo de un empleado
UPDATE Empleado 
SET  nombre = "Juana"
WHERE idEmpleado = 1;

UPDATE Empleado 
SET nombre = "Adrian"
WHERE idEmpleado = 1;


-- Modificando varios atributos al mismo tiempo de un empleado
UPDATE Empleado
SET nombre = "Adrian Mateo", apellido = "Mamani M.", sueldo = 15000
WHERE idEmpleado = 1;


-- Modificando un atributo de varios empleados
UPDATE empleado
SET sueldo = 0
WHERE sueldo IS NULL;


# Borrar registros  --------------------------------------------------
DELETE FROM Empleado;	-- Borrar todas las filas de la tabla Empleado

DELETE FROM Empleado
WHERE nombre = "Ana" AND apellido = "Frank";	-- Ingrese varios registros repetidos, y ahora los borre a todos con esta sentencia


-- Agregamndo/actualizando/modificando un atributo a un registro
UPDATE Empleado 
SET idDepartamento = 1
WHERE idEmpleado = 1;


-- Modificando un atributo a mas de un registro con el operador OR
UPDATE Empleado
SET idDepartamento = 2
WHERE idEmpleado = 2 OR idEmpleado = 3 OR idEmpleado = 4;


-- Modificando un atributo a mas de un registro con el operador IN, mas facil.
UPDATE Empleado 
SET idDepartamento = 4
WHERE idEmpleado IN (1,2,3,4);


-- Comprobando si me deja cargar un id de un departamento que no existe
INSERT INTO Empleado
(nombre, apellid o, idDepartamento) VALUES
("Juan", "Fernandez", 10);	-- Funciona correctamente, la FK me bloquea el ingreso de 
							-- un idDepartamento que NO este en la tabla departamento

-- Ingreso un idDepartamento que existe
INSERT INTO Empleado 
(nombre, apellido, idDepartamento) VALUES
("Juan", "Fernandez", 4);

-- "ELIMINO", o mas bien le asigno NULL a todos los atributos "idDepartamento" de los empleados que tenga el idDepartamento = 4
UPDATE Empleado 
SET idDepartamento = NULL 
WHERE idDepartamento = 4;


# --------------------  ORDENANDO LOS DATOS DEVUELTOS POR SELECT  ------------- 
SELECT * FROM empleado 
WHERE sueldo >= 0
ORDER BY nombre;	-- Me lo ordena segun este atributo y por DEFAULT es ASC -> ascendente

SELECT * FROM empleado 
WHERE sueldo >= 0
ORDER BY nombre DESC;

SELECT * FROM empleado 
WHERE sueldo >= 0
ORDER BY nombre ASC;	

-- Si el nombre se repite, ordena el apellido en forma ASC -> ascendente
SELECT * FROM empleado 
WHERE sueldo >= 0
ORDER BY nombre, apellido ASC;	-- Si le saco el ASC es lo mismo, porque es el valor por default	

SELECT * FROM empleado 
WHERE sueldo >= 0
ORDER BY nombre ASC, apellido DESC;	


# Tambien puedo poner un limite a la cant de registros que quiero ver, con LIMIT
SELECT * FROM empleado 
LIMIT 2;	-- Va desde el primero, al ultimo..









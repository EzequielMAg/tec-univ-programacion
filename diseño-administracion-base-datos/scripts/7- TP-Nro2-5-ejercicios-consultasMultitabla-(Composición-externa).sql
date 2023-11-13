/*
 * 
 * 	Consultas multitabla (Composición externa)
 * 
 */
USE `utn-guianro2-dml`;

##Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

# 1. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
# Este listado también debe incluir los empleados que no tienen ningún departamento asociado.
SELECT * FROM Empleado e
LEFT JOIN Departamento d 
ON e.codigo_departamento = d.codigo;

SELECT * FROM Departamento d 
RIGHT JOIN Empleado e 
ON e.codigo_departamento = d.codigo;


# 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
SELECT * FROM Empleado e
LEFT JOIN  Departamento d 
ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento IS NULL;

SELECT * FROM Departamento d
RIGHT JOIN  Empleado e 
ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento IS NULL;


# 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
SELECT *
#SELECT d.nombre 
FROM  Departamento d
LEFT JOIN Empleado e 
ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento  IS NULL;

SELECT * FROM Empleado e
RIGHT JOIN Departamento d 
ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento  IS NULL;


# 4. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
# El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no tienen
#  ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
SELECT * FROM Empleado e
LEFT JOIN Departamento d ON e.codigo_departamento = d.codigo
UNION 
SELECT * FROM Departamento d
LEFT JOIN Empleado e ON e.codigo_departamento = d.codigo;
# NOTA: ESTA SENTENCIA ESTA MAL, osea MUESTRA MAL LA INFORMACION, la correcta es la siguiente.

-- (usando RIGHT despues del UNION y alternando las tablas) :
SELECT * FROM Empleado e
LEFT JOIN Departamento d ON e.codigo_departamento = d.codigo
UNION 
SELECT * FROM Empleado e
RIGHT JOIN Departamento d ON e.codigo_departamento = d.codigo; 

-- Mejorando la impresion de la informacion:
-- Ademas vi que tambien pedia que lo ordenemos alf segun el nombre del depto.
/* OBSERVACIONES: 
 *   - Con esta consulta, recorde y reforce lo de que se tiene que respetar la cant de atributos tanto
 *     en el primer SELECT como en el segundo SELECT.
 *   - Y que debo establecer un alias para poder usarlo en el ORDER BY, ya que no me deja acceder a traves del alias.
 * */
SELECT e.codigo AS ID, e.nombre AS Nombre, 
	   concat(e.apellido1, " ", ifnull(e.apellido2, "")) AS Apellidos, -- NO hace falta usar el AS, pero es + legible
	   d.codigo, d.nombre AS `Nombre del departamento`
FROM Empleado e
LEFT JOIN Departamento d ON e.codigo_departamento = d.codigo
UNION 
SELECT e.codigo AS ID, e.nombre AS Nombre, 
       concat(e.apellido1, " ", ifnull(e.apellido2, "")) AS Apellidos,
	   d.codigo, d.nombre AS `Nombre del departamento`
FROM Departamento d
LEFT JOIN Empleado e ON e.codigo_departamento = d.codigo
ORDER BY `Nombre del departamento` ASC; -- Se que es ASC por DEFAULT, pero lo agrego = para mejorar la legibilidad.


# 5. Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no 
# tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
SELECT * FROM Empleado e
LEFT JOIN Departamento d 
ON e.codigo_departamento = d.codigo 
WHERE e.codigo_departamento IS NULL
UNION 
SELECT * FROM Empleado e
RIGHT JOIN Departamento d 
ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento IS NULL;

-- Ahora agrego lo del order by, y emprolijo como se muestran los datos:
-- Me parecio mejor hacer esto despues, y la anterior sentencia trabajarla asi de entrada
-- para resolverlo mas rapido, los detalles para despues
SELECT e.codigo AS ID, e.nombre AS Nombre, 
	   concat(e.apellido1, " ", ifnull(e.apellido2, "")) AS Apellidos, -- NO hace falta usar el AS, pero es + legible
	   d.codigo, d.nombre AS `Nombre del departamento` 
FROM Empleado e
LEFT JOIN Departamento d 
ON e.codigo_departamento = d.codigo 
WHERE e.codigo_departamento IS NULL
UNION 
SELECT e.codigo AS ID, e.nombre AS Nombre, 
	   concat(e.apellido1, " ", ifnull(e.apellido2, "")) AS Apellidos, -- NO hace falta usar el AS, pero es + legible
	   d.codigo, d.nombre AS `Nombre del departamento` 
FROM Empleado e
RIGHT JOIN Departamento d 
ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento IS NULL
ORDER BY `Nombre del departamento` ASC;

/* NOTA: Con este ultimo ejercicio aprendi que el WHERE se agrega en ambas consultas, osea
*		 que es independiente del UNION. Este operador solo une las consultas para que se ejecuten al mismo tiempo.
*		 Por lo que, si uso UNION, no significa que debo ahorrar un WHERE. 		
**/	

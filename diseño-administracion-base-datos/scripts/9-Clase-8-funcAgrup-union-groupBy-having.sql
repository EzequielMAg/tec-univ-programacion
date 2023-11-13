USE `utn-guiaNro2-DML`;

SELECT * FROM Empleado;
SELECT * FROM Departamento;

# ------------------------------  OPERADOR UNION  ------------------------------
-- A continuacion el mismo ejemplo, pero con algunas varianetes para explicar las caracteristicas del UNION.
-- Observar la cantidad de columnas, debe ser la misma cantidad en el 1° SELECT como en el 2°
SELECT e.codigo, e.nombre, d.nombre AS nomDep
FROM Empleado e 
LEFT JOIN Departamento d ON e.codigo_departamento = d.codigo 
UNION 
SELECT e.codigo, e.nombre, d.nombre
FROM Departamento d 
LEFT JOIN Empleado e ON e.codigo_departamento = d.codigo;

-- No hace falta que sea exactamente la misma columna, basta con que sea del mismo tipo de dato
SELECT e.codigo, e.nombre, d.nombre AS nomDep, 0
FROM Empleado e 
LEFT JOIN Departamento d ON e.codigo_departamento = d.codigo 
UNION 
SELECT e.codigo, e.nombre, d.nombre, d.gastos 
FROM Departamento d 
LEFT JOIN Empleado e ON e.codigo_departamento = d.codigo;

-- Si queremos usar ALIAS deben estar en el 1° SELECT, en el segundo no tendran efecto.
SELECT e.codigo, e.nombre, d.nombre AS nomDep, 0 AS gastos
FROM Empleado e 
LEFT JOIN Departamento d ON e.codigo_departamento = d.codigo 
UNION 
SELECT e.codigo AS hola, e.nombre, d.nombre, d.gastos 
FROM Departamento d 
LEFT JOIN Empleado e ON e.codigo_departamento = d.codigo;

-- El ORDER BY va al final de toda la consulta, si no no tendra efecto.
SELECT e.codigo, e.nombre, d.nombre AS nomDep, 0 AS gastos
FROM Empleado e 
LEFT JOIN Departamento d ON e.codigo_departamento = d.codigo 
UNION 
SELECT e.codigo AS hola, e.nombre, d.nombre, d.gastos 
FROM Departamento d 
LEFT JOIN Empleado e ON e.codigo_departamento = d.codigo
#ORDER BY 1;	  -- Segun el e.codigo. Osea que podemos usar numeros y referencias al nro de columna definido en el SELECT.
#ORDER BY 4;	  -- Segun la columna 4, osea con alias "gastos". 
#ORDER BY gastos; -- Tambien se puede usar el alias para ordenar.
#ORDER BY nomDep;
#ORDER BY d.nombre; -- Tira error porque NO reconoce la d. RARO, normalmente se hace asi, pero el problema es el UNION.
#ORDER BY Departamento.nombre; -- Tambien tira error.

# --------------------------------------------------------------------------------
SELECT * FROM Empleado;
SELECT * FROM Departamento;

# ------------------------------  FUNCION DE SUMAR  ------------------------------
-- Va a sumar todos los datos de la columna que se le pase por arguemnto.
-- Lo que hace el motor es recorrer todos los registros, agarrar el valor de la columna pasada, y las va sumando,
-- guardando el resultado, y al finalizar retorna ese valor, el cual es proyectado por el SELECT.
-- NO estamos mostrando filas, ESTAMOS MOSTRANDO UN VALOR.
SELECT SUM(gastos) AS SUMA_GASTOS
FROM Departamento;

-- Usando una condicion:
SELECT SUM(gastos) AS SUMA_GASTOS
FROM Departamento
WHERE gastos > 6000; -- Solo suma los gastos que cumplan esta condicion.

-- Que no puedo hacer?
SELECT nombre, SUM(gastos) AS SUMA_GASTOS
FROM Departamento;
-- Bue.. ME DEJO! Pero esta mal igual, no deberia poderse hacer. Sera porque estoy usando MariaDB en vez de MySQL?
-- En esta lapton con Debian... Aunque son muy paracidos ambos motores.
-- La profe dijo que esta consulta no se puede hacer porque: "Que nombre de departamento me va a mostrar? 
-- si lo que esta haciendo es recorrer todos los deptos para sumar los gastos, el nombre de cual depto me va a mostrar?"
-- Como que no tiene sentido traer el de alguno en especifico(? No le incunve a la FN en realidad.. Esta retorna un nro.


# ------------------------------  MAS FUNCIONES - MAX, MIN, AVG  ------------------------------
SELECT SUM(gastos) AS SUMA_GASTOS,
	   MAX(gastos) AS MAXIMO,	-- Recorre todas las filas y me retorna el valor MAYOR segun la columna pasada x arg.
	   MIN(gastos) AS MINIMO,	-- Idem del anterior, pero me retorna el valor mas menor :v
	   AVG(gastos) AS PROMEDIO  -- Esto nos retorna el promedio.. 
FROM Departamento;

-- NOTA: siempre que no le ponemos un alias nos devuelve para mostrar como titulo de la columna, la funcion completa.
-- PD: Como yo le puse un comentario justo a llado de la funcion, si yo no le pongo un alias, tambien me va a 
--	   traer el comentario anterior :v NQV, sera hasta la , (coma) de la instrruccion anterior supongo, lo q trae.

# ------------------------------  FORMATEANDO EL PROMEDIO  ------------------------------
-- sin formateo
SELECT AVG(gastos) AS PROMEDIO   
FROM Departamento;

-- con formateo (se casteo a un tipo decimal de 10 digitos con 2 decimales)
SELECT CAST(AVG(gastos) AS DECIMAL(10, 2)) AS PROMEDIO   
FROM Departamento;

-- Podemos ponerle la cant d decimales que queramos, eso segun el segundo parametro del decimal()
SELECT CAST(AVG(gastos) AS DECIMAL(10, 4)) AS PROMEDIO   
FROM Departamento;


-- NOTA: Tener cuidado con los valores nulos al hacer la funcion AVG, de promedio, porque no tiene en cuentra los nulos
--		 entonces estaria sacando mal el calculo, por que divide por un total de registros, que no seria el total real
--       ya que estaria ignorando a los nulos.
SELECT * FROM Departamento;

SELECT CAST(AVG(gastos) AS DECIMAL(10, 4)) AS PROMEDIO   
FROM Departamento;

-- Entonces como hago para que los cuente? A los nulos y se calcule bien el promedio, agrego la FN ifnull()
-- Que recordemos que, analiza si el primer arg pasado es null, y si lo es retorna el valor que le pasamos como 2 arg.
SELECT CAST(AVG(IFNULL(gastos, 0)) AS DECIMAL(10, 4)) AS PROMEDIO   
FROM Departamento;


SELECT * FROM Departamento;
# ------------------------------  FUNCION COUNT()  ------------------------------
-- count() cuenta filas (REGISTROS) segun el arg pasado. Si ponemos * contara todos los registros:
SELECT count(*) FROM Departamento;

-- Aca cuenta todas las filas donde haya un valor en gastos, si hay un valor null, no lo cuenta.
SELECT count(gastos) FROM Departamento;

-- Para ver los resultados juntos 
SELECT count(*), count(gastos) FROM Departamento;

-- Si yo quiero contar la cant de registros, para asegurme que los cuente a todos teniendo en cuenta los nulos,
-- debo hacerlo por la CLAVE PRIMARIA, ya que esta no admite nulos..
SELECT count(codigo) FROM Departamento;

-- Para contar los nulos:
SELECT count(codigo) FROM Departamento
WHERE gastos IS NULL;

-- Cuento la cantidad de empleados de un departamento especifico:
SELECT count(*) FROM Empleado e
WHERE e.codigo_departamento = 2;

-- Pero si yo quisiera ver la cantidad de empleados que hay en cada departamento? 
-- Tendria que hacer esta misma consulta anterior por cada departamento???
-- Para eso tengo que hacer sumas parciales, para eso esta el siguiente tema, que significa AGRUPAR POR
# ------------------------------  GROUP BY  ------------------------------
-- Aca nos dice cuantos empleados hay en cada departamento: 2 sin depto asignado (null), 3 en el depto 1, etc..
SELECT e.codigo_departamento, count(*) 
FROM Empleado e
GROUP BY e.codigo_departamento;

-- Si hay un WHERE seria en el siguiente orden: SELECT, FROM, WHERE y despues el GROUP BY

-- En esta consulta, se va a listar la cant de empleades por cada depto, menos los empleados sin depto
SELECT e.codigo_departamento, count(*)
FROM Empleado e 
WHERE e.codigo_departamento  IS NOT NULL 
GROUP BY e.codigo_departamento;


# ------------------------------  HAVING  ------------------------------
-- Con having filtro las filas resultantes del GROUP BY. 
-- ES PARA FILTRAR RESULTADOS.

-- Con esta consulta le decimos al motor que nos muestre unicamente aquellos deptos con mas de 2 empleados.
-- Estamos filtrando un resultado, el resultado del count()
SELECT e.codigo_departamento, count(*)
FROM Empleado e 
WHERE e.codigo_departamento  IS NOT NULL 
GROUP BY e.codigo_departamento
HAVING count(*) > 2;

-- Aca le agregamos un alias a la FN count(), para luego referirnos a tal columna con el alias
-- Pero esto no hace que se evite contar de nuevo
SELECT e.codigo_departamento, count(*) AS contar
FROM Empleado e 
WHERE e.codigo_departamento  IS NOT NULL 
GROUP BY e.codigo_departamento
HAVING contar > 2;

-- Seria una consulta a la anterior, pero estamos ignorando los empleados asignados al depto 1
SELECT e.codigo_departamento, count(*) AS contar
FROM Empleado e 
WHERE e.codigo_departamento <> 1	-- Seria lo mismo que poner !=
GROUP BY e.codigo_departamento 
HAVING contar > 2;

# DIFERENCIA ENTRE WHERE Y HAVING
/* Segun las consulta anteriores, con un count() y la condicion que excluye a los empleados asignados al depto 1,
 * el WHERE saca las filas antes de realizar el calculo y el HAVING filtra el resultado.
 * Justo un momento antes de que se ejecute el HAVING, ya se tiene todo contado, y luego el HAVING muestra unicamente
 * lo que nosotros le indicamos en su condicion */


-- Otra consulta con HAVING:
SELECT d.codigo, d.nombre, 
	   count(*) AS contar, 
	   sum(gastos) AS suma
FROM Empleado e 
LEFT JOIN Departamento d 
ON e.codigo_departamento = d.codigo 
WHERE e.codigo_departamento != 1
GROUP BY e.codigo_departamento 
HAVING suma > 3000;

# Tratando de entender la consulta anterior:
SELECT #*, 					-- Me muestra todos los datos, de la TABLA Empleado, anexandole la tabla Departamento.
       d.codigo, d.nombre, d.gastos,
	   count(*) AS contar, 	-- Suma la cantidad de registros, y va a ser cant de empleados segun depto, POR EL GROUP BY
	   sum(gastos) AS suma	/* SUMA la cantidad total de gastos, segun cada depto, y hace: gastos * cantEmpleados
	   						 * esto significaria entonces que el valor "gastos" de cada depto, es por cada empleado en el depto.*/
FROM Empleado e 
LEFT JOIN Departamento d 
ON e.codigo_departamento = d.codigo 
WHERE e.codigo_departamento != 1	-- quita del calculo a los empleados q tengan asignado el depto 1.
GROUP BY e.codigo_departamento -- Es por este GROUP BY que solo se agarra al primer empleado que pertenezca a un depto,
							   -- y ya no se tienen en cuenta a los demas empleados del mismo depto.
HAVING suma > 3000;			   -- Del resultado del GROUP BY, el HAVING filtra y solo muestra a aquellos cuya suma de gastos > 3000


SELECT d.codigo, d.nombre, 
	   count(*) AS contar, 
	   sum(gastos) AS suma
FROM Empleado e 
LEFT JOIN Departamento d 
ON e.codigo_departamento = d.codigo 
WHERE e.codigo_departamento != 1
GROUP BY d.nombre 
HAVING suma > 3000;










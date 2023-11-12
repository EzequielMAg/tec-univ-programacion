USE `utn-guiaNro2-DML`;

SELECT * FROM Empleado;
SELECT * FROM Departamento;

-- OPERADOR UNION
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

# ------------------------------------------------------------------------------------------
SELECT * FROM Empleado;
SELECT * FROM Departamento;

# FUNCION DE SUMAR. Va a sumar todos los datos de la columna que se le pase por arguemnto.
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

# Mas funciones
SELECT SUM(gastos) AS SUMA_GASTOS,
	   MAX(gastos) AS MAXIMO,	-- Recorre todas las filas y me retorna el valor MAYOR segun la columna pasada x arg.
	   MIN(gastos) AS MINIMO,	-- Idem del anterior, pero me retorna el valor mas menor :v
	   AVG(gastos) AS PROMEDIO  -- Esto nos retorna el promedio.. 
FROM Departamento;

-- NOTA: siempre que no le ponemos un alias nos devuelve para mostrar como titulo de la columna, la funcion completa.
-- PD: Como yo le puse un comentario justo a llado de la funcion, si yo no le pongo un alias, tambien me va a 
--	   traer el comentario anterior :v NQV, sera hasta la , (coma) de la instrruccion anterior supongo, lo q trae.

# FORMATEANDO EL PROMEDIO 
-- sin formateo
SELECT AVG(gastos) AS PROMEDIO   
FROM Departamento;

-- con formateo (se casteo a un tipo decimal de 10 digitos con 2 decimales)
SELECT CAST(AVG(gastos) AS DECIMAL(10, 2)) AS PROMEDIO   
FROM Departamento;

-- Podemos ponerle la cant d decimales que queramos, eso segun el segundo parametro del decimal()
SELECT CAST(AVG(gastos) AS DECIMAL(10, 4)) AS PROMEDIO   
FROM Departamento;





SELECT e.codigo_departamento, count(*)
FROM empleado e 
WHERE e.codigo_departamento  IS NOT NULL 
GROUP BY e.codigo_departamento;

-- Con having filtro las filas reswultantes del GROUP BY(?)
SELECT e.codigo_departamento, count(*)
FROM empleado e 
WHERE e.codigo_departamento  IS NOT NULL 
GROUP BY e.codigo_departamento
HAVING count(*) > 2;











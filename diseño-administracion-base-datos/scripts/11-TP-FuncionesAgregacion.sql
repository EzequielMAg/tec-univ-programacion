/*
* 
*  Consultas con funciones de agregado
*
*/
SELECT * FROM Departamento;

# 1. Calcula la suma del presupuesto de todos los departamentos.
SELECT sum(presupuesto) AS `Suma total de todos los deptos`
FROM Departamento;

# 2. Calcula la media del presupuesto de todos los departamentos.
SELECT avg(presupuesto) FROM Departamento; 

SELECT CAST(avg(presupuesto) AS decimal(10, 2)) 
FROM Departamento; 

SELECT CAST(avg(presupuesto) AS decimal(10, 2)) AS `Promedio del presupuesto de todos los deptos` 
FROM Departamento; 

# 3. Calcula el valor mínimo del presupuesto de todos los departamentos.
SELECT min(presupuesto) FROM Departamento;

# 4. Calcula el nombre del departamento y el presupuesto que tiene asignado, del
# departamento con menor presupuesto.
SELECT * FROM Departamento d
ORDER BY presupuesto
LIMIT 1;

SELECT d.codigo AS ID, 
	   d.nombre AS Nombre,
	   d.presupuesto AS Presupuesto 
FROM Departamento d
ORDER BY presupuesto
LIMIT 2; -- Puse dos porque me di cuenta que hay 2 con el mismo valor = 0, pero es horrible esto :v

-- Viendo la resolucion, lo hicieron con subconsultas:
-- (me parecia que la forma que lo resolvi en la consulta anterior, no era lo que pedia jajaj)
SELECT nombre, presupuesto 
FROM Departamento 
WHERE presupuesto = (SELECT min(presupuesto) FROM Departamento);


# 5. Calcula el valor máximo del presupuesto de todos los departamentos.
SELECT max(presupuesto) AS max_presupuesto
FROM Departamento;

# 6. Calcula el nombre del departamento y el presupuesto que tiene asignado, del
# departamento con mayor presupuesto.
SELECT * FROM Departamento
ORDER BY presupuesto DESC
LIMIT 1;

SELECT d.codigo,
	   d.nombre,
	   d.presupuesto 
FROM Departamento d
ORDER BY presupuesto DESC
LIMIT 1;

-- Viendo la resolucion, al igual que en el ejerc. 4, habia que aplicar subconsultas:
-- Aunque hasta este momento que vi este tema, me falto ver repasar el tema de subconsulta.
-- En cuanto a las clases, tambien, este tema aun quedaba pendiente en ese momento.
-- RESOLUCION:
SELECT nombre, presupuesto 
FROM Departamento
WHERE presupuesto = (SELECT max(presupuesto) FROM Departamento);


# 7. Calcula el número total de empleados que hay en la tabla empleado.
SELECT count(*) AS `Cantidad total de empleados`
FROM Empleado;

-- Otra forma de hacer lo mismo pero mediante uno de los atributos, siempre la PK para asegurarse que no haya nulos.
-- Sino, count() los ignora.
SELECT count(codigo) AS `Cantidad total de empleados`
FROM Empleado;


# 8. Calcula el número de empleados que no tienen NULL en su segundo apellido.
-- MI NOTA: para cumplir con el ejercicio no hace falta agregar nada para contar los que no tienen null,
--          basta con usar la funcion por tal atributo y listo, por que por DEFAULT count() no los tiene en cuenta.
SELECT count(apellido2) 
FROM Empleado;

-- Pero.. Si quiero asegurarme :v (aunque no haga falta, por ahi queda mas explicito)
SELECT count(apellido2)
FROM Empleado 
WHERE apellido2 IS NOT NULL;

-- Otra forma de hacerlo, es como esta en la resolucion:
SELECT count(*)  AS empleados_con_segundo_apellido
FROM empleado 
WHERE apellido2 IS NOT NULL;

-- COMENTARIO: aunque esta ultima forma de resolver el ejercicio no me gusta, osea, porque contarlos a todos
--			   con el * (asterisco)?? No hace falta. Pero bueno, es otra forma...


# 9. Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas, 
# una con el nombre del departamento y otra con el número de empleados que tiene asignados.
SELECT d.nombre, 
	   count(e.codigo) AS `Cantidad de empleados`
FROM Empleado e
RIGHT JOIN Departamento d
ON e.codigo_departamento = d.codigo 
GROUP BY d.nombre;
#ORDER BY d.nombre;
#ORDER BY `Cantidad de empleados`;

-- Otra forma sin usar JOIN (vista en clase, recordando:)
-- Aunque, claro, no cumpliria con la consigna xq no muestra el nombre del depto. Entonces, si o si hay que usar JOIN.
SELECT e.codigo_departamento,
	   count(*) AS `Cantidad de empleados`
FROM Empleado e
GROUP BY e.codigo_departamento;

-- Si, si o si con JOIN, porque a traves del departamento no puedo saber que empleados tiene asignados.
-- No estaria normalizada sino.


# 10.Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe tener dos columnas, 
# una con el nombre del departamento y otra con el número de empleados que tiene asignados.
SELECT d.nombre, 
	   count(e.codigo) AS `Cantidad de empleados`
FROM Empleado e
RIGHT JOIN Departamento d
ON e.codigo_departamento = d.codigo 
GROUP BY d.nombre
HAVING `Cantidad de empleados` > 2;

# 11. Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta consulta
# también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.

-- RTA: esto ya lo hice en el ejerc. 9, no entiendo que pedia el nueve entonces, si es lo mismo.
--      Bueno, el 9 era medio abierto, capaz no lo exigia y aca si :v


# 12.Calcula el número de empleados que trabajan en cada unos de los
# departamentos que tienen un presupuesto mayor a 200000 euros.
SELECT d.nombre, 
	   count(e.codigo) AS `Cantidad de empleados`
FROM Empleado e
RIGHT JOIN Departamento d
ON e.codigo_departamento = d.codigo 
WHERE d.presupuesto > 200000
GROUP BY d.nombre;


/* NOTA: 
*    - Revisando las resoluciones, me di cuenta, y tambien recorde de la clase, que siempre es recomendable
*      agregar un alias a cada funcion, para mostrar bien el nombre de la columna, y la funcion ahi.
* 	   Y parece que la convencion es usar un nombre_etc, en vez de como yo lo estaba haciendo con `` y un
* 	   nombre largo separado por espacios :v Igual me gusta mas como lo hago yo.
*/
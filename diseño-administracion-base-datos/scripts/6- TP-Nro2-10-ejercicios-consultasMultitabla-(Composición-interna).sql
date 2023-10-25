/*
 * 
 * 	Consultas multitabla (Composición interna)
 * 
 */
USE `utn-guianro2-dml`;


# 1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
SELECT * FROM Empleado e
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo;

-- Tambien puede ser de esta forma, porque interpreto que "donde trabaja cada uno" y NO todos estan asignados, y de esta forma
-- puedo ver a todos los empleados, incluso los que no estan asignados a ningun depto.
SELECT * FROM Empleado e
LEFT JOIN Departamento d ON e.codigo_departamento  = d.codigo;


# 2. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. 
# Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo 
# lugar por los apellidos y el nombre de los empleados.
SELECT * FROM Empleado e
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo
ORDER BY d.nombre, e.apellido1, e.apellido2, e.nombre;


# 3. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
SELECT d.codigo, d.nombre
FROM Empleado e
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento IS NOT NULL; 

-- Lo que me pide es lo anterior supongo, pero no me gusta que se repiten... y no tengo ninguna info mas
-- Por lo que muestro algunos datos de los empleados:
SELECT d.codigo, d.nombre, e.codigo, e.nombre  FROM Empleado e
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento IS NOT NULL
ORDER BY d.codigo; -- Le agrego esto, porque si NO los ordena segun el codigo del usuario.. Y de esta forma mantiene el orden
				   -- del listado igual que la sentencia anterior

-- Al final entendi que esto es lo que me pide este ejercicio.
-- De esta forma veo los departamentos que tienen al menos 1 empleado asignado, pero sin repetirse los nombres de los departamentos
-- segun cada empleado. 
SELECT DISTINCT d.codigo, d.nombre FROM Empleado e
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo;
-- WHERE e.codigo_departamento IS NOT NULL; -- Esta linea no hacia falta, porque ya de por si, con el INNER JOIN se traen los empleados
											-- que estan asociados a un depto.


# 4. Devuelve un listado con el código, el nombre del departamento y el valor del presupuesto actual del que dispone, 
# solamente de aquellos departamentos que tienen empleados. El valor del presupuesto actual lo puede calcular
# restando al valor del presupuesto inicial (columna presupuesto) el valor de los gastos que ha generado (columna gastos).
SELECT DISTINCT 
  d.codigo, d.nombre, 
  (d.presupuesto - d.gasto) AS "presupuesto disponible"
FROM Empleado e
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo;

# 5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
SELECT d.nombre FROM Empleado e 
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo 
WHERE e.nif = "38382980M"

-- Lo anterior es lo que exactamente pide el ejercicio, pero quiero ver mas info!
SELECT d.codigo, d.nombre, e.codigo, e.nombre, e.nif  FROM Empleado e 
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo 
WHERE e.nif = "38382980M"


# 6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
SELECT d.nombre FROM empleado e 
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo 
WHERE concat(e.nombre, " ", apellido1, " ", apellido2) = "Pepe Ruiz Santana";

-- Lo anterior es lo que exactamente pide el ejercicio, pero quiero ver mas info!
SELECT d.codigo, d.nombre, e.codigo, e.nombre, e.apellido1, e.apellido2  FROM Empleado e 
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo 
WHERE concat(e.nombre, " ", apellido1, " ", apellido2) = "Pepe Ruiz Santana";


# 7. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
-- No especifico por cual atributo debo ordenarlos alfabeticamente.
-- Aca lo ordeno por el nombre del empleado
SELECT * FROM Empleado e 
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo 
WHERE d.nombre = "i+d"
ORDER BY e.nombre;

-- Aca lo ordeno por el primer apellido del empleado
SELECT * FROM Empleado e 
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo 
WHERE d.nombre = "i+d"
ORDER BY e.apellido1;	-- Que al FINAL, NO cambia la forma de listar la informacion respecto a la query anterior :v


# 8. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. 
# Ordena el resultado alfabéticamente.
-- Por default, viene ordenado segun el codigo del departamento
SELECT * FROM Empleado e
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo
WHERE d.nombre IN("Sistemas", "Contabilidad", "I+D");

-- Aca lo ordeno segun el nombre del departamento.. En el ejerc 7 esto no tenia sentido, porque era solo 1 depto :v
SELECT * FROM Empleado e
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo
WHERE d.nombre IN("Sistemas", "Contabilidad", "I+D")
ORDER BY d.nombre;



# 9. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
SELECT * FROM Empleado e
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo
WHERE NOT (d.presupuesto BETWEEN 100000 AND 200000);


# 10.Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. 
# Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.

SELECT d.nombre FROM Empleado e
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo
WHERE e.apellido2 IS NULL;

SELECT * FROM Empleado e
INNER JOIN Departamento d ON e.codigo_departamento = d.codigo
WHERE e.apellido2 IS NULL;







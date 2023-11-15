/*
 * 
 *		GUIA DE SUBCONSULTAS 
 *
 */

USE `utn-guianro2-dml`;

# 1.2.7.1 Con operadores básicos de comparación
# 1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).
SELECT * 
FROM empleado
WHERE codigo_departamento = (SELECT codigo FROM departamento WHERE nombre = "Sistemas");

# 2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
SELECT nombre, presupuesto 
FROM departamento
WHERE presupuesto = (SELECT max(presupuesto) FROM departamento);

# 3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
SELECT nombre, presupuesto 
FROM departamento 
WHERE presupuesto = (SELECT min(presupuesto) FROM departamento);


# 1.2.7.2 Subconsultas con ALL y ANY
# 4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad
# que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT nombre, presupuesto 
FROM departamento
WHERE presupuesto >= ALL (SELECT presupuesto FROM departamento);

# 5. Devuelve el nombre del departamento con menor presupuesto y la cantidad
# que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT nombre, presupuesto 
FROM departamento
WHERE presupuesto <= ALL (SELECT presupuesto FROM departamento);

# 6. Devuelve los nombres de los departamentos que tienen empleados
# asociados. (Utilizando ALL o ANY).
SELECT e.codigo_departamento, e.nombre, e.apellido1 
FROM empleado e
WHERE e.codigo_departamento = ANY (SELECT codigo FROM departamento)
ORDER BY e.codigo_departamento;
-- OOPS, me equivoque, y traje los nombres de los empleados que tienen un depto asociado... Al revez :v

-- Ahora si..:
SELECT codigo, nombre
FROM departamento
WHERE codigo = ANY (SELECT codigo_departamento FROM empleado);

# 7. Devuelve los nombres de los departamentos que no tienen empleados
# asociados. (Utilizando ALL o ANY).
SELECT codigo, nombre
FROM departamento
WHERE codigo != ALL (SELECT DISTINCT codigo_departamento FROM empleado WHERE codigo_departamento IS NOT NULL);
-- Aca tenia que poner en la subconsulta que sea distinto de null, porque sino no me traia nada :v


# 1.2.7.3 Subconsultas con IN y NOT IN
# 8. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).
SELECT codigo, nombre
FROM departamento
WHERE codigo IN (SELECT DISTINCT codigo_departamento FROM empleado WHERE codigo_departamento IS NOT NULL);

# 9. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).
SELECT codigo, nombre
FROM departamento 
WHERE codigo NOT IN (SELECT DISTINCT codigo_departamento FROM empleado WHERE codigo_departamento IS NOT NULL);


# 1.2.7.4 Subconsultas con EXISTS y NOT EXISTS
# 10.Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT DISTINCT  d.codigo, d.nombre
FROM departamento d 
JOIN empleado e ON e.codigo_departamento = d.codigo
WHERE EXISTS (SELECT DISTINCT 1 FROM empleado WHERE codigo_departamento IS NOT NULL);
-- Esta forma me funciona, pero no me gusta... creo que ademas la subconsulta esta demas..

-- Probando otra forma (subconsulta relacionada o dependiente)
SELECT codigo, nombre
FROM departamento d 
WHERE EXISTS (SELECT codigo_departamento FROM empleado e WHERE e.codigo_departamento = d.codigo);

-- Asi estaba en la resolucion:
SELECT nombre
FROM departamento d 
WHERE EXISTS (SELECT 1 FROM empleado e WHERE e.codigo_departamento = d.codigo);
-- Ahora que la veo es lo mismo q la anterior q hice.. Pero aca retorna un 1 y solo muestra el nombre

# 11. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT d.codigo, d.nombre
FROM departamento d 
WHERE NOT EXISTS (SELECT codigo_departamento FROM empleado e WHERE e.codigo_departamento = d.codigo);

-- Asi estaba en la resolucion:
SELECT nombre
FROM departamento d 
WHERE NOT EXISTS (SELECT 1 FROM empleado e WHERE e.codigo_departamento = d.codigo);
-- Idem comentario en linea 89.
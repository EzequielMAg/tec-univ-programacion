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
LEFT JOIN Departamento d ON e.codigo_departamento = d.codigo;

SELECT * FROM Departamento d 
RIGHT JOIN Empleado e ON e.codigo_departamento = d.codigo;


# 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
SELECT * FROM Departamento d
LEFT JOIN  Empleado e ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento IS NULL;

SELECT * FROM Empleado e
RIGHT JOIN  Departamento d ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento IS NULL;



# 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
SELECT * FROM Empleado e
RIGHT JOIN Departamento d ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento  IS NULL;

SELECT * FROM  Departamento d
LEFT JOIN Empleado e ON e.codigo_departamento = d.codigo
WHERE e.codigo_departamento  IS NULL;


# 4. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
# El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no tienen
#  ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
SELECT * FROM empleado e
FULL OUTER JOIN departamento d ON e.codigo_departamento = d.codigo; -- NO ME FUNCIONA LPM

SELECT * FROM empleado e
LEFT JOIN departamento d ON e.codigo_departamento = d.codigo; 



# 5. Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no 
# tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
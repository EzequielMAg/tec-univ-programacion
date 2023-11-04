SELECT * FROM empleado;
SELECT * FROM departamento;


-- OPERADOR UNION
0SELECT e.codigo, e.nombre, d.nobre AS nomDep, 0
FROM Empleado e 
LEFT JOIN Departamento d ON e.codigo_departamento = d.codigo 
UNION 
SELECT e.codigo, e.nombre, d.nobre, d.gastos 
FROM Departamento d LEFT JOIN Empleado e ON e.codigo_departamento = d.codigo;


SELECT * FROM Empleado;
SELECT * FROM Departamento;

SELECT SUM(gasto) AS SUMA_GASTOS
FROM Departamento;

SELECT SUM(gasto) AS SUMA_GASTOS
FROM Departamento;


SELECT * FROM `utn-guianro2-dml`;


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











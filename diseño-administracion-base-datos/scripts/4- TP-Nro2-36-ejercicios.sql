CREATE DATABASE  `utn-guiaNro2-DML`;
USE `utn-guiaNro2-DML`;

# ---------------------------------  CREACION DE TABLAS  ---------------------------------
CREATE TABLE Empleado 
(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
	nif VARCHAR(9) NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	apellido1 VARCHAR(100) NOT NULL,
	apellido2 VARCHAR(100),
	codigo_departamento INT
);

CREATE TABLE Departamento 
(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	presupuesto DOUBLE NOT NULL,
	gastos DOUBLE
);

ALTER TABLE Empleado 
ADD CONSTRAINT fk_codigoDepartamento 
FOREIGN KEY (codigo_departamento) REFERENCES Departamento(codigo); 

ALTER TABLE Departamento 
CHANGE COLUMN gastos gasto double;

# ---------------------------------  CARGA DE REGISTROS  ---------------------------------
INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);


# ---------------------------------  RESOLUCION DE EJERCICIOS  ---------------------------------
# 1. Lista el primer apellido de todos los empleados.
SELECT apellido1 FROM Empleado;


# 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT DISTINCT apellido1 FROM Empleado;


# 3. Lista todas las columnas de la tabla empleado.
SELECT * FROM Empleado;


# 4. Lista el nombre y los apellidos de todos los empleados.
SELECT nombre, apellido1, apellido2 FROM Empleado;


# 5. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado.
SELECT codigo_departamento FROM Empleado;


# 6. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado, 
# eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_departamento FROM Empleado;


# 7. Lista el nombre y apellidos de los empleados en una única columna.
SELECT concat(nombre, " ", apellido1, " ", ifnull(apellido2, " ...")) AS "Nombre y Apellidos" FROM Empleado;


# 8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT UPPER(
concat(nombre, " ", apellido1, " ", ifnull(apellido2, " ..."))) 
AS "Nombre y Apellidos" FROM Empleado;


# 9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT LOWER(
concat(nombre, " ", apellido1, " ", ifnull(apellido2, " ..."))) 
AS "Nombre y Apellidos" FROM Empleado;


# 10.Lista el código de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, 
# una mostrará únicamente los dígitos del nif y la otra la letra.
SELECT 
  codigo, 
  SUBSTRING(nif, 1, LENGTH(nif) - 1) AS digitos_nif,	-- toma todos los caracteres del NIF, excepto el último
  RIGHT(nif, 1) AS letra_nif	-- toma el último carácter del NIF
FROM Empleado;


# 11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. 
# Para calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los gastos que se
# han generado (columna gastos). Tenga en cuenta que en algunos casos pueden existir valores negativos. Utilice un alias 
# apropiado para la nueva columna columna que está calculando.
SELECT 
  nombre, 
  (presupuesto - gasto) AS "presupuesto actual" 
FROM departamento;


# 12.Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT 
  nombre, 
  (presupuesto - gasto) AS "presupuesto actual" 
FROM departamento
WHERE (presupuesto - gasto) >= 0
ORDER BY (presupuesto - gasto) ASC;


# 13.Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT nombre 
FROM departamento
ORDER BY nombre ASC; -- Entiendo que no hace falta poner ASC, que es por default si no lo pongo, pero lo hago para que sea mejor :v 


# 14.Lista el nombre de todos los departamentos ordenados de forma descendente.
SELECT nombre 
FROM departamento
ORDER BY nombre DESC;


# 15.Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta 
# en primer lugar sus apellidos y luego su nombre.
SELECT apellido1, ifnull(apellido2, " ..."), nombre 
FROM Empleado
ORDER BY apellido1, apellido2, nombre;	-- Por DEFAULT son todos ASC -> ascendentes


# 16.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT 
  codigo,
  nombre, 
  (presupuesto - gasto) AS "presupuesto actual"
FROM Departamento 
ORDER BY (presupuesto - gasto) DESC
LIMIT 3;


# 17.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT 
  codigo,
  nombre, 
  (presupuesto - gasto) AS "presupuesto actual"
FROM Departamento 
ORDER BY (presupuesto - gasto) ASC 
LIMIT 3;


# 18.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
SELECT 
  codigo,
  nombre,
  gasto
FROM Departamento
ORDER BY gasto DESC
LIMIT 2; 


# 19.Devuelve una lista con el nombre y el gasto, de los 2 departamentos quetienen menor gasto.
SELECT 
  codigo,
  nombre,
  gasto 
FROM Departamento
ORDER BY gasto
LIMIT 2;


# 20.Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe 
# incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
SELECT * FROM Empleado
ORDER BY codigo
LIMIT 5 OFFSET 2; -- Le digo "mostrame 5 registros, desde el registro tercero (indice 2), ya que el primer reg tiene indice 0"


# 21.Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto 
# mayor o igual a 150000 euros.
SELECT
  codigo,
  nombre,
  presupuesto
FROM Departamento 
WHERE presupuesto >= 150000;


# 22.Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
SELECT 
  codigo,
  nombre,
  gasto
FROM Departamento 
WHERE gasto <= 5000;


# 23.Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre 
# 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT 
  codigo,
  nombre,
  presupuesto
FROM Departamento 
WHERE presupuesto >= 100000 AND presupuesto <= 200000;


# 24.Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
# Sin utilizar el operador BETWEEN.
SELECT 
  codigo,
  nombre,
  presupuesto
FROM Departamento 
WHERE presupuesto <= 100000 OR presupuesto >= 200000;


# 25.Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. 
# Utilizando el operador BETWEEN.
SELECT 
  codigo,
  nombre,
  presupuesto
FROM Departamento 
WHERE presupuesto BETWEEN 100000 AND 200000;


# 26.Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. 
# Utilizando el operador BETWEEN.
SELECT 
  codigo,
  nombre,
  presupuesto
FROM Departamento 
WHERE NOT(presupuesto BETWEEN 100000 AND 200000);


# 27.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los 
# gastos sean mayores que el presupuesto del que disponen.
SELECT 
  codigo,
  nombre,
  presupuesto, 
  gasto,
  presupuesto - gasto AS "presupuesto actual"
FROM Departamento 
WHERE gasto > presupuesto;


# 28.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los 
# gastos sean menores que el presupuesto del que disponen.
SELECT 
  codigo,
  nombre,
  presupuesto, 
  gasto,
  presupuesto - gasto AS "presupuesto actual"
FROM Departamento 
WHERE gasto < presupuesto;


# 29.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los 
# gastos sean iguales al presupuesto del que disponen.
SELECT 
  codigo,
  nombre,
  presupuesto, 
  gasto,
  presupuesto - gasto AS "presupuesto actual"
FROM Departamento 
WHERE gasto = presupuesto;


# 30.Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
SELECT * FROM Empleado 
WHERE apellido2 IS NULL;


# 31.Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
SELECT * FROM Empleado 
WHERE apellido2 IS NOT NULL;


# 32.Lista todos los datos de los empleados cuyo segundo apellido sea López.
SELECT * FROM Empleado 
WHERE apellido2 = "Lopez";


# 33.Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
SELECT * FROM Empleado 
WHERE apellido2 = "Díaz" OR apellido2 = "Moreno";


# 34.Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
SELECT * FROM Empleado 
WHERE apellido2 in("Díaz", "Moreno");


# 35.Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
SELECT 
  nombre,
  apellido1,
  apellido2,
  nif,
  codigo_departamento 
FROM Empleado 
WHERE codigo_departamento = 3;


# 36.Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.*/
SELECT 
  nombre,
  apellido1,
  apellido2,
  nif,
  codigo_departamento 
FROM Empleado 
WHERE codigo_departamento IN (2, 4, 5);


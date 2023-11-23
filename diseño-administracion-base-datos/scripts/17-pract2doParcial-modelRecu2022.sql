/*
 * 
 *		Practicando con un recu de 2do parcial de BD 2022 
 * 
 */

/* 1. Realizar las sentencias SQL en base al siguiente modelo:
*
*	>>> Empleado
*	Legajo int(PK)
*	Apellido varchar(50)
*	Nombre varchar(50)
*	idTurno int (FK)
*	SueldoBasico decimal
*
*	>>> Recibo
*	NroRecibo int (PK)
*	Legajo int (FK)
*	fecha date
*
*	>>> Turno
*	idTurno int (PK)
*	nombre
*/

CREATE DATABASE `utn-practrec2doParcial-2022`;
USE `utn-practrec2doParcial-2022`;

<<<<<<< HEAD
/* -----------------  CREACION DE TABLAS  -----------------
CREATE TABLE Empleado(
=======
 -- -----------------  CREACION DE TABLAS  -----------------
CREATE TABLE Empleado (
>>>>>>> ef20b28 (Practica BD)
	legajo int AUTO_INCREMENT,
 	apellido varchar(50) NOT NULL, 
  	nombre varchar(50) NOT NULL,
  	idTurno int NOT NULL,
  	sueldoBasico decimal(10, 2) NOT NULL,
 	CONSTRAINT pk_legajo_empleado PRIMARY KEY (legajo),
 	CONSTRAINT fk_idTurno FOREIGN KEY (idTurno) REFERENCES Turno(idTurno)
 );


CREATE TABLE Recibo(
	nroRecibo int AUTO_INCREMENT,
	legajo int NOT NULL,
	fecha date NOT NULL,
	CONSTRAINT pk_nroRecibo PRIMARY KEY (nroRecibo),
	CONSTRAINT fk_legajo_empleado FOREIGN KEY (legajo) REFERENCES Empleado(legajo)
);

CREATE TABLE Turno(
	idTurno int AUTO_INCREMENT,
	nombre varchar(50),
	CONSTRAINT pk_idTurno PRIMARY KEY (idTurno)
);


DROP TABLE Empleado;
DROP TABLE Recibo;

ALTER TABLE Recibo 
DROP FOREIGN KEY fk_legajo_empleado;


-- -----------------  CARGA DE DATOS  ----------------- 
INSERT INTO Turno 
(nombre) VALUES
('Mañana'),
('Tarde'),
('Noche');

INSERT INTO Empleado
(apellido, nombre, idTurno, sueldoBasico) VALUES
('Mamani A.', 'Ezequiel', '1', 1000000),
('Perez', 'Juan', '2', 500000),
('Fernandez', 'Marcelo', '3', 750000),
('Messi', 'Leo', '1', 10000000);

INSERT INTO Recibo 
(legajo, fecha) VALUES 
(1, '2023-11-16');

INSERT INTO Recibo 
(legajo, fecha) VALUES 
(2, '2023-11-16'),
(3, '2023-11-16');

INSERT INTO Recibo 
(legajo, fecha) VALUES 
(1, '2023-1-16'),
(2, '2023-1-16'),
(3, '2023-1-16'),
(1, '2023-2-16'),
(2, '2023-2-16'),
(3, '2023-2-16'),
(1, '2023-3-16'),
(2, '2023-3-16'),
(3, '2023-3-16'),
(1, '2023-4-16'),
(2, '2023-4-16'),
(3, '2023-4-16'),
(1, '2023-5-16'),
(2, '2023-5-16'),
(3, '2023-5-16'),
(1, '2023-6-16'),
(2, '2023-6-16'),
(3, '2023-6-16'),
(1, '2023-7-16'),
(2, '2023-7-16'),
(3, '2023-7-16'),
(1, '2023-8-16'),
(2, '2023-8-16'),
(3, '2023-8-16'),
(1, '2023-9-16'),
(2, '2023-9-16'),
(3, '2023-9-16'),
(1, '2023-10-16'),
(2, '2023-10-16'),
(3, '2023-10-16');


SELECT * FROM empleado;
SELECT * FROM turno;
SELECT * FROM recibo;


# a. Listar el total de sueldos x turno pagados en el año 2023. 
#	 Mostrar unicamente turnos que tuvieron mas de 5 empleados
SELECT t.idTurno, 
	   t.nombre, 
   	   count(DISTINCT e.legajo) AS cant_empleados, 
   	   sum(sueldoBasico) AS total_sueldos_pagados_2023
FROM empleado e
JOIN recibo r ON r.legajo = e.legajo
JOIN turno t ON t.idTurno = e.idTurno
WHERE YEAR(r.fecha) = "2023"
GROUP BY t.idTurno, t.nombre
HAVING cant_empleados >= 5;  

# b. Listar empleados que cobran un sueldo inferior al promedio de sueldos de su mismo turno.
-- APROXIMACIONES..:
-- Aca una query general de info
SELECT COUNT(legajo) AS cant_empleados,
	   SUM(sueldoBasico) AS suma_total_sueldos,
	   CAST(AVG(sueldoBasico) AS DECIMAL(10, 2)) AS promedio_sueldos
FROM empleado;

-- Aca un promedio de sueldos por turno con algo mas de info
SELECT idTurno,
       COUNT(legajo) AS cant_empleados,
	   SUM(sueldoBasico) AS suma_total_sueldos,
	   CAST(AVG	(sueldoBasico) AS DECIMAL(10, 2)) AS promedio_sueldos
FROM empleado
GROUP BY idTurno;

-- Aca un promedio de sueldos por turno 
SELECT idTurno,
	   CAST(AVG	(sueldoBasico) AS DECIMAL(10, 2)) AS promedio_sueldos
FROM empleado
GROUP BY idTurno;

-- La query que pide el ejercicio (me ayudo a finalizarla CHATGPT):
SELECT e.idTurno, e.legajo, e.apellido, e.nombre, e.sueldoBasico
FROM Empleado e
JOIN (SELECT idTurno, AVG(sueldoBasico) AS sueldoPromedio
      FROM Empleado
      GROUP BY idTurno) AS t 
ON e.idTurno = t.idTurno
WHERE e.sueldoBasico < t.sueldoPromedio
ORDER BY e.idTurno;


# c. Crear un procedimiento que tome por parametro una fecha de inicio y una fecha de fin y  
#	 devuelva todos los empleados indicando cuales cobraron sueldo, con el siguiente formato:
#
#	 Legajo, Cobro_sueldo
#	  1001		SI
#	  1002		NO

delimiter $$
CREATE PROCEDURE verificarCobroSueldo
(
	IN p_fechaInicial date,
	IN p_fechaFinal date
)
BEGIN
	SELECT e.legajo, 
		   CASE WHEN r.nroRecibo IS NOT NULL THEN 'SI' 
		   		ELSE 'NO' 
		   		END AS 'cobro sueldo'
	FROM empleado e 
	LEFT JOIN recibo r ON r.legajo = e.legajo AND r.fecha BETWEEN p_fechaInicial AND p_fechaFinal; 
END 
$$ 
delimiter ;

CALL verificarCobroSueldo('2023-11-1', '2023-11-30');



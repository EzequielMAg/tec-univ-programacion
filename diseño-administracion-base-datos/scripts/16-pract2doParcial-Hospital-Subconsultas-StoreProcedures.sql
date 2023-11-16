/*
* 
*	 GUIA PRACTICA SUBCONSULTAS Y STORE PROCEDURES. 
*
*	Prof: Julieta Wilson // UTN - Mar Del Plata - 2023
* 
*/

DROP DATABASE Hospital;
CREATE DATABASE `utn-tp-Hospital`;
USE `utn-tp-Hospital`;

/* -----------------  CREACION DE TABLAS  -----------------

create table departamento(
	id_departamento int not null auto_increment,
    nombre varchar(100) not null,
    localidad varchar(100) not null,
    constraint pk_id_departamento primary key (id_departamento)
);

create table empleado(
	id_empleado int not null auto_increment,
    id_departamento int null,
    apellido varchar(100) not null,
    oficio varchar(100) not null,
    salario double not null,
    dir int null,
    comision varchar(100) not null,
    fecha_alta datetime not null,
    CONSTRAINT pk_id_empleado PRIMARY KEY (id_empleado),
	CONSTRAINT FK_empleado_departamento FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

create table hospital(
	id_hospital int not null auto_increment,
	nombre varchar(100) not null,
    direccion varchar(100) not null,
    telefono varchar(100) not null,
    cantidad_camas int not null,
	CONSTRAINT PK_hospital PRIMARY KEY(id_hospital)
);

CREATE TABLE doctor(
	id_doctor int not null auto_increment,
	id_hospital int,
    apellido varchar(100) not null,
    especialidad varchar(100) not null,
	CONSTRAINT PK_Doctor PRIMARY KEY(id_doctor),
	CONSTRAINT FK_Doctor_Hospital FOREIGN KEY (id_hospital) REFERENCES hospital(id_hospital)
);

CREATE TABLE sala(
    id_sala int not null,
    id_hospital int,
	nombre varchar(100) not null,
	num_cama int not null,
	CONSTRAINT PK_sala PRIMARY KEY(id_sala,num_cama),
	CONSTRAINT FK_Sala_Hospital FOREIGN KEY (id_hospital) REFERENCES hospital(id_hospital)
);

CREATE TABLE enfermo(
	id_enfermo int not null auto_increment,
    apellido varchar(100) not null,
    direccion varchar(100) not null,
    fecha_nac date,
    genero char,
    dni varchar(8) not null unique,
	CONSTRAINT PK_enfermo PRIMARY KEY(id_enfermo)
);

CREATE TABLE plantilla
(
	id_plantilla int not null auto_increment,
	id_empleado int not null,
    id_sala int not null,
    id_hospital int not null,
    id_enfermo int not null,
    diagnostico varchar(100) not null,
	CONSTRAINT PK_Plantilla PRIMARY KEY(id_plantilla),
	CONSTRAINT FK_Plantilla_Sala FOREIGN KEY (id_sala) REFERENCES sala(id_sala),
    CONSTRAINT FK_Plantilla_hospital FOREIGN KEY (id_hospital) REFERENCES sala(id_hospital),
	CONSTRAINT FK_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
	CONSTRAINT FK_enfermo FOREIGN KEY (id_enfermo) REFERENCES enfermo(id_enfermo)
);
*/

/* -----------------  CARGA DE DATOS  -----------------
 
INSERT INTO departamento(nombre,localidad) VALUES('CONTABILIDAD','Las Toninas');
INSERT INTO departamento(nombre,localidad) VALUES('INFORMATICA','Mar Del Plata');
INSERT INTO departamento(nombre,localidad) VALUES('VENTAS','Santa Teresita');
INSERT INTO departamento(nombre,localidad) VALUES('INVESTIGACION','Costa del Este');
INSERT INTO departamento(nombre,localidad) VALUES('PRODUCCION','Aguas Verdes');

INSERT INTO empleado(apellido, oficio, dir, fecha_alta, salario, comision, id_departamento)
VALUES
('SANCHEZ','EMPLEADO',7902,'1980-12-17 00:00:00',10400,0,1),
('ARROYO','VENDEDOR',7698,'1981-03-01 00:00:00',208000,39000,1),
('SALA','VENDEDOR',689,'1981-04-01 00:00:00',162500,65000,2),
('JIMENEZ','DIRECTOR',7839,'1981-05-01 00:00:00',386750,0,2),
('MARTIN','VENDEDOR',7698,'2003-06-11 00:00:00',182000,182000,3),
('NEGRO','DIRECTOR',7839,'2004-07-01 00:00:00',370500,0,3),
('CEREZO','DIRECTOR',7839,'2004-08-01 00:00:00',318500,0,4),
('NINO','ANALISTA',7566,'2004-02-09 00:00:00',390000,0,4),
('REY','PRESIDENTE',0,'1987-10-03 00:00:00',650000,0,4),
('TOVAR','VENDEDOR',7698,'1989-12-04 00:00:00',195000,0,4),
('ALONSO','EMPLEADO',7788,'1991-12-05 00:00:00',143000,0,5),
('JIMENO','EMPLEADO',7698,'1999-12-05 00:00:00',123500,0,5),
('FERNANDEZ','ANALISTA',7566,'1981-02-21 00:00:00',390000,0,2),
('MUÑOZ','EMPLEADO',7782,'2021-02-11 00:00:00',169000,0,1),
('SERRA','DIRECTOR',7839,'2021-02-11 00:00:00',225000,39000,2),
('GARCIA','EMPLEADO',7119,'2020-02-01 00:00:00',129000,0,5);

INSERT INTO hospital(nombre,direccion,telefono, cantidad_camas) VALUES('Provincial','O Donell 50','964-4256',502);
INSERT INTO hospital(nombre,direccion,telefono, cantidad_camas) VALUES('General','Atocha s/n','595-3111',987);
INSERT INTO hospital(nombre,direccion,telefono, cantidad_camas) VALUES('La Paz','Castellana 1000','923-5411',412);
INSERT INTO hospital(nombre,direccion,telefono, cantidad_camas) VALUES('San Carlos','Ciudad Universitaria','597-1500',845);

INSERT INTO doctor(id_hospital,apellido,especialidad) VALUES(1,'Cabeza D.','Psiquiatría');
INSERT INTO doctor(id_hospital,apellido,especialidad) VALUES(2,'Best D.','Urología');
INSERT INTO doctor(id_hospital,apellido,especialidad) VALUES(1,'López A.','Cardiología');
INSERT INTO doctor(id_hospital,apellido,especialidad) VALUES(2,'Galo D.','Pediatría');
INSERT INTO doctor(id_hospital,apellido,especialidad) VALUES(4,'Adams C.','Neurología');
INSERT INTO doctor(id_hospital,apellido,especialidad) VALUES(3,'Miller G.','Ginecología');
INSERT INTO doctor(id_hospital,apellido,especialidad) VALUES(4,'Chuki P.','Pediatría');
INSERT INTO doctor(id_hospital,apellido,especialidad) VALUES(3,'Cajal R.','Cardiología');

INSERT INTO sala(id_sala,id_hospital,nombre,num_cama) VALUES(1,1,'Recuperación',10);
INSERT INTO sala(id_sala,id_hospital,nombre,num_cama) VALUES(1,1,'Recuperación',15);
INSERT INTO sala(id_sala,id_hospital,nombre,num_cama) VALUES(2,2,'Maternidad',34);
INSERT INTO sala(id_sala,id_hospital,nombre,num_cama) VALUES(2,4,'Maternidad',24);
INSERT INTO sala(id_sala,id_hospital,nombre,num_cama) VALUES(3,1,'Cuidados Intensivos',21);
INSERT INTO sala(id_sala,id_hospital,nombre,num_cama) VALUES(3,3,'Cuidados Intensivos',10);
INSERT INTO sala(id_sala,id_hospital,nombre,num_cama) VALUES(4,3,'Cardiología',53);
INSERT INTO sala(id_sala,id_hospital,nombre,num_cama) VALUES(4,4,'Cardiología',55);
INSERT INTO sala(id_sala,id_hospital,nombre,num_cama) VALUES(6,2,'Psiquiátricos',67);
INSERT INTO sala(id_sala,id_hospital,nombre,num_cama) VALUES(6,3,'Psiquiátricos',118); 

INSERT INTO enfermo(apellido,direccion,fecha_nac,genero,dni)
VALUES
('Laguía M.','Goya 20','1998-12-12','M',28086242),
('Fernández M.','Recoletos 50','1980-04-17','F',28499142),
('Serrano V.','Alcalá 12','1992-09-25','F',32190059),
('Domin S.','Mayor 71','1977-09-23','M',16065471),
('Neal R.','Orense 11','1960-02-22','F',38001217),
('Cervantes M.','Perón 38','1978-05-08','M',44029390),
('Miller B.','López de Hoyos 2','1982-11-07','F',31969044),
('Ruiz P.','Ezquerdo 103','1994-07-15','M',10097253),
('Fraiser A.','Soto 3','1991-05-09','F',28521776),
('Benítez E.','Argentina','1988-08-05','M',15411767);

INSERT INTO plantilla(id_hospital,id_sala,id_empleado,id_enfermo,diagnostico)
VALUES
(1,1,1,1,'Esta Enfermo'),
(1,1,1,2,'Gripe'),
(2,2,2,3,'Tuberculosis'),
(1,1,1,4,'Renitis Aguda'),
(1,1,1,5,'Hepatitis B'),
(1,1,1,6,'Hepatitis A'),
(1,1,1,7,'Varicela'),
(1,1,1,8,'Covid'),
(1,1,1,9,'Conjuntivitis'),
(1,1,1,10,'Excoleosis');
*/

Select * from departamento;
Select * from doctor;
Select * from empleado;
Select * from enfermo;
Select * from hospital;
Select * from sala;
Select * from plantilla;


# -----------------  SUBCONSULTAS  -----------------
-- 1. Mostrar el numero de empleado, el apellido y la fecha de alta del empleado mas antiguo de la empresa
#SELECT id_empleado, apellido, fecha_alta 
SELECT *
FROM empleado
WHERE fecha_alta = (SELECT min(fecha_alta) FROM empleado);

-- 2. Mostrar el numero de empleado, el apellido y la fecha de alta del empleado mas modernos de la empresa
#SELECT id_empleado, apellido, fecha_alta 
SELECT * 
FROM empleado 
WHERE fecha_alta = (SELECT max(fecha_alta) FROM empleado);

-- 3. Mostrar el apellido y el oficio de los empleados con el mismo oficio que Arroyo.
SELECT apellido, oficio 
FROM empleado 
WHERE oficio = (SELECT oficio FROM empleado WHERE apellido = "Arroyo");

-- 4. Mostrar apellidos y oficio de los empleados del departamento 2 cuyo trabajo sea el mismo que el de
--    cualquier empleado de ventas.
SELECT apellido, oficio
FROM empleado 
WHERE id_departamento = 2 
AND oficio = ANY (SELECT e.oficio 
				  FROM empleado e 
				  JOIN departamento d ON e.id_departamento = d.id_departamento 
				  WHERE d.nombre = "VENTAS");

-- Resolucion de la materia:				 
SELECT apellido, oficio
FROM empleado
WHERE id_departamento = 2
AND oficio IN (SELECT oficio 
			   FROM empleado 
			   WHERE id_departamento = (SELECT id_departamento 
			   							FROM departamento 
		   								WHERE nombre = 'ventas'))
ORDER BY 2;


-- 5. Mostrar los empleados que tienen mejor salario que la media de los vendedores, no incluyendo al presidente.
SELECT * 
FROM empleado
WHERE salario > (SELECT avg(salario) 
				 FROM empleado 
				 WHERE oficio = "vendedor") 
AND oficio <> "presidente";
#AND oficio != "presidente";
#AND NOT oficio = "presidente";

-- 6. Mostrar los hospitales que tienen personal (Doctores) de cardiología.
SELECT *
FROM hospital
#WHERE id_hospital IN (SELECT id_hospital 
WHERE id_hospital = ANY (SELECT id_hospital 
					  	 FROM doctor 
				  		 WHERE especialidad = "cardiologia");

-- 7. Visualizar el salario anual de los empleados de la plantilla del Hospital Provincial y General. 
--    (Realizar con subconsulta)
				  		
#Aproximacion...
SELECT salario, salario * 12 AS `salario anual` FROM empleado;
SELECT * FROM plantilla;

-- Mi resolucion:
SELECT DISTINCT e.apellido, e.oficio, e.salario, (e.salario*12) AS `salario anual`
FROM empleado e
JOIN plantilla p ON p.id_empleado = e.id_empleado 
WHERE p.id_hospital  = ANY (
	SELECT id_hospital 
	FROM hospital 
--	WHERE nombre = "Provincial" OR nombre = "General");
	WHERE nombre IN("Provincial", "General"));
# En la resolucion usaron group by, yo use DISTINCT al ver que eran solo 2 resultados..
# Por ahi no lo tenia q resolver asi, pero trae la misma informacion.

-- Resolucion de flor:
SELECT salario, salario*12 AS salario_anual, id_empleado, apellido
FROM empleado
WHERE id_empleado IN (SELECT id_empleado 
					  FROM plantilla 
                      WHERE id_hospital IN (SELECT id_hospital 
											FROM hospital 
                                            WHERE nombre IN('provincial','general')));

-- Resolucion de la materia:
SELECT e.apellido, e.oficio, (e.salario * 12) as 'Salario Anual'
FROM empleado e
JOIN plantilla p ON e.id_empleado = p.id_empleado
WHERE p.id_hospital IN (SELECT id_hospital 
					    FROM hospital 
					    WHERE nombre = 'PROVINCIAL' OR nombre = 'GENERAL')
GROUP BY e.id_empleado;                                           
  
-- Tratando de replicar la resolucion de flor (doble subconsulta, sin verla, claro):
SELECT id_empleado, apellido, oficio, salario, (salario*12) AS salario_anual
FROM empleado 
WHERE id_empleado IN (SELECT id_empleado 
					  FROM plantilla
					  WHERE id_hospital IN (SELECT id_hospital 
				   		   	   			      FROM hospital 
				   							  WHERE nombre IN("provincial", "general")));
# Lo logré!
				   							 
-- 8. Realizar el ejercicio anterior pero sin subconsultas
SELECT e.apellido, e.oficio, e.salario, (e.salario*12) AS `salario anual`
FROM empleado e
JOIN plantilla p ON p.id_empleado = e.id_empleado 
JOIN hospital h ON h.id_hospital = p.id_hospital 
WHERE h.nombre IN ("Provincial", "General")
GROUP BY e.id_empleado;

-- 9. Mostrar el apellido de los pacientes que nacieron antes que el Señor Miller.
SELECT apellido, fecha_nac
FROM enfermo
WHERE fecha_nac < (SELECT fecha_nac FROM enfermo WHERE apellido = "Miller B.");


# STORE PROCEDURES
-- 1. Sacar todos los empleados que se dieron de alta entre una determinada fecha inicial y fecha final 
--	  y que pertenecen a un determinado departamento.
delimiter $$
CREATE PROCEDURE deleteEmployeesByDate
(
	IN p_initialDate date,
	IN p_finalDate date,
	IN p_idDepartamento int
)
BEGIN
	DELETE FROM empleado 
	WHERE fecha_alta BETWEEN p_initialDate AND p_finalDate
					 AND id_departamento  = p_idDepartamento;
END
$$
delimiter ;

DROP PROCEDURE deleteEmployeesByDate;
CALL deleteEmployeesByDate("2023-11-15", "2023-11-15", 2);
SELECT * FROM empleado;

-- Luego me di cuenta por la resolucion que con SACAR la consigna se referia a mostrar por un select pff...
delimiter $$
CREATE PROCEDURE getEmployeesByDate
(
	IN p_initialDate date,
	IN p_finalDate date,
	IN p_idDepartamento int
)
BEGIN
	SELECT * FROM empleado 
	WHERE fecha_alta BETWEEN p_initialDate AND p_finalDate
					 AND id_departamento  = p_idDepartamento;
END
$$
delimiter ;

CALL getEmployeesByDate("1980-11-15", "2023-11-15", 1);

-- 2. Crear procedimiento que nos devuelva salario, oficio y comisión, pasándole el apellido.
delimiter $$
CREATE PROCEDURE getEmployeeByAddress
(
	IN p_address varchar(100)
)
BEGIN
	SELECT oficio, salario, comision
	FROM empleado 
	WHERE apellido = p_address;
END
$$
delimiter ;

DROP PROCEDURE getEmployeeByAddress;

CALL getEmployeeByAddress("rey");
CALL getEmployeeByAddress("MAMANI");
CALL getEmployeeByAddress("sala");


-- 3. Crear un procedimiento para mostrar el salario, oficio, apellido y nombre del departamento de todos 
--	  los empleados que contengan en su apellido el valor que le pasemos como parámetro.
delimiter $$
CREATE PROCEDURE getEmployeeByValueInAddres
(
	IN p_valueInAddress varchar(100)
)
BEGIN
	SELECT e.apellido, d.nombre, e.oficio, e.salario
	FROM empleado e 
	JOIN departamento d ON d.id_departamento = e.id_departamento 
	WHERE e.apellido LIKE concat('%', p_valueInAddress, '%');
END;
$$
delimiter ;

DROP PROCEDURE getEmployeeByValueInAddres;
CALL getEmployeeByValueInAddres('g');
CALL getEmployeeByValueInAddres('m');

-- PRUEBA:
SET @parametro = 'g';
SELECT @parametro;

SELECT e.apellido, d.nombre, e.oficio, e.salario
FROM empleado e 
JOIN departamento d ON d.id_departamento = e.id_departamento 
WHERE e.apellido LIKE concat('%', @parametro, '%');
-- AHORA SII! A arreglar ese precedure LPM!
-- estaba haciendo: WHERE e.apellido LIKE ('%' + p_valueInAddress + '%'); y no andaba... era por los +
-- que no hay que usarlos!


-- 4. Crear un procedimiento que recupere el número departamento, el nombre y número de empleados, 
--    dándole como valor el nombre del departamento, si el nombre introducido no es válido, mostraremos 
--	  un mensaje informativo comunicándolo.
delimiter $$
CREATE PROCEDURE getInfoFromDepartmentByName
(
	IN p_departamentName varchar(100)
)
BEGIN
	DECLARE searched_department varchar(100);

	-- Buscar el depto
	SELECT nombre INTO searched_department #Asigna el valor de la col nombre a la var searched_department.
	FROM departamento
	WHERE nombre = p_departamentName;

	-- Verificar si se encontro el depto
	IF (searched_department IS NULL) THEN
		SELECT concat('DEPARTAMENTO INTRODUCIDO NO VALIDO: ', p_departamentName) AS RESULTADO;
	ELSE 
        -- Obtener la información del departamento y la cantidad de empleados
		SELECT e.id_departamento, d.nombre, count(*) AS 'cantidad de empleados'
		FROM empleado e
		JOIN departamento d ON d.id_departamento = e.id_departamento 
		WHERE d.nombre = p_departamentName
		GROUP BY e.id_departamento, d.nombre;
	END IF;
END;
$$
delimiter ;

CALL getInfoFromDepartmentByName('INFORMATICA');
CALL getInfoFromDepartmentByName('CONTABILIDAD');
CALL getInfoFromDepartmentByName('VENTAS');
CALL getInfoFromDepartmentByName('INVESTIGACION');
CALL getInfoFromDepartmentByName('PRODUCCION');

DROP PROCEDURE getInfoFromDepartmentByName;





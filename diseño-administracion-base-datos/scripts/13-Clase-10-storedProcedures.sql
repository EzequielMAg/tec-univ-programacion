/*
 * 
 *	PROCEDIMIENTOS ALMACENADOS - STORE PROCEDURES
 * 
 */

/* 
 *  No hay muchas practica de este tema...
 * 
 *  Que son? Son procedimientos equivalentes a lo que conocemos como funciones/metodos.
 *
 *  Un procedimiento es una funcion que ejecuta una cant de sentencias, en este caso sentencias SQL, 
 *  los stored pueden o NO retornar un valor.  
 * 
 * 	Al implementarse los ORM, los procedures empezaron a usarse menos, porque ademas se guardaba mucha 
 *  informacion de la logica de negocio en la BD.
 * 
 *  VENTAJAS de los store procedures:
 *  - Cuando la persistencia de datos es sobre un volumen de datos grande, es mas optimo usar prodecimientos,
 *    es mas rapida la persistencia. Porque cuando uno define el procedimiento y lo ejecuta, el motor arma un plan
 *    de ejecucion y lo guarda. Como lo guarda la segunda vez que tiene que ejecutarse, se ejecuta directamente.
 */

CREATE TABLE categoria 
( 
	idCat int PRIMARY KEY AUTO_INCREMENT,
	nombre varchar(100)
);

# --------------  CREANDO UN PROCEDIMIENTO  --------------
delimiter $$
CREATE PROCEDURE insertCategoria #Nombre del procedimiento
(								 #Aca van a estar declarados los parametros del proc. 
	p_nombre varchar(50)		 #Por DEFAULT al escribirlo asi, es un param de entrada.
)								 #La convencion es poner un _ o p_ para despues identificarr el parm del atrib.
BEGIN 
	INSERT INTO categoria(nombre) 
	VALUES(p_nombre);
	
	SELECT last_insert_id(); #Esta FN retorna el ultimo ID insertado.
	#SELECT * FROM categoria;
END 
$$

# LLAMANDO AL PROCEDIMIENTO:
CALL insertCategoria("A");
CALL insertCategoria("B");

SELECT * FROM categoria;

DROP PROCEDURE insertCategoria;

CALL insertCategoria('C');
CALL insertCategoria('D');
CALL insertCategoria('E');


# OTRO EJEMPLO DE PROCEDURE
delimiter $$
CREATE PROCEDURE insertCategoria2
(
	IN p_nombre varchar(100),
	OUT p_idCat int
)
BEGIN 
	INSERT INTO categoria(nombre) VALUES(p_nombre);
	SET p_idCat = last_insert_id();
END
$$
delimiter ;

CALL insertCategoria2("F", @hola);
SELECT @hola;

/*	DIFERENCIA ENTRE UN STORE PROCEDURE Y UN TRIGGER
 * 
 *  Es que el store proc.. es un prodecimiento que uno lo tiene que llamar con el call y el trigger 
 *  tambien es un procedimiento, que se dispara a traves de un evento. El evento puede ser, cuando se 
 *  hace un INSERT, un UPDATE o un DELETE de un registro respecto a una tabla. Entonces, en el momento 
 *  en que el compilador ve que se hizo un INSERT, si hay un trigger relacionado a ese insert, de esa tabla
 *  lo ejecuta, osea dispara el trigger ejecutando su porcion de codigo.
 * 
 *  Los trigger ya casi ni se usan actualmente.
 *  Un ejemplo de aplicacion de los triggers que se usan hoy en dia, podria ser, que cada vez que se hace 
 *  algun insert, delete o update, o mas q nada con lo que es delete o update, que son operaciones mas sensibles, 
 *  podria guardarse los valores viejos, en otra tabla, junto con la hora y fecha del momento de la accion.
 */




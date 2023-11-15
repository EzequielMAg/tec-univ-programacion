/*
 * 
 * 	TEMA: CASE
 * 
 * 
 * 	El case de BD es como un switch tradicional de programacion. Tiene la misma logica.
 * 	Se utiliza para un condicional de casos. Tiene mucho que ver en BD en como quiero que me 
 *  devuelva cierta informacion, segun un requerimiento.  
 */

USE `utn-guianro2-dml`;

# -------------------  EJEMPLOS  -------------------
-- NOTA: modifique un poco los ejemplos, agregue alguna cosita, pero despues son en gral iguales a la clase.
SELECT codigo, nombre, gastos,
CASE WHEN gastos = 0 THEN 'gastos por analizar' 
	 WHEN gastos <= 10000 THEN 'bajo'
	 WHEN gastos > 10000 AND gastos <= 100000 THEN 'medio'
	 WHEN gastos > 100000 THEN 'alto'
	 END AS `categoria gastos`
FROM departamento
ORDER BY gastos ASC;

-- Otro ejemplo, pero usando ELSE remplazando al ultimo WHEN
SELECT codigo, nombre, gastos,
CASE WHEN gastos = 0 THEN 'gastos por analizar' 
	 WHEN gastos <= 10000 THEN 'bajo'
	 WHEN gastos > 10000 AND gastos <= 100000 THEN 'medio'
	 ELSE 'alto'
	 END AS `categoria gastos`
FROM departamento
ORDER BY gastos ASC;

-- Ejemplo usando la variable en la condicion CASE (modifique el ejemplo, mas bien lo complete por que
-- la profe no ejecuto la query)
SELECT codigo, nombre, gastos,
CASE gastos 
	WHEN 0 THEN 'gastos por analizar'
	WHEN 1000 THEN 'bajo'
	WHEN 3000 THEN 'bajo'
	WHEN 6000 THEN 'bajo'
	WHEN 380000 THEN 'alto'
	WHEN 200000 THEN 'alto'
	ELSE 'medio'
	END AS `categoria gastos`
FROM departamento
ORDER BY gastos ASC;
/*  OBSERVACION: 
 * 		Esta forma de trabajar es la que realmente se parece a un SWITCH de cualq lenguaje de prog.
 * 		Por que se analiza el valor de la variable, y se compara contra las que hay en cada case, 
 * 		bueno aca seria "contra cada when".
 * 
 * 		En cambio, los otros 2 primeros ejemplos, se parecen mas a un IF, ELSE IF, y al final un ELSE
 * 		en el caso del 2do ejemplo.
*/


-- NOTA: los 3 ejemplos anteriores, me las arregle para que traigan la misma informacion, pero
-- 		 claramente son distintas consultas, la forma que esta escrita.


-- Otro ejemplo (que no va a compilar porque el empleado no tiene ese atributo):
UPDATE empleado 
SET sexo = CASE sexo 
				WHEN 1 THEN 'Femenino' 
				WHEN 2 THEN 'Masculino' 
		   END
FROM departamento;


-- Si son solamente dos opciones, podemos usar un IF:
UPDATE empleado 
SET sexo = IF(sexo = 1, 'f', 'm') #En esta funcion IF, SI O SI tienen q estar los 3 argumentos: 
								  #condicion, el caso TRUE y el caso FALSE.
FROM departamento;
-- NOTA: esta sentencia con IF no es una funcion NATIVA de MySQL, sino que cada motor implementa su propia
-- funcion condicional, en SQL Server es IFIF.


# Otro ejemplo "mas avanzado" de case:
-- Tener en cuenta que se invento cualq cosa para dar el ejemplo, no tiene porq tener sentido respecto a los datos
-- almacenados en las tablas.
SELECT count(*) AS 'cantidad total de empleados',
	   count(CASE WHEN codigo_departamento IN (1,2) THEN 1 END) AS 'sistemas', 		#1*
	   count(CASE WHEN codigo_departamento IN (3,4) THEN 1 END) AS 'administracion' #2*
from empleado; 

/* COMENTARIOS:
 * 
 * #1* : En tal linea, se buscar cuantos empleados tienen el cod_depto = a 1 o 2 y los cuenta
 * #2* : Aca lo mismo, pero con el cod_depto 3 o 4, los cuenta y retorna tal cant. 
 */
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   



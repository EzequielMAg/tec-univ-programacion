/*
 * 
 * Clase 9 - TEMA SUBCONSULTAS
 * 
*/

USE `utn-guianro2-dml`

-- Devuelve un valor escalar
SELECT avg(gastos) FROM departamento;

-- Devuelve una lista de valores
SELECT gastos FROM departamento; 

-- Devuelve una matriz de valores
SELECT * FROM departamento; 

# CUALQUIER TIPO DE CONSULTA SE PUEDE USAR COMO SUBCONSULTA.
-- Dependiendo lo que devuelve, voy a determinar donde la puedo usar.


# ---------------------------------------------  EJEMPLOS  ---------------------------------------------
# Lugares donde puedo usar una subconsulta (hablando de VALORES ESCALARES):

-- Aca el avg() retorna un escalar, entonces lo puedo usar tranquilamente dentro de este otro SELECT
SELECT codigo, nombre, (SELECT avg(gastos) FROM departamento) AS promedio_gastos
FROM departamento;

-- Dentro de un UPDATE, aun referido a un valor escalar
UPDATE departamento 
SET gastos = 100 	-- El valor 100 puede ser reemplazada por una subconsulta.
WHERE nombre = 'abc';

-- Sabemos que podemos hacer lo anterior, ahora usemos una subconsulta:
UPDATE departamento 
SET gastos = (SELECT avg(gastos) FROM departamento)
WHERE nombre = 'abc';
-- NO ME FUNCION ESTO ANTERIOR :V LPM, eso q esta tal cual q la prof hizo, va la prof no mostro todo
-- no ejecuto la query, explico q se puede hacer, pero tampoco escribio la subconsulta dentro de los ()

-- Dentro de una sentencia FROM....  No termino la profe de dar el ejemplo.. No se entendio.

-- Dentro de un WHERE. La forma mas comun:
SELECT codigo, nombre, gastos
FROM departamento
WHERE gastos > (SELECT avg(gastos) FROM departamento);

-- Otra forma igual a la consulta anterior, pero agregando una columna para mostrar el promedio
SELECT codigo, nombre, gastos,  
	   (SELECT avg(gastos) FROM departamento) AS promedio
FROM departamento
WHERE gastos > (SELECT avg(gastos) FROM departamento);

-- Dentro del HAVING:
SELECT codigo_departamento, count(*) 
FROM empleado
GROUP BY codigo_departamento
HAVING count(*) > 2; -- Recordando con este ejemplo el concepto de GROUP BY y de HAVVING. El valor 2, puede ser 
					 -- reemplezado por una subconsulta. 
					 -- Pero justo no habia un ejemplo de una subconsulta para reemplazar.


# ----------------------------------  Ejemplos de cosas que estan mal:  ---------------------------------
# Siguiendo con los valores escalaras:

-- La subconsulta SELECT retorna una matriz, asi q esta mal, no se puede mostrar tal cosa, matriz dentro de otra matriz
SELECT codigo, nombre, (SELECT * FROM departamento) AS promedio_gastos
FROM departamento;

-- Parecida a la anterior.
-- La subconsulta SELECT retorna una columna/LISTA, no se puede mostrar tal cosa, lista dentro de una matriz
SELECT codigo, nombre, (SELECT gastos FROM departamento) AS promedio_gastos
FROM departamento;


# -----------------------------  SUBCONSULTAS DE LISTAS - EJEMPLOS  -----------------------------
# Lugares donde puedo usar tal tipo de subconsulta 

-- En la clausula WHERE de cualquier consulta que use el operador IN, ALL, SOME, ANY

 #Primero el ejemplo de lo que no se puede hacer:
SELECT * FROM departamento 
WHERE gastos > (SELECT gastos FROM departamento WHERE presupuesto > 120000);
 -- Osea, no se puede usar operadores: <, >, <>, ni el >=, <=, para comparar con una lista de valores.
 -- Se puede comparar con un unico valor, ahi si podemos usar subconsultas escalares.
 
 -- Recordandoo el uso del IN:
 -- Aca estamos diciendo que me liste los deptos que tengan gastos igual a 1k, 3k, o 6k.
SELECT * FROM departamento 
WHERE gastos IN (1000, 3000, 6000); 
#WHERE gastos = 1000 OR gastos = 3000 OR gastos = 6000; -- Esta linea es equivalente a la anterior linea.
 
 # Ahora si, el ejemplo:
 -- Aca, en la subconsulta, estamos diciendo que nos liste los gastos de los deptos que tienen presupuesto > 120000. 
 -- Ahora, quiero saber toda la informacion de los deptos que tienen gastos = a los gastos de esa lista anterior.
SELECT * FROM departamento 
WHERE gastos IN (SELECT gastos FROM departamento WHERE presupuesto > 120000);

 #NOTA: tranquilamente podemos usar la siguiente consulta y asi evitar usar una subconsulta.... 
 # Pero la profe, con la consulta anterior nos dio un ejemplo.
SELECT * FROM departamento WHERE presupuesto > 120000;

-- Otro ejemplo de subconsultas que retornan lista, usandolas en un where:
-- Aca vemos a los empleados que pertenecen a los departamentos que tienen gastos > 100k 
SELECT * FROM empleado
WHERE codigo_departamento IN (SELECT codigo FROM departamento WHERE gastos > 100000);

-- El mismo resultado que la consulta anterior, pero con JOIN:
SELECT * FROM empleado e
LEFT JOIN departamento d ON e.codigo_departamento = d.codigo 
WHERE gastos > 100000;
#WHERE d.gastos > 100000; -- Notar que no hace falta acceder al atributo de esta forma
 
 #NOTA: SIEMPRE CONVIENE EL JOIN ANTES QUE LA SUBCONSULTA. La subconsulta realiza mucho mas trabajo del procesador.
 #	   Porque con la subconsulta hace 2 consultas, con el JOIN no.

-- Aca queremos ver la informacion de empleados + deptos, donde los gastos sean >= al de TODOS de esa lista retornada.
SELECT * FROM empleado e 
JOIN departamento d ON e.codigo_departamento = d.codigo 
WHERE gastos >= ALL (SELECT gastos FROM departamento WHERE gastos > 100000);

-- Idem a consulta anterior, donde sea >= al de ALGUNO de esa lista retornada.
SELECT * FROM empleado e 
JOIN departamento d ON e.codigo_departamento = d.codigo 
WHERE gastos >= ANY (SELECT gastos FROM departamento WHERE gastos > 100000);

-- En de la clausula FROM de una instruccion SELECT como tabla derivada de varias filas y una columna

-- En de la clausula WHERE, cuando usa la funcion EXISTS o NOT EXISTS para verificar la existencia 
-- de valores en la lista
 #Faltaron ejemplos para estos dos ultimos...


# ----------------  SUBCONSULTAS QUE RETORNAN MATRICES - EJEMPLOS de donde podemos usarlas  ----------------

-- En la clausula FROM de una instruccion SELECT como tabla derivada de varias filas y columnas. O en un JOIN.
SELECT * 
FROM (SELECT * FROM empleado WHERE codigo_departamento IS NOT NULL) AS empleados_con_deptos;
-- Esta ultima consulta no se quiere hacer una consulta sobre el total..
-- Aveces es mejor hacerlo de esta forma, el FROM hacerlo de una vista PARCIAL. Que se va acrear ahi, en la subc.
-- Esto tambien lo podemos guardar como un objeto en la BD, objeto llamado VIEWS, que actua de la misma forma.
-- Para poder consultarlo cuando quiero. Guardarlo en este objeto tiene un costo menor que hacer la subc.

-- En la clausula WHERE, cuando se usa la funcion EXISTS o NO EXISTS para verificar la existencia de valores 
-- en la lista. La funcion EXISTS solo devuelve true si existe al menos una fila o false si no devuelve ninguna fila.
SELECT * FROM empleado e
JOIN departamento d ON e.codigo_departamento = d.codigo 
WHERE EXISTS (SELECT 1 FROM departamento WHERE gastos IS NOT null);
-- El valor 1 esta para retornar algo que represente un valor. Como el EXISTS no se va a fijar que devuelve la subconsulta, sino
-- en que devuelva algo, entonces no hace falta retornar un valor de la tabla.
-- Por lo general el Existe se usa cuando tiene que evaluar algo en ambos consultas, es decir en subconsultas relacionadas.


# --------------------------  SUBCONSULTAS RELACIONADAS  --------------------------
-- Son subconsultas que dependen de valores devueltos por la consulta exterior.
-- No pueden ejecutarse en forma independiente.
-- Se ejecuta una vez por cada fila de la consulta exterior.
-- Pueden ser escalares, listas o matrices.

-- EJEMPLO: aca la subconsulta no es independiente de la consulta general.
-- Se van ejecutando las dos al mismo tiempo.
SELECT * FROM empleado e
JOIN departamento d1 ON e.codigo_departamento = d1.codigo
WHERE gastos >= (SELECT avg(gastos) FROM departamento d2 WHERE d2.codigo = d1.codigo);




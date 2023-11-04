
SELECT * FROM Empleado;

SELECT * FROM Departamento;


# Me trae los registros "INTERSECCION" entre las dos tablas
-- Si hay algun empleado que tenga null en el idDepartamento, entonces, no lo va a traer, porq en la tabla no hay ningun dep con null
SELECT * FROM Empleado e
INNER JOIN Departamento AS d 
ON e.idDepartamento  = d.idDepartamento; 


# Ademas de lo anterior, quiero a todos los que tengan sueldo > 1000
SELECT * FROM Empleado e
INNER JOIN Departamento d ON e.idDepartamento  = d.idDepartamento 
WHERE e.sueldo > 0;

# Con LEFT JOIN, me traigo todos los empleados y dep's obvio, pero si no tiene asignado ningun dep -> muestra todos
# los atributos del departamento con null. La idea es mostrar todos los empleados + a q depto pertenece etc. 
# O mas bien, mostrar todos los datos que pertenezcan al conjunta A, primer tabla q se pasa o la de la izq :v
# mas los datos de la segunda tabla (derecha), y si no tiene ninguno asignado, entonces todo null.
SELECT * FROM Empleado e  
LEFT JOIN Departamento d 
ON e.idDepartamento = d.idDepartamento;

# ACA importa mostrar TODOS los departamentos, los que tienen empleados y los que NO!
# Si el departamento NO tiene asignado a ningun empleado -> muestra todos los atributos del empleado con null
# Pero la idea es mostrar todos los departamentos.. O como en el coment anterior, traer todos los registros del
# segundo conjunto/tabla mas la info de la primera tabla, y al igual q antes, si no tienen ningun empleado asignado, 
# entonces muestra todo null la parte del empleado.
SELECT * FROM Empleado e  
RIGHT JOIN Departamento d 
ON e.idDepartamento = d.idDepartamento;


# Pusimos las tablas al revez, osea, primero la de Departamento y luego la de Empleado
# y me trae al igual que antes, todos los departamentos, mas los empleados q estan en tales dep's y si
# no hay ninguno asignado a algun dep, entonces le pone todo NULL a la parte donde tendria que estar el empleado.
SELECT * FROM Departamento d
LEFT JOIN Empleado e 
ON e.idDepartamento = d.idDepartamento;


# El unico dato que nos puede asegurar que no haya NULOS es la CLAVE PRIMARIA. 
# Entonces si queremos ver todos los departamentos donde hayan empleados:
SELECT * FROM Departamento d
LEFT JOIN Empleado e ON e.idDepartamento = d.idDepartamento
WHERE e.idEmpleado IS NOT NULL;

# Si quiero saber los departamentos donde no hay ningun empleado asignado:
SELECT * FROM Departamento d
LEFT JOIN Empleado e ON e.idDepartamento = d.idDepartamento
WHERE e.idEmpleado IS NULL;

# Creamos una tercera tabla para hacer consultas entre mas de 2 tablas  -----
CREATE TABLE Categoria 
(
	idCategoria int PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50)
);

-- Me olvide ponerle restricciones al atributo:
ALTER TABLE Categoria 
MODIFY COLUMN nombre varchar(50) NOT NULL UNIQUE;

INSERT INTO categoria 
(nombre) VALUES 
("A"),
("B"),
("C");

SELECT * FROM Categoria;
# -----
ALTER TABLE Departamento 
ADD COLUMN idCategoria INT;

ALTER TABLE Departamento 
ADD CONSTRAINT fk_idCategoria 
FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria);
# ----
# Aca puedo observar que no se puede eliminar un atributo que sea FK, pimero debo eliminar la FK
# y luego recien, eliminar el atributo/columna
ALTER TABLE Departamento DROP FOREIGN KEY fk_idCategoria;
ALTER TABLE Departamento DROP COLUMN idCategoria;

# Lo anterior, de la linea 79 a 84, lo puedo hacer en una misma query
# Agrega la columna nueva, que a su vez va a ser una FK que se relaciona con la tabla Categoria.
ALTER TABLE Departamento
ADD COLUMN idCategoria INT,
ADD CONSTRAINT fk_idCategoria 
FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria);

## -------------------------------------------

SELECT * FROM Empleado;

SELECT * FROM Departamento;

SELECT * FROM Categoria;

# Haciendo JOINS con mas de 2 tablas:
SELECT * FROM Empleado e
LEFT JOIN Departamento d ON e.idDepartamento = d.idDepartamento
LEFT JOIN Categoria c ON c.idCategoria = d.idCategoria;
# Aca el ORDEN ES IMPORTANTE. Estamos vinculando primero los empleados con los departamentos. 
# Y luego a esos departamentos, los vinculamos con sus categorias..


SELECT * FROM Empleado e
LEFT JOIN Categoria c ON c.idCategoria = d.idCategoria
LEFT JOIN Departamento d ON e.idDepartamento = d.idDepartamento;
# Esto nos da un error, porque el ORDEN IMPORTA. No podemos poner condiciones de columnas que aun no tenemos vinculadas.
# NO PODEMOS SALTEARNOS Y MEZCLAR EL ORDEN... 
# Empleado tiene un FK con departamentos. Listo hago el JOIN, se indexan las tablas, ahora puedo trabajar a traves del departamento!
# El depto tiene una FK con la tabla categorias, idCategoria. Puedo hacer otro JOIN
# de departamento, con la tabla que la FK tiene asociada, categorias.


# Listar todos los empleados que tengan un departamento, cuya categoria sea A.
SELECT * FROM Empleado e
LEFT JOIN Departamento d ON e.idDepartamento = d.idDepartamento
LEFT JOIN Categoria c ON c.idCategoria = d.idCategoria
WHERE c.nombre = 'A';



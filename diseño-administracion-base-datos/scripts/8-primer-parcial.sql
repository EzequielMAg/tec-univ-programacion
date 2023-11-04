
CREATE TABLE IF NOT EXISTS TRABAJADORES_X_CATEGORÍAS (
IdTrabajadorXCategoría INT AUTO_INCREMENT,
IdTrabajador INT NOT NULL,
IdCategoria INT NOT NULL,

CONSTRAINT PK_ID_TRABAJADOR_X_CATEGORIA PRIMARY KEY (IdTrabajadorXCategoria),
CONSTRAINT FK_ID_TRABAJADOR FOREIGN KEY (IdTrabajador) REFERENCES TRABAJADORES (IdEmpleado),
CONSTRAINT FK_ID_CATEGORIA FOREIGN KEY (IdCategoria) REFERENCES CATEGORIAS (IdCategoria)
);
ALTER TABLE TRABAJADORES DROP COLUMN IdCategoriaProf;



# ------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TRABAJADORES_X_CATEGORÍAS (

IdTrabajadorXCategoría INT AUTO_INCREMENT,
IdTrabajador INT NOT NULL,
IdCategoria INT NOT NULL,

CONSTRAINT PK_ID_TRABAJADOR_X_CATEGORIA PRIMARY KEY (IdTrabajadorXCategoria),
CONSTRAINT FK_ID_TRABAJADOR FOREIGN KEY (IdTrabajador) REFERENCES TRABAJADORES (IdEmpleado),
CONSTRAINT FK_ID_CATEGORIA FOREIGN KEY (IdCategoria) REFERENCES CATEGORIAS (IdCategoria)

);

ALTER TABLE CATEGORÍAS ADD IdTrabajador INT NOT NULL;
ALTER TABLE CATEGORÍAS ADD CONSTRAINT FK_ID_TRABAJADOR (IdTrabajador) REFERENCES TRABAJADORES (IdEmpleado);

# ------------------------------------------------------------------------




b.
SELECT V.VOTOS  as ‘cantidad de votos del partido’, M.MESA
FROM PARTIDOS as P
INNER JOIN VOTOS as V ON P.ID_PARTIDO = V.ID_PARTIDO
INNER JOIN MESAS as M ON V.ID_MESA = M.ID_MESA
WHERE P.PARTIDO = ‘UTN’;


d.
SELECT V.VOTOS, M.MESA
FROM VOTOS as V
INNER JOIN MESAS as M ON V.ID_MESA = M.ID_MESA
INNER JOIN PARTIDOS as P ON P.ID_PARTIDO = V.ID_PARTIDO
WHERE P.PARTIDO = ‘UTN’









CREATE DATABASE `segundo-parcial-bd`;

USE `segundo-parcial-bd`;

/*
CREATE TABLE Ciudades (
    CiudadId INT PRIMARY KEY AUTO_INCREMENT,
    Ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE Trayectos (
    TrayectoID INT PRIMARY KEY AUTO_INCREMENT,
    Origen INT NOT NULL,
    Destino INT NOT NULL,
    Distancia INT NOT NULL,
    FOREIGN KEY (Origen) REFERENCES Ciudades(CiudadId),
    FOREIGN KEY (Destino) REFERENCES Ciudades(CiudadId)
);

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY  AUTO_INCREMENT,
    Cliente VARCHAR(50) NOT NULL,
    Categoria CHAR(1) NOT NULL
);

CREATE TABLE Viajes (
    ClienteID INT,
    TrayectoID INT,
    Fecha DATETIME NOT NULL,
    PRIMARY KEY (ClienteID, TrayectoID, Fecha),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (TrayectoID) REFERENCES Trayectos(TrayectoID)
);


-- Insertar datos en Ciudades
INSERT INTO Ciudades (CiudadId, Ciudad) VALUES
(1, 'Ciudad1'),
(2, 'Ciudad2'),
(3, 'Ciudad3');

-- Insertar datos en Trayectos
INSERT INTO Trayectos (TrayectoID, Origen, Destino, Distancia) VALUES
(1, 1, 2, 100),
(2, 2, 3, 150),
(3, 1, 3, 200);

-- Insertar datos en Clientes
INSERT INTO Clientes (ClienteID, Cliente, Categoria) VALUES
(1, 'Juan', 'A'),
(2, 'Pedro', 'B');

-- Insertar datos en Viajes
INSERT INTO Viajes (ClienteID, TrayectoID, Fecha) VALUES
(1, 1, '2021-01-01'),
(1, 2, '2021-02-15'),
(1, 3, '2021-03-20'),
(1, 1, '2023-04-10'),
(1, 3, '2023-05-05'),
(2, 1, '2021-06-30'),
(2, 3, '2023-07-15');

*/

# -------------------------------------------------------------------------------------
# 1.a.
SELECT
    c.Cliente,
    SUM(CASE WHEN YEAR(v.Fecha) = 2021 THEN 1 ELSE 0 END) AS '2021',
    SUM(CASE WHEN YEAR(v.Fecha) = 2022 THEN 1 ELSE 0 END) AS '2022',
    SUM(CASE WHEN YEAR(v.Fecha) = 2023 THEN 1 ELSE 0 END) AS '2023'
FROM
    Clientes c
    LEFT JOIN Viajes v ON c.ClienteID = v.ClienteID
WHERE
    YEAR(v.Fecha) BETWEEN 2021 AND 2023
GROUP BY
    c.Cliente;

# 1.a. SEGUNDA FORMA PASADA POR JUANMAA   
SELECT
    c.Cliente,
    COUNT(CASE WHEN YEAR(v.Fecha) = 2021 THEN 1 ELSE NULL END) AS "2021",
    COUNT(CASE WHEN YEAR(v.Fecha) = 2022 THEN 1 ELSE NULL END) AS "2022",
    COUNT(CASE WHEN YEAR(v.Fecha) = 2023 THEN 1 ELSE NULL END) AS "2023"
FROM
    Clientes c
LEFT JOIN
    Viajes v ON c.ClienteId = v.ClienteId
GROUP BY
    c.Cliente;

   
# -------------------------------------------------------------------------------------
   -- Asumiendo que CiudadId 1 es 'Mar del plata' y CiudadId 2 es 'Córdoba'
-- Insertar más viajes en el año 2023 que en 2022 para Mar del plata y Córdoba
INSERT INTO Viajes (ClienteID, TrayectoID, Fecha) VALUES
(1, 1, '2022-01-01'),  -- Viaje en 2022 desde Mar del plata
(1, 1, '2022-02-15'),  -- Viaje en 2022 desde Mar del plata
(1, 2, '2022-03-20'),  -- Viaje en 2022 desde Córdoba
(1, 2, '2022-04-10'),  -- Viaje en 2022 desde Córdoba
(1, 1, '2023-05-05'),  -- Viaje en 2023 desde Mar del plata
(1, 2, '2023-06-30'),  -- Viaje en 2023 desde Córdoba
(1, 2, '2023-07-15'),  -- Viaje en 2023 desde Córdoba
(1, 2, '2023-08-20');  -- Viaje en 2023 desde Córdoba

# -------------------------------------------------------------------------------------
   
#1)b) de juanmaaaa
SELECT
    C.Ciudad AS Origen,
    SUM(CASE WHEN YEAR(V.Fecha) = 2023 THEN 1 ELSE 0 END) AS cantidad_viajes
FROM
    Ciudades C
JOIN Trayectos T ON C.CiudadId = T.Origen
JOIN Viajes V ON T.TrayectoId = V.TrayectoId
WHERE YEAR(V.Fecha) IN (2022, 2023)
GROUP BY  C.CiudadId, C.Ciudad
HAVING
    SUM(CASE WHEN YEAR(V.Fecha) = 2023 THEN 1 ELSE 0 END) >
    SUM(CASE WHEN YEAR(V.Fecha) = 2022 THEN 1 ELSE 0 END);
   
# -------------------------------------------------------------------------------------
#1.C REVISARRRRRRRRRRRRRRR parece que es la misma consulta de amvbos lados
SELECT
    'Mar del Plata' AS Ciudad,
    COUNT(*) AS CantidadViajes
FROM
    Ciudades C
JOIN
    Trayectos T ON C.CiudadId = T.Origen
JOIN
    Viajes V ON T.TrayectoId = V.TrayectoId
WHERE
    C.Ciudad = 'Mar del Plata'

UNION

-- Cantidad de viajes hacia "Mar del Plata"
SELECT
    'Mar del Plata' AS Ciudad,
    COUNT(*) AS CantidadViajes
FROM
    Ciudades C
JOIN
    Trayectos T ON C.CiudadId = T.Destino
JOIN
    Viajes V ON T.TrayectoId = V.TrayectoId
WHERE
    C.Ciudad = 'Mar del Plata';
   
# flor me lo paso;: ----------------------------
   -- Viajes con origen en "Mar del Plata"
SELECT
    COUNT(*) AS cantidad_viajes
FROM viajes v
JOIN trayectos t ON v.trayectoId = t.trayectoId
JOIN ciudades c ON t.origen = c.ciudadId
WHERE c.ciudad = 'Mar del Plata'

UNION

-- Viajes con destino en "Mar del Plata"
SELECT
    COUNT(*) AS cantidad_viajes
FROM viajes v
JOIN trayectos t ON v.trayectoId = t.trayectoId
JOIN ciudades c ON t.destino = c.ciudadId
WHERE c.ciudad = 'Mar del Plata';
   
#2) 
CREATE PROCEDURE InsertarViajeClienteNuevo(
    IN p_NombreCliente NVARCHAR(50),
    IN p_CategoriaCliente CHAR(1),
    IN p_IdTrayecto INT,
    IN p_FechaViaje DATETIME
)
BEGIN
    -- Declarar variables para almacenar el nuevo ClienteId
    DECLARE NuevoClienteId INT;
    
    -- Insertar nuevo cliente
    INSERT INTO Clientes (Cliente, Categoria)
    VALUES (p_NombreCliente, p_CategoriaCliente);

    -- Obtener el ClienteId del nuevo cliente
    SET NuevoClienteId = LAST_INSERT_ID();

    -- Insertar nuevo viaje
    INSERT INTO Viajes (ClienteId, TrayectoId, Fecha)
    VALUES (NuevoClienteId, p_IdTrayecto, p_FechaViaje);
END 
   






CALL InsertarViajeClienteNuevo("Juan", 'A', 1, '2021-01-01 00:00:00');

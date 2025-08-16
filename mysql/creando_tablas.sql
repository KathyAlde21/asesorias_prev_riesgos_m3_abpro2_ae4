-- =============================================================
-- ABPRO2 AE4 – MODELO ENTIDAD RELACIÓN (DDL) - TABLA INICIAL
-- Autores: Giorgio Interdonato, Katherine Alderete, Katrina González
-- Generado en MySQL según modelo Crow’s Foot
-- =============================================================
-- 1) CLIENTE
-- ======================================================
CREATE TABLE cliente (
  rutcliente        INT PRIMARY KEY NOT NULL,
  nombres           VARCHAR(30) NOT NULL,
  apellidos         VARCHAR(30) NOT NULL,
  telefono          VARCHAR(20) NOT NULL,
  afp               VARCHAR(30),
  sistemasalud      INT,
  direccion         VARCHAR(70),
  comuna            VARCHAR(50),
  edad              SMALLINT NOT NULL
 -- CONSTRAINT Cliente_PK PRIMARY KEY (rutcliente)
);

-- ======================================================
-- 2) CAPACITACION
-- ======================================================
CREATE TABLE capacitacion (
  idcapacitacion INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  fecha DATE,
  hora TIME,
  lugar VARCHAR(50) NOT NULL,
  duracion INT,
  cantidadasistentes INT NOT NULL,
  Cliente_rutcliente INT NOT NULL,
  -- CONSTRAINT Capacitacion_PK PRIMARY KEY (idcapacitacion),
  KEY Capacitacion_Cliente_FK (Cliente_rutcliente),
  CONSTRAINT Capacitacion_Cliente_FK
    FOREIGN KEY (Cliente_rutcliente)
    REFERENCES cliente (rutcliente)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ======================================================
-- 3) ASISTENTES
-- ======================================================
CREATE TABLE asistentes (
  idasistente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nombres VARCHAR(100) NOT NULL,
  edad TINYINT NOT NULL,
  Capacitacion_idcapacitacion INT NOT NULL,
  -- CONSTRAINT Asistentes_PK PRIMARY KEY (idasistente),
  KEY Asistentes_Capacitacion_FK (Capacitacion_idcapacitacion),
  CONSTRAINT Asistentes_Capacitacion_FK
    FOREIGN KEY (Capacitacion_idcapacitacion)
    REFERENCES capacitacion (idcapacitacion)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ======================================================
-- 4) ACCIDENTE
-- ======================================================
CREATE TABLE accidente (
  accidenteid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  dia DATE,
  hora TIME,
  lugar VARCHAR(50) NOT NULL,
  origen VARCHAR(100),
  consecuencias VARCHAR(100),
  Cliente_rutcliente INT NOT NULL,
  -- CONSTRAINT Accidente_PK PRIMARY KEY (accidenteid),
  KEY Accidente_Cliente_FK (Cliente_rutcliente),
  CONSTRAINT Accidente_Cliente_FK
    FOREIGN KEY (Cliente_rutcliente)
    REFERENCES cliente (rutcliente)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================
-- Verificación rápida
-- ============================
SHOW TABLES;
SHOW CREATE TABLE cliente;
SHOW CREATE TABLE capacitacion;
SHOW CREATE TABLE asistentes;
SHOW CREATE TABLE accidente;

-- =============================================================
-- Fin del DDL
-- =============================================================

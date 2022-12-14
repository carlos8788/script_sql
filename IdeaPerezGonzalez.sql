CREATE SCHEMA IF NOT EXISTS vuelos_comerciales;
use vuelos_comerciales;
CREATE TABLE pasajero (
    id_pasajero INT NOT NULL AUTO_INCREMENT,
    nombre_pasajero VARCHAR(45) NOT NULL,
    apellido_pasajero VARCHAR(45) NOT NULL,
    domicilio VARCHAR(60) NULL,
    PRIMARY KEY (id_pasajero)
);

CREATE TABLE piloto (
    id_piloto INT NOT NULL AUTO_INCREMENT,
    nombre_piloto VARCHAR(45) NOT NULL,
    apellido_piloto VARCHAR(45) NOT NULL,
    antiguedad INT NOT NULL,
    PRIMARY KEY (id_piloto)
);

CREATE TABLE avion (
    id_avion INT NOT NULL AUTO_INCREMENT,
    capacidad INT NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    anio_creacion INT NOT NULL,
    PRIMARY KEY (id_avion)
);

CREATE TABLE ruta (
    id_ruta INT NOT NULL AUTO_INCREMENT,
    origen VARCHAR(45) NOT NULL,
    destino VARCHAR(45) NOT NULL,
    distancia REAL NOT NULL,
    PRIMARY KEY (id_ruta)
);

CREATE TABLE pasaje (
    id_pasaje INT NOT NULL AUTO_INCREMENT,
    asiento VARCHAR(5) NOT NULL,
    id_pasajero INT NOT NULL,
    id_vuelo INT NOT NULL,
    PRIMARY KEY (id_pasaje),
    FOREIGN KEY (id_pasajero) REFERENCES pasajero(id_pasajero)
);

CREATE TABLE vuelo (
    id_vuelo INT NOT NULL AUTO_INCREMENT,
    horario_vuelo DATETIME NOT NULL,
    id_piloto INT NOT NULL,
    id_ruta INT NOT NULL,
    id_avion INT NOT NULL,
    PRIMARY KEY (id_vuelo),
    FOREIGN KEY (id_piloto) REFERENCES piloto(id_piloto),
    FOREIGN KEY (id_ruta) REFERENCES ruta(id_ruta),
    FOREIGN KEY (id_avion) REFERENCES avion(id_avion)
);

ALTER TABLE pasaje ADD FOREIGN KEY (id_vuelo) REFERENCES vuelo(id_vuelo);









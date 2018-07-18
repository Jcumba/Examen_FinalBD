-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-07-18 14:45:57.902
CREATE DATABASE TioJuanito
GO
-- tables
-- Table: Apoderador

USE TioJuanito
GO

CREATE TABLE Apoderador (
    cod_apod int  NOT NULL,
    dni_apod int  NOT NULL,
    nom_apod varchar(50)  NOT NULL,
    ape_apod varchar(50)  NOT NULL,
    sexo_apod char(1)  NOT NULL,
    CONSTRAINT Apoderador_pk PRIMARY KEY  (cod_apod)
);

-- Table: Bus
CREATE TABLE Bus (
    cod_bus int  NOT NULL,
    placa_bus varchar(10)  NOT NULL,
    color_bus varchar(25)  NOT NULL,
    papeletas_bus int  NOT NULL,
    CONSTRAINT Bus_pk PRIMARY KEY  (cod_bus)
);

-- Table: Colegio
CREATE TABLE Colegio (
    cod_cole int  NOT NULL,
    desc_cole int  NOT NULL,
    CONSTRAINT Colegio_pk PRIMARY KEY  (cod_cole)
);

-- Table: Contrado
CREATE TABLE Contrado (
    cod_cont int  NOT NULL,
    fec_cont date  NOT NULL,
    tiempo_cont varchar(25)  NOT NULL,
    Apoderador_cod_apod int  NOT NULL,
    Turno_cod_turno int  NOT NULL,
    CONSTRAINT Contrado_pk PRIMARY KEY  (cod_cont)
);

-- Table: Hijo
CREATE TABLE Hijo (
    cod_hijo int  NOT NULL,
    nom_hijo varchar(50)  NOT NULL,
    ape_hijo varchar(50)  NOT NULL,
    dir_hijo varchar(50)  NOT NULL,
    Apoderador_cod_apod int  NOT NULL,
    Colegio_cod_cole int  NOT NULL,
    CONSTRAINT Hijo_pk PRIMARY KEY  (cod_hijo)
);

-- Table: Papeleta
CREATE TABLE Papeleta (
    cod_papeleta int  NOT NULL,
    desc_papeleta varchar(100)  NOT NULL,
    fecha_papeleta date  NOT NULL,
    Viaje_cod_viaje int  NOT NULL,
    CONSTRAINT Papeleta_pk PRIMARY KEY  (cod_papeleta)
);

-- Table: Trabajador
CREATE TABLE Trabajador (
    cod_tbjr int  NOT NULL,
    dni_tbjr int  NOT NULL,
    nom_tbjr varchar(50)  NOT NULL,
    ape_tbjr varchar(50)  NOT NULL,
    sexo_tbjr char(1)  NOT NULL,
    tip_tbjr char(1)  NOT NULL,
    CONSTRAINT Trabajador_pk PRIMARY KEY  (cod_tbjr)
);

-- Table: Turno
CREATE TABLE Turno (
    cod_turno int  NOT NULL,
    tip_turno varchar(50)  NOT NULL,
    horainicio_turno datetime  NOT NULL,
    horafin_turno datetime  NOT NULL,
    Trabajador_cod_tbjr int  NOT NULL,
    CONSTRAINT Turno_pk PRIMARY KEY  (cod_turno)
);

-- Table: Viaje
CREATE TABLE Viaje (
    cod_viaje int  NOT NULL,
    ksalida_viaje varchar(25)  NOT NULL,
    kregreso_viaje varchar(25)  NOT NULL,
    Bus_cod_bus int  NOT NULL,
    Turno_cod_turno int  NOT NULL,
    CONSTRAINT Viaje_pk PRIMARY KEY  (cod_viaje)
);


----------------------------------------------------------> Relaciones <-----------------------------------------------------

-- foreign keys
-- Reference: Contrado_Apoderador (table: Contrado)
ALTER TABLE Contrado ADD CONSTRAINT Contrado_Apoderador
    FOREIGN KEY (Apoderador_cod_apod)
    REFERENCES Apoderador (cod_apod);

-- Reference: Contrado_Turno (table: Contrado)
ALTER TABLE Contrado ADD CONSTRAINT Contrado_Turno
    FOREIGN KEY (Turno_cod_turno)
    REFERENCES Turno (cod_turno);

-- Reference: Hijo_Apoderador (table: Hijo)
ALTER TABLE Hijo ADD CONSTRAINT Hijo_Apoderador
    FOREIGN KEY (Apoderador_cod_apod)
    REFERENCES Apoderador (cod_apod);

-- Reference: Hijo_Colegio (table: Hijo)
ALTER TABLE Hijo ADD CONSTRAINT Hijo_Colegio
    FOREIGN KEY (Colegio_cod_cole)
    REFERENCES Colegio (cod_cole);

-- Reference: Papeleta_Viaje (table: Papeleta)
ALTER TABLE Papeleta ADD CONSTRAINT Papeleta_Viaje
    FOREIGN KEY (Viaje_cod_viaje)
    REFERENCES Viaje (cod_viaje);

-- Reference: Turno_Trabajador (table: Turno)
ALTER TABLE Turno ADD CONSTRAINT Turno_Trabajador
    FOREIGN KEY (Trabajador_cod_tbjr)
    REFERENCES Trabajador (cod_tbjr);

-- Reference: Viaje_Bus (table: Viaje)
ALTER TABLE Viaje ADD CONSTRAINT Viaje_Bus
    FOREIGN KEY (Bus_cod_bus)
    REFERENCES Bus (cod_bus);

-- Reference: Viaje_Turno (table: Viaje)
ALTER TABLE Viaje ADD CONSTRAINT Viaje_Turno
    FOREIGN KEY (Turno_cod_turno)
    REFERENCES Turno (cod_turno);

-- End of file.


-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-07-18 14:45:57.902
CREATE DATABASE TioJuanito;
-- tables
-- Table: Apoderador

USE TioJuanito;


CREATE TABLE Apoderador (
    cod_apod int  ,
    dni_apod int  ,
    nom_apod varchar(50)  ,
    ape_apod varchar(50)  ,
    sexo_apod char(1)  ,
    CONSTRAINT Apoderador_pk PRIMARY KEY  (cod_apod)
);

-- Table: Bus
CREATE TABLE Bus (
    cod_bus int  ,
    placa_bus varchar(10)  ,
    color_bus varchar(25)  ,
    papeletas_bus int  ,
    CONSTRAINT Bus_pk PRIMARY KEY  (cod_bus)
);

-- Table: Colegio
CREATE TABLE Colegio (
    cod_cole int  ,
    desc_cole varchar(50) ,
    CONSTRAINT Colegio_pk PRIMARY KEY  (cod_cole)
);

-- Table: Contrado
CREATE TABLE Contrado (
    cod_cont int  ,
    fec_cont date  ,
    tiempo_cont varchar(25)  ,
    Apoderador_cod_apod int  ,
    Turno_cod_turno int  ,
    CONSTRAINT Contrado_pk PRIMARY KEY  (cod_cont)
);

-- Table: Hijo
CREATE TABLE Hijo (
    cod_hijo int  ,
    nom_hijo varchar(50)  ,
    ape_hijo varchar(50)  ,
    dir_hijo varchar(50)  ,
    Apoderador_cod_apod int  ,
    Colegio_cod_cole int  ,
    CONSTRAINT Hijo_pk PRIMARY KEY  (cod_hijo)
);

-- Table: Papeleta
CREATE TABLE Papeleta (
    cod_papeleta int  ,
    desc_papeleta varchar(100)  ,
    fecha_papeleta date  ,
    Viaje_cod_viaje int  ,
    CONSTRAINT Papeleta_pk PRIMARY KEY  (cod_papeleta)
);

-- Table: Trabajador
CREATE TABLE Trabajador (
    cod_tbjr int  ,
    dni_tbjr int  ,
    nom_tbjr varchar(50)  ,
    ape_tbjr varchar(50)  ,
    sexo_tbjr char(1)  ,
    tip_tbjr char(1)  ,
    CONSTRAINT Trabajador_pk PRIMARY KEY  (cod_tbjr)
);

-- Table: Turno
CREATE TABLE Turno (
    cod_turno int  ,
    tip_turno varchar(50)  ,
    horainicio_turno datetime  ,
    horafin_turno datetime  ,
    Trabajador_cod_tbjr int  ,
    CONSTRAINT Turno_pk PRIMARY KEY  (cod_turno)
);

-- Table: Viaje
CREATE TABLE Viaje (
    cod_viaje int  ,
    ksalida_viaje varchar(25)  ,
    kregreso_viaje varchar(25)  ,
    Bus_cod_bus int  ,
    Turno_cod_turno int  ,
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


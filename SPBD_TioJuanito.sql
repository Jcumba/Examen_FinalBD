---- sp de la empresa de transporte el Tio Juanito -----

USE TIOJUANITO
GO

-- Insertar datos para registrar un nuevo trabajador en BD el TIO JUANITO ---
CREATE PROCEDURE sp_ingresartbjr
@DNI int,
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@SEXO char(1),
@TIPO char(1)
AS
    BEGIN
        INSERT INTO Empleado
        (dni_tbjr,nom_tbjr,ape_tbjr,sexo_tbjr,tip_tbjr)
    VALUES  
                (UPPER(@DNI),UPPER(@NOMBRE),UPPER(@APELLIDO),UPPER(@SEXO),UPPER(@TIPO))

END
GO


-- Insertar datos para registrar un nuevo Hijo en BD el TIO JUANITO ---
CREATE PROCEDURE sp_ingresarhijo
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@DIRECCION VARCHAR(50),
@APODERADO int,
@COLEGIO int
AS
    BEGIN
        INSERT INTO Hijo
        (nom_hijo,ape_hijo,dir_hijo,Apoderador_cod_apod,Colegio_cod_cole)
    VALUES  
                (UPPER(@NOMBRE),UPPER(@APELLIDO),UPPER(@DIRECCION),UPPER(@APODERADO),UPPER(@COLEGIO))

END
GO


-- Insertar datos para registrar un nuevo Apoderado en BD el TIO JUANITO ---
CREATE PROCEDURE sp_ingresarApo
@DNI int,
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@SEXO char(1)
AS
    BEGIN
        INSERT INTO Apoderador
        (dni_apod,nom_apod,ape_apod,sexo_apod)
    VALUES  
                (UPPER(@DNI),UPPER(@NOMBRE),UPPER(@APELLIDO),UPPER(@SEXO))

END
GO

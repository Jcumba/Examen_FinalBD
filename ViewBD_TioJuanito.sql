---- Vistas de la empresa de transporte el Tio Juanito -----

USE TIOJUANITO
GO

---- Primera Vista de la empresa de transporte el Tio Juanito donde nos mostrara al niño, el colegio en el que esta, la urbanización y su el nombre de turno-----
CREATE VIEW vw_Niño
AS
SELECT CONCAT(nom_hijo,' ',ape_hijo) AS 'Niño', Colegio.desc_cole AS 'Colegio', 
Hijo.dir_hijo AS 'Urbanización', Turno.tip_turno
FROM Hijo
INNER JOIN Colegio
ON  Hijo.cod_hijo = Colegio.cod_cole
INNER JOIN Turno
ON Hijo.cod_hijo = Turno.cod_turno;
GO

SELECT * FROM vw_Niño;

---- Segunda Vista de la empresa de transporte el Tio Juanito donde nos mostrara al niño, la urbanización y la hora en que lo recogen y le dejan de su casa-----
CREATE VIEW vw_niño2
AS
SELECT CONCAT(nom_hijo,' ',ape_hijo) AS 'Niño',
Hijo.dir_hijo AS 'Urbanización', Turno.horainicio_turno AS 'Recoje',  Turno.horafin_turno AS 'Retorna'
FROM Hijo
INNER JOIN Turno
ON Hijo.cod_hijo = Turno.cod_turno
GO

SELECT * FROM vw_niño2;


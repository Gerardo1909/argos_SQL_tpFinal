-- Aquí va el código de busqueda sobre 2 claves de una tabla

SELECT * FROM historial_orbita
WHERE altitud > 20000 
AND inclinacion <= 90;
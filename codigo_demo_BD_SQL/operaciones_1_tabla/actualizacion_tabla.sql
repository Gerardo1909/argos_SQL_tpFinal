-- Aquí va el código de actualización de una tabla
UPDATE imagen
SET url_imagen = REGEXP_REPLACE(url_imagen, '.jpg', '.png')
WHERE url_imagen LIKE '.jpg';
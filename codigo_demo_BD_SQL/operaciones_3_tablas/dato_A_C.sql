SELECT 
    tipo_satelite.tipo_satelite,
    COUNT(mision_satelite.id_mision) AS cantidad_misiones
FROM tipo_satelite
    JOIN satelite ON satelite.id_tipo_satelite = tipo_satelite.id_tipo_satelite
    JOIN mision_satelite ON mision_satelite.id_satelite = satelite.id_satelite
GROUP BY tipo_satelite.tipo_satelite
ORDER BY cantidad_misiones DESC;
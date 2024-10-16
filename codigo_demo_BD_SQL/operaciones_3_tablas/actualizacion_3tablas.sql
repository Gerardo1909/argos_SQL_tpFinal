UPDATE mision
SET m.objetivo = 'Exploración del espacio profundo y análisis de recursos'
FROM mision m
JOIN mision_satelite ms ON m.id_mision = ms.id_mision
JOIN satelite s ON ms.id_satelite = s.id_satelite
WHERE s.nombre_satelite = 'Asterion';
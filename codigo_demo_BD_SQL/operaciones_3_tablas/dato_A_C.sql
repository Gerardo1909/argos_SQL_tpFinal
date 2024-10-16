SELECT s.nombre_satelite
FROM mision m
JOIN mision_satelite ms ON m.id_mision = ms.id_mision
JOIN satelite s ON ms.id_satelite = s.id_satelite
WHERE m.nombre_mision = 'Misión Omega';
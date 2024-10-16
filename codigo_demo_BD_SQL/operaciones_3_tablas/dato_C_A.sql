SELECT m.nombre_mision
FROM satelite s
JOIN mision_satelite ms ON s.id_satelite = ms.id_satelite
JOIN mision m ON ms.id_mision = m.id_mision
WHERE s.nombre_satelite = 'Asterion';
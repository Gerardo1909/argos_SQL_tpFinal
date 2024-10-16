SELECT ms.id_mision
FROM satelite s
JOIN mision_satelite ms ON s.id_satelite = ms.id_satelite
WHERE s.nombre_satelite = 'Asterion';
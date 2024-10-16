DELETE FROM mision_satelite
USING mision
WHERE mision_satelite.id_mision = mision.id_mision AND mision.nombre_mision = 'Misión Omega';

DELETE FROM mision
WHERE nombre_mision = 'Misión Omega';

SELECT 
    satelite.nombre_satelite,
    mision_satelite.id_mision
FROM mision_satelite
    JOIN satelite ON satelite.id_satelite = mision_satelite.id_satelite
WHERE satelite.nombre_satelite = 'Erebos';
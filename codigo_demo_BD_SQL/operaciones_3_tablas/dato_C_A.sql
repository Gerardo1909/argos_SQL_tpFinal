SELECT 
    mision_satelite.id_mision,
    tipo_satelite.tipo_satelite
FROM mision_satelite
    JOIN satelite ON satelite.id_satelite = mision_satelite.id_satelite
    JOIN tipo_satelite ON satelite.id_tipo_satelite = tipo_satelite.id_tipo_satelite 
WHERE tipo_satelite.tipo_satelite = 'Comunicaciones';
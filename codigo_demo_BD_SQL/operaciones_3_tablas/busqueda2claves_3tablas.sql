SELECT * FROM satelite s
JOIN estacion_satelite es on es.id_satelite = s.id_satelite
JOIN estacion_terrestre et on et.id_estacion = es.id_estacion_terrestre
WHERE et.id_proposito_estacion = 2 and s.nombre_satelite ilike 'A%'
SELECT * FROM mision_satelites ms
JOIN mision as m on m.id_mision = ms.id_mision
JOIN satelite as s on s.id_satelite = ms.id_satelite
where s.nombre_satelite ilike 'A%'
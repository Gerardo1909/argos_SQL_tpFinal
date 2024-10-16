CREATE INDEX idx_mision_nombre ON mision (nombre_mision); -- Optimiza las búsquedas por nombre de misión
CREATE INDEX idx_mision_satelite_ids ON mision_satelite (id_mision, id_satelite); -- Mejora la eficiencia de los JOIN entre misiones y satélites
CREATE INDEX idx_satelite_nombre ON satelite (nombre_satelite); -- Optimiza las búsquedas por nombre de satélite
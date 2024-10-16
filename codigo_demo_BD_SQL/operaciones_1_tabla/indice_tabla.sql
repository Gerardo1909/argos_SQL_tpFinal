CREATE INDEX index_estacion_satelite ON "estacion_satelite" ("id_estacion_terrestre", "id_satelite");

CREATE INDEX index_historial_orbita ON "historial_orbita" (altitud, inclinacion);
CREATE TABLE "estacion_terrestre" (
	"id_estacion" SERIAL PRIMARY KEY,
	"nombre_estacion" VARCHAR(100),
	"id_ubicacion_estacion" INTEGER,
	"id_proposito_estacion" INTEGER,
	"id_estado_operacion" INTEGER,
	CONSTRAINT fk_ubicacion_estacion FOREIGN KEY ("id_ubicacion_estacion") REFERENCES "ubicacion_estacion"("id_ubicacion_estacion"),
	CONSTRAINT fk_proposito_estacion FOREIGN KEY ("id_proposito_estacion") REFERENCES "proposito_estacion"("id_proposito_estacion"),
	CONSTRAINT fk_estado_operacional FOREIGN KEY ("id_estado_operacion") REFERENCES "estado_operacion"("id_estado_operacion")
);
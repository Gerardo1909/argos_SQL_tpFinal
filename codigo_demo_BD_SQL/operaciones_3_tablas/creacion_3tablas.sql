CREATE TABLE "estacion_satelite" (
	"id_estacion_satelite" SERIAL PRIMARY KEY,
	"id_estacion_terrestre" INTEGER,
	"id_satelite" INTEGER,
	CONSTRAINT fk_estacion_terrestre FOREIGN KEY ("id_estacion_terrestre") REFERENCES "estacion_terrestre"("id_estacion"),
	CONSTRAINT fk_satelite_estacion FOREIGN KEY ("id_satelite") REFERENCES "satelite"("id_satelite")
);

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

CREATE TABLE "satelite" (
	"id_satelite" SERIAL PRIMARY KEY,
	"nombre_satelite" VARCHAR(100),
	"fecha_lanzamiento" DATE,
	"id_fabricante" INTEGER,
	"id_tipo_satelite" INTEGER,
	"id_estado" INTEGER,
	CONSTRAINT fk_fabricante FOREIGN KEY ("id_fabricante") REFERENCES "fabricante_satelite"("id_fabricante_satelite"),
	CONSTRAINT fk_tipo_satelite FOREIGN KEY ("id_tipo_satelite") REFERENCES "tipo_satelite"("id_tipo_satelite"),
	CONSTRAINT fk_estado FOREIGN KEY ("id_estado") REFERENCES "estado_satelite"("id_estado_satelite")
);
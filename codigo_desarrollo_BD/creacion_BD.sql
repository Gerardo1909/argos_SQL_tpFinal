CREATE TABLE "estado_satelite" (
	"id_estado_satelite" SERIAL PRIMARY KEY,
	"estado_satelite" VARCHAR(50)
);

CREATE TABLE "tipo_satelite" (
	"id_tipo_satelite" SERIAL PRIMARY KEY,
	"tipo_satelite" VARCHAR(50)
);

CREATE TABLE "tipo_orbita" (
	"id_tipo_orbita" SERIAL PRIMARY KEY,
	"tipo_orbita" VARCHAR(50)
);

CREATE TABLE "fabricante_satelite" (
	"id_fabricante_satelite" SERIAL PRIMARY KEY,
	"nombre_fabricante" VARCHAR(100)
);

CREATE TABLE "estado_operacion" (
	"id_estado_operacion" SERIAL PRIMARY KEY,
	"estado_operacion" VARCHAR(50)
);

CREATE TABLE "ubicacion_estacion" (
	"id_ubicacion_estacion" SERIAL PRIMARY KEY,
	"nombre_ubicacion" VARCHAR(100)
);

CREATE TABLE "proposito_estacion" (
	"id_proposito_estacion" SERIAL PRIMARY KEY,
	"nombre_proposito" VARCHAR(100)
);

CREATE TABLE "mision" (
	"id_mision" SERIAL PRIMARY KEY,
	"nombre_mision" VARCHAR(100),
	"fecha_inicio" DATE,
	"fecha_fin" DATE,
	"objetivo" TEXT
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

CREATE TABLE "observacion" (
	"id_observacion" SERIAL PRIMARY KEY,
	"id_satelite" INTEGER,
	"timestamp_observacion" TIMESTAMP,
	"latitud" DECIMAL(9, 6),  -- Precisión común para coordenadas geográficas
	"longitud" DECIMAL(9, 6), -- Precisión común para coordenadas geográficas
	CONSTRAINT fk_satelite FOREIGN KEY ("id_satelite") REFERENCES "satelite"("id_satelite")
);

CREATE TABLE "imagen" ( 
	"id_imagen" SERIAL PRIMARY KEY,
	"id_observacion" INTEGER UNIQUE,
	"url_imagen" VARCHAR(255),
	"resolucion" VARCHAR(50),
	CONSTRAINT fk_observacion FOREIGN KEY ("id_observacion") REFERENCES "observacion"("id_observacion")
);

CREATE TABLE "mision_satelite" (
	"id_mision_satelite" SERIAL PRIMARY KEY,
	"id_mision" INTEGER,
	"id_satelite" INTEGER,
	CONSTRAINT fk_mision FOREIGN KEY ("id_mision") REFERENCES "mision"("id_mision"),
	CONSTRAINT fk_satelite_mision FOREIGN KEY ("id_satelite") REFERENCES "satelite"("id_satelite")
);

CREATE TABLE "historial_orbita" (
	"id_orbita" SERIAL PRIMARY KEY,
	"id_satelite" INTEGER,
	"id_tipo_orbita" INTEGER,
	"altitud" INTEGER,
	"inclinacion" DECIMAL(5, 2),
	CONSTRAINT fk_satelite_orbita FOREIGN KEY ("id_satelite") REFERENCES "satelite"("id_satelite"),
	CONSTRAINT fk_tipo_orbita FOREIGN KEY ("id_tipo_orbita") REFERENCES "tipo_orbita"("id_tipo_orbita")
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

CREATE TABLE "estacion_satelite" (
	"id_estacion_satelite" SERIAL PRIMARY KEY,
	"id_estacion_terrestre" INTEGER,
	"id_satelite" INTEGER,
	CONSTRAINT fk_estacion_terrestre FOREIGN KEY ("id_estacion_terrestre") REFERENCES "estacion_terrestre"("id_estacion"),
	CONSTRAINT fk_satelite_estacion FOREIGN KEY ("id_satelite") REFERENCES "satelite"("id_satelite")
);






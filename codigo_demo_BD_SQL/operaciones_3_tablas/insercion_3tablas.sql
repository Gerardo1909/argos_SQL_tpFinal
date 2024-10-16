--Insertar una nueva misión y luego eliminarla, involucrando 3 tablas: "mision", "satelite", y "mision_satelite"

INSERT INTO mision (id_mision, nombre_mision, fecha_inicio, fecha_fin, objetivo)
VALUES (DEFAULT, 'Misión Omega', '2024-01-01', '2024-06-01', 'Exploración del espacio profundo')
RETURNING id_mision INTO v_id_mision; -- Utilizo una variable temporal para saber el ultimo SERIAL

INSERT INTO mision_satelite (id_mision, id_satelite)
VALUES (v_id_mision, 1);


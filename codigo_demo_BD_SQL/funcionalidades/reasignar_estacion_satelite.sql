CREATE OR REPLACE FUNCTION reasignar_estacion_satelite(
    p_id_satelite INT,
    p_id_estacion_anterior INT,
    p_id_nueva_estacion INT
)
RETURNS VOID AS $$
DECLARE
    v_id_estacion_anterior INT;
    v_id_estacion_nueva INT;
    v_id_relacion INT;
    v_id_nueva_relacion INT;
    v_id_satelite INT;
BEGIN
    -- Verifico si el satélite indicado existe
    SELECT 
        id_satelite 
    INTO v_id_satelite
    FROM satelite 
    WHERE id_satelite = p_id_satelite;

    -- De no existir lanzo una excepción
    IF v_id_satelite IS NULL THEN
        RAISE EXCEPTION 'El satélite de id % no existe', p_id_satelite;
    END IF;

    -- Verifico si la estación terrestre anterior existe
    SELECT 
        id_estacion 
    INTO v_id_estacion_anterior
    FROM estacion_terrestre 
    WHERE id_estacion = p_id_estacion_anterior;

    -- De no existir lanzo una excepción
    IF v_id_estacion_anterior IS NULL THEN
        RAISE EXCEPTION 'La estación terrestre anterior con id % no existe', p_id_estacion_anterior;
    END IF;

    -- Verifico que el satélite indicado y la estación anterior hayan estado relacionados
    SELECT 
        id_estacion_satelite 
    INTO v_id_relacion
    FROM estacion_satelite 
    WHERE id_estacion_terrestre = p_id_estacion_anterior AND id_satelite = p_id_satelite;

    -- De no existir la relación lanzo una excepción
    IF v_id_relacion IS NULL THEN
        RAISE EXCEPTION 'La estación terrestre anterior con id % no tiene asociado al satélite con id %', p_id_estacion_anterior, p_id_satelite;
    END IF;

    -- Verifico si la nueva estación terrestre existe
    SELECT 
        id_estacion 
    INTO v_id_estacion_nueva
    FROM estacion_terrestre 
    WHERE id_estacion = p_id_nueva_estacion;

    -- De no existir lanzo una excepción
    IF v_id_estacion_nueva IS NULL THEN
        RAISE EXCEPTION 'La estación terrestre con id % no existe', p_nueva_estacion;
    END IF;

    -- Verifico que el satélite indicado y la nueva estación no estén relacionados
    SELECT 
        id_estacion_satelite
    INTO v_id_nueva_relacion
    FROM estacion_satelite 
    WHERE id_estacion_terrestre = p_id_nueva_estacion AND id_satelite = p_id_satelite;

    -- De existir la relación lanzo una excepción
    IF v_id_nueva_relacion IS NOT NULL THEN
        RAISE EXCEPTION 'La estación terrestre con id % ya tiene asociado al satélite con id %', p_id_nueva_estacion, p_id_satelite;
    END IF;

    -- Finalmente reasigno el satélite a la nueva estación
    UPDATE estacion_satelite
    SET id_estacion_terrestre = p_id_nueva_estacion
    WHERE id_satelite = p_id_satelite AND id_estacion_terrestre = p_id_estacion_anterior;

END;
$$ LANGUAGE plpgsql;
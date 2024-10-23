CREATE OR REPLACE FUNCTION actualizar_estado_satelite(
    p_id_satelite INT,
    p_estado_satelite VARCHAR(50)
)
RETURNS VOID AS $$
DECLARE
    v_id_estado INT;
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

    -- Busco el id del estado indicado
    SELECT 
        id_estado_satelite 
    INTO v_id_estado
    FROM estado_satelite 
    WHERE estado_satelite = p_estado_satelite;

    -- Si no existe, lanzo una excepción
    IF v_id_estado IS NULL THEN
        RAISE EXCEPTION 'El estado del satélite % no existe', p_estado_satelite;
    END IF;

    -- Finalmente, actualizo el estado del satélite
    UPDATE satelite
    SET id_estado = v_id_estado
    WHERE id_satelite = p_id_satelite;

END;
$$ LANGUAGE plpgsql;
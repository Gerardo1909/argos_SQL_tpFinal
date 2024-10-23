CREATE OR REPLACE FUNCTION verificar_estado_satelite()
RETURNS TRIGGER AS $$
DECLARE
    estado_satelite INT;
BEGIN
    -- Primero selecciono el estado del satélite que realizó la observación
    SELECT 
        id_estado
    INTO estado_satelite 
    FROM satelite 
    WHERE id_satelite = NEW.id_satelite

    -- Verifico que el satélite del cual se quiere insertar observaciones esté activo
    IF estado_satelite != 1 THEN
        RAISE EXCEPTION 'Se está tratando de insertar observaciones pertenecientes a un satélite que no está activo';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verificar_estado_satelite
BEFORE INSERT ON observacion
FOR EACH ROW
EXECUTE FUNCTION verificar_estado_satelite();
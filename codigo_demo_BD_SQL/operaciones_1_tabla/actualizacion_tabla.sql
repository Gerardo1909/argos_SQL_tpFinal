UPDATE "imagen"
SET "url_imagen" = REGEXP_REPLACE(url_imagen, '.jpg', '.png') -- Reemplaza .jpg por .png
WHERE "url_imagen" LIKE '%.jpg';
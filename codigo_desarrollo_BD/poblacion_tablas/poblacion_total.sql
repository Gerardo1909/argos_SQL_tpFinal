-- Poblar la tabla satelite con 20 registros
INSERT INTO satelite (nombre_satelite, fecha_lanzamiento, id_fabricante, id_tipo_satelite, id_estado) VALUES
('Argos-1', '2020-01-15', 1, 1, 1),
('Argos-2', '2019-06-20', 2, 2, 2),
('Argos-3', '2021-03-10', 3, 3, 3),
('Argos-4', '2018-11-05', 4, 4, 1),
('Argos-5', '2022-07-25', 5, 1, 1),
('Argos-6', '2020-02-15', 1, 2, 1),
('Argos-7', '2019-07-20', 2, 3, 2),
('Argos-8', '2021-04-10', 3, 4, 3),
('Argos-9', '2018-12-05', 4, 1, 1),
('Argos-10', '2022-08-25', 5, 2, 1),
('Argos-11', '2020-03-15', 1, 3, 1),
('Argos-12', '2019-08-20', 2, 4, 2),
('Argos-13', '2021-05-10', 3, 1, 3),
('Argos-14', '2018-01-05', 4, 2, 1),
('Argos-15', '2022-09-25', 5, 3, 1),
('Argos-16', '2020-04-15', 1, 4, 1),
('Argos-17', '2019-09-20', 2, 1, 2),
('Argos-18', '2021-06-10', 3, 2, 3),
('Argos-19', '2018-02-05', 4, 3, 1),
('Argos-20', '2022-10-25', 5, 4, 1);

-- Poblar la tabla estacion_terrestre con 10 registros
INSERT INTO estacion_terrestre (nombre_estacion, id_ubicacion_estacion, id_proposito_estacion, id_estado_operacional) VALUES
('Estación Espacial Kennedy', 1, 1, 1),
('Estación Espacial Houston', 2, 2, 2),
('Estación Espacial Baikonur', 3, 3, 1),
('Estación Espacial Guayana', 4, 4, 3),
('Estación Espacial Tanegashima', 5, 1, 1),
('Estación Espacial Vandenberg', 1, 2, 1),
('Estación Espacial Jiuquan', 2, 3, 2),
('Estación Espacial Satish Dhawan', 3, 4, 1),
('Estación Espacial Woomera', 4, 1, 3),
('Estación Espacial Alcântara', 5, 2, 1);

-- Poblar la tabla historial_orbita
INSERT INTO historial_orbita (id_satelite, id_tipo_orbita, altitud, inclinacion) VALUES
(1, 1, 500, 98.7),
(2, 2, 20000, 55.0),
(3, 3, 35786, 0.0),
(4, 4, 40000, 63.4),
(5, 1, 550, 97.5),
(6, 2, 20000, 56.0),
(7, 3, 35786, 1.0),
(8, 4, 40000, 64.4),
(9, 1, 600, 99.5),
(10, 2, 21000, 57.0);

-- Poblar la tabla observacion
INSERT INTO observacion (id_satelite, timestamp_observacion, latitud, longitud) VALUES
(1, '2023-01-01 10:00:00', 34.05, -118.25),
(2, '2023-01-02 11:00:00', 40.71, -74.00),
(3, '2023-01-03 12:00:00', 51.51, -0.13),
(4, '2023-01-04 13:00:00', 35.68, 139.69),
(5, '2023-01-05 14:00:00', -33.87, 151.21),
(6, '2023-01-06 15:00:00', 48.85, 2.35),
(7, '2023-01-07 16:00:00', 55.75, 37.62),
(8, '2023-01-08 17:00:00', 39.90, 116.40),
(9, '2023-01-09 18:00:00', 19.43, -99.13),
(10, '2023-01-10 19:00:00', -23.55, -46.63);

-- Poblar la tabla imagen
INSERT INTO imagen (id_observacion, url_imagen, resolucion) VALUES
(1, 'http://example.com/image1.jpg', '1080p'),
(2, 'http://example.com/image2.jpg', '4K'),
(3, 'http://example.com/image3.jpg', '720p'),
(4, 'http://example.com/image4.jpg', '1080p'),
(5, 'http://example.com/image5.jpg', '4K'),
(6, 'http://example.com/image6.jpg', '1080p'),
(7, 'http://example.com/image7.jpg', '4K'),
(8, 'http://example.com/image8.jpg', '720p'),
(9, 'http://example.com/image9.jpg', '1080p'),
(10, 'http://example.com/image10.jpg', '4K');


-- Poblar la tabla estacion_satelite
INSERT INTO estacion_satelite (id_estacion_terrestre, id_satelite) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Poblar la tabla mision_satelite
INSERT INTO mision_satelite (id_mision, id_satelite) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
-- Ingreso registros de "vuelos"
INSERT INTO vuelos (horaSalida, fecha, horaLlegada, ciudad) 
VALUES (1330, '2023-04-18', 1530, 'MDQ');
INSERT INTO vuelos (horaSalida, fecha, horaLlegada, ciudad) 
VALUES (1520, '2023-04-10', 1730, 'Bariloche');
INSERT INTO vuelos (horaSalida, fecha, horaLlegada, ciudad) 
VALUES (1600, '2023-05-15', 2000, 'chile');

-- Ingreso registro de pasajeros
INSERT INTO pasajeros (pasaporte, nro_vuelo) VALUES (23456984, 1);
INSERT INTO pasajeros (pasaporte, nro_vuelo) VALUES (34562654, 3);
INSERT INTO pasajeros (pasaporte, nro_vuelo) VALUES (24449875, 2);


-- Ingreso registro de avion
INSERT INTO aviones (nro, modelo, fabricante, capacidad, angar, nro_vuelo) VALUES (12, '420', 'PAMPA', 300, 'A2', 3);
INSERT INTO aviones (nro, modelo, fabricante, capacidad, angar, nro_vuelo) VALUES (08, '320', 'AeroSA', 400, 'A1', 1);
INSERT INTO aviones (nro, modelo, fabricante, capacidad, angar, nro_vuelo) VALUES (05, '120', 'PAMPA', 300, 'C2', 2);


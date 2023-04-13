-- Ingreso registros de "vuelos"
insert into vuelos (horaSalida, fecha, horaLlegada, ciudad) 
values (1330, '2023-04-18', 1530, 'MDQ');
insert into vuelos (horaSalida, fecha, horaLlegada, ciudad) 
values (1520, '2023-04-10', 1730, 'Bariloche');
insert into vuelos (horaSalida, fecha, horaLlegada, ciudad) 
values (1600, '2023-05-15', 2000, 'chile');

-- Ingreso registro de pasajeros
insert into pasajeros (pasaporte, nro_vuelo) values (23456984, 1);
insert into pasajeros (pasaporte, nro_vuelo) values (34562654, 3);
insert into pasajeros (pasaporte, nro_vuelo) values (24449875, 2);

-- Ingreso registro de "avion"
insert into aviones (nro, modelo, fabricante, capacidad, angar, nro_vuelo) 
values (12, '420', 'PAMPA', 300, 'A2', 3);
insert into aviones (nro, modelo, fabricante, capacidad, angar, nro_vuelo) 
values (08, '320', 'AeroSA', 400, 'A1', 1);
insert into aviones (nro, modelo, fabricante, capacidad, angar, nro_vuelo) 
values (05, '120', 'PAMPA', 300, 'C2', 2);

-- ingreso registro de "personal"
insert into personal (nroLegajo, nombre, areaAsignada, nro_vuelo) 
values (35465468, 'Adrian', 'piloto', 1);
insert into personal (nroLegajo, nombre, areaAsignada, nro_vuelo) 
values (54826547, 'Walter', 'piloto', 3);
insert into personal (nroLegajo, nombre, areaAsignada, nro_vuelo) 
values (87965248, 'Daniela', 'piloto', 2);

-- ingreso registro de "pilotos"
insert into pilotos (nroLegajo, nro_avion) VALUES (35465468, 12);
insert into pilotos (nroLegajo, nro_avion) VALUES (54826547, 05);
insert into pilotos (nroLegajo, nro_avion) VALUES (87965248, 08);

-- ingreso registro de "piloto_personal"
insert into piloto_personal (nroLegajo_piloto, nroLegajo_personal)
values (35465468,35465468);
insert into piloto_personal (nroLegajo_piloto, nroLegajo_personal)
values (54826547,54826547);
insert into piloto_personal (nroLegajo_piloto, nroLegajo_personal)
values (87965248,87965248);
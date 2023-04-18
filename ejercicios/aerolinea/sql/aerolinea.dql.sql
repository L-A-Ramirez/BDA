/*
	Consultas
*/

select * from vuelos;
select * from pasajeros;
select * from aviones;
select * from personal;
select * from pilotos;
select * from piloto_personal;

/* 
	Se requiere saber las horas totales de vuelo 
	que tuvo el piloto y la ciudad de destino
*/
select horaSalida, horaLlegada, ciudad, (horaLlegada - horaSalida) as HorasTotales from vuelos;

/* 
	Consultas condicionadas 
	Funciones
*/
/* consulta con funcion simple */
-- Quiero sacar el vuelo con el precio más bajo
select horaSalida, horaLlegada, (horaLlegada - horaSalida) 
as Horas_Totales, ciudad, min(precio) as precio_minimo from vuelos;

-- Quiero sacar el vuelo con el precio más alto
select horaSalida, horaLlegada, (horaLlegada - horaSalida) 
as Horas_Totales, ciudad, max(precio) as precio_maximo from vuelos;

/* Consulta condicionada */
-- Quiero sacar el vuelo con el precio menor o igual a 20000
select horaSalida, horaLlegada, (horaLlegada - horaSalida) 
as Horas_Totales, ciudad, precio from vuelos where precio <= 20000;

-- Quiero sacar el vuelo con el precio mayor o igual a 20000
select horaSalida, horaLlegada, (horaLlegada - horaSalida) 
as Horas_Totales, ciudad, precio from vuelos where precio > 20000;

-- Quiero saber cuantas personas viajan hasta "venezuela"
select count(pasaporte) as cantidad_pasajeros, ciudad from pasajeros 
join vuelos on pasajeros.nro_vuelo = vuelos.nro
where ciudad = "venezuela"; 

select count(pasaporte) cantidad_pasajeros, ciudad from pasajeros as p 
join vuelos as v on p.nro_vuelo = v.nro
where ciudad = "venezuela";
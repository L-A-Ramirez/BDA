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

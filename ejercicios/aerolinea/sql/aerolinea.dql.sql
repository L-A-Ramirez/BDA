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
/* Columnas calculadas */
-- Obtengo un vuelo con descuento del 20%
select ciudad, precio, (precio*0.8) descuento_20 from vuelos;

/* Group */
-- Agrupamos y contamos la cantidad de vuelos a distintas ciudades
select count(ciudad), ciudad from vuelos group by ciudad;

/* consulta con funcion simple */

-- Quiero sacar el vuelo con el precio más bajo
select horaSalida, horaLlegada, (horaLlegada - horaSalida) 
as Horas_Totales, ciudad, min(precio) as precio_minimo from vuelos;

-- Quiero sacar el vuelo con el precio más alto
select horaSalida, horaLlegada, (horaLlegada - horaSalida) 
as Horas_Totales, ciudad, max(precio) as precio_maximo from vuelos;

-- Obtengo el vuelo más barato apartir del 20% de descuento
select ciudad, precio, min((precio*0.8)) descuento_20_deMenorPrecio from vuelos;

-- Queremos saber el promedio total del precio de los vuelos
select avg(precio) promedio_total from vuelos;

-- Queremos saber el promedio total del precio de los vuelos a mar del plata
select avg(precio) promedio_total from vuelos where ciudad = "mdq";

-- Queremos saber la suma total de precio de los vuelos a mar del plata
select sum(precio) promedio_total from vuelos where ciudad = "mdq";

/* 
	Consulta condicionada: 
    mayor(>), menor(<), menor igual (<=), mayor igual (>=) 
    un resultado y otro (and/between), un resultado u otro (or/in)
*/
-- Quiero sacar el vuelo con el precio menor o igual a 20000
select horaSalida, horaLlegada, (horaLlegada - horaSalida) 
as Horas_Totales, ciudad, precio from vuelos where precio <= 20000;

-- Quiero sacar el vuelo con el precio mayor o igual a 20000
select horaSalida, horaLlegada, (horaLlegada - horaSalida) 
as Horas_Totales, ciudad, precio from vuelos where precio >= 20000;

-- Quiero sacar la ciudad de mdq o chile
select ciudad, precio from vuelos where ciudad = "MDQ" or ciudad = "chile";
SELECT ciudad, precio FROM vuelos WHERE ciudad IN('chile','MDQ');

-- Quiero sacar la ciudad de mdq y el precio "18000"
select ciudad, precio from vuelos where ciudad = "MDQ" and precio = 18000;

-- Quiero sacar el precio entre "18000" y "25000" -- Pendiente
select min(precio) precio_min, max(precio) precio_max
from vuelos;

/* 
	Join 
	1) seleccionar los campos de ambas tablas "pasaporte" de pasajeros y 
    "ciudad" de vuelos
    2) unimos la tabla pasajeros con vuelos (from pasajeros join vuelos)
    3) relacionar los campos (pk y fk) usando la palabra on, hacemos una comparación
    "pasajeros.nro_vuelo = vuelos.nro"
*/

-- Quiero saber cuantas personas viajan hasta "venezuela"
select count(pasaporte) as cantidad_pasajeros, ciudad from pasajeros 
join vuelos on pasajeros.nro_vuelo = vuelos.nro
where ciudad = "venezuela";

select count(pasaporte) cantidad_pasajeros, ciudad from pasajeros as p 
join vuelos as v on p.nro_vuelo = v.nro
where ciudad = "venezuela";
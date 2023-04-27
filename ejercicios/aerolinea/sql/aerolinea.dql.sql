/*
	Consultas
*/

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

/* Group y having */
-- Agrupamos y contamos la cantidad de vuelos a distintas ciudades
select count(ciudad), ciudad from vuelos group by ciudad;

/* 
	Agrupamos y contamos la suma de precio de los vuelos que sean mayores 
	al promedio del precio de chile
*/
select @promChile:=avg(precio) from vuelos where ciudad = "chile";

select avg(precio), ciudad from vuelos
group by ciudad having avg(precio) > @promChile;

-- sumar el precio de los vuelos con destino a "colombia"
select sum(precio), ciudad from vuelos
join pasajeros on vuelos.nro = pasajeros.nro_vuelo
where ciudad = "colombia";

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
    Intervalo entre (and/between), un resultado u otro (or/in)
*/
-- Quiero sacar el vuelo con el precio menor o igual a 20000
select horaSalida, horaLlegada, (horaLlegada - horaSalida) 
as Horas_Totales, ciudad, precio from vuelos where precio <= 20000;

-- Quiero sacar el vuelo con el precio mayor o igual a 20000
select horaSalida, horaLlegada, (horaLlegada - horaSalida) 
as Horas_Totales, ciudad, precio from vuelos where precio >= 20000;

-- Quiero sacar la ciudad de mdq o chile
select ciudad, precio from vuelos where ciudad = "MDQ" or ciudad = "chile";
SELECT ciudad, precio FROM vuelos WHERE ciudad IN ('chile','MDQ');

-- Quiero sacar la ciudad de mdq y el precio "18000"
select ciudad, precio from vuelos where ciudad = "MDQ" and precio = 18000;

-- Guardo en variables diferentes el precio maximo y el precio minimo
select @minPrecio := max(precio) from vuelos;
select @maxPrecio := min(precio) from vuelos;

-- Quiero sacar el precio entre "18000" y "29000" -- Pendiente
select precio from vuelos where precio between 18000 and 29000 order by precio;

-- Quiero sacar el precio minimo y el maximo
select precio from vuelos where precio = @minPrecio or precio = @maxPrecio;

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


select * from pasajeros pas join personas per
on per.pasaporte = pas.pasaporte;

-- --------------- Join
/*
	Inner join explícito
*/
select fecha, horaSalida, ciudad, pasaporte 
from vuelos join pasajeros
on vuelos.nro = pasajeros.nro_vuelo having ciudad = "colombia";

/*
	Inner join implícito (opcional)
*/
-- Usar 2 condiciones: Cuando hayamos usando el where y requerimos de 
-- otra condición usaremos having
select fecha, horaSalida, ciudad, pasaporte 
from vuelos, pasajeros
where vuelos.nro = pasajeros.nro_vuelo having ciudad = "colombia";

/*
	Inner join natural (opcional)
    Siempre y cuando la pk y la fk tengan el mismo nombre
*/
select * from pasajeros pas natural join personas per;

/* 
	Seleccioname la fecha, hora de salida, ciudad, angar, pasaporte, el nombre 
	y el apellido de personas con vuelos
*/
select v.fecha, v.horaSalida, v.ciudad, a.angar, p.pasaporte, p.nombre, p.apellido 
from vuelos v join pasajeros psj on v.nro = psj.nro_vuelo 
join personas p on p.pasaporte = psj.pasaporte 
join aviones a on v.nro = a.nro;

/* 
	Seleccioname la fecha, hora de salida, ciudad, angar, pasaporte, el nombre 
	y el apellido de personas con vuelos
*/
select v.fecha, v.horaSalida, v.ciudad, a.angar, p.pasaporte, p.nombre, p.apellido 
from vuelos v join pasajeros psj on v.nro = psj.nro_vuelo 
join personas p on p.pasaporte = psj.pasaporte 
join aviones a on v.nro = a.nro where p.pasaporte = 26547896;

/*
	left join: Trae todos los registros de la izquierda que tengan y no relación con la tabla derecha
    right join: Trae todos los registros de la derecha que tengan y no relación con la tabla izquierda
    inner join: Trae registros que solo tengan relación (es igual a "join")
*/

/* 
	Traeme todos los pasajeros que tengan vuelos y los que no lo tengan
	(seleccionando la tabla correspondiente (right join))
*/
select v.fecha, v.horaSalida, v.ciudad, p.pasaporte 
from vuelos v right join pasajeros p on v.nro = p.nro_vuelo;

-- Traeme todos vuelos que tengan y no tengan pasajeros
select v.fecha, v.horaSalida, v.ciudad, p.pasaporte 
from vuelos v left join pasajeros p on v.nro = p.nro_vuelo;

-- Traeme a los pasajeros que no tengan vuelos
select v.fecha, v.horaSalida, v.ciudad, p.pasaporte 
from vuelos v right join pasajeros p on v.nro = p.nro_vuelo where p.nro_vuelo is null;

-- ------------- Consultas anidadas
-- Seleccioname el pasaporte y el nombre de la persona con destino a colombia
SELECT DISTINCT pasaporte, nombre
FROM pasajeros as pas natural join personas per
join vuelos as v on v.nro = pas.nro_vuelo 
WHERE ciudad in 
(SELECT ciudad
FROM vuelos
WHERE ciudad = 'colombia');


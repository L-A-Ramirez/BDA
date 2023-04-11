show databases;
use bda_cfp18;
-- Borramos tablas si es que existen
drop table if exists pasajeros;
drop table if exists vuelos;
drop table if exists personal;
drop table if exists pilotos;
drop table if exists aviones;
drop table if exists piloto_personal;

-- Creamos tablas
create table if not exists pasajeros (
	pasaporte int primary key, 
    nro_vuelo int
);

create table if not exists vuelos (
	nro int primary key auto_increment,
    horaSalida time,
    horaLlegada time,
    fecha date,
    ciudad varchar(50),
    nro_avion int
);

create table if not exists personal(
	nroLegajo int primary key,
    nombre varchar(25),
    nro_vuelo int,
    areaAsignada enum("azafata",
						"mecanico",
                        "soporte","limpieza","piloto")
);

create table if not exists pilotos(
	nroLegajo int primary key,
    nro_avion int
);

create table if not exists piloto_personal(
	id int primary key,
    nroLegajo_piloto int,
    nroLegajo_personal int
);

create table if not exists aviones(
	nro int primary key,
    modelo varchar(50),
    fabricante varchar(50),
    capacidad int,
    angar varchar(12)
);

show tables;
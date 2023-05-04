-- Traeme las veces que se ejecuto un programa con frecuencia media en un sistema de nivel bajo
select sp.id,s.nivel,p.freq_ejec from sistema_programa sp
join sistemas s on s.nivel = sp.nivel_sistema
join programas p on p.freq_ejec = sp.freq_ejec_programa
where s.nivel = "bajo" and p.freq_ejec = "media";


-- Traeme la suma de veces que se ejecutaron programas en el sistema


-- Traeme los programas con archivos input_output


/* 
	Traeme las frecuencia de los programas con archivos 
	input_output y el nivel de su sistema 
*/
-- Con alias en la tabla
select p_a.id,freq_ejec, modo, nivel from programa_archivo as p_a
join programas as p on p.freq_ejec = p_a.freq_ejec_programa 
join archivos as a on a.modo = p_a.modo_archivo 
join sistema_programa as s_p on s_p.freq_ejec_programa = p.freq_ejec 
join sistemas as s on s_p.nivel_sistema = s.nivel;

-- Sin alias en la tabla
select programa_archivo.id,freq_ejec, modo, nivel from programa_archivo
join programas on programas.freq_ejec = programa_archivo.freq_ejec_programa 
join archivos on archivos.modo = programa_archivo.modo_archivo 
join sistema_programa on sistema_programa.freq_ejec_programa = programas.freq_ejec 
join sistemas on sistema_programa.nivel_sistema = sistemas.nivel;
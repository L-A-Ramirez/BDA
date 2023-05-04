-- --------------------------------------------------- INGRESO REGISTROS SISTEMAS
INSERT INTO `sistema`.`sistemas` (`nivel`) VALUES ('bajo');
INSERT INTO `sistema`.`sistemas` (`nivel`) VALUES ('alto');
INSERT INTO `sistema`.`sistemas` (`nivel`) VALUES ('medio');


-- --------------------------------------------------- INGRESO REGISTROS PROGRAMAS
INSERT INTO `sistema`.`programas` (`freq_ejec`) VALUES ('alta');
INSERT INTO `sistema`.`programas` (`freq_ejec`) VALUES ('media');
INSERT INTO `sistema`.`programas` (`freq_ejec`) VALUES ('baja');


-- --------------------------------------------------- INGRESO REGISTROS ARCHIVOS
INSERT INTO `sistema`.`archivos` (`modo`) VALUES ('input');
INSERT INTO `sistema`.`archivos` (`modo`) VALUES ('input-output');
INSERT INTO `sistema`.`archivos` (`modo`) VALUES ('output');


-- --------------------------------------------------- INGRESO REGISTROS SISTEMA_PROGRAMA
INSERT INTO `sistema`.`sistema_programa` (`nivel_sistema`, `freq_ejec_programa`) VALUES ('alto', 'media');
INSERT INTO `sistema`.`sistema_programa` (`nivel_sistema`, `freq_ejec_programa`) VALUES ('bajo', 'media');
INSERT INTO `sistema`.`sistema_programa` (`nivel_sistema`, `freq_ejec_programa`) VALUES ('bajo', 'baja');
INSERT INTO `sistema`.`sistema_programa` (`nivel_sistema`, `freq_ejec_programa`) VALUES ('medio', 'alta');
INSERT INTO `sistema`.`sistema_programa` (`nivel_sistema`, `freq_ejec_programa`) VALUES ('medio', 'media');
INSERT INTO `sistema`.`sistema_programa` (`nivel_sistema`, `freq_ejec_programa`) VALUES ('medio', 'baja');


-- --------------------------------------------------- INGRESO REGISTROS PROGRAMA_ARCHIVO
INSERT INTO `sistema`.`programa_archivo` (`freq_ejec_programa`, `modo_archivo`) VALUES ('alta', 'input-output');
INSERT INTO `sistema`.`programa_archivo` (`freq_ejec_programa`, `modo_archivo`) VALUES ('alta', 'input');
INSERT INTO `sistema`.`programa_archivo` (`freq_ejec_programa`, `modo_archivo`) VALUES ('alta', 'output');
INSERT INTO `sistema`.`programa_archivo` (`freq_ejec_programa`, `modo_archivo`) VALUES ('media', 'input');
INSERT INTO `sistema`.`programa_archivo` (`freq_ejec_programa`, `modo_archivo`) VALUES ('media', 'output');
INSERT INTO `sistema`.`programa_archivo` (`freq_ejec_programa`, `modo_archivo`) VALUES ('baja', 'input');


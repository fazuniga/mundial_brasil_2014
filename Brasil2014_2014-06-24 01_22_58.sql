-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.6.16 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             8.3.0.4771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para brasil2014
CREATE DATABASE IF NOT EXISTS `brasil2014` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `brasil2014`;


-- Volcando estructura para tabla brasil2014.dow
DROP TABLE IF EXISTS `dow`;
CREATE TABLE IF NOT EXISTS `dow` (
  `id_dia` int(11) NOT NULL,
  `dia` varchar(7) NOT NULL,
  PRIMARY KEY (`id_dia`,`dia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla brasil2014.dow: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `dow` DISABLE KEYS */;
INSERT IGNORE INTO `dow` (`id_dia`, `dia`) VALUES
	(1, 'Do'),
	(2, 'Lu'),
	(3, 'Ma'),
	(4, 'Mi'),
	(5, 'Ju'),
	(6, 'Vi'),
	(7, 'Sa');
/*!40000 ALTER TABLE `dow` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.equipos
DROP TABLE IF EXISTS `equipos`;
CREATE TABLE IF NOT EXISTS `equipos` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `Pais` varchar(50) CHARACTER SET utf8 NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `Code` varchar(2) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_equipo`,`Pais`,`id_grupo`,`Code`),
  KEY `id_grupo` (`id_grupo`),
  KEY `Pais` (`Pais`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla brasil2014.equipos: 32 rows
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT IGNORE INTO `equipos` (`id_equipo`, `Pais`, `id_grupo`, `Code`) VALUES
	(1, 'Brasil', 1, 'BR'),
	(2, 'Croacia', 1, 'HR'),
	(3, 'MÃ©xico', 1, 'MX'),
	(4, 'CamerÃºn', 1, 'CM'),
	(5, 'EspaÃ±a', 2, 'ES'),
	(6, 'Holanda', 2, 'NL'),
	(7, 'Chile', 2, 'CL'),
	(8, 'Australia', 2, 'AU'),
	(9, 'Colombia', 3, 'CO'),
	(10, 'Grecia', 3, 'GR'),
	(11, 'Costa de Marfil', 3, 'CI'),
	(12, 'JapÃ³n', 3, 'JP'),
	(13, 'Uruguay', 4, 'UY'),
	(14, 'Italia', 4, 'IT'),
	(15, 'Inglaterra', 4, 'EN'),
	(16, 'Costa Rica', 4, 'CR'),
	(17, 'Suiza', 5, 'CH'),
	(18, 'Francia', 5, 'FR'),
	(19, 'Ecuador', 5, 'EC'),
	(20, 'Honduras', 5, 'HN'),
	(21, 'Argentina', 6, 'AR'),
	(22, 'Bosnia - Herzegovina', 6, 'BA'),
	(23, 'Nigeria', 6, 'NG'),
	(24, 'IrÃ¡n', 6, 'IR'),
	(25, 'Alemania', 7, 'DE'),
	(26, 'Estados Unidos', 7, 'US'),
	(27, 'Portugal', 7, 'PT'),
	(28, 'Ghana', 7, 'GH'),
	(29, 'BÃ©lgica', 8, 'BE'),
	(30, 'Rusia', 8, 'RU'),
	(31, 'Argelia', 8, 'DZ'),
	(32, 'Corea del Sur', 8, 'KR');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.equipos_post_grupos
DROP TABLE IF EXISTS `equipos_post_grupos`;
CREATE TABLE IF NOT EXISTS `equipos_post_grupos` (
  `id_equipo` int(11) NOT NULL,
  `Equipo` varchar(50) NOT NULL,
  `id_pais` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`,`Equipo`),
  KEY `id_pais` (`id_pais`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla brasil2014.equipos_post_grupos: 32 rows
/*!40000 ALTER TABLE `equipos_post_grupos` DISABLE KEYS */;
INSERT IGNORE INTO `equipos_post_grupos` (`id_equipo`, `Equipo`, `id_pais`) VALUES
	(1, 'Primero A', 1),
	(2, 'Segundo A', 3),
	(3, 'Primero B', 6),
	(4, 'Segundo B', 7),
	(5, 'Primero C', NULL),
	(6, 'Segundo C', NULL),
	(7, 'Primero D', NULL),
	(8, 'Segundo D', NULL),
	(9, 'Primero E', NULL),
	(10, 'Segundo E', NULL),
	(11, 'Primero F', NULL),
	(12, 'Segundo F', NULL),
	(13, 'Primero G', NULL),
	(14, 'Segundo G', NULL),
	(15, 'Primero H', NULL),
	(16, 'Segundo H', NULL),
	(17, 'Ganador 49', NULL),
	(18, 'Ganador 50', NULL),
	(19, 'Ganador 51', NULL),
	(20, 'Ganador 52', NULL),
	(21, 'Ganador 53', NULL),
	(22, 'Ganador 54', NULL),
	(23, 'Ganador 55', NULL),
	(24, 'Ganador 56', NULL),
	(25, 'Ganador 57', NULL),
	(26, 'Ganador 58', NULL),
	(27, 'Ganador 59', NULL),
	(28, 'Ganador 60', NULL),
	(29, 'Ganador 61', NULL),
	(30, 'Ganador 62', NULL),
	(31, 'Perdedor 61', NULL),
	(32, 'Perdedor 62', NULL);
/*!40000 ALTER TABLE `equipos_post_grupos` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.estadios
DROP TABLE IF EXISTS `estadios`;
CREATE TABLE IF NOT EXISTS `estadios` (
  `id_estadio` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(50) CHARACTER SET utf8 NOT NULL,
  `estadio` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_estadio`,`ciudad`,`estadio`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla brasil2014.estadios: 12 rows
/*!40000 ALTER TABLE `estadios` DISABLE KEYS */;
INSERT IGNORE INTO `estadios` (`id_estadio`, `ciudad`, `estadio`) VALUES
	(1, 'Belo Horizonte', 'MineirÃ£o'),
	(2, 'Brasilia', 'Garrincha'),
	(3, 'Cuiaba', 'Arena Pantanal'),
	(4, 'Curitiba', 'Arena da Baixada'),
	(5, 'Fortaleza', 'CastelÃ£o'),
	(6, 'Manaus', 'Arena Amazonia'),
	(7, 'Natal', 'Arena das Dunas'),
	(8, 'Porto Alegre', 'Beira-Rio'),
	(9, 'Recife', 'Arena Pernambuco'),
	(10, 'Rio De Janeiro', 'MaracanÃ£'),
	(11, 'Salvador', 'Arena Fonte Nova'),
	(12, 'SÃ£o Paulo', 'Arena Corinthians');
/*!40000 ALTER TABLE `estadios` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.fixture
DROP TABLE IF EXISTS `fixture`;
CREATE TABLE IF NOT EXISTS `fixture` (
  `id_match` int(11) NOT NULL AUTO_INCREMENT,
  `id_ronda` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_estadio` int(11) NOT NULL,
  `id_local` int(11) NOT NULL,
  `id_visita` int(11) NOT NULL,
  PRIMARY KEY (`id_match`,`id_ronda`,`id_grupo`,`fecha`,`hora`,`id_estadio`,`id_local`,`id_visita`),
  KEY `id_grupo` (`id_grupo`),
  KEY `id_estadio` (`id_estadio`),
  KEY `id_local` (`id_local`),
  KEY `id_visita` (`id_visita`),
  KEY `id_ronda` (`id_ronda`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla brasil2014.fixture: 48 rows
/*!40000 ALTER TABLE `fixture` DISABLE KEYS */;
INSERT IGNORE INTO `fixture` (`id_match`, `id_ronda`, `id_grupo`, `fecha`, `hora`, `id_estadio`, `id_local`, `id_visita`) VALUES
	(1, 1, 1, '2014-06-12', '16:00:00', 12, 1, 2),
	(2, 1, 1, '2014-06-13', '12:00:00', 7, 3, 4),
	(3, 1, 2, '2014-06-13', '15:00:00', 11, 5, 6),
	(4, 1, 2, '2014-06-13', '18:00:00', 3, 7, 8),
	(5, 1, 3, '2014-06-14', '12:00:00', 1, 9, 10),
	(6, 1, 3, '2014-06-14', '21:00:00', 9, 11, 12),
	(7, 1, 4, '2014-06-14', '15:00:00', 5, 13, 16),
	(8, 1, 4, '2014-06-14', '18:00:00', 6, 15, 14),
	(9, 1, 5, '2014-06-15', '12:00:00', 2, 17, 19),
	(10, 1, 5, '2014-06-15', '15:00:00', 8, 18, 20),
	(11, 1, 6, '2014-06-15', '18:00:00', 10, 21, 22),
	(12, 1, 6, '2014-06-16', '15:00:00', 4, 24, 23),
	(13, 1, 7, '2014-06-16', '12:00:00', 11, 25, 27),
	(14, 1, 7, '2014-06-16', '18:00:00', 7, 28, 26),
	(15, 1, 8, '2014-06-17', '12:00:00', 1, 29, 31),
	(16, 1, 8, '2014-06-17', '18:00:00', 3, 30, 32),
	(17, 1, 1, '2014-06-17', '15:00:00', 5, 1, 3),
	(18, 1, 1, '2014-06-18', '18:00:00', 6, 4, 2),
	(19, 1, 2, '2014-06-18', '15:00:00', 10, 5, 7),
	(20, 1, 2, '2014-06-18', '12:00:00', 8, 8, 6),
	(21, 1, 3, '2014-06-19', '12:00:00', 2, 9, 11),
	(22, 1, 3, '2014-06-19', '18:00:00', 7, 12, 10),
	(23, 1, 4, '2014-06-19', '15:00:00', 12, 13, 15),
	(24, 1, 4, '2014-06-20', '12:00:00', 9, 14, 16),
	(25, 1, 5, '2014-06-20', '15:00:00', 11, 17, 18),
	(26, 1, 5, '2014-06-20', '18:00:00', 4, 20, 19),
	(27, 1, 6, '2014-06-21', '12:00:00', 1, 21, 24),
	(28, 1, 6, '2014-06-21', '18:00:00', 3, 23, 22),
	(29, 1, 7, '2014-06-21', '15:00:00', 5, 25, 28),
	(30, 1, 7, '2014-06-22', '18:00:00', 6, 26, 27),
	(31, 1, 8, '2014-06-22', '12:00:00', 10, 29, 30),
	(32, 1, 8, '2014-06-22', '15:00:00', 8, 32, 31),
	(33, 1, 1, '2014-06-23', '16:00:00', 2, 4, 1),
	(34, 1, 1, '2014-06-23', '16:00:00', 9, 2, 3),
	(35, 1, 2, '2014-06-23', '12:00:00', 4, 8, 5),
	(36, 1, 2, '2014-06-23', '12:00:00', 12, 6, 7),
	(37, 1, 3, '2014-06-24', '16:00:00', 3, 12, 9),
	(38, 1, 3, '2014-06-24', '16:00:00', 5, 10, 11),
	(39, 1, 4, '2014-06-24', '12:00:00', 7, 14, 13),
	(40, 1, 4, '2014-06-24', '12:00:00', 1, 16, 15),
	(41, 1, 5, '2014-06-25', '16:00:00', 8, 20, 17),
	(42, 1, 5, '2014-06-25', '16:00:00', 11, 19, 18),
	(43, 1, 6, '2014-06-25', '12:00:00', 8, 23, 21),
	(44, 1, 6, '2014-06-25', '12:00:00', 11, 22, 24),
	(45, 1, 7, '2014-06-26', '12:00:00', 9, 26, 25),
	(46, 1, 7, '2014-06-26', '12:00:00', 2, 27, 28),
	(47, 1, 8, '2014-06-26', '16:00:00', 12, 32, 29),
	(48, 1, 8, '2014-06-26', '16:00:00', 4, 31, 30);
/*!40000 ALTER TABLE `fixture` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.fixture_post_grupos
DROP TABLE IF EXISTS `fixture_post_grupos`;
CREATE TABLE IF NOT EXISTS `fixture_post_grupos` (
  `id_match` int(11) NOT NULL,
  `id_ronda` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_estadio` int(11) NOT NULL,
  `id_local` int(11) NOT NULL,
  `id_visita` int(11) NOT NULL,
  PRIMARY KEY (`id_match`,`id_ronda`,`fecha`,`hora`,`id_estadio`,`id_local`,`id_visita`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla brasil2014.fixture_post_grupos: 16 rows
/*!40000 ALTER TABLE `fixture_post_grupos` DISABLE KEYS */;
INSERT IGNORE INTO `fixture_post_grupos` (`id_match`, `id_ronda`, `fecha`, `hora`, `id_estadio`, `id_local`, `id_visita`) VALUES
	(49, 2, '2014-06-28', '12:00:00', 1, 1, 4),
	(50, 2, '2014-06-28', '16:00:00', 10, 5, 8),
	(51, 2, '2014-06-29', '12:00:00', 5, 3, 2),
	(52, 2, '2014-06-29', '16:00:00', 9, 7, 6),
	(53, 2, '2014-06-30', '12:00:00', 2, 9, 12),
	(54, 2, '2014-06-30', '16:00:00', 8, 13, 16),
	(55, 2, '2014-07-01', '12:00:00', 12, 11, 10),
	(56, 2, '2014-07-01', '16:00:00', 11, 15, 14),
	(57, 3, '2014-07-04', '16:00:00', 5, 17, 18),
	(58, 3, '2014-07-04', '12:00:00', 10, 19, 20),
	(59, 3, '2014-07-05', '16:00:00', 11, 21, 22),
	(60, 3, '2014-07-05', '12:00:00', 2, 23, 24),
	(61, 4, '2014-07-08', '16:00:00', 1, 25, 26),
	(62, 4, '2014-07-09', '16:00:00', 12, 27, 28),
	(63, 5, '2014-07-12', '16:00:00', 2, 31, 32),
	(64, 6, '2014-07-13', '15:00:00', 10, 29, 30);
/*!40000 ALTER TABLE `fixture_post_grupos` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.grupos
DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_grupo`,`grupo`),
  KEY `grupo` (`grupo`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla brasil2014.grupos: 8 rows
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT IGNORE INTO `grupos` (`id_grupo`, `grupo`) VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C'),
	(4, 'D'),
	(5, 'E'),
	(6, 'F'),
	(7, 'G'),
	(8, 'H');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.results
DROP TABLE IF EXISTS `results`;
CREATE TABLE IF NOT EXISTS `results` (
  `id_match` int(11) NOT NULL,
  `goles_local` int(11) DEFAULT NULL,
  `goles_visita` int(11) DEFAULT NULL,
  `goles_local_pt` int(11) DEFAULT NULL,
  `goles_visita_pt` int(11) DEFAULT NULL,
  `minuto_primer_gol` int(11) DEFAULT NULL,
  `id_jugador_primer_gol` int(11) DEFAULT NULL,
  `goles_local_ot` int(11) DEFAULT NULL,
  `goles_visita_ot` int(11) DEFAULT NULL,
  `penales_local` int(11) DEFAULT NULL,
  `penales_visita` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_match`),
  KEY `id_jugador_primer_gol` (`id_jugador_primer_gol`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=FIXED;

-- Volcando datos para la tabla brasil2014.results: 64 rows
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT IGNORE INTO `results` (`id_match`, `goles_local`, `goles_visita`, `goles_local_pt`, `goles_visita_pt`, `minuto_primer_gol`, `id_jugador_primer_gol`, `goles_local_ot`, `goles_visita_ot`, `penales_local`, `penales_visita`) VALUES
	(1, 3, 1, 1, 1, 11, 146, NULL, NULL, NULL, NULL),
	(2, 1, 0, 0, 0, 61, 102, NULL, NULL, NULL, NULL),
	(3, 1, 5, 1, 1, 27, 420, NULL, NULL, NULL, NULL),
	(4, 3, 1, 2, 1, 12, 195, NULL, NULL, NULL, NULL),
	(5, 3, 0, 1, 1, 6, 201, NULL, NULL, NULL, NULL),
	(6, 2, 1, 0, 1, 16, 875, NULL, NULL, NULL, NULL),
	(7, 1, 3, 1, 0, 24, 278, NULL, NULL, NULL, NULL),
	(8, 1, 2, 1, 1, 35, 563, NULL, NULL, NULL, NULL),
	(9, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 3, 0, 1, 0, 45, 452, NULL, NULL, NULL, NULL),
	(11, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(32, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(33, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(36, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(49, 2, 2, NULL, NULL, NULL, NULL, 1, 1, 3, 5),
	(50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.rondas
DROP TABLE IF EXISTS `rondas`;
CREATE TABLE IF NOT EXISTS `rondas` (
  `id_ronda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ronda` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_ronda`,`nombre_ronda`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla brasil2014.rondas: 6 rows
/*!40000 ALTER TABLE `rondas` DISABLE KEYS */;
INSERT IGNORE INTO `rondas` (`id_ronda`, `nombre_ronda`) VALUES
	(1, 'Fase de Grupos'),
	(2, 'Octavos de Final'),
	(3, 'Cuartos de Final'),
	(4, 'Semifinal'),
	(5, '3Â° Lugar'),
	(6, 'Final');
/*!40000 ALTER TABLE `rondas` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Apellido` varchar(50) CHARACTER SET utf8 NOT NULL,
  `id_pais` int(11) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `active` int(11) NOT NULL,
  `admin` int(11) NOT NULL,
  PRIMARY KEY (`username`,`password`,`id_user`,`Nombre`,`Apellido`,`id_pais`,`email`,`active`,`admin`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla brasil2014.users: 55 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`id_user`, `username`, `password`, `Nombre`, `Apellido`, `id_pais`, `email`, `active`, `admin`) VALUES
	(26, 'abernuy', 'a5920ccee7acde560d22af1ce09219ba', 'Alvaro', 'Bernuy', 7, 'alvaro.bernuy@lan.com', 1, 0),
	(33, 'alvarouc', '25d55ad283aa400af464c76d713c07ad', 'Alvaro', 'Philippi', 7, 'aphillippib@gmail.com', 1, 0),
	(41, 'Amedina', '152f329a6f517d65d91bfb6103529b23', 'Andres', 'Medina', 7, 'andres.medina@lan.com', 1, 0),
	(31, 'barb', '03a403de4e174dbb3cbb951cdda85188', 'Barbara', 'Delgadillo', 7, 'barbara.delgadillop@lan.com', 1, 0),
	(5, 'bcfiguer', '9becee5a7172bb92a9e0004efa2a7605', 'Benjamin', 'Figueroa', 7, 'BENJAMIN.FIGUEROA@LAN.COM', 1, 1),
	(48, 'bernardo.medeiros', '47679f5395df0fa81d8f90271488a44d', 'Bernardo', 'Medeiros', 1, 'bernardo.medeiros@lan.com', 1, 0),
	(40, 'Bertoni', 'ab4b04aa82363c9025e2acb8fd60fc3d', 'Stefano', 'Bertoni', 7, 'stefano.bertoni@lan.com', 1, 0),
	(67, 'calu', 'fd317045cbdcd26054de08112d6031b4', 'Carmen Luz', 'Gillmore', 7, 'carmen.gillmore@lan.com', 1, 0),
	(56, 'Camilo', '761e2c4277cf93a3f4aabb221ed59963', 'Camilo', 'Castillo', 7, 'camilo.castillo@lan.com', 1, 0),
	(52, 'cgk', '2e7165ceb19f183e695ce49285a4c228', 'Claudio', 'Gonzalez', 7, 'claudio.gonzalezk@lan.com', 1, 0),
	(32, 'cjovel', '19b45df0381f767c1d0eab82541e6deb', 'Carlos', 'Jovel', 21, 'carlos.jovel@gmail.com', 1, 0),
	(43, 'clopez', '25d55ad283aa400af464c76d713c07ad', 'Cristina', 'Lopez', 9, 'cristina.lopez@lan.com', 1, 0),
	(36, 'Cvenegas', '6bfc57a8b58cd19e5b6c9afce62b7c53', 'Carlos', 'Venegas', 9, 'carlos.venegas@lan.com', 1, 0),
	(37, 'djmendez', 'b2f512f0aeca9c17c2e809deed680a66', 'Andres ', 'Mendez', 7, 'andres.mendez@lan.com', 1, 0),
	(47, 'dzorec', 'dc563bf86d935cc5eab71abf726c9bc1', 'Diana ', 'Zorec', 21, 'diana.zorec@lan.com', 1, 0),
	(60, 'elascano', 'fc4851f6804b36823f826183f8cf7cfd', 'alexis', 'lascano', 19, 'efrain.lascano@lan.com', 1, 0),
	(58, 'erika', '628d809931abc1135c0376c2422e75df', 'Erika', 'Kutscher', 21, 'erika.kutscher@lan.com', 1, 0),
	(1, 'fazuniga', '2a7b81774d79261fa1235ac70d3ae987', 'Felipe', 'ZÃºÃ±iga', 7, 'felipe.zuniga@lan.com', 1, 1),
	(42, 'fbarrientosc', '4d186321c1a7f0f354b297e8914ab240', 'Fabiola', 'Barrientos', 7, 'fabiola.barrientos@lan.com', 1, 0),
	(25, 'fgaete', '2be64fb023583117a77a25a85b37769f', 'Felipe', 'Gaete', 7, 'felipe.gaetev@lan.com', 1, 0),
	(29, 'fjmonter', 'b437f56ced10ffc34926ec619193012a', 'Francisco', 'Montero', 7, 'francisco.montero@lan.com', 1, 0),
	(63, 'Frabarri', '1cc7bee1ceda9799a0a7e0c2d2ba68e6', 'Francisco', 'Barrientos', 7, 'francisco.barrientos@lan.com', 1, 0),
	(22, 'goportus', '46ce50639fb811afeab6ecadc81cd147', 'Gonzalo', 'Oportus', 7, 'goportus@gmail.com', 1, 0),
	(65, 'gquirola', '9c7d728bc5f41fea1780d31a1e89ee6e', 'Gladys', 'Quirola', 19, 'gquirolam@gmail.com', 1, 0),
	(61, 'Guille', 'b17efedf3164605f195a0b38ce2c7708', 'Guillermo', 'Cardoza', 7, 'guillermo.cardoza@lan.com', 1, 0),
	(44, 'Herlen', '02250636720679ab86dbf1e56a906727', 'Herlen', 'Rojas', 7, 'herlen.rojas@lan.com', 1, 0),
	(35, 'ierbetta', '659b1b45cc93f115d84bc35ac3ededd9', 'IGNACIO', 'ERBETTA', 7, 'ignacio.erbetta@lan.com', 1, 0),
	(46, 'Igeissbuhler', '6667b735f9e83e1c2c0d86cca1d2cc38', 'Ignacio', 'Geissbuhler', 25, 'ignacio.geissbuhler@lan.com', 1, 0),
	(59, 'janabalon', '87e914c3239963739e4f60a79f2bf413', 'Javier', 'Anabalon', 7, 'javier.anabalon@lan.com', 1, 0),
	(39, 'Javi', '06a3d33896e53ae21a0b6a256ff75c86', 'Javiera ', 'Rojas', 7, 'javirojas3@gmail.com', 1, 0),
	(17, 'jorge.sierra', '2929f626ecb94cdca69fc6c39087594d', 'Jorge', 'Sierra', 31, 'jorge.sierra@lan.com', 1, 0),
	(19, 'jorge.sierra', 'bef1b0514f602f9b6158009f49fe71b4', 'Jorge', 'Sierra', 31, 'jorge.sierra@lan.com', 1, 0),
	(64, 'jprojas', '32e7de789aff6734faf158cf7922a64c', 'Juan Pablo', 'Rojas', 7, 'juanpablo.rojas@lan.com', 1, 0),
	(28, 'jzambrano', '4245b0ee642a4c7208d70988c422601f', 'Javier ', 'Zambrano', 7, 'javier.zambrano@lan.com', 1, 0),
	(24, 'lausierra', 'a0585fa6f90bf2dca75dac4e86a4ccbf', 'Laura', 'Sierra', 9, 'laura.sierra@lan.com', 1, 0),
	(21, 'manolocampeon', '50191b5134d44464a1abf4c6b0c92237', 'Manuel', 'Lopez', 7, 'manuel.lopez@lan.com', 1, 0),
	(45, 'mapuerto', 'd9bdba08d2e4682bbf994a1d0a2cff54', 'Manuel', 'Puerto', 9, 'ma.puerto638@gmail.com', 1, 0),
	(34, 'mbuenahora', '85e024f1c00871cdb2296c5b4be382e7', 'Mateo', 'Buenahora', 9, 'm.buenahora34@gmail.com', 1, 0),
	(51, 'mchampin', 'bd1b4a5f3768a46e4f22a4261074489e', 'Miguel', 'Champin', 7, 'miguel.champin@lan.com', 1, 0),
	(49, 'nathalialacava', '48ffe865b8425b89483718f81f060249', 'Nathalia', 'Lacava', 1, 'nathalia.lacava@lan.com', 1, 0),
	(66, 'obopp', '0838ecfb969d782bae32f24d02057e26', 'Oscar', 'Bopp', 7, 'oscar.bopp@lan.com', 1, 0),
	(68, 'Paolo', '18d58911a8e8082501de2f5f8ff51e8d', 'Paolo', 'Escorza', 15, 'paolo.escorza@lan.com', 1, 0),
	(30, 'patonacho', '6d64ec3c9eca2fb1b555fb4066d7372a', 'Patricio', 'Droguett', 7, 'patricio.droguett@lan.com', 1, 0),
	(20, 'Pedrettips', '21a0b122c1efae60ae9cd7930df50593', 'Pedro', 'Ortega', 20, 'pedro.ortega@lan.com', 1, 0),
	(55, 'Rbaeza', 'd8d3a01ba7e5d44394b6f0a8533f4647', 'Rodolfo', 'Baeza', 7, 'rodolfo.baeza@lan.com', 1, 0),
	(50, 'rbernales', 'ed723bce2e135a71b599d5a3390e4f56', 'Rodolfo', 'Bernales', 7, 'rodolfo.bernales@gmail.com', 1, 0),
	(53, 'Rodolfo', '9e8c51af6a376ff13a825c6c609b61a0', 'Rodolfo', 'Salazar', 7, 'rodolfo.salazar@lan.com', 1, 0),
	(62, 'ruth', '616706c4d6f7bdf68b30893f860cbb2b', 'Ruth', 'Escobar', 1, 'ruth.escobar@lan.com', 1, 0),
	(18, 'sahudson', '4a77913368b47965eed37e17e1057d69', 'Sergio', 'Hudson', 7, 'sergio.hudson@lan.com', 1, 0),
	(54, 'sebaparodi', '222ba5af00cc7c95360744bfb09ae6b6', 'Sebastian', 'Parodi', 7, 'sebastian.parodi@lan.com', 1, 0),
	(38, 'Tamara', 'b3ec03fcb3d1db56e190ba3e7bfea81e', 'Tamara', 'Moya', 21, 'tamaramoyak@gmail.com', 1, 0),
	(2, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test', 'test', 7, 'test@test.cl', 1, 0),
	(27, 'vfuentes', 'f504a26f06130fae8c8e818a849ed3e0', 'Victor', 'Fuentes', 7, 'victor.fuentes@lan.com', 1, 0),
	(23, 'victor_nivia', 'ca0dc185c4d803a1d6c11288fae82a31', 'Victor', 'Nivia', 9, 'victor.nivia@lan.com', 1, 0),
	(57, 'ZARAZA', 'af7b8aa516c11fe26692669bc6fd10a2', 'Catalina ', 'Zarini', 21, 'catalina.zarini@lan.com', 1, 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Volcando estructura para vista brasil2014.vw_avance_equipos
DROP VIEW IF EXISTS `vw_avance_equipos`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_avance_equipos` (
	`Equipo` VARCHAR(28) NULL COLLATE 'utf8_general_ci',
	`id_equipo` BIGINT(20) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_avance_rondas
DROP VIEW IF EXISTS `vw_avance_rondas`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_avance_rondas` (
	`id_ronda` INT(11) NOT NULL,
	`Ronda` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Partidos Jugados` BIGINT(21) NOT NULL,
	`Activa` INT(0) NULL,
	`Partidos de la Ronda` BIGINT(21) NOT NULL,
	`Partido Minimo` DECIMAL(43,0) NULL,
	`Partidos Acumulados` DECIMAL(42,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_equipos_post_grupos
DROP VIEW IF EXISTS `vw_equipos_post_grupos`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_equipos_post_grupos` (
	`Equipo` VARCHAR(28) NULL COLLATE 'utf8_general_ci',
	`id_equipo` INT(11) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_fixture
DROP VIEW IF EXISTS `vw_fixture`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_fixture` (
	`Partido` INT(11) NOT NULL,
	`id_ronda` INT(11) NOT NULL,
	`Ronda` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Grupo` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`DOW` VARCHAR(7) NOT NULL COLLATE 'utf8_general_ci',
	`Fecha` DATE NOT NULL,
	`Hora` TIME NOT NULL,
	`CodeL` VARCHAR(2) NULL COLLATE 'utf8_general_ci',
	`Local` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`CodeV` VARCHAR(2) NULL COLLATE 'utf8_general_ci',
	`Visita` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Ciudad` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Estadio` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`enabled` BIGINT(20) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_octavos_de_final
DROP VIEW IF EXISTS `vw_octavos_de_final`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_octavos_de_final` (
	`Partido` INT(11) NOT NULL,
	`id_ronda` INT(11) NOT NULL,
	`Ronda` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Grupo` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`Fecha` DATE NOT NULL,
	`Hora` TIME NOT NULL,
	`iLocal` INT(11) NOT NULL,
	`CodeL` VARCHAR(2) NOT NULL COLLATE 'utf8_general_ci',
	`Local` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`iVisita` INT(11) NOT NULL,
	`CodeV` VARCHAR(2) NOT NULL COLLATE 'utf8_general_ci',
	`Visita` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Ciudad` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Estadio` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`enabled` BIGINT(20) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_octavos_de_final_dos
DROP VIEW IF EXISTS `vw_octavos_de_final_dos`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_octavos_de_final_dos` (
	`Grupo` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`id_equipo` INT(11) NOT NULL,
	`Equipo` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Code` VARCHAR(2) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_octavos_de_final_results
DROP VIEW IF EXISTS `vw_octavos_de_final_results`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_octavos_de_final_results` (
	`Partido` INT(11) NOT NULL,
	`id_ronda` INT(11) NOT NULL,
	`Grupo` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`iLocal` INT(11) NOT NULL,
	`Local` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`CodeL` VARCHAR(2) NOT NULL COLLATE 'utf8_general_ci',
	`iVisita` INT(11) NOT NULL,
	`Visita` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`CodeV` VARCHAR(2) NOT NULL COLLATE 'utf8_general_ci',
	`gLocal` INT(11) NULL,
	`gVisita` INT(11) NULL,
	`gLocal_PT` INT(11) NULL,
	`gVisita_PT` INT(11) NULL,
	`gLocal_OT` INT(11) NULL,
	`gVisita_OT` INT(11) NULL,
	`penales_Local` INT(11) NULL,
	`penales_Visita` INT(11) NULL,
	`pLocal` BIGINT(20) NULL,
	`pVisita` BIGINT(20) NULL,
	`Ganador` VARCHAR(50) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_octavos_de_final_uno
DROP VIEW IF EXISTS `vw_octavos_de_final_uno`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_octavos_de_final_uno` (
	`Grupo` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`Equipo` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Nombre` VARCHAR(28) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_partidos_jugados
DROP VIEW IF EXISTS `vw_partidos_jugados`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_partidos_jugados` (
	`Partidos Jugados` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_partidos_jugados_grupos
DROP VIEW IF EXISTS `vw_partidos_jugados_grupos`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_partidos_jugados_grupos` (
	`Grupo` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`MaxJ` DECIMAL(45,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_partidos_por_ronda
DROP VIEW IF EXISTS `vw_partidos_por_ronda`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_partidos_por_ronda` (
	`id_ronda` INT(11) NOT NULL,
	`Ronda` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Partidos` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_partidos_por_ronda_acum
DROP VIEW IF EXISTS `vw_partidos_por_ronda_acum`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_partidos_por_ronda_acum` (
	`id_ronda` INT(11) NOT NULL,
	`Ronda` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Partidos` BIGINT(21) NOT NULL,
	`Total_Partidos` DECIMAL(42,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_puntos_carton
DROP VIEW IF EXISTS `vw_puntos_carton`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_puntos_carton` (
	`id_carton` INT(11) NOT NULL,
	`Carton` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`id_user` INT(11) NOT NULL,
	`Nombre` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Apellido` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`pts_Marcador` BIGINT(11) NULL,
	`pts_Diferencia` BIGINT(11) NULL,
	`pts_Resultado` BIGINT(11) NULL,
	`pts_PT` BIGINT(11) NULL,
	`pts_Minuto_PG` BIGINT(11) NULL,
	`pts_Jugador_PG` BIGINT(11) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_ranking
DROP VIEW IF EXISTS `vw_ranking`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_ranking` (
	`pagado` INT(11) NOT NULL,
	`id_carton` INT(11) NOT NULL,
	`Nombre` VARCHAR(101) NOT NULL COLLATE 'utf8_general_ci',
	`Carton` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`Puntos` DECIMAL(46,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_results
DROP VIEW IF EXISTS `vw_results`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_results` (
	`Partido` INT(11) NOT NULL,
	`id_ronda` INT(11) NOT NULL,
	`Grupo` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`iLocal` INT(11) NOT NULL,
	`eLocal` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`CodeL` VARCHAR(2) NULL COLLATE 'utf8_general_ci',
	`iVisita` INT(11) NOT NULL,
	`eVisita` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`CodeV` VARCHAR(2) NULL COLLATE 'utf8_general_ci',
	`gLocal` INT(11) NULL,
	`gVisita` INT(11) NULL,
	`gLocal_PT` INT(11) NULL,
	`gVisita_PT` INT(11) NULL,
	`gLocal_OT` INT(11) NULL,
	`gVisita_OT` INT(11) NULL,
	`penales_Local` INT(11) NULL,
	`penales_Visita` INT(11) NULL,
	`Minuto_PG` INT(11) NULL,
	`id_jugador_pg` INT(11) NULL,
	`Jugador_PG` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`pLocal` BIGINT(20) NULL,
	`pVisita` BIGINT(20) NULL,
	`Ganador` VARCHAR(50) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_results_by_group
DROP VIEW IF EXISTS `vw_results_by_group`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_results_by_group` (
	`Grupo` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`ID` INT(11) NOT NULL,
	`Equipo` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Codigo` VARCHAR(2) NULL COLLATE 'utf8_general_ci',
	`Jugados` DECIMAL(45,0) NULL,
	`Victorias` DECIMAL(45,0) NULL,
	`Empates` DECIMAL(45,0) NULL,
	`Derrotas` DECIMAL(45,0) NULL,
	`Goles a Favor` DECIMAL(54,0) NULL,
	`Goles en Contra` DECIMAL(54,0) NULL,
	`Diferencia de Goles` DECIMAL(55,0) NULL,
	`Puntos` DECIMAL(47,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_results_by_group_tmp
DROP VIEW IF EXISTS `vw_results_by_group_tmp`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_results_by_group_tmp` (
	`Grupo` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`ID` INT(11) NOT NULL,
	`Equipo` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Codigo` VARCHAR(2) NULL COLLATE 'utf8_general_ci',
	`Jugados` DECIMAL(23,0) NULL,
	`Victorias` DECIMAL(23,0) NULL,
	`Empates` DECIMAL(23,0) NULL,
	`Derrotas` DECIMAL(23,0) NULL,
	`gContra` DECIMAL(32,0) NULL,
	`gFavor` DECIMAL(32,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_results_post_grupos
DROP VIEW IF EXISTS `vw_results_post_grupos`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_results_post_grupos` (
	`Equipo` VARCHAR(21) NOT NULL COLLATE 'utf8_general_ci',
	`id_equipo_new` INT(11) NULL,
	`id_equipo` BIGINT(11) NULL,
	`Pais` VARCHAR(50) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_seleccionados
DROP VIEW IF EXISTS `vw_seleccionados`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_seleccionados` (
	`id_equipo` INT(11) NOT NULL,
	`Code` VARCHAR(2) NOT NULL COLLATE 'utf8_general_ci',
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Posicion` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`id_jugador` INT(11) NOT NULL,
	`Nombre` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Club` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Pais del Club` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_selec_clubs
DROP VIEW IF EXISTS `vw_selec_clubs`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_selec_clubs` (
	`id_equipo` INT(11) NOT NULL,
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Club` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Numero de Jugadores` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_selec_pais
DROP VIEW IF EXISTS `vw_selec_pais`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_selec_pais` (
	`id_equipo` INT(11) NOT NULL,
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`pais_club` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Jugadores` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_selec_perc_pais
DROP VIEW IF EXISTS `vw_selec_perc_pais`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_selec_perc_pais` (
	`id_equipo` INT(11) NOT NULL,
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`pais_club` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Jugadores` BIGINT(21) NOT NULL,
	`Porcentaje` DECIMAL(27,4) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_selec_perc_pais_top
DROP VIEW IF EXISTS `vw_selec_perc_pais_top`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_selec_perc_pais_top` (
	`id_equipo` INT(11) NOT NULL,
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`pais_club` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Jugadores` BIGINT(21) NOT NULL,
	`Porcentaje` DECIMAL(27,4) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_selec_posic_pais
DROP VIEW IF EXISTS `vw_selec_posic_pais`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_selec_posic_pais` (
	`id_equipo` INT(11) NOT NULL,
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Posicion` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`pais_club` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Numero de Jugadores` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_selec_total
DROP VIEW IF EXISTS `vw_selec_total`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_selec_total` (
	`id_equipo` INT(11) NOT NULL,
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Jugadores` BIGINT(21) NOT NULL,
	`Reservas` DECIMAL(32,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_avance_equipos
DROP VIEW IF EXISTS `vw_avance_equipos`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_avance_equipos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_avance_equipos` AS SELECT epg.*
FROM vw_equipos_post_grupos epg
UNION ALL 
SELECT rpg.Equipo, rpg.id_equipo
FROM vw_results_post_grupos rpg ;


-- Volcando estructura para vista brasil2014.vw_avance_rondas
DROP VIEW IF EXISTS `vw_avance_rondas`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_avance_rondas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_avance_rondas` AS SELECT 
	z.id_ronda AS id_ronda,
	z.Ronda AS Ronda,
	a.`Partidos Jugados`,
	(CASE 
		WHEN a.`Partidos Jugados` >= z.Total_Partidos - z.Partidos - 12 THEN 1 
		ELSE 0 
	END) AS Activa,
	/*(CASE 
		WHEN ((a.`Partidos Jugados` >= 
			(CASE WHEN (z.id_ronda > 1) THEN ((z.Total_Partidos - z.Partidos)) ELSE 0 END)) 
			AND (a.`Partidos Jugados` < z.Total_Partidos )) THEN 1 
		ELSE 0 
	END) AS Activa,*/
	z.Partidos AS `Partidos de la Ronda`,
	(CASE 
		WHEN (z.id_ronda > 1) THEN ((z.Total_Partidos - z.Partidos)) 
		ELSE 0 
	END) AS `Partido Minimo`,
	z.Total_Partidos AS `Partidos Acumulados`
FROM vw_partidos_por_ronda_acum z
JOIN vw_partidos_jugados a ;


-- Volcando estructura para vista brasil2014.vw_equipos_post_grupos
DROP VIEW IF EXISTS `vw_equipos_post_grupos`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_equipos_post_grupos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_equipos_post_grupos` AS (SELECT CONCAT('Primero ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'A')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT CONCAT('Segundo ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'A')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT CONCAT('Primero ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'B')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT CONCAT('Segundo ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'B')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT CONCAT('Primero ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'C')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT CONCAT('Segundo ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'C')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT CONCAT('Primero ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'D')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT CONCAT('Segundo ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'D')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT CONCAT('Primero ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'E')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT CONCAT('Segundo ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'E')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT CONCAT('Primero ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'F')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT CONCAT('Segundo ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'F')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT CONCAT('Primero ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'G')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT CONCAT('Segundo ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'G')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT CONCAT('Primero ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'H')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT CONCAT('Segundo ', v.Grupo) AS Equipo, CASE WHEN x.MaxJ = 3 THEN v.ID ELSE NULL END AS id_equipo
FROM vw_results_by_group v
JOIN vw_partidos_jugados_grupos x ON v.Grupo = x.Grupo
WHERE (v.Grupo = 'H')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) ;


-- Volcando estructura para vista brasil2014.vw_fixture
DROP VIEW IF EXISTS `vw_fixture`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_fixture`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_fixture` AS SELECT 
	f.id_match AS Partido,
	r.id_ronda AS id_ronda,
	r.nombre_ronda AS Ronda,
	(CASE WHEN ISNULL(g.grupo) THEN '' ELSE g.grupo END) AS Grupo,
	d.dia AS DOW, f.fecha AS Fecha, f.hora AS Hora,
	eql.Code AS CodeL, eql.Pais AS Local,
	eqv.Code AS CodeV, eqv.Pais AS Visita,
	e.ciudad AS Ciudad, e.estadio AS Estadio,
	(CASE WHEN (ROUND((TIME_TO_SEC(TIMEDIFF(STR_TO_DATE(CONCAT(f.fecha,' ',f.hora),'%Y-%m-%d %H:%i:%s'),(NOW() + INTERVAL -71 MINUTE))) / 60),0) < ((20 * 1) * 1)) THEN 0 ELSE 1 END) AS enabled
FROM fixture f
JOIN dow d on d.id_dia = DAYOFWEEK(f.fecha)
JOIN rondas r ON r.id_ronda = f.id_ronda
JOIN equipos eql ON eql.id_equipo = f.id_local
JOIN equipos eqv ON eqv.id_equipo = f.id_visita
LEFT JOIN grupos g ON g.id_grupo = f.id_grupo
JOIN estadios e ON e.id_estadio = f.id_estadio

UNION ALL

SELECT 
	f.id_match AS Partido,
	r.id_ronda AS id_ronda,
	r.nombre_ronda AS Ronda,
	'' AS Grupo,
	d.dia AS DOW, f.fecha AS Fecha, f.hora AS Hora,
	CASE WHEN ISNULL(eql.id_pais) THEN '' ELSE el.Code END AS CodeL, 
	CASE WHEN ISNULL(eql.id_pais) THEN eql.Equipo ELSE el.Pais END AS Local, 
	CASE WHEN ISNULL(eqv.id_pais) THEN '' ELSE ev.Code END AS CodeV, 
	CASE WHEN ISNULL(eqv.id_pais) THEN eqv.Equipo ELSE ev.Pais END AS Visita, 
	e.ciudad AS Ciudad, e.estadio AS Estadio,
	(CASE WHEN (ROUND((TIME_TO_SEC(TIMEDIFF(STR_TO_DATE(CONCAT(f.fecha,' ',f.hora),'%Y-%m-%d %H:%i:%s'),(NOW() + INTERVAL -71 MINUTE))) / 60),0) < ((20 * 1) * 1)) THEN 0 ELSE 1 END) AS enabled
FROM fixture_post_grupos f
JOIN dow d on d.id_dia = DAYOFWEEK(f.fecha)
JOIN rondas r ON r.id_ronda = f.id_ronda
JOIN estadios e ON e.id_estadio = f.id_estadio 
JOIN equipos_post_grupos eql ON eql.id_equipo = f.id_local
JOIN equipos_post_grupos eqv ON eqv.id_equipo = f.id_visita
LEFT JOIN equipos el ON eql.id_pais = el.id_equipo
LEFT JOIN equipos ev ON eqv.id_pais = ev.id_equipo

/* SEGUNDA PARTE DE LA QUERY - ALTERNATIVA
SELECT 
	f.id_match AS Partido,
	r.id_ronda AS id_ronda,
	r.nombre_ronda AS Ronda,
	'' AS Grupo,
	d.dia AS DOW, f.fecha AS Fecha, f.hora AS Hora,
	CASE WHEN ISNULL(ael.id_equipo) THEN '' ELSE el.Code END AS CodeL, 
	CASE WHEN ISNULL(ael.id_equipo) THEN eql.Equipo ELSE el.Pais END AS Local, 
	CASE WHEN ISNULL(aev.id_equipo) THEN '' ELSE ev.Code END AS CodeV, 
	CASE WHEN ISNULL(aev.id_equipo) THEN eqv.Equipo ELSE ev.Pais END AS Visita, 
	e.ciudad AS Ciudad, e.estadio AS Estadio,
	(CASE WHEN (ROUND((TIME_TO_SEC(TIMEDIFF(STR_TO_DATE(CONCAT(f.fecha,' ',f.hora),'%Y-%m-%d %H:%i:%s'),(NOW() + INTERVAL -71 MINUTE))) / 60),0) < ((20 * 1) * 1)) THEN 0 ELSE 1 END) AS enabled
FROM fixture_post_grupos f
JOIN dow d on d.id_dia = DAYOFWEEK(f.fecha)
JOIN rondas r ON r.id_ronda = f.id_ronda
JOIN estadios e ON e.id_estadio = f.id_estadio 
JOIN equipos_post_grupos eql ON eql.id_equipo = f.id_local
JOIN equipos_post_grupos eqv ON eqv.id_equipo = f.id_visita
JOIN vw_avance_equipos ael ON ael.Equipo = eql.Equipo
JOIN vw_avance_equipos aev ON aev.Equipo = eqv.Equipo
LEFT JOIN equipos el ON eql.id_pais = el.id_equipo
LEFT JOIN equipos ev ON eqv.id_pais = ev.id_equipo
*/


/*
SELECT 
	f.id_match AS Partido,
	r.id_ronda AS id_ronda,
	r.nombre_ronda AS Ronda,
	(CASE WHEN ISNULL(g.grupo) THEN '' ELSE g.grupo END) AS Grupo,
	d.dia AS DOW, f.fecha AS Fecha, f.hora AS Hora,
	eql.Code AS CodeL, eql.Pais AS Local,
	eqv.Code AS CodeV, eqv.Pais AS Visita,
	e.ciudad AS Ciudad, e.estadio AS Estadio,
	(CASE WHEN (ROUND((TIME_TO_SEC(TIMEDIFF(STR_TO_DATE(CONCAT(f.fecha,' ',f.hora),'%Y-%m-%d %H:%i:%s'),(NOW() + INTERVAL -71 MINUTE))) / 60),0) < ((20 * 1) * 1)) THEN 0 ELSE 1 END) AS enabled
FROM fixture f
JOIN dow d on d.id_dia = DAYOFWEEK(f.fecha)
JOIN rondas r ON r.id_ronda = f.id_ronda
JOIN equipos eql ON eql.id_equipo = f.id_local
JOIN equipos eqv ON eqv.id_equipo = f.id_visita
LEFT JOIN grupos g ON g.id_grupo = f.id_grupo
JOIN estadios e ON e.id_estadio = f.id_estadio
WHERE r.id_ronda = 1 
UNION ALL
SELECT 
	f.id_match AS Partido,
	r.id_ronda AS id_ronda,
	r.nombre_ronda AS Ronda,
	'' AS Grupo,
	d.dia AS DOW, f.fecha AS Fecha, f.hora AS Hora,
	CASE WHEN ISNULL(vpgl.id_pais) THEN '' ELSE el.Code END AS CodeL, 
	CASE WHEN ISNULL(vpgl.id_pais) THEN eql.Equipo ELSE el.Pais END AS Local, 
	CASE WHEN ISNULL(vpgv.id_pais) THEN '' ELSE ev.Code END AS CodeV, 
	CASE WHEN ISNULL(vpgv.id_pais) THEN eqv.Equipo ELSE ev.Pais END AS Visita, 
	e.ciudad AS Ciudad, e.estadio AS Estadio,
	(CASE WHEN (ROUND((TIME_TO_SEC(TIMEDIFF(STR_TO_DATE(CONCAT(f.fecha,' ',f.hora),'%Y-%m-%d %H:%i:%s'),(NOW() + INTERVAL -71 MINUTE))) / 60),0) < ((20 * 1) * 1)) THEN 0 ELSE 1 END) AS enabled
FROM fixture_post_grupos f
JOIN dow d on d.id_dia = DAYOFWEEK(f.fecha)
JOIN rondas r ON r.id_ronda = f.id_ronda
JOIN estadios e ON e.id_estadio = f.id_estadio
LEFT JOIN equipos_post_grupos eql ON eql.id_equipo = f.id_local
LEFT JOIN equipos_post_grupos eqv ON eqv.id_equipo = f.id_visita
JOIN vw_equipos_post_grupos vpgl ON eql.Equipo = vpgl.Equipo
JOIN vw_equipos_post_grupos vpgv ON eqv.Equipo = vpgv.Equipo
LEFT JOIN equipos el ON el.id_equipo = vpgl.id_pais
LEFT JOIN equipos ev ON ev.id_equipo = vpgv.id_pais 

UNION ALL

SELECT 
	f.id_match AS Partido,
	r.id_ronda AS id_ronda,
	r.nombre_ronda AS Ronda,
	'' AS Grupo,
	d.dia AS DOW, f.fecha AS Fecha, f.hora AS Hora,	
	CASE WHEN ISNULL(rpgl.id_equipo) THEN '' ELSE el.Code END AS CodeL, 
	CASE WHEN ISNULL(rpgl.id_equipo) THEN eql.Equipo ELSE el.Pais END AS Local, 
	CASE WHEN ISNULL(rpgv.id_equipo) THEN '' ELSE ev.Code END AS CodeV, 
	CASE WHEN ISNULL(rpgv.id_equipo) THEN eqv.Equipo ELSE ev.Pais END AS Visita, 
	e.ciudad AS Ciudad, e.estadio AS Estadio,
	(CASE WHEN (ROUND((TIME_TO_SEC(TIMEDIFF(STR_TO_DATE(CONCAT(f.fecha,' ',f.hora),'%Y-%m-%d %H:%i:%s'),(NOW() + INTERVAL -71 MINUTE))) / 60),0) < ((20 * 1) * 1)) THEN 0 ELSE 1 END) AS enabled
FROM fixture_post_grupos f
JOIN dow d on d.id_dia = DAYOFWEEK(f.fecha)
JOIN rondas r ON r.id_ronda = f.id_ronda
JOIN estadios e ON e.id_estadio = f.id_estadio
LEFT JOIN equipos_post_grupos eql ON eql.id_equipo = f.id_local
LEFT JOIN vw_results_post_grupos rpgl ON rpgl.Equipo = eql.Equipo
LEFT JOIN equipos_post_grupos eqv ON eqv.id_equipo = f.id_visita
LEFT JOIN vw_results_post_grupos rpgv ON rpgv.Equipo = eqv.Equipo
LEFT JOIN equipos el ON el.id_equipo = rpgl.id_equipo
LEFT JOIN equipos ev ON ev.id_equipo = rpgv.id_equipo
WHERE r.id_ronda > 2

-- ORDER BY 1
*/ ;


-- Volcando estructura para vista brasil2014.vw_octavos_de_final
DROP VIEW IF EXISTS `vw_octavos_de_final`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_octavos_de_final`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_octavos_de_final` AS SELECT 
	v.Partido, v.id_ronda, v.Ronda, v.Grupo, v.Fecha, v.Hora,
	el.id_equipo as iLocal, p.Code AS CodeL, p.Equipo AS Local,
	ev.id_equipo as iVisita, q.Code AS CodeV, q.Equipo AS Visita,
	v.Ciudad, v.Estadio, v.enabled
FROM vw_fixture v
JOIN vw_octavos_de_final_dos p ON p.Pais = v.Local
JOIN vw_octavos_de_final_dos q ON q.Pais = v.Visita 
JOIN equipos el on el.Pais = p.Equipo
JOIN equipos ev on ev.Pais = q.Equipo ;


-- Volcando estructura para vista brasil2014.vw_octavos_de_final_dos
DROP VIEW IF EXISTS `vw_octavos_de_final_dos`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_octavos_de_final_dos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_octavos_de_final_dos` AS SELECT g.grupo AS Grupo, e.Pais AS Pais, f.id_equipo AS id_equipo, f.Pais AS Equipo,f.Code AS Code
FROM vw_octavos_de_final_uno v
JOIN grupos g ON g.grupo = v.Grupo
JOIN equipos e ON e.Pais = v.Nombre
JOIN equipos f ON f.Pais = v.Equipo ;


-- Volcando estructura para vista brasil2014.vw_octavos_de_final_results
DROP VIEW IF EXISTS `vw_octavos_de_final_results`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_octavos_de_final_results`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_octavos_de_final_results` AS SELECT 
	r.Partido, r.id_ronda, r.Grupo, 
	ofl.id_equipo as iLocal,  ofl.Equipo as Local,  ofl.Code as CodeL,
	ofv.id_equipo as iVisita, ofv.Equipo as Visita, ofv.Code as CodeV,
	r.gLocal, r.gVisita, 
	r.gLocal_PT, r.gVisita_PT,
	r.gLocal_OT, r.gVisita_OT,
	r.penales_Local, r.penales_Visita,
	r.pLocal, r.pVisita,
	CASE 
		WHEN r.Ganador = ofl.Pais THEN ofl.Equipo
		WHEN r.Ganador = ofv.Pais THEN ofv.Equipo
	END as Ganador
FROM vw_results r
JOIN vw_octavos_de_final_dos ofl ON ofl.Pais = r.eLocal
JOIN vw_octavos_de_final_dos ofv ON ofv.Pais = r.eVisita
WHERE id_ronda = 2 ;


-- Volcando estructura para vista brasil2014.vw_octavos_de_final_uno
DROP VIEW IF EXISTS `vw_octavos_de_final_uno`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_octavos_de_final_uno`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_octavos_de_final_uno` AS (SELECT v.Grupo, v.Equipo AS Equipo, CONCAT('Primero ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'A')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Segundo ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'A')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Primero ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'B')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Segundo ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'B')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Primero ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'C')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Segundo ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'C')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Primero ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'D')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Segundo ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'D')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Primero ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'E')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Segundo ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'E')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Primero ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'F')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Segundo ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'F')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Primero ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'G')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Segundo ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'G')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Primero ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'H')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1) UNION ALL (
SELECT v.Grupo AS Grupo,v.Equipo AS Equipo, CONCAT('Segundo ',v.Grupo) AS Nombre
FROM vw_results_by_group v
WHERE (v.Grupo = 'H')
ORDER BY v.Grupo,v.Puntos DESC,v.`Goles a Favor` DESC,v.`Diferencia de Goles` DESC,v.ID
LIMIT 1,1) ;


-- Volcando estructura para vista brasil2014.vw_partidos_jugados
DROP VIEW IF EXISTS `vw_partidos_jugados`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_partidos_jugados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_partidos_jugados` AS SELECT COUNT(*) as `Partidos Jugados`
FROM results
WHERE goles_local IS NOT NULL AND goles_visita IS NOT NULL ;


-- Volcando estructura para vista brasil2014.vw_partidos_jugados_grupos
DROP VIEW IF EXISTS `vw_partidos_jugados_grupos`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_partidos_jugados_grupos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_partidos_jugados_grupos` AS SELECT Grupo, max(Jugados) as MaxJ
FROM vw_results_by_group
GROUP BY Grupo ;


-- Volcando estructura para vista brasil2014.vw_partidos_por_ronda
DROP VIEW IF EXISTS `vw_partidos_por_ronda`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_partidos_por_ronda`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_partidos_por_ronda` AS SELECT f.id_ronda AS id_ronda, r.nombre_ronda AS Ronda, COUNT(*) AS Partidos
FROM fixture f
JOIN rondas r ON r.id_ronda = f.id_ronda
GROUP BY f.id_ronda,r.nombre_ronda
UNION ALL 
SELECT f.id_ronda AS id_ronda, r.nombre_ronda AS Ronda, COUNT(*) AS Partidos
FROM fixture_post_grupos f
JOIN rondas r ON r.id_ronda = f.id_ronda
GROUP BY f.id_ronda,r.nombre_ronda ;


-- Volcando estructura para vista brasil2014.vw_partidos_por_ronda_acum
DROP VIEW IF EXISTS `vw_partidos_por_ronda_acum`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_partidos_por_ronda_acum`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_partidos_por_ronda_acum` AS select `x`.`id_ronda` AS `id_ronda`,`x`.`Ronda` AS `Ronda`,`x`.`Partidos` AS `Partidos`,sum(`y`.`Partidos`) AS `Total_Partidos` from (`vw_partidos_por_ronda` `x` join `vw_partidos_por_ronda` `y`) where (`x`.`id_ronda` >= `y`.`id_ronda`) group by `x`.`id_ronda`,`x`.`Ronda` ;


-- Volcando estructura para vista brasil2014.vw_puntos_carton
DROP VIEW IF EXISTS `vw_puntos_carton`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_puntos_carton`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_puntos_carton` AS SELECT c.id_carton, `c`.`descripcion` AS `Carton`,`u`.`id_user` AS `id_user`,`u`.`Nombre` AS `Nombre`,`u`.`Apellido` AS `Apellido`,(CASE WHEN ((`r`.`goles_local` = `a`.`goles_local`) AND (`r`.`goles_visita` = `a`.`goles_visita`)) THEN `p`.`Marcador` ELSE 0 END) AS `pts_Marcador`,(CASE WHEN ((`r`.`goles_local` - `r`.`goles_visita`) = (`a`.`goles_local` - `a`.`goles_visita`)) THEN `p`.`Diferencia_Goles` ELSE 0 END) AS `pts_Diferencia`,(CASE WHEN ((`r`.`goles_local` > `r`.`goles_visita`) AND (`a`.`goles_local` > `a`.`goles_visita`)) THEN `p`.`Ganador` WHEN ((`r`.`goles_local` < `r`.`goles_visita`) AND (`a`.`goles_local` < `a`.`goles_visita`)) THEN `p`.`Ganador` WHEN ((`r`.`goles_local` = `r`.`goles_visita`) AND (`a`.`goles_local` = `a`.`goles_visita`)) THEN `p`.`Ganador` ELSE 0 END) AS `pts_Resultado`,(CASE WHEN ((`r`.`goles_local_pt` = `a`.`goles_local_pt`) AND (`r`.`goles_visita_pt` = `a`.`goles_visita_pt`)) THEN `p`.`Marcador_Primer_Tiempo` ELSE 0 END) AS `pts_PT`,(CASE WHEN (`r`.`minuto_primer_gol` = `a`.`minuto_primer_gol`) THEN `p`.`Minuto_Primer_Gol` ELSE 0 END) AS `pts_Minuto_PG`,(CASE WHEN (`r`.`id_jugador_primer_gol` = `a`.`id_jugador_primer_gol`) THEN `p`.`Jugador_Primer_Gol` ELSE 0 END) AS `pts_Jugador_PG`
FROM cartones c
JOIN apuestas a ON a.id_carton = c.id_carton
JOIN users u ON u.id_user = c.id_user
JOIN results r ON r.id_match = a.id_match
JOIN puntos_apuestas p
WHERE r.goles_local IS NOT NULL 
AND r.goles_visita IS NOT NULL ;


-- Volcando estructura para vista brasil2014.vw_ranking
DROP VIEW IF EXISTS `vw_ranking`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_ranking`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_ranking` AS SELECT cr.pagado, c.id_carton, CONCAT(c.Nombre,' ',c.Apellido) AS Nombre,c.Carton AS Carton,(((((SUM(c.pts_Marcador) + SUM(c.pts_Diferencia)) + SUM(c.pts_Resultado)) + SUM(c.pts_PT)) + SUM(c.pts_Minuto_PG)) + SUM(c.pts_Jugador_PG)) AS Puntos
FROM vw_puntos_carton c
JOIN cartones cr ON cr.id_carton = c.id_carton
GROUP BY c.id_user,c.Carton
ORDER BY (((((SUM(c.pts_Marcador) + SUM(c.pts_Diferencia)) + SUM(c.pts_Resultado)) + SUM(c.pts_PT)) + SUM(c.pts_Minuto_PG)) + SUM(c.pts_Jugador_PG)) DESC, CONCAT(c.Nombre,' ',c.Apellido),c.Carton ;


-- Volcando estructura para vista brasil2014.vw_results
DROP VIEW IF EXISTS `vw_results`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_results`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_results` AS SELECT 
	f.id_match AS Partido,
	r.id_ronda AS id_ronda,
	(CASE WHEN ISNULL(g.grupo) THEN '' ELSE g.grupo END) AS Grupo,
	eql.id_equipo AS iLocal,eql.Pais AS eLocal,eql.Code AS CodeL,
	eqv.id_equipo AS iVisita,eqv.Pais AS eVisita,eqv.Code AS CodeV,
	(CASE WHEN ISNULL(rr.goles_local) THEN NULL ELSE rr.goles_local END) AS gLocal,
	(CASE WHEN ISNULL(rr.goles_visita) THEN NULL ELSE rr.goles_visita END) AS gVisita,
	(CASE WHEN ISNULL(rr.goles_local_pt) THEN NULL ELSE rr.goles_local_pt END) AS gLocal_PT,
	(CASE WHEN ISNULL(rr.goles_visita_pt) THEN NULL ELSE rr.goles_visita_pt END) AS gVisita_PT,
	(CASE WHEN ISNULL(rr.goles_local_ot) THEN NULL ELSE rr.goles_local_ot END) AS gLocal_OT,
	(CASE WHEN ISNULL(rr.goles_visita_ot) THEN NULL ELSE rr.goles_visita_ot END) AS gVisita_OT,
	(CASE WHEN ISNULL(rr.penales_local) THEN NULL ELSE rr.penales_local END) AS penales_Local,
	(CASE WHEN ISNULL(rr.penales_visita) THEN NULL ELSE rr.penales_visita END) AS penales_Visita,
	(CASE WHEN ISNULL(rr.minuto_primer_gol) THEN NULL ELSE rr.minuto_primer_gol END) AS Minuto_PG,
	(CASE WHEN ISNULL(j.Nombre) THEN NULL ELSE j.id_jugador END) AS id_jugador_pg,
	(CASE WHEN ISNULL(j.Nombre) THEN NULL ELSE j.Nombre END) AS Jugador_PG, 
	(CASE WHEN ISNULL(rr.goles_local) THEN NULL ELSE 
		(CASE 
			WHEN (rr.goles_local > rr.goles_visita) THEN 3
			WHEN (rr.goles_local = rr.goles_visita) THEN 1 
			ELSE 0 
		END) 
	END) AS pLocal,
	(CASE WHEN ISNULL(rr.goles_visita) THEN NULL ELSE 
		(CASE 
			WHEN (rr.goles_local < rr.goles_visita) THEN 3
			WHEN (rr.goles_local = rr.goles_visita) THEN 1
			ELSE 0
		END)
	END) AS pVisita,
	CASE 
		WHEN r.id_ronda = 1 AND (rr.goles_local > rr.goles_visita) THEN eql.Pais
		WHEN r.id_ronda = 1 AND (rr.goles_local = rr.goles_visita) THEN 'Empate'
		WHEN r.id_ronda = 1 AND (rr.goles_local < rr.goles_visita) THEN eqv.Pais
 		WHEN r.id_ronda > 1 AND (rr.goles_local > rr.goles_visita) THEN eql.Pais
 		WHEN r.id_ronda > 1 AND (rr.goles_local < rr.goles_visita) THEN eqv.Pais
		WHEN r.id_ronda > 1 AND (rr.goles_local = rr.goles_visita) THEN 
			CASE
				WHEN rr.goles_local_ot > rr.goles_visita_ot THEN eql.Pais
				WHEN rr.goles_local_ot < rr.goles_visita_ot THEN eqv.Pais
				WHEN rr.goles_local_ot = rr.goles_visita_ot THEN
					CASE
						WHEN rr.penales_local > rr.penales_visita THEN eql.Pais
						WHEN rr.penales_local < rr.penales_visita THEN eqv.Pais
					END
			END
	END as 'Ganador'
FROM fixture f
JOIN rondas r ON r.id_ronda = f.id_ronda
JOIN estadios e ON e.id_estadio = f.id_estadio
JOIN equipos eql ON eql.id_equipo = f.id_local
JOIN equipos eqv ON eqv.id_equipo = f.id_visita
LEFT JOIN grupos g ON g.id_grupo = f.id_grupo
LEFT JOIN results rr ON rr.id_match = f.id_match
LEFT JOIN jugadores j ON j.id_jugador = rr.id_jugador_primer_gol

UNION ALL

SELECT 
	f.id_match AS Partido,
	r.id_ronda AS id_ronda,
	'' Grupo,
	eql.id_equipo AS iLocal, 
	(CASE WHEN ISNULL(el.Pais) THEN eql.Equipo ELSE el.Pais END) AS eLocal,
	(CASE WHEN ISNULL(el.Code) THEN '' ELSE el.Code END) AS CodeL,
	eqv.id_equipo AS iVisita,
	(CASE WHEN ISNULL(ev.Pais) THEN eqv.Equipo ELSE ev.Pais END) AS eVisita, 
	(CASE WHEN ISNULL(ev.Code) THEN '' ELSE ev.Code END) AS CodeV,
	(CASE WHEN ISNULL(rr.goles_local) THEN NULL ELSE rr.goles_local END) AS gLocal,
	(CASE WHEN ISNULL(rr.goles_visita) THEN NULL ELSE rr.goles_visita END) AS gVisita,
	(CASE WHEN ISNULL(rr.goles_local_pt) THEN NULL ELSE rr.goles_local_pt END) AS gLocal_PT,
	(CASE WHEN ISNULL(rr.goles_visita_pt) THEN NULL ELSE rr.goles_visita_pt END) AS gVisita_PT,
	(CASE WHEN ISNULL(rr.goles_local_ot) THEN NULL ELSE rr.goles_local_ot END) AS gLocal_OT,
	(CASE WHEN ISNULL(rr.goles_visita_ot) THEN NULL ELSE rr.goles_visita_ot END) AS gVisita_OT,
	(CASE WHEN ISNULL(rr.penales_local) THEN NULL ELSE rr.penales_local END) AS penales_Local,
	(CASE WHEN ISNULL(rr.penales_visita) THEN NULL ELSE rr.penales_visita END) AS penales_Visita,
	(CASE WHEN ISNULL(rr.minuto_primer_gol) THEN NULL ELSE rr.minuto_primer_gol END) AS Minuto_PG,
	(CASE WHEN ISNULL(j.Nombre) THEN NULL ELSE j.id_jugador END) AS id_jugador_pg,
	(CASE WHEN ISNULL(j.Nombre) THEN NULL ELSE j.Nombre END) AS Jugador_PG, 
	(CASE WHEN ISNULL(rr.goles_local) THEN NULL ELSE 
		(CASE 
			WHEN (rr.goles_local > rr.goles_visita) THEN 3
			WHEN (rr.goles_local = rr.goles_visita) THEN 1 
			ELSE 0 
		END) 
	END) AS pLocal,
	(CASE WHEN ISNULL(rr.goles_visita) THEN NULL ELSE 
		(CASE 
			WHEN (rr.goles_local < rr.goles_visita) THEN 3
			WHEN (rr.goles_local = rr.goles_visita) THEN 1
			ELSE 0
		END)
	END) AS pVisita,
	CASE 
		WHEN r.id_ronda = 1 AND (rr.goles_local > rr.goles_visita) THEN el.Pais
		WHEN r.id_ronda = 1 AND (rr.goles_local = rr.goles_visita) THEN 'Empate'
		WHEN r.id_ronda = 1 AND (rr.goles_local < rr.goles_visita) THEN ev.Pais
 		WHEN r.id_ronda > 1 AND (rr.goles_local > rr.goles_visita) THEN el.Pais
 		WHEN r.id_ronda > 1 AND (rr.goles_local < rr.goles_visita) THEN ev.Pais
		WHEN r.id_ronda > 1 AND (rr.goles_local = rr.goles_visita) THEN 
			CASE
				WHEN rr.goles_local_ot > rr.goles_visita_ot THEN el.Pais
				WHEN rr.goles_local_ot < rr.goles_visita_ot THEN ev.Pais
				WHEN rr.goles_local_ot = rr.goles_visita_ot THEN
					CASE
						WHEN rr.penales_local > rr.penales_visita THEN el.Pais
						WHEN rr.penales_local < rr.penales_visita THEN ev.Pais
					END
			END
	END as 'Ganador'
FROM fixture_post_grupos f
JOIN rondas r ON r.id_ronda = f.id_ronda
JOIN estadios e ON e.id_estadio = f.id_estadio
JOIN equipos_post_grupos eql ON eql.id_equipo = f.id_local
JOIN equipos_post_grupos eqv ON eqv.id_equipo = f.id_visita
LEFT JOIN equipos el ON eql.id_pais = el.id_equipo
LEFT JOIN equipos ev ON eqv.id_pais = ev.id_equipo
LEFT JOIN results rr ON rr.id_match = f.id_match
LEFT JOIN jugadores j ON j.id_jugador = rr.id_jugador_primer_gol ;


-- Volcando estructura para vista brasil2014.vw_results_by_group
DROP VIEW IF EXISTS `vw_results_by_group`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_results_by_group`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_results_by_group` AS select `v`.`Grupo` AS `Grupo`,`v`.`ID` AS `ID`,`v`.`Equipo` AS `Equipo`,`v`.`Codigo` AS `Codigo`,sum(`v`.`Jugados`) AS `Jugados`,sum(`v`.`Victorias`) AS `Victorias`,sum(`v`.`Empates`) AS `Empates`,sum(`v`.`Derrotas`) AS `Derrotas`,sum(`v`.`gFavor`) AS `Goles a Favor`,sum(`v`.`gContra`) AS `Goles en Contra`,(sum(`v`.`gFavor`) - sum(`v`.`gContra`)) AS `Diferencia de Goles`,((3 * sum(`v`.`Victorias`)) + (1 * sum(`v`.`Empates`))) AS `Puntos` from `vw_results_by_group_tmp` `v` group by `v`.`Grupo`,`v`.`Equipo` order by `v`.`Grupo`,((3 * sum(`v`.`Victorias`)) + (1 * sum(`v`.`Empates`))) desc,(sum(`v`.`gFavor`) - sum(`v`.`gContra`)) desc,sum(`v`.`gFavor`) desc,`v`.`ID` ;


-- Volcando estructura para vista brasil2014.vw_results_by_group_tmp
DROP VIEW IF EXISTS `vw_results_by_group_tmp`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_results_by_group_tmp`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_results_by_group_tmp` AS SELECT p.Grupo AS Grupo,p.iLocal AS ID,p.eLocal AS Equipo,p.CodeL AS Codigo, SUM((CASE WHEN (p.gLocal IS NOT NULL) THEN 1 ELSE 0 END)) AS Jugados, SUM((CASE WHEN ((p.gLocal IS NOT NULL) AND (p.gLocal > p.gVisita)) THEN 1 ELSE 0 END)) AS Victorias, SUM((CASE WHEN ((p.gLocal IS NOT NULL) AND (p.gLocal = p.gVisita)) THEN 1 ELSE 0 END)) AS Empates, SUM((CASE WHEN ((p.gLocal IS NOT NULL) AND (p.gLocal < p.gVisita)) THEN 1 ELSE 0 END)) AS Derrotas,(CASE WHEN ISNULL(SUM(p.gVisita)) THEN 0 ELSE SUM(p.gVisita) END) AS gContra,(CASE WHEN ISNULL(SUM(p.gLocal)) THEN 0 ELSE SUM(p.gLocal) END) AS gFavor
FROM vw_results p
WHERE (p.Grupo <> '')
GROUP BY p.Grupo,p.eLocal
UNION ALL
SELECT p.Grupo AS Grupo,p.iVisita AS ID,p.eVisita AS Equipo,p.CodeV AS Codigo, SUM((CASE WHEN (p.gVisita IS NOT NULL) THEN 1 ELSE 0 END)) AS Jugados, SUM((CASE WHEN ((p.gVisita IS NOT NULL) AND (p.gVisita > p.gLocal)) THEN 1 ELSE 0 END)) AS Victorias, SUM((CASE WHEN ((p.gVisita IS NOT NULL) AND (p.gLocal = p.gVisita)) THEN 1 ELSE 0 END)) AS Empates, SUM((CASE WHEN ((p.gVisita IS NOT NULL) AND (p.gVisita < p.gLocal)) THEN 1 ELSE 0 END)) AS Derrotas,(CASE WHEN ISNULL(SUM(p.gLocal)) THEN 0 ELSE SUM(p.gLocal) END) AS gContra,(CASE WHEN ISNULL(SUM(p.gVisita)) THEN 0 ELSE SUM(p.gVisita) END) AS gFavor
FROM vw_results p
WHERE (p.Grupo <> '')
GROUP BY p.Grupo,p.eVisita ;


-- Volcando estructura para vista brasil2014.vw_results_post_grupos
DROP VIEW IF EXISTS `vw_results_post_grupos`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_results_post_grupos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_results_post_grupos` AS SELECT 
--	r.id_ronda,
	CASE 
		WHEN r.Partido NOT IN (63, 64) THEN CONCAT('Ganador ', r.Partido)
		ELSE CONCAT('Perdedor ', r.Partido - 2)
	END AS Equipo, 
	e.id_equipo as id_equipo_new,
	CASE 
		WHEN r.Ganador IS NULL THEN NULL 
		ELSE CASE WHEN r.Ganador = r.eLocal THEN r.iLocal ELSE r.iVisita END 
	END AS id_equipo, 
	CASE 
		WHEN r.Ganador IS NULL THEN NULL
		ELSE CASE WHEN r.Ganador = r.eLocal THEN r.eLocal ELSE r.eVisita END 
	END AS Pais
FROM vw_results r
LEFT JOIN equipos e ON e.Pais = (CASE WHEN r.Ganador IS NULL THEN NULL ELSE CASE WHEN r.Ganador = r.eLocal THEN r.eLocal ELSE r.eVisita END END)
WHERE id_ronda > 1 ;


-- Volcando estructura para vista brasil2014.vw_seleccionados
DROP VIEW IF EXISTS `vw_seleccionados`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_seleccionados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_seleccionados` AS select `e`.`id_equipo` AS `id_equipo`,`e`.`Code` AS `Code`,`e`.`Pais` AS `Pais`,`p`.`posicion` AS `Posicion`,`j`.`id_jugador` AS `id_jugador`,`j`.`Nombre` AS `Nombre`,`j`.`club` AS `Club`,`j`.`pais_club` AS `Pais del Club` from ((`jugadores` `j` join `equipos` `e` on((`e`.`id_equipo` = `j`.`id_equipo`))) join `posiciones` `p` on((`p`.`id_posicion` = `j`.`id_posicion`))) where ((`j`.`va_a_brasil` = 1) and (`j`.`reserva` = 0)) order by `e`.`id_equipo`,`p`.`id_posicion` ;


-- Volcando estructura para vista brasil2014.vw_selec_clubs
DROP VIEW IF EXISTS `vw_selec_clubs`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_selec_clubs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_selec_clubs` AS select `e`.`id_equipo` AS `id_equipo`,`e`.`Pais` AS `Pais`,`j`.`club` AS `Club`,count(0) AS `Numero de Jugadores` from (`jugadores` `j` join `equipos` `e` on((`j`.`id_equipo` = `e`.`id_equipo`))) group by `e`.`Pais`,`j`.`club` order by `e`.`id_equipo`,`e`.`Pais`,count(0) desc,`j`.`club` ;


-- Volcando estructura para vista brasil2014.vw_selec_pais
DROP VIEW IF EXISTS `vw_selec_pais`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_selec_pais`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_selec_pais` AS select `e`.`id_equipo` AS `id_equipo`,`e`.`Pais` AS `Pais`,`j`.`pais_club` AS `pais_club`,count(0) AS `Jugadores` from (`jugadores` `j` join `equipos` `e` on((`j`.`id_equipo` = `e`.`id_equipo`))) where (`j`.`va_a_brasil` = 1) group by `e`.`Pais`,`j`.`pais_club` order by `e`.`id_equipo`,count(0) desc,`j`.`pais_club` ;


-- Volcando estructura para vista brasil2014.vw_selec_perc_pais
DROP VIEW IF EXISTS `vw_selec_perc_pais`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_selec_perc_pais`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_selec_perc_pais` AS select `p`.`id_equipo` AS `id_equipo`,`p`.`Pais` AS `Pais`,`p`.`pais_club` AS `pais_club`,`p`.`Jugadores` AS `Jugadores`,((`p`.`Jugadores` / `t`.`Jugadores`) * 100) AS `Porcentaje` from (`vw_selec_total` `t` join `vw_selec_pais` `p` on(((`t`.`id_equipo` = `p`.`id_equipo`) and (`t`.`Pais` = `p`.`Pais`)))) ;


-- Volcando estructura para vista brasil2014.vw_selec_perc_pais_top
DROP VIEW IF EXISTS `vw_selec_perc_pais_top`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_selec_perc_pais_top`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_selec_perc_pais_top` AS select `p`.`id_equipo` AS `id_equipo`,`p`.`Pais` AS `Pais`,`p`.`pais_club` AS `pais_club`,`p`.`Jugadores` AS `Jugadores`,`p`.`Porcentaje` AS `Porcentaje` from `vw_selec_perc_pais` `p` where ((select count(0) from `vw_selec_perc_pais` `f` where ((`f`.`id_equipo` = `p`.`id_equipo`) and (`f`.`Porcentaje` >= `p`.`Porcentaje`))) <= 3) order by 1,5 desc ;


-- Volcando estructura para vista brasil2014.vw_selec_posic_pais
DROP VIEW IF EXISTS `vw_selec_posic_pais`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_selec_posic_pais`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_selec_posic_pais` AS select `e`.`id_equipo` AS `id_equipo`,`e`.`Pais` AS `Pais`,`p`.`posicion` AS `Posicion`,`j`.`pais_club` AS `pais_club`,count(0) AS `Numero de Jugadores` from ((`jugadores` `j` join `equipos` `e` on((`j`.`id_equipo` = `e`.`id_equipo`))) join `posiciones` `p` on((`p`.`id_posicion` = `j`.`id_posicion`))) where (`j`.`va_a_brasil` = 1) group by `e`.`Pais`,`p`.`posicion`,`j`.`pais_club` order by `e`.`id_equipo`,`e`.`Pais`,`p`.`posicion`,count(0) desc,`j`.`pais_club` ;


-- Volcando estructura para vista brasil2014.vw_selec_total
DROP VIEW IF EXISTS `vw_selec_total`;
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_selec_total`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_selec_total` AS select `e`.`id_equipo` AS `id_equipo`,`e`.`Pais` AS `Pais`,count(0) AS `Jugadores`,sum(`j`.`reserva`) AS `Reservas` from (`jugadores` `j` join `equipos` `e` on((`j`.`id_equipo` = `e`.`id_equipo`))) where (`j`.`va_a_brasil` = 1) group by `e`.`Pais` order by `e`.`id_equipo`,count(0) desc ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

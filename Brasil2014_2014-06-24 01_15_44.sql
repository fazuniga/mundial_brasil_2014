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


-- Volcando estructura para tabla brasil2014.apuestas
CREATE TABLE IF NOT EXISTS `apuestas` (
  `id_carton` int(11) NOT NULL,
  `id_match` int(11) NOT NULL,
  `goles_local` int(11) DEFAULT NULL,
  `goles_visita` int(11) DEFAULT NULL,
  `goles_local_pt` int(11) DEFAULT NULL,
  `goles_visita_pt` int(11) DEFAULT NULL,
  `minuto_primer_gol` int(11) DEFAULT NULL,
  `id_jugador_primer_gol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_carton`,`id_match`),
  KEY `jugador_primer_gol` (`id_jugador_primer_gol`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Volcando estructura para tabla brasil2014.cartones
CREATE TABLE IF NOT EXISTS `cartones` (
  `id_carton` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) CHARACTER SET utf8 NOT NULL,
  `id_user` int(11) NOT NULL,
  `pagado` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_carton`,`id_user`,`descripcion`,`pagado`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando estructura para tabla brasil2014.dow
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


-- Volcando estructura para tabla brasil2014.fixture
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


-- Volcando estructura para tabla brasil2014.grupos_results
CREATE TABLE IF NOT EXISTS `grupos_results` (
  `Grupo` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ID` int(11) NOT NULL DEFAULT '0',
  `Equipo` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Codigo` varchar(2) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Jugados` decimal(23,0) NOT NULL DEFAULT '0',
  `Victorias` decimal(23,0) DEFAULT NULL,
  `Empates` decimal(23,0) DEFAULT NULL,
  `Derrotas` decimal(23,0) DEFAULT NULL,
  `gContra` decimal(32,0) DEFAULT NULL,
  `gFavor` decimal(32,0) DEFAULT NULL,
  PRIMARY KEY (`Grupo`,`ID`,`Equipo`,`Codigo`,`Jugados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla brasil2014.grupos_results: ~96 rows (aproximadamente)
/*!40000 ALTER TABLE `grupos_results` DISABLE KEYS */;
INSERT IGNORE INTO `grupos_results` (`Grupo`, `ID`, `Equipo`, `Codigo`, `Jugados`, `Victorias`, `Empates`, `Derrotas`, `gContra`, `gFavor`) VALUES
	('', 33, 'Primero A', '', 1, 0, 1, 0, -100, -100),
	('', 34, 'Segundo A', '', 1, 0, 1, 0, -100, -100),
	('', 35, 'Primero B', '', 1, 0, 1, 0, -100, -100),
	('', 36, 'Segundo B', '', 1, 0, 1, 0, -100, -100),
	('', 37, 'Primero C', '', 1, 0, 1, 0, -100, -100),
	('', 38, 'Segundo C', '', 1, 0, 1, 0, -100, -100),
	('', 39, 'Primero D', '', 1, 0, 1, 0, -100, -100),
	('', 40, 'Segundo D', '', 1, 0, 1, 0, -100, -100),
	('', 41, 'Primero E', '', 1, 0, 1, 0, -100, -100),
	('', 42, 'Segundo E', '', 1, 0, 1, 0, -100, -100),
	('', 43, 'Primero F', '', 1, 0, 1, 0, -100, -100),
	('', 44, 'Segundo F', '', 1, 0, 1, 0, -100, -100),
	('', 45, 'Primero G', '', 1, 0, 1, 0, -100, -100),
	('', 46, 'Segundo G', '', 1, 0, 1, 0, -100, -100),
	('', 47, 'Primero H', '', 1, 0, 1, 0, -100, -100),
	('', 48, 'Segundo H', '', 1, 0, 1, 0, -100, -100),
	('', 49, 'Ganador 49', '', 1, 0, 1, 0, -100, -100),
	('', 50, 'Ganador 50', '', 1, 0, 1, 0, -100, -100),
	('', 51, 'Ganador 51', '', 1, 0, 1, 0, -100, -100),
	('', 52, 'Ganador 52', '', 1, 0, 1, 0, -100, -100),
	('', 53, 'Ganador 53', '', 1, 0, 1, 0, -100, -100),
	('', 54, 'Ganador 54', '', 1, 0, 1, 0, -100, -100),
	('', 55, 'Ganador 55', '', 1, 0, 1, 0, -100, -100),
	('', 56, 'Ganador 56', '', 1, 0, 1, 0, -100, -100),
	('', 57, 'Ganador 57', '', 1, 0, 1, 0, -100, -100),
	('', 58, 'Ganador 58', '', 1, 0, 1, 0, -100, -100),
	('', 59, 'Ganador 59', '', 1, 0, 1, 0, -100, -100),
	('', 60, 'Ganador 60', '', 1, 0, 1, 0, -100, -100),
	('', 61, 'Ganador 61', '', 1, 0, 1, 0, -100, -100),
	('', 62, 'Ganador 62', '', 1, 0, 1, 0, -100, -100),
	('', 63, 'Perdedor 61', '', 1, 0, 1, 0, -100, -100),
	('', 64, 'Perdedor 62', '', 1, 0, 1, 0, -100, -100),
	('A', 1, 'Brasil', 'BR', 1, 0, 1, 0, -100, -100),
	('A', 1, 'Brasil', 'BR', 2, 0, 2, 0, -200, -200),
	('A', 2, 'Croacia', 'HR', 1, 0, 1, 0, -100, -100),
	('A', 2, 'Croacia', 'HR', 2, 0, 2, 0, -200, -200),
	('A', 3, 'MÃ©xico', 'MX', 1, 0, 1, 0, -100, -100),
	('A', 3, 'MÃ©xico', 'MX', 2, 0, 2, 0, -200, -200),
	('A', 4, 'CamerÃºn', 'CM', 1, 0, 1, 0, -100, -100),
	('A', 4, 'CamerÃºn', 'CM', 2, 0, 2, 0, -200, -200),
	('B', 5, 'EspaÃ±a', 'ES', 1, 0, 1, 0, -100, -100),
	('B', 5, 'EspaÃ±a', 'ES', 2, 0, 2, 0, -200, -200),
	('B', 6, 'Holanda', 'NL', 1, 0, 1, 0, -100, -100),
	('B', 6, 'Holanda', 'NL', 2, 0, 2, 0, -200, -200),
	('B', 7, 'Chile', 'CL', 1, 0, 1, 0, -100, -100),
	('B', 7, 'Chile', 'CL', 2, 0, 2, 0, -200, -200),
	('B', 8, 'Australia', 'AU', 1, 0, 1, 0, -100, -100),
	('B', 8, 'Australia', 'AU', 2, 0, 2, 0, -200, -200),
	('C', 9, 'Colombia', 'CO', 1, 0, 1, 0, -100, -100),
	('C', 9, 'Colombia', 'CO', 2, 0, 2, 0, -200, -200),
	('C', 10, 'Grecia', 'GR', 1, 0, 1, 0, -100, -100),
	('C', 10, 'Grecia', 'GR', 2, 0, 2, 0, -200, -200),
	('C', 11, 'Costa de Marfil', 'CI', 1, 0, 1, 0, -100, -100),
	('C', 11, 'Costa de Marfil', 'CI', 2, 0, 2, 0, -200, -200),
	('C', 12, 'JapÃ³n', 'JP', 1, 0, 1, 0, -100, -100),
	('C', 12, 'JapÃ³n', 'JP', 2, 0, 2, 0, -200, -200),
	('D', 13, 'Uruguay', 'UY', 1, 0, 1, 0, -100, -100),
	('D', 13, 'Uruguay', 'UY', 2, 0, 2, 0, -200, -200),
	('D', 14, 'Italia', 'IT', 1, 0, 1, 0, -100, -100),
	('D', 14, 'Italia', 'IT', 2, 0, 2, 0, -200, -200),
	('D', 15, 'Inglaterra', 'EN', 1, 0, 1, 0, -100, -100),
	('D', 15, 'Inglaterra', 'EN', 2, 0, 2, 0, -200, -200),
	('D', 16, 'Costa Rica', 'CR', 1, 0, 1, 0, -100, -100),
	('D', 16, 'Costa Rica', 'CR', 2, 0, 2, 0, -200, -200),
	('E', 17, 'Suiza', 'CH', 1, 0, 1, 0, -100, -100),
	('E', 17, 'Suiza', 'CH', 2, 0, 2, 0, -200, -200),
	('E', 18, 'Francia', 'FR', 1, 0, 1, 0, -100, -100),
	('E', 18, 'Francia', 'FR', 2, 0, 2, 0, -200, -200),
	('E', 19, 'Ecuador', 'EC', 1, 0, 1, 0, -100, -100),
	('E', 19, 'Ecuador', 'EC', 2, 0, 2, 0, -200, -200),
	('E', 20, 'Honduras', 'HN', 1, 0, 1, 0, -100, -100),
	('E', 20, 'Honduras', 'HN', 2, 0, 2, 0, -200, -200),
	('F', 21, 'Argentina', 'AR', 1, 0, 1, 0, -100, -100),
	('F', 21, 'Argentina', 'AR', 2, 0, 2, 0, -200, -200),
	('F', 22, 'Bosnia - Herzegovina', 'BA', 1, 0, 1, 0, -100, -100),
	('F', 22, 'Bosnia - Herzegovina', 'BA', 2, 0, 2, 0, -200, -200),
	('F', 23, 'Nigeria', 'NG', 1, 0, 1, 0, -100, -100),
	('F', 23, 'Nigeria', 'NG', 2, 0, 2, 0, -200, -200),
	('F', 24, 'IrÃ¡n', 'IR', 1, 0, 1, 0, -100, -100),
	('F', 24, 'IrÃ¡n', 'IR', 2, 0, 2, 0, -200, -200),
	('G', 25, 'Alemania', 'DE', 1, 0, 1, 0, -100, -100),
	('G', 25, 'Alemania', 'DE', 2, 0, 2, 0, -200, -200),
	('G', 26, 'Estados Unidos', 'US', 1, 0, 1, 0, -100, -100),
	('G', 26, 'Estados Unidos', 'US', 2, 0, 2, 0, -200, -200),
	('G', 27, 'Portugal', 'PT', 1, 0, 1, 0, -100, -100),
	('G', 27, 'Portugal', 'PT', 2, 0, 2, 0, -200, -200),
	('G', 28, 'Ghana', 'GH', 1, 0, 1, 0, -100, -100),
	('G', 28, 'Ghana', 'GH', 2, 0, 2, 0, -200, -200),
	('H', 29, 'BÃ©lgica', 'BE', 1, 0, 1, 0, -100, -100),
	('H', 29, 'BÃ©lgica', 'BE', 2, 0, 2, 0, -200, -200),
	('H', 30, 'Rusia', 'RU', 1, 0, 1, 0, -100, -100),
	('H', 30, 'Rusia', 'RU', 2, 0, 2, 0, -200, -200),
	('H', 31, 'Argelia', 'DZ', 1, 0, 1, 0, -100, -100),
	('H', 31, 'Argelia', 'DZ', 2, 0, 2, 0, -200, -200),
	('H', 32, 'Corea del Sur', 'KR', 1, 0, 1, 0, -100, -100),
	('H', 32, 'Corea del Sur', 'KR', 2, 0, 2, 0, -200, -200);
/*!40000 ALTER TABLE `grupos_results` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.grupos_stats
CREATE TABLE IF NOT EXISTS `grupos_stats` (
  `Grupo` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ID` int(11) NOT NULL DEFAULT '0',
  `Equipo` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Codigo` varchar(2) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Jugados` decimal(45,0) DEFAULT NULL,
  `Victorias` decimal(45,0) DEFAULT NULL,
  `Empates` decimal(45,0) DEFAULT NULL,
  `Derrotas` decimal(45,0) DEFAULT NULL,
  `Goles a Favor` decimal(54,0) DEFAULT NULL,
  `Goles en Contra` decimal(54,0) DEFAULT NULL,
  `Diferencia de Goles` decimal(55,0) DEFAULT NULL,
  `Puntos` decimal(47,0) DEFAULT NULL,
  PRIMARY KEY (`Grupo`,`ID`,`Equipo`,`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla brasil2014.grupos_stats: ~64 rows (aproximadamente)
/*!40000 ALTER TABLE `grupos_stats` DISABLE KEYS */;
INSERT IGNORE INTO `grupos_stats` (`Grupo`, `ID`, `Equipo`, `Codigo`, `Jugados`, `Victorias`, `Empates`, `Derrotas`, `Goles a Favor`, `Goles en Contra`, `Diferencia de Goles`, `Puntos`) VALUES
	('', 33, 'Primero A', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 34, 'Segundo A', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 35, 'Primero B', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 36, 'Segundo B', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 37, 'Primero C', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 38, 'Segundo C', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 39, 'Primero D', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 40, 'Segundo D', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 41, 'Primero E', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 42, 'Segundo E', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 43, 'Primero F', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 44, 'Segundo F', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 45, 'Primero G', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 46, 'Segundo G', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 47, 'Primero H', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 48, 'Segundo H', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 49, 'Ganador 49', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 50, 'Ganador 50', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 51, 'Ganador 51', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 52, 'Ganador 52', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 53, 'Ganador 53', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 54, 'Ganador 54', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 55, 'Ganador 55', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 56, 'Ganador 56', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 57, 'Ganador 57', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 58, 'Ganador 58', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 59, 'Ganador 59', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 60, 'Ganador 60', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 61, 'Ganador 61', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 62, 'Ganador 62', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 63, 'Perdedor 61', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('', 64, 'Perdedor 62', '', 1, 0, 1, 0, -100, -100, 0, 1),
	('A', 1, 'Brasil', 'BR', 3, 0, 3, 0, -300, -300, 0, 3),
	('A', 2, 'Croacia', 'HR', 3, 0, 3, 0, -300, -300, 0, 3),
	('A', 3, 'MÃ©xico', 'MX', 3, 0, 3, 0, -300, -300, 0, 3),
	('A', 4, 'CamerÃºn', 'CM', 3, 0, 3, 0, -300, -300, 0, 3),
	('B', 5, 'EspaÃ±a', 'ES', 3, 0, 3, 0, -300, -300, 0, 3),
	('B', 6, 'Holanda', 'NL', 3, 0, 3, 0, -300, -300, 0, 3),
	('B', 7, 'Chile', 'CL', 3, 0, 3, 0, -300, -300, 0, 3),
	('B', 8, 'Australia', 'AU', 3, 0, 3, 0, -300, -300, 0, 3),
	('C', 9, 'Colombia', 'CO', 3, 0, 3, 0, -300, -300, 0, 3),
	('C', 10, 'Grecia', 'GR', 3, 0, 3, 0, -300, -300, 0, 3),
	('C', 11, 'Costa de Marfil', 'CI', 3, 0, 3, 0, -300, -300, 0, 3),
	('C', 12, 'JapÃ³n', 'JP', 3, 0, 3, 0, -300, -300, 0, 3),
	('D', 13, 'Uruguay', 'UY', 3, 0, 3, 0, -300, -300, 0, 3),
	('D', 14, 'Italia', 'IT', 3, 0, 3, 0, -300, -300, 0, 3),
	('D', 15, 'Inglaterra', 'EN', 3, 0, 3, 0, -300, -300, 0, 3),
	('D', 16, 'Costa Rica', 'CR', 3, 0, 3, 0, -300, -300, 0, 3),
	('E', 17, 'Suiza', 'CH', 3, 0, 3, 0, -300, -300, 0, 3),
	('E', 18, 'Francia', 'FR', 3, 0, 3, 0, -300, -300, 0, 3),
	('E', 19, 'Ecuador', 'EC', 3, 0, 3, 0, -300, -300, 0, 3),
	('E', 20, 'Honduras', 'HN', 3, 0, 3, 0, -300, -300, 0, 3),
	('F', 21, 'Argentina', 'AR', 3, 0, 3, 0, -300, -300, 0, 3),
	('F', 22, 'Bosnia - Herzegovina', 'BA', 3, 0, 3, 0, -300, -300, 0, 3),
	('F', 23, 'Nigeria', 'NG', 3, 0, 3, 0, -300, -300, 0, 3),
	('F', 24, 'IrÃ¡n', 'IR', 3, 0, 3, 0, -300, -300, 0, 3),
	('G', 25, 'Alemania', 'DE', 3, 0, 3, 0, -300, -300, 0, 3),
	('G', 26, 'Estados Unidos', 'US', 3, 0, 3, 0, -300, -300, 0, 3),
	('G', 27, 'Portugal', 'PT', 3, 0, 3, 0, -300, -300, 0, 3),
	('G', 28, 'Ghana', 'GH', 3, 0, 3, 0, -300, -300, 0, 3),
	('H', 29, 'BÃ©lgica', 'BE', 3, 0, 3, 0, -300, -300, 0, 3),
	('H', 30, 'Rusia', 'RU', 3, 0, 3, 0, -300, -300, 0, 3),
	('H', 31, 'Argelia', 'DZ', 3, 0, 3, 0, -300, -300, 0, 3),
	('H', 32, 'Corea del Sur', 'KR', 3, 0, 3, 0, -300, -300, 0, 3);
/*!40000 ALTER TABLE `grupos_stats` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.jugadores
CREATE TABLE IF NOT EXISTS `jugadores` (
  `id_jugador` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL DEFAULT '0',
  `Nombre` varchar(50) NOT NULL DEFAULT '',
  `id_posicion` int(11) NOT NULL DEFAULT '0',
  `club` varchar(50) NOT NULL DEFAULT '',
  `pais_club` varchar(50) NOT NULL DEFAULT '',
  `reserva` int(11) NOT NULL DEFAULT '0',
  `va_a_brasil` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_jugador`,`id_equipo`,`Nombre`,`id_posicion`,`club`,`pais_club`,`reserva`,`va_a_brasil`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_posicion` (`id_posicion`)
) ENGINE=MyISAM AUTO_INCREMENT=921 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla brasil2014.jugadores: 919 rows
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT IGNORE INTO `jugadores` (`id_jugador`, `id_equipo`, `Nombre`, `id_posicion`, `club`, `pais_club`, `reserva`, `va_a_brasil`) VALUES
	(1, 16, 'Keylor Navas', 1, 'Levante', 'EspaÃ±a', 0, 1),
	(2, 16, 'Patrick Pemberton', 1, 'Alajuelense', 'Costa Rica', 0, 1),
	(3, 16, 'Daniel Cambronero', 1, 'Herediano', 'Costa Rica', 0, 1),
	(4, 16, 'Esteban Alvarado', 1, 'AZ Alkmaar', 'Holanda', 0, 0),
	(5, 16, 'Giancarlo GonzÃ¡lez', 2, 'Columbus Crew', 'Estados Unidos', 0, 1),
	(6, 16, 'Johnny Acosta', 2, 'Alajuelense', 'Costa Rica', 0, 1),
	(7, 16, 'Kendall Waston', 2, 'Saprissa', 'Costa Rica', 0, 0),
	(8, 16, 'Michael UmaÃ±a', 2, 'Saprissa', 'Costa Rica', 0, 1),
	(9, 16, 'Roy Miller', 2, 'New York Red Bulls', 'Estados Unidos', 0, 1),
	(10, 16, 'Christian Gamboa', 2, 'Rosenborg', 'Noruega', 0, 1),
	(11, 16, 'Oscar Duarte', 2, 'FC Brujas', 'BÃ©lgica', 0, 1),
	(12, 16, 'Heiner Mora', 2, 'Saprissa', 'Costa Rica', 0, 1),
	(13, 16, 'Junior DÃ­az', 2, 'Mainz 04', 'Alemania', 0, 1),
	(14, 16, 'Waylon FrancisÂ ', 2, 'Columbus Crew', 'Estados Unidos', 0, 1),
	(15, 16, 'Yeltsin Tejeda', 3, 'Saprissa', 'Costa Rica', 0, 1),
	(16, 16, 'Carlos HernÃ¡ndez', 3, 'Wellington Phoenix', 'Australia', 0, 0),
	(17, 16, 'Celso Borges', 3, 'AIK', 'Suecia', 0, 1),
	(18, 16, 'JosÃ© Miguel Cubero', 3, 'Herediano', 'Costa Rica', 0, 1),
	(19, 16, 'Hansell Arauz', 3, 'Saprissa', 'Costa Rica', 0, 0),
	(20, 16, 'Michael Barrantes', 3, 'Aalesund', 'Noruega', 0, 1),
	(21, 16, 'Oscar GranadosÂ ', 3, 'Herediano', 'Costa Rica', 0, 1),
	(22, 16, 'Ariel Rodriguez', 3, 'Alajuelense', 'Costa Rica', 0, 0),
	(23, 16, 'Jairo Arrieta', 3, 'Columbus Crew', 'Estados Unidos', 0, 0),
	(24, 16, 'Marco UreÃ±a', 4, 'Kuban Krasnodar', 'Rusia', 0, 1),
	(25, 16, 'Christian BolaÃ±os', 3, 'FC Copenhague', 'Dinamarca', 0, 1),
	(26, 16, 'Diego Calvo', 3, 'Valerenga', 'Noruega', 0, 1),
	(27, 16, 'Randall Brenes', 4, 'CartaginÃ©s', 'Costa Rica', 0, 1),
	(28, 16, 'Alvaro SaborÃ­o', 4, 'Real Salt Lake', 'Estados Unidos', 0, 0),
	(29, 16, 'Bryan Ruiz', 4, 'PSV Eindhoven', 'Holanda', 0, 1),
	(30, 16, 'Joel Campbell', 4, 'Olympiakos', 'Grecia', 0, 1),
	(31, 26, 'Brad Guzan', 1, 'Aston Villa', 'Inglaterra', 0, 1),
	(32, 26, 'Tim Howard', 1, 'Everton', 'Inglaterra', 0, 1),
	(33, 26, 'Nick Rimando', 1, 'Real Salt Lake', 'Estados Unidos', 0, 1),
	(34, 26, 'DaMarcus Beasley', 2, 'Puebla', 'MÃ©xico', 0, 1),
	(35, 26, 'Matt Besler', 2, 'Sporting Kansas City', 'Estados Unidos', 0, 1),
	(36, 26, 'John Brooks', 2, 'Hertha Berlin', 'Alemania', 0, 1),
	(37, 26, 'Geoff Cameron', 2, 'Stoke City', 'Inglaterra', 0, 1),
	(38, 26, 'Timmy ChandlerÂ ', 2, 'Nuremberg', 'Alemania', 0, 1),
	(39, 26, 'Brad Evans', 2, 'Seattle Sounders FC', 'Estados Unidos', 0, 1),
	(40, 26, 'Omar Gonzalez', 2, 'LA Galaxy', 'Estados Unidos', 0, 1),
	(41, 26, 'Clarence Goodson', 2, 'San Jose Earthquakes', 'Estados Unidos', 0, 1),
	(42, 26, 'Fabian Johnson', 2, 'Hoffenheim', 'Alemania', 0, 1),
	(43, 26, 'Michael ParkhurstÂ ', 2, 'Columbus Crew', 'Estados Unidos', 0, 1),
	(44, 26, 'DeAndre Yedlin', 2, 'Seattle Sounders FC', 'Estados Unidos', 0, 1),
	(45, 26, 'Kyle Beckerman', 3, 'Real Salt Lake', 'Estados Unidos', 0, 1),
	(46, 26, 'Alejandro Bedoya', 3, 'Nantes', 'Francia', 0, 1),
	(47, 26, 'Michael Bradley', 3, 'Toronto FC', 'Estados Unidos', 0, 1),
	(48, 26, 'Joe Corona', 3, 'Club Tijuana', 'MÃ©xico', 0, 1),
	(49, 26, 'Brad Davis', 3, 'Houston Dynamo', 'Estados Unidos', 0, 1),
	(50, 26, 'Mix Diskerud', 3, 'Rosenborg', 'Noruega', 0, 1),
	(51, 26, 'Maurice Edu', 3, 'Philadelphia Union', 'Estados Unidos', 0, 1),
	(52, 26, 'Julian Green', 3, 'Bayern Munich', 'Alemania', 0, 1),
	(53, 26, 'Jermaine Jones', 3, 'Besiktas', 'TurquÃ­a', 0, 1),
	(54, 26, 'Graham Zusi', 3, 'Sporting Kansas City', 'Estados Unidos', 0, 1),
	(55, 26, 'Jozy Altidore', 4, 'Sunderland', 'Inglaterra', 0, 1),
	(56, 26, 'Terrence Boyd', 4, 'Rapid Viena', 'Austria', 0, 1),
	(57, 26, 'Clint Dempsey', 4, 'Seattle Sounders FC', 'Estados Unidos', 0, 1),
	(58, 26, 'Landon Donovan', 4, 'LA Galaxy', 'Estados Unidos', 0, 1),
	(59, 26, 'Aron Johannsson', 4, 'AZ Alkmaar', 'Holanda', 0, 1),
	(60, 26, 'Chris Wondolowski', 4, 'San Jose Earthquakes', 'Estados Unidos', 0, 1),
	(61, 20, 'Noel Valladares', 1, 'Olimpia', 'Honduras', 0, 1),
	(62, 20, 'Donis Escober', 1, 'Olimpia', 'Honduras', 0, 1),
	(63, 20, 'Luis LÃ³pez', 1, 'Real EspaÃ±a', 'Honduras', 0, 1),
	(64, 20, 'Brayan Beckeles', 2, 'Olimpia', 'Honduras', 0, 1),
	(65, 20, 'Emilio Izaguirre', 2, 'Celtic', 'Escocia', 0, 1),
	(66, 20, 'Juan Carlos GarcÃ­a', 2, 'Wigan Athletic', 'Inglaterra', 0, 1),
	(67, 20, 'Maynor Figueroa', 2, 'Hull City', 'Inglaterra', 0, 1),
	(68, 20, 'VÃ­ctor Bernardez', 2, 'San Jose Earthquakes', 'Estados Unidos', 0, 1),
	(69, 20, 'OsmÃ¡n ChÃ¡vez', 2, 'Qingdao Janoon', 'China', 0, 1),
	(70, 20, 'Juan Pablo Montes', 2, 'Motagua', 'Honduras', 0, 1),
	(71, 20, 'Arnold Peralta', 3, 'Rangers', 'Escocia', 0, 1),
	(72, 20, 'Luis Garrido', 3, 'Olimpia', 'Honduras', 0, 1),
	(73, 20, 'Roger Espinoza', 3, 'Wigan Athletic', 'Inglaterra', 0, 1),
	(74, 20, 'Jorge Claros', 3, 'Motagua', 'Honduras', 0, 1),
	(75, 20, 'Wilson Palacios', 3, 'Stoke City', 'Inglaterra', 0, 1),
	(76, 20, 'Oscar GarcÃ­a', 3, 'Houston Dynamo', 'Estados Unidos', 0, 1),
	(77, 20, 'Andy Najar', 3, 'Anderlecht', 'BÃ©lgica', 0, 1),
	(78, 20, 'Mario MartÃ­nez', 3, 'Real EspaÃ±a', 'Honduras', 0, 1),
	(79, 20, 'Marvin ChÃ¡vez', 3, 'Colorado Rapids', 'Estados Unidos', 0, 1),
	(80, 20, 'Jerry Bengtson', 4, 'New England Revolution', 'Estados Unidos', 0, 1),
	(81, 20, 'Jerry Palacios', 4, 'Alajuelense', 'Costa Rica', 0, 1),
	(82, 20, 'Carlo Costly', 4, 'Real EspaÃ±a', 'Honduras', 0, 1),
	(83, 20, 'Rony MartÃ­nez', 4, 'Real Sociedad', 'EspaÃ±a', 0, 1),
	(84, 3, 'JesÃºs Corona', 1, 'Cruz Azul', 'MÃ©xico', 0, 1),
	(85, 3, 'Alfredo Talavera', 1, 'Toluca', 'MÃ©xico', 0, 1),
	(86, 3, 'Guillermo Ochoa', 1, 'AC Ajaccio', 'Francia', 0, 1),
	(87, 3, 'Paul Aguilar', 2, 'AmÃ©rica', 'MÃ©xico', 0, 1),
	(88, 3, 'Miguel LayÃºn', 2, 'AmÃ©rica', 'MÃ©xico', 0, 1),
	(89, 3, 'HÃ©ctor Moreno', 2, 'Espanyol', 'EspaÃ±a', 0, 1),
	(90, 3, 'Diego Reyes', 2, 'FC Porto', 'Portugal', 0, 1),
	(91, 3, 'Francisco RodrÃ­guez', 2, 'AmÃ©rica', 'MÃ©xico', 0, 1),
	(92, 3, 'Rafael MÃ¡rquez', 2, 'LeÃ³n', 'MÃ©xico', 0, 1),
	(93, 3, 'Carlos Salcido', 2, 'Tigres', 'MÃ©xico', 0, 1),
	(94, 3, 'HÃ©ctor Herrera', 3, 'FC Porto', 'Portugal', 0, 1),
	(95, 3, 'JosÃ© Juan VÃ¡zquez', 3, 'LeÃ³n', 'MÃ©xico', 0, 1),
	(96, 3, 'Juan Carlos Medina', 3, 'AmÃ©rica', 'MÃ©xico', 0, 0),
	(97, 3, 'Carlos Pena', 3, 'LeÃ³n', 'MÃ©xico', 0, 1),
	(98, 3, 'Isaac Brizuela', 3, 'Toluca', 'MÃ©xico', 0, 1),
	(99, 3, 'Luis Montes', 3, 'LeÃ³n', 'MÃ©xico', 0, 0),
	(100, 3, 'Marco FabiÃ¡n', 3, 'Cruz Azul', 'MÃ©xico', 0, 1),
	(101, 3, 'AndrÃ©s Guardado', 3, 'Bayer Leverkusen', 'Alemania', 0, 1),
	(102, 3, 'Oribe Peralta', 4, 'Santos Laguna', 'MÃ©xico', 0, 1),
	(103, 3, 'Javier HernÃ¡ndez', 4, 'Manchester United', 'Inglaterra', 0, 1),
	(104, 3, 'RaÃºl JimÃ©nez', 4, 'AmÃ©rica', 'MÃ©xico', 0, 1),
	(105, 3, 'Alan Pulido', 4, 'Tigres', 'MÃ©xico', 0, 1),
	(106, 3, 'Giovani dos Santos', 4, 'Villarreal', 'EspaÃ±a', 0, 1),
	(107, 21, 'Mariano AndÃºjar', 1, 'Catania', 'Italia', 0, 1),
	(108, 21, 'AgustÃ­n OriÃ³n', 1, 'Boca Juniors', 'Argentina', 0, 1),
	(109, 21, 'Sergio Romero', 1, 'Monaco', 'Francia', 0, 1),
	(110, 21, 'JosÃ© Basanta', 2, 'Monterrey', 'MÃ©xico', 0, 1),
	(111, 21, 'Hugo Campagnaro', 2, 'Inter de MilÃ¡n', 'Italia', 0, 1),
	(112, 21, 'MartÃ­n Demichelis', 2, 'Manchester City', 'Inglaterra', 0, 1),
	(113, 21, 'Federico FernÃ¡ndezÂ ', 2, 'Napoli', 'Italia', 0, 1),
	(114, 21, 'Ezequiel Garay', 2, 'Benfica', 'Portugal', 0, 1),
	(115, 21, 'Lisandro LÃ³pez', 2, 'Getafe', 'EspaÃ±a', 0, 0),
	(116, 21, 'Gabriel Mercado', 2, 'River Plate', 'Argentina', 0, 0),
	(117, 21, 'NicolÃ¡s Otamendi', 2, 'AtlÃ©tico Mineiro', 'Brasil', 0, 0),
	(118, 21, 'Marcos Rojo', 2, 'Sporting de Lisboa', 'Portugal', 0, 1),
	(119, 21, 'Pablo Zabaleta', 2, 'Manchester City', 'Inglaterra', 0, 1),
	(120, 21, 'Ricardo Ãlvarez', 3, 'Inter de MilÃ¡n', 'Italia', 0, 1),
	(121, 21, 'Ã‰ver Banega', 3, 'Newell\'s Old Boys', 'Argentina', 0, 0),
	(122, 21, 'Lucas Biglia', 3, 'Lazio', 'Italia', 0, 1),
	(123, 21, 'Ãngel Di MarÃ­a', 3, 'Real Madrid', 'EspaÃ±a', 0, 1),
	(124, 21, 'Augusto FernÃ¡ndez', 3, 'Celta de Vigo', 'EspaÃ±a', 0, 1),
	(125, 21, 'Fernando Gago', 3, 'Boca Juniors', 'Argentina', 0, 1),
	(126, 21, 'Javier MascheranoÂ ', 3, 'FC Barcelona', 'EspaÃ±a', 0, 1),
	(127, 21, 'Enzo PÃ©rez', 3, 'Benfica', 'Portugal', 0, 1),
	(128, 21, 'FabiÃ¡n Rinaudo', 3, 'Catania', 'Italia', 0, 0),
	(129, 21, 'Maximiliano RodrÃ­guez', 3, 'Newell\'s Old Boys', 'Argentina', 0, 1),
	(130, 21, 'JosÃ© Sosa', 3, 'AtlÃ©tico de Madrid', 'EspaÃ±a', 0, 0),
	(131, 21, 'Sergio AgÃ¼ero', 4, 'Manchester City', 'Inglaterra', 0, 1),
	(132, 21, 'Franco Di Santo', 4, 'Werder Bremen', 'Alemania', 0, 0),
	(133, 21, 'Gonzalo HiguaÃ­n', 4, 'Napoli', 'Italia', 0, 1),
	(134, 21, 'Ezequiel Lavezi', 4, 'Paris Saint Germain', 'Francia', 0, 1),
	(135, 21, 'Lionel Messi', 4, 'FC Barcelona', 'EspaÃ±a', 0, 1),
	(136, 21, 'Rodrigo Palacio', 4, 'Inter de MilÃ¡n', 'Italia', 0, 1),
	(137, 1, 'Julio CÃ©sar', 1, 'Toronto FC', 'CanadÃ¡', 0, 1),
	(138, 1, 'Jefferson', 1, 'Botafogo', 'Brasil', 0, 1),
	(139, 1, 'Vitor', 1, 'AtlÃ©tico Mineiro', 'Brasil', 0, 1),
	(140, 1, 'Dante', 2, 'Bayern Munich', 'Alemania', 0, 1),
	(141, 1, 'David Luiz', 2, 'Chelsea', 'Inglaterra', 0, 1),
	(142, 1, 'Henrique', 2, 'Napoli', 'Italia', 0, 1),
	(143, 1, 'Thiago Silva', 2, 'Paris Saint Germain', 'Francia', 0, 1),
	(144, 1, 'Daniel Alves', 2, 'FC Barcelona', 'EspaÃ±a', 0, 1),
	(145, 1, 'Maicon', 2, 'AS Roma', 'Italia', 0, 1),
	(146, 1, 'Marcelo', 2, 'Real Madrid', 'EspaÃ±a', 0, 1),
	(147, 1, 'Maxwell', 2, 'Paris Saint Germain', 'Francia', 0, 1),
	(148, 1, 'Fernandinho', 3, 'Manchester City', 'Inglaterra', 0, 1),
	(149, 1, 'Hernanes', 3, 'Inter de MilÃ¡n', 'Italia', 0, 1),
	(150, 1, 'Luiz Gustavo', 3, 'Wolfsburgo', 'Alemania', 0, 1),
	(151, 1, 'Oscar', 3, 'Chelsea', 'Inglaterra', 0, 1),
	(152, 1, 'Paulinho', 3, 'Tottenham Hotspur', 'Inglaterra', 0, 1),
	(153, 1, 'Ramires', 3, 'Chelsea', 'Inglaterra', 0, 1),
	(154, 1, 'Willian', 3, 'Chelsea', 'Inglaterra', 0, 1),
	(155, 1, 'Bernard', 4, 'Shakhtar Donetsk', 'Ucrania', 0, 1),
	(156, 1, 'Fred', 4, 'Fluminense', 'Brasil', 0, 1),
	(157, 1, 'Hulk', 4, 'Zenit', 'Rusia', 0, 1),
	(158, 1, 'JÃ´', 4, 'AtlÃ©tico Mineiro', 'Brasil', 0, 1),
	(159, 1, 'Neymar', 4, 'FC Barcelona', 'EspaÃ±a', 0, 1),
	(160, 1, 'Diego Cavalieri', 1, 'Fluminense', 'Brasil', 1, 0),
	(161, 1, 'Rafinha', 2, 'Bayern Munich', 'Alemania', 1, 0),
	(162, 1, 'Filipe Luis', 2, 'AtlÃ©tico de Madrid', 'EspaÃ±a', 1, 0),
	(163, 1, 'Miranda', 2, 'AtlÃ©tico de Madrid', 'EspaÃ±a', 1, 0),
	(164, 1, 'Lucas', 3, 'Paris Saint Germain', 'Francia', 1, 0),
	(165, 1, 'Lucas Leiva', 3, 'Liverpool', 'Inglaterra', 1, 0),
	(166, 1, 'Alan Kardec', 4, 'Sao Paulo', 'Brasil', 1, 0),
	(167, 7, 'Claudio Bravo', 1, 'Real Sociedad', 'EspaÃ±a', 0, 1),
	(168, 7, 'Johnny Herrera', 1, 'Universidad de Chile', 'Chile', 0, 1),
	(169, 7, 'Cristopher Toselli', 1, 'Universidad CatÃ³lica', 'Chile', 0, 1),
	(170, 7, 'Paulo GarcÃ©s', 1, 'O\'Higgins', 'Chile', 0, 0),
	(171, 7, 'Miiko Albornoz', 2, 'MalmÃ¶ FF', 'Suecia', 0, 1),
	(172, 7, 'Enzo AndÃ­a', 2, 'Universidad CatÃ³lica', 'Chile', 0, 0),
	(173, 7, 'Marcos GonzÃ¡lez', 2, 'UniÃ³n EspaÃ±ola', 'Chile', 0, 0),
	(174, 7, 'Mauricio Isla', 2, 'Juventus', 'Italia', 0, 1),
	(175, 7, 'Gonzalo Jara', 2, 'Nottingham Forest', 'Inglaterra', 0, 1),
	(176, 7, 'Eugenio Mena', 2, 'Santos', 'Brasil', 0, 1),
	(177, 7, 'Gary Medel', 2, 'Cardiff City', 'Gales', 0, 1),
	(178, 7, 'JosÃ© Rojas', 2, 'Universidad de Chile', 'Chile', 0, 1),
	(179, 7, 'Charles ArÃ¡nguiz', 3, 'Internacional', 'Brasil', 0, 1),
	(180, 7, 'Jean Beausejour', 3, 'Wigan Athletic', 'Inglaterra', 0, 1),
	(181, 7, 'Carlos Carmona', 3, 'Atalanta', 'Italia', 0, 1),
	(182, 7, 'Marcelo DÃ­az', 3, 'FC Basel', 'Suiza', 0, 1),
	(183, 7, 'MatÃ­as FernÃ¡ndez', 3, 'Fiorentina', 'Italia', 0, 0),
	(184, 7, 'JosÃ© Pedro Fuenzalida', 3, 'Colo Colo', 'Chile', 0, 1),
	(185, 7, 'Felipe GutiÃ©rrez', 3, 'FC Twente', 'Holanda', 0, 1),
	(186, 7, 'Pedro Pablo HernÃ¡ndez', 3, 'O\'Higgins', 'Chile', 0, 0),
	(187, 7, 'Rodrigo Millar', 3, 'Atlas', 'MÃ©xico', 0, 0),
	(188, 7, 'Francisco Silva', 3, 'Osasuna', 'EspaÃ±a', 0, 1),
	(189, 7, 'Jorge Valdivia', 3, 'Palmeiras', 'Brasil', 0, 1),
	(190, 7, 'Arturo Vidal', 3, 'Juventus', 'Italia', 0, 1),
	(191, 7, 'Gustavo Canales', 4, 'UniÃ³n EspaÃ±ola', 'Chile', 0, 0),
	(192, 7, 'FabiÃ¡n Orellana', 4, 'Celta de Vigo', 'EspaÃ±a', 0, 1),
	(193, 7, 'Esteban Paredes', 4, 'Colo Colo', 'Chile', 0, 1),
	(194, 7, 'Mauricio Pinilla', 4, 'Cagliari', 'Italia', 0, 1),
	(195, 7, 'Alexis SÃ¡nchez', 4, 'FC Barcelona', 'EspaÃ±a', 0, 1),
	(196, 7, 'Eduardo Vargas', 4, 'Valencia', 'EspaÃ±a', 0, 1),
	(197, 9, 'David Ospina', 1, 'Niza', 'Francia', 0, 1),
	(198, 9, 'Farid MondragÃ³n', 1, 'Deportivo Cali', 'Colombia', 0, 1),
	(199, 9, 'Camilo Vargas', 1, 'Santa Fe', 'Colombia', 0, 1),
	(200, 9, 'Camilo ZÃºÃ±iga', 2, 'Napoli', 'Italia', 0, 1),
	(201, 9, 'Pablo Armero', 2, 'West Ham United', 'Inglaterra', 0, 1),
	(202, 9, 'Cristian Zapata', 2, 'AC Milan', 'Italia', 0, 1),
	(203, 9, 'Mario Yepes', 2, 'Atalanta', 'Italia', 0, 1),
	(204, 9, 'Amaranto Perea', 2, 'Cruz Azul', 'MÃ©xico', 0, 0),
	(205, 9, 'Carlos ValdÃ©s', 2, 'San Lorenzo', 'Argentina', 0, 1),
	(206, 9, 'Santiago Arias', 2, 'PSV Eindhoven', 'Holanda', 0, 1),
	(207, 9, 'Eder Ãlvarez Balanta', 2, 'River Plate', 'Argentina', 0, 1),
	(208, 9, 'Aquivaldo Mosquera', 2, 'AmÃ©rica', 'MÃ©xico', 0, 0),
	(209, 9, 'James RodrÃ­guez', 3, 'Monaco', 'Francia', 0, 1),
	(210, 9, 'Abel Aguilar', 3, 'Toulouse', 'Francia', 0, 1),
	(211, 9, 'Carlos SÃ¡nchez', 3, 'Elche', 'EspaÃ±a', 0, 1),
	(212, 9, 'Fredy GuarÃ­n', 3, 'Inter de MilÃ¡n', 'Italia', 0, 1),
	(213, 9, 'Juan Fernando Quintero', 3, 'FC Porto', 'Portugal', 0, 1),
	(214, 9, 'Aldo RamÃ­rez', 3, 'Morelia', 'MÃ©xico', 0, 0),
	(215, 9, 'Edwin Valencia', 3, 'Fluminense', 'Brasil', 0, 0),
	(216, 9, 'Macnelly Torres', 3, 'Al Shabab', 'Arabia Saudita', 0, 0),
	(217, 9, 'Alex MejÃ­a', 3, 'AtlÃ©tico Nacional', 'Colombia', 0, 1),
	(218, 9, 'VÃ­ctor Ibarbo', 4, 'Cagliari', 'Italia', 0, 1),
	(219, 9, 'Elkin Soto', 3, 'Mainz 04', 'Alemania', 0, 0),
	(220, 9, 'Juan Guillermo Cuadrado', 3, 'Fiorentina', 'Italia', 0, 1),
	(221, 9, 'Jackson MartÃ­nez', 4, 'FC Porto', 'Portugal', 0, 1),
	(222, 9, 'Radamel Falcao GarcÃ­a', 4, 'Monaco', 'Francia', 0, 0),
	(223, 9, 'TeÃ³filo GutiÃ©rrez', 4, 'River Plate', 'Argentina', 0, 1),
	(224, 9, 'Luis Fernando Muriel', 4, 'Udinese', 'Italia', 0, 0),
	(225, 9, 'Carlos Bacca', 4, 'Sevilla', 'EspaÃ±a', 0, 1),
	(226, 9, 'AdriÃ¡n Ramos', 4, 'Borussia Dortmund', 'Alemania', 0, 1),
	(227, 19, 'MÃ¡ximo Banguera', 1, 'Barcelona', 'Ecuador', 0, 1),
	(228, 19, 'AdriÃ¡n Bone', 1, 'El Nacional', 'Ecuador', 0, 1),
	(229, 19, 'Alexander DomÃ­nguez', 1, 'LDU de Quito', 'Ecuador', 0, 1),
	(230, 19, 'Gabriel Achilier', 2, 'Emelec', 'Ecuador', 0, 1),
	(231, 19, 'Walter AyovÃ­', 2, 'Pachuca', 'MÃ©xico', 0, 1),
	(232, 19, 'Oscar BagÃ¼Ã­', 2, 'Emelec', 'Ecuador', 0, 1),
	(233, 19, 'Frickson Erazo', 2, 'Flamengo', 'Brasil', 0, 1),
	(234, 19, 'Jorge Guagua', 2, 'Emelec', 'Ecuador', 0, 1),
	(235, 19, 'John NarvÃ¡ez', 2, 'Emelec', 'Ecuador', 0, 0),
	(236, 19, 'Juan Carlos Paredes', 2, 'Barcelona', 'Ecuador', 0, 1),
	(237, 19, 'Cristian RamÃ­rez', 2, 'Fortuna DÃ¼sseldorf', 'Alemania', 0, 0),
	(238, 19, 'Michael Arroyo', 3, 'Atlante', 'MÃ©xico', 0, 1),
	(239, 19, 'Segundo Castillo', 3, 'Al Hilal', 'Arabia Saudita', 0, 0),
	(240, 19, 'Carlos Gruezo', 3, 'Stuttgart', 'Alemania', 0, 1),
	(241, 19, 'Renato Ibarra', 3, 'Vitesse Arnhem', 'Holanda', 0, 1),
	(242, 19, 'Fidel MartÃ­nez', 3, 'Tijuana', 'MÃ©xico', 0, 1),
	(243, 19, 'Edison MÃ©ndez', 3, 'Santa Fe', 'Colombia', 0, 1),
	(244, 19, 'Oswaldo Minda', 3, 'Chivas USA', 'Estados Unidos', 0, 1),
	(245, 19, 'Christian Noboa', 3, 'DÃ­namo de MoscÃº', 'Rusia', 0, 1),
	(246, 19, 'Pedro QuinonezÂ ', 3, 'Emelec', 'Ecuador', 0, 0),
	(247, 19, 'Luis Saritama', 3, 'Barcelona', 'Ecuador', 0, 1),
	(248, 19, 'Antonio Valencia', 3, 'Manchester United', 'Inglaterra', 0, 1),
	(249, 19, 'Jaime AyovÃ­', 4, 'Tijuana', 'MÃ©xico', 0, 1),
	(250, 19, 'Felipe Caicedo', 4, 'Al-Jazira', 'E.A.U.', 0, 1),
	(251, 19, 'Ãngel Mena', 4, 'Emelec', 'Ecuador', 0, 0),
	(252, 19, 'Jefferson Montero', 4, 'Morelia', 'MÃ©xico', 0, 1),
	(253, 19, 'Cristian Penilla', 4, 'Barcelona', 'Ecuador', 0, 0),
	(254, 19, 'Joao Rojas', 4, 'Cruz Azul', 'MÃ©xico', 0, 1),
	(255, 19, 'Enner Valencia', 4, 'Pachuca', 'MÃ©xico', 0, 1),
	(256, 19, 'Armando Wila', 4, 'Universidad CatÃ³lica', 'Ecuador', 0, 0),
	(257, 13, 'Fernando Muslera', 1, 'Galatasaray', 'TurquÃ­a', 0, 1),
	(258, 13, 'MartÃ­n Silva', 1, 'Vasco da Gama', 'Brasil', 0, 1),
	(259, 13, 'Rodrigo MuÃ±oz', 1, 'Libertad', 'Paraguay', 0, 1),
	(260, 13, 'Diego Lugano', 2, 'West Bromwich Albion', 'Inglaterra', 0, 1),
	(261, 13, 'Diego GodÃ­n', 2, 'AtlÃ©tico de Madrid', 'EspaÃ±a', 0, 1),
	(262, 13, 'JosÃ© MarÃ­a GimÃ©nez', 2, 'AtlÃ©tico de Madrid', 'EspaÃ±a', 0, 1),
	(263, 13, 'MartÃ­n CÃ¡ceres', 2, 'Juventus', 'Italia', 0, 1),
	(264, 13, 'Maximiliano Pereira', 2, 'Benfica', 'Portugal', 0, 1),
	(265, 13, 'Jorge Fucile', 2, 'FC Porto', 'Portugal', 0, 1),
	(266, 13, 'SebastiÃ¡n Coates', 2, 'Nacional', 'Uruguay', 0, 1),
	(267, 13, 'Egidio ArÃ©valo RÃ­os', 3, 'Morelia', 'MÃ©xico', 0, 1),
	(268, 13, 'Walter Gargano', 3, 'Parma', 'Italia', 0, 1),
	(269, 13, 'Diego PÃ©rezÂ ', 3, 'Bologna', 'Italia', 0, 1),
	(270, 13, 'SebastiÃ¡n Eguren', 3, 'Palmeiras', 'Brasil', 0, 0),
	(271, 13, 'Ãlvaro GonzÃ¡lez', 3, 'Lazio', 'Italia', 0, 1),
	(272, 13, 'Ãlvaro Pereira', 3, 'Sao Paulo', 'Brasil', 0, 1),
	(273, 13, 'CristiÃ¡n RodrÃ­guez', 3, 'AtlÃ©tico de Madrid', 'EspaÃ±a', 0, 1),
	(274, 13, 'GastÃ³n RamÃ­rez', 3, 'Southampton', 'Inglaterra', 0, 1),
	(275, 13, 'NicolÃ¡s Lodeiro', 3, 'Botafogo', 'Brasil', 0, 1),
	(276, 13, 'Alejandro Silva', 3, 'LanÃºs', 'Argentina', 0, 0),
	(277, 13, 'Luis SuÃ¡rez', 4, 'Liverpool', 'Inglaterra', 0, 1),
	(278, 13, 'Edinson Cavani', 4, 'Paris Saint Germain', 'Francia', 0, 1),
	(279, 13, 'Diego ForlÃ¡n', 4, 'Cerezo Osaka', 'JapÃ³n', 0, 1),
	(280, 13, 'CristiÃ¡n Stuani', 4, 'Espanyol', 'EspaÃ±a', 0, 1),
	(281, 13, 'Abel HernÃ¡ndez', 4, 'Palermo', 'Italia', 0, 1),
	(282, 13, 'AndrÃ©s Scotti', 2, 'Nacional', 'Uruguay', 1, 0),
	(283, 13, 'Ãlvaro FernÃ¡ndez', 3, 'Gimnasia y Esgrima de La Plata', 'Argentina', 1, 0),
	(284, 13, 'Gonzalo Castro', 4, 'Real Sociedad', 'EspaÃ±a', 1, 0),
	(285, 25, 'Manuel Neuer', 1, 'Bayern Munich', 'Alemania', 0, 1),
	(286, 25, 'Roman Weidenfeller', 1, 'Borussia Dortmund', 'Alemania', 0, 1),
	(287, 25, 'Ron-Robert Zieler', 1, 'Hannover', 'Alemania', 0, 1),
	(288, 25, 'JÃ©rome Boateng', 2, 'Bayern Munich', 'Alemania', 0, 1),
	(289, 25, 'Philipp Lahm', 2, 'Bayern Munich', 'Alemania', 0, 1),
	(290, 25, 'Erik Durm', 2, 'Borussia Dortmund', 'Alemania', 0, 1),
	(291, 25, 'Kevin GroÃŸkreutz', 2, 'Borussia Dortmund', 'Alemania', 0, 1),
	(292, 25, 'Mats Hummels', 2, 'Borussia Dortmund', 'Alemania', 0, 1),
	(293, 25, 'Marcel Schmelzer', 2, 'Borussia Dortmund', 'Alemania', 0, 1),
	(294, 25, 'Matthias Ginter', 2, 'Freiburg', 'Alemania', 0, 1),
	(295, 25, 'Benedikt HÃ¶wedes', 2, 'Schalke 04', 'Alemania', 0, 1),
	(296, 25, 'Marcell Jansen', 2, 'Hamburgo', 'Alemania', 0, 1),
	(297, 25, 'Per Mertesacker', 2, 'Arsenal', 'Inglaterra', 0, 1),
	(298, 25, 'Shkodran Mustafi', 2, 'Sampdoria', 'Italia', 0, 1),
	(299, 25, 'Lars Bender', 3, 'Bayer Leverkusen', 'Alemania', 0, 1),
	(300, 25, 'Julian Draxler', 3, 'Schalke 04', 'Alemania', 0, 1),
	(301, 25, 'Leon Goretzka', 3, 'Schalke 04', 'Alemania', 0, 1),
	(302, 25, 'Max Meyer', 3, 'Schalke 04', 'Alemania', 0, 1),
	(303, 25, 'Mario GÃ¶tze', 3, 'Bayern Munich', 'Alemania', 0, 1),
	(304, 25, 'Toni Kroos', 3, 'Bayern Munich', 'Alemania', 0, 1),
	(305, 25, 'Thomas MÃ¼ller', 3, 'Bayern Munich', 'Alemania', 0, 1),
	(306, 25, 'Bastian Schweinsteiger', 3, 'Bayern Munich', 'Alemania', 0, 1),
	(307, 25, 'Christoph Kramer', 3, 'Borussia MÃ¶nchengladbach', 'Alemania', 0, 1),
	(308, 25, 'Sami Khedira', 3, 'Real Madrid', 'EspaÃ±a', 0, 1),
	(309, 25, 'Mesut Ã–zil', 3, 'Arsenal', 'Inglaterra', 0, 1),
	(310, 25, 'Marcos Reus', 3, 'Borussia Dortmund', 'Alemania', 0, 0),
	(311, 25, 'AndrÃ© SchÃ¼rrle', 3, 'Chelsea', 'Inglaterra', 0, 1),
	(312, 25, 'Lukas Podolski', 4, 'Arsenal', 'Inglaterra', 0, 1),
	(313, 25, 'Miroslav Klose', 4, 'Lazio', 'Italia', 0, 1),
	(314, 25, 'Kevin Volland', 4, 'Hoffenheim', 'Alemania', 0, 1),
	(315, 29, 'Thibaut Courtois', 1, 'AtlÃ©tico de Madrid', 'EspaÃ±a', 0, 1),
	(316, 29, 'Simon Mignolet', 1, 'Liverpool', 'Inglaterra', 0, 1),
	(317, 29, 'Koen Casteels', 1, 'Hoffenheim', 'Alemania', 0, 1),
	(318, 29, 'Silvio Proto', 1, 'Anderlecht', 'BÃ©lgica', 0, 1),
	(319, 29, 'Anthony Vanden Borre', 2, 'Anderlecht', 'BÃ©lgica', 0, 1),
	(320, 29, 'Toby Alderweireld', 2, 'AtlÃ©tico de Madrid', 'EspaÃ±a', 0, 1),
	(321, 29, 'Laurent Ciman', 2, 'Standard de Lieja', 'BÃ©lgica', 0, 1),
	(322, 29, 'Vincent Kompany', 2, 'Manchester City', 'Inglaterra', 0, 1),
	(323, 29, 'Daniel Van Buyten', 2, 'Bayern Munich', 'Alemania', 0, 1),
	(324, 29, 'Thomas Vermaelen', 2, 'Arsenal', 'Inglaterra', 0, 1),
	(325, 29, 'Nicolas Lombaerts', 2, 'Zenit', 'Rusia', 0, 1),
	(326, 29, 'Jan Vertonghen', 2, 'Tottenham Hotspur', 'Inglaterra', 0, 1),
	(327, 29, 'Alex Witsel', 3, 'Zenit', 'Rusia', 0, 1),
	(328, 29, 'Steven Defour', 3, 'FC Porto', 'Portugal', 0, 1),
	(329, 29, 'Marouane Fellaini', 3, 'Manchester United', 'Inglaterra', 0, 1),
	(330, 29, 'Moussa DembÃ©lÃ©', 3, 'Tottenham Hotspur', 'Inglaterra', 0, 1),
	(331, 29, 'Nacer Chadli', 3, 'Tottenham Hotspur', 'Inglaterra', 0, 1),
	(332, 29, 'Kevin de Bruyne', 3, 'Wolfsburgo', 'Alemania', 0, 1),
	(333, 29, 'Romelu Lukaku', 4, 'Everton', 'Inglaterra', 0, 1),
	(334, 29, 'Divock Origi', 4, 'Lille', 'Francia', 0, 1),
	(335, 29, 'Eden Hazard', 4, 'Chelsea', 'Inglaterra', 0, 1),
	(336, 29, 'Kevin Mirallas', 4, 'Everton', 'Inglaterra', 0, 1),
	(337, 29, 'Dries Mertens', 4, 'Napoli', 'Italia', 0, 1),
	(338, 29, 'Adnan Januzaj', 4, 'Manchester United', 'Inglaterra', 0, 1),
	(339, 29, 'SÃ©bastien Pocognoli', 2, 'Hannover 96', 'Alemania', 1, 1),
	(340, 29, 'Jelle Van Damme', 2, 'Standard de Lieja', 'BÃ©lgica', 1, 1),
	(341, 29, 'Guillaume Gillet', 3, 'Anderlecht', 'BÃ©lgica', 1, 1),
	(342, 29, 'Thorgan Hazard', 3, 'SV Zulte Waregem', 'BÃ©lgica', 1, 1),
	(343, 29, 'Radja Nainggolan', 3, 'Roma', 'Italia', 1, 1),
	(344, 29, 'Michy Batshuayi', 4, 'Standard de Lieja', 'BÃ©lgica', 1, 1),
	(345, 22, 'Asmir Begovic', 1, 'Stoke City', 'Inglaterra', 0, 1),
	(346, 22, 'Jasmin FejzicÂ ', 1, 'Aalen', 'Alemania', 0, 1),
	(347, 22, 'Asmir Avdukic', 1, 'Borac Banja Luka', 'Bosnia - Herzegovina', 0, 1),
	(348, 22, 'Dejan Bandovic', 1, 'Sarajevo', 'Bosnia - Herzegovina', 0, 0),
	(349, 22, 'Emir Spahic', 2, 'Bayer Leverkusen', 'Alemania', 0, 1),
	(350, 22, 'Sead Kolasinac', 2, 'Schalke 04', 'Alemania', 0, 1),
	(351, 22, 'Ognjen Vranjes', 2, 'Elazigspor', 'TurquÃ­a', 0, 1),
	(352, 22, 'Ervin Zukanovic', 2, 'Gent', 'BÃ©lgica', 0, 0),
	(353, 22, 'Ermin Bicakcic', 2, 'Eintracht Braunschweig', 'Alemania', 0, 1),
	(354, 22, 'Mensur Mujdza', 2, 'Freiburg', 'Alemania', 0, 1),
	(355, 22, 'Toni Sunjic', 2, 'Zorya', 'Ucrania', 0, 1),
	(356, 22, 'Zoran Kvrzic', 2, 'Rijeka', 'Bosnia - Herzegovina', 0, 0),
	(357, 22, 'Srdjan StanicÂ ', 2, 'Zeljeznicar', 'Bosnia - Herzegovina', 0, 0),
	(358, 22, 'Sejad Salihovis', 3, 'Hoffenheim', 'Alemania', 0, 1),
	(359, 22, 'Miralem Pjanic', 3, 'AS Roma', 'Italia', 0, 1),
	(360, 22, 'Senijad Ibricic', 3, 'Erciyesspor', 'TurquÃ­a', 0, 1),
	(361, 22, 'Izet Hajrovic', 3, 'Galatasaray', 'TurquÃ­a', 0, 1),
	(362, 22, 'Haris Medunjanin', 3, 'Gaziantepspor', 'TurquÃ­a', 0, 1),
	(363, 22, 'Senad Lulic', 3, 'Lazio', 'Italia', 0, 1),
	(364, 22, 'Avdija Vrsajevic', 3, 'Hajduk Split', 'Croacia', 0, 1),
	(365, 22, 'Zvjezdan Misimovic', 3, 'Guizhou Renhe', 'China', 0, 1),
	(366, 22, 'Edin Visca', 3, 'Istanbul BB', 'TurquÃ­a', 0, 1),
	(367, 22, 'Muhamed Becic', 3, 'Ferencvaros', 'HungrÃ­a', 0, 1),
	(368, 22, 'Tino SusicÂ ', 3, 'Hajduk Split', 'Croacia', 0, 1),
	(369, 22, 'Anel Hadzic', 3, 'Sturm Graz', 'Austria', 0, 1),
	(370, 22, 'Miroslav StevanovicÂ ', 3, 'Elche', 'EspaÃ±a', 0, 0),
	(371, 22, 'Adnan Zahirovic', 3, 'Bochum', 'Alemania', 0, 0),
	(372, 22, 'Vedad Ibisevic', 4, 'Stuttgart', 'Alemania', 0, 1),
	(373, 22, 'Edin Dzeko', 4, 'Manchester City', 'Inglaterra', 0, 1),
	(374, 22, 'Ermin Zec', 4, 'Genclerbirligi', 'TurquÃ­a', 0, 0),
	(375, 2, 'Stipe Pletikosa', 1, 'Rostov', 'Rusia', 0, 1),
	(376, 2, 'Danijel Subasic', 1, 'Monaco', 'Francia', 0, 1),
	(377, 2, 'Oliver Zelenika', 1, 'Dinamo Zagreb', 'Croacia', 0, 1),
	(378, 2, 'Darijo Srna', 2, 'Shakhtar Donetsk', 'Ucrania', 0, 1),
	(379, 2, 'Dejan Lovren', 2, 'Southampton', 'Inglaterra', 0, 1),
	(380, 2, 'Vedran Corluka', 2, 'Lokomotiv de MoscÃº', 'Rusia', 0, 1),
	(381, 2, 'Gordon Schildenfeld', 2, 'Panathinaikos', 'Grecia', 0, 1),
	(382, 2, 'Danijel Pranjic', 2, 'Panathinaikos', 'Grecia', 0, 1),
	(383, 2, 'Ivan Strinic', 2, 'Dnipro Dnipropetrovsk', 'Ucrania', 0, 0),
	(384, 2, 'Domagoj Vida', 2, 'DÃ­namo de Kiev', 'Ucrania', 0, 1),
	(385, 2, 'Sime Vrsaljko', 2, 'Genoa', 'Italia', 0, 1),
	(386, 2, 'Igor Bubnjic', 2, 'Udinese', 'Italia', 0, 0),
	(387, 2, 'Luka Modric', 3, 'Real Madrid', 'EspaÃ±a', 0, 1),
	(388, 2, 'Ivan Rakitic', 3, 'Sevilla', 'EspaÃ±a', 0, 1),
	(389, 2, 'Niko Kranjcar', 3, 'Queens Park Rangers', 'Inglaterra', 0, 0),
	(390, 2, 'Ognjen Vukojevic', 3, 'DÃ­namo de Kiev', 'Ucrania', 0, 1),
	(391, 2, 'Ivan Perisic', 3, 'Vfl Wolfsburgo', 'Alemania', 0, 1),
	(392, 2, 'Mateo Kovacic', 3, 'Inter de MilÃ¡n', 'Italia', 0, 1),
	(393, 2, 'Milan Badelj', 3, 'Hamburgo', 'Alemania', 0, 0),
	(394, 2, 'Ivo Ilicevic', 3, 'Hamburgo', 'Alemania', 0, 0),
	(395, 2, 'Marcelo Brozovic', 3, 'Dinamo Zagreb', 'Croacia', 0, 1),
	(396, 2, 'Ivan Mocinic', 3, 'Rijeka', 'Croacia', 0, 1),
	(397, 2, 'Mario Pasalic', 3, 'Hajduk Split', 'Croacia', 0, 0),
	(398, 2, 'Sammir', 3, 'Getafe', 'EspaÃ±a', 0, 1),
	(399, 2, 'Mario Mandzukic', 4, 'Bayern Munich', 'Alemania', 0, 1),
	(400, 2, 'Ivica Olic', 4, 'Vfl Wolfsburgo', 'Alemania', 0, 1),
	(401, 2, 'Eduardo da Silva', 4, 'Shakhtar Donetsk', 'Ucrania', 0, 1),
	(402, 2, 'Nikica Jelavic', 4, 'Hull City', 'Inglaterra', 0, 1),
	(403, 2, 'Ante Rebic', 4, 'Fiorentina', 'Italia', 0, 1),
	(404, 2, 'Duje Cop', 4, 'Dinamo Zagreb', 'Croacia', 0, 0),
	(405, 5, 'Iker Casillas', 1, 'Real Madrid', 'EspaÃ±a', 0, 1),
	(406, 5, 'Pepe Reina', 1, 'Napoli', 'Italia', 0, 1),
	(407, 5, 'David de Gea', 1, 'Manchester United', 'Inglaterra', 0, 1),
	(408, 5, 'Sergio Ramos', 2, 'Real Madrid', 'EspaÃ±a', 0, 1),
	(409, 5, 'Gerard PiquÃ©', 2, 'FC Barcelona', 'EspaÃ±a', 0, 1),
	(410, 5, 'RaÃºl Albiol', 2, 'Napoli', 'Italia', 0, 1),
	(411, 5, 'Jordi Alba', 2, 'FC Barcelona', 'EspaÃ±a', 0, 1),
	(412, 5, 'CÃ©sar Azpilicueta', 2, 'Chelsea', 'Inglaterra', 0, 1),
	(413, 5, 'Alberto Moreno', 2, 'Sevilla', 'EspaÃ±a', 0, 0),
	(414, 5, 'Dani Carvajal', 2, 'Real Madrid', 'EspaÃ±a', 0, 0),
	(415, 5, 'Juanfran Torres', 2, 'AtlÃ©tico de Madrid', 'EspaÃ±a', 0, 1),
	(416, 5, 'Xavi HernÃ¡ndez', 3, 'FC Barcelona', 'EspaÃ±a', 0, 1),
	(417, 5, 'AndrÃ©s Iniesta', 3, 'FC Barcelona', 'EspaÃ±a', 0, 1),
	(418, 5, 'Sergio Busquets', 3, 'FC Barcelona', 'EspaÃ±a', 0, 1),
	(419, 5, 'Cesc FÃ¡bregas', 3, 'FC Barcelona', 'EspaÃ±a', 0, 1),
	(420, 5, 'Xabi Alonso', 3, 'Real Madrid', 'EspaÃ±a', 0, 1),
	(421, 5, 'Koke ResurrecciÃ³n', 3, 'AtlÃ©tico de Madrid', 'EspaÃ±a', 0, 1),
	(422, 5, 'Javier MartÃ­nez', 3, 'Bayern Munich', 'Alemania', 0, 1),
	(423, 5, 'Thiago AlcÃ¡ntara', 3, 'Bayern Munich', 'Alemania', 0, 0),
	(424, 5, 'Juan Mata', 3, 'Manchester United', 'Inglaterra', 0, 1),
	(425, 5, 'Santi Cazorla', 3, 'Arsenal', 'Inglaterra', 0, 1),
	(426, 5, 'Ander Iturraspe', 3, 'Athletic de Bilbao', 'EspaÃ±a', 0, 0),
	(427, 5, 'David Silva', 4, 'Manchester City', 'Inglaterra', 0, 1),
	(428, 5, 'Pedro RodrÃ­guez', 4, 'FC Barcelona', 'EspaÃ±a', 0, 1),
	(429, 5, 'JesÃºs Navas', 4, 'Manchester City', 'Inglaterra', 0, 0),
	(430, 5, 'Diego Costa', 4, 'AtlÃ©tico de Madrid', 'EspaÃ±a', 0, 1),
	(431, 5, 'Fernando Llorente', 4, 'Juventus', 'Italia', 0, 0),
	(432, 5, 'Fernando Torres', 4, 'Chelsea', 'Inglaterra', 0, 1),
	(433, 5, 'David Villa', 4, 'AtlÃ©tico de Madrid', 'EspaÃ±a', 0, 1),
	(434, 5, 'Alvaro Negredo', 4, 'Manchester City', 'Inglaterra', 0, 0),
	(435, 18, 'Hugo Lloris', 1, 'Tottenham Hotspur', 'Inglaterra', 0, 1),
	(436, 18, 'Steve Mandanda', 1, 'Marsella', 'Francia', 0, 0),
	(437, 18, 'StÃ©phane Ruffier', 1, 'Saint-Ã‰tienne', 'Francia', 0, 1),
	(438, 18, 'RaphÃ¤el Varane', 2, 'Real Madrid', 'EspaÃ±a', 0, 1),
	(439, 18, 'Mamadou Sakho', 2, 'Liverpool', 'Inglaterra', 0, 1),
	(440, 18, 'Mathieu Debuchy', 2, 'Newcastle United', 'Inglaterra', 0, 1),
	(441, 18, 'Laurent Koscielny', 2, 'Arsenal', 'Inglaterra', 0, 1),
	(442, 18, 'Lucas Digne', 2, 'Paris Saint Germain', 'Francia', 0, 1),
	(443, 18, 'Eliaquim Mangala', 2, 'FC Porto', 'Portugal', 0, 1),
	(444, 18, 'Bacary Sagna', 2, 'Arsenal', 'Inglaterra', 0, 1),
	(445, 18, 'Patrice Evra', 2, 'Manchester United', 'Inglaterra', 0, 1),
	(446, 18, 'Yohan Cabaye', 3, 'Paris Saint Germain', 'Francia', 0, 1),
	(447, 18, 'Paul Pogba', 3, 'Juventus', 'Italia', 0, 1),
	(448, 18, 'Blaise Matuidi', 3, 'Paris Saint Germain', 'Francia', 0, 1),
	(449, 18, 'ClÃ©ment Grenier', 3, 'Lyon', 'Francia', 0, 0),
	(450, 18, 'Maxime Gonalons', 3, 'Lyon', 'Francia', 0, 0),
	(451, 18, 'Rio Mavuba', 3, 'Lille', 'Francia', 0, 1),
	(452, 18, 'Karim Benzema', 3, 'Real Madrid', 'EspaÃ±a', 0, 1),
	(453, 18, 'Franck RibÃ©ry', 4, 'Bayern Munich', 'Alemania', 0, 0),
	(454, 18, 'Antoine Griezmann', 4, 'Real Sociedad', 'EspaÃ±a', 0, 1),
	(455, 18, 'Olivier Giroud', 4, 'Arsenal', 'Inglaterra', 0, 1),
	(456, 18, 'Mathieu Valbuena', 4, 'Marsella', 'Francia', 0, 1),
	(457, 18, 'Alexandre Lacazette', 4, 'Lyon', 'Francia', 0, 0),
	(458, 18, 'StÃ©phane Ruffier', 1, 'Saint-Ã‰tienne', 'Francia', 1, 0),
	(459, 18, 'BenoÃ®t Tremoulinas', 2, 'DÃ­namo de Kiev', 'Ucrania', 1, 0),
	(460, 18, 'RÃ©my Cabella', 3, 'Montpellier', 'Francia', 1, 1),
	(461, 18, 'Maxime Gonalons', 3, 'Lyon', 'Francia', 1, 0),
	(462, 18, 'LoÃ¯c Perrin', 3, 'Saint-Ã‰tienne', 'Francia', 1, 0),
	(463, 18, 'Morgan Schneiderlin', 3, 'Southampton', 'Inglaterra', 1, 1),
	(464, 18, 'Alexandre Lacazette', 4, 'Lyon', 'Francia', 1, 0),
	(465, 10, 'Alexandros Tzorvas', 1, 'Apollon Smyrnis', 'Grecia', 0, 0),
	(466, 10, 'Michalis Sifakis', 1, 'Atromitos', 'Grecia', 0, 0),
	(467, 10, 'Orestis Karnezis', 1, 'Granada', 'EspaÃ±a', 0, 1),
	(468, 10, 'Panaglotis Glykos', 1, 'PAOK', 'Grecia', 0, 1),
	(469, 10, 'Stefanos Kapino', 1, 'Panathinaikos', 'Grecia', 0, 1),
	(470, 10, 'Avraam Papadopoulos', 2, 'Olympiakos', 'Grecia', 0, 0),
	(471, 10, 'Dimitris Siovas', 2, 'Olympiakos', 'Grecia', 0, 0),
	(472, 10, 'Kostas Manolas', 2, 'Olympiakos', 'Grecia', 0, 1),
	(473, 10, 'Giannis Maniatis', 3, 'Olympiakos', 'Grecia', 0, 1),
	(474, 10, 'Jose Holebas', 2, 'Olympiakos', 'Grecia', 0, 1),
	(475, 10, 'Sokratis Papastathopoulos', 2, 'Borussia Dortmund', 'Alemania', 0, 1),
	(476, 10, 'Giorgios Tzavellas', 2, 'PAOK', 'Grecia', 0, 1),
	(477, 10, 'Loukas Vyntra', 2, 'Levante', 'EspaÃ±a', 0, 1),
	(478, 10, 'Vasilis Torosidis', 2, 'Roma', 'Italia', 0, 1),
	(479, 10, 'Alexandros Tziolis', 3, 'Kayserispor', 'TurquÃ­a', 0, 1),
	(480, 10, 'Andreas Samaris', 3, 'Olympiakos', 'Grecia', 0, 1),
	(481, 10, 'Kostas Katsouranis', 3, 'PAOK', 'Grecia', 0, 1),
	(482, 10, 'Giorgos Karagounis', 3, 'Fulham', 'Inglaterra', 0, 1),
	(483, 10, 'Panagiotis Tachtsidis', 3, 'Torino', 'Italia', 0, 1),
	(484, 10, 'Sotiris Ninis', 3, 'PAOK', 'Grecia', 0, 0),
	(485, 10, 'Ioannis Fetfatzidis', 4, 'Genoa', 'Italia', 0, 1),
	(486, 10, 'Kostas Fortounis', 3, 'Kaiserslautern', 'Alemania', 0, 0),
	(487, 10, 'Lazaros Christodoulopoulos', 3, 'Bologna', 'Italia', 0, 1),
	(488, 10, 'Panagiotis Kone', 3, 'Bologna', 'Italia', 0, 1),
	(489, 10, 'Dimitris Papadopoulos', 4, 'Atromitos', 'Grecia', 0, 0),
	(490, 10, 'Dimitris Salpingidis', 4, 'PAOK', 'Grecia', 0, 1),
	(491, 10, 'Giorgios Samaras', 4, 'Celtic', 'Escocia', 0, 1),
	(492, 10, 'Konstantinos Mitroglou', 4, 'Fulham', 'Inglaterra', 0, 1),
	(493, 10, 'Theofanis Gekas', 4, 'Konyaspor', 'TurquÃ­a', 0, 1),
	(494, 6, 'Jasper Cillessen', 1, 'Ajax', 'Holanda', 0, 1),
	(495, 6, 'Tim Krul', 1, 'Newcastle United', 'Inglaterra', 0, 1),
	(496, 6, 'Michel Vorm', 1, 'Swansea City', 'Inglaterra', 0, 1),
	(497, 6, 'Jeroen Zoet', 1, 'PSV Eindhoven', 'Holanda', 0, 0),
	(498, 6, 'Patrick van Aanholt', 2, 'Vitesse', 'Holanda', 0, 0),
	(499, 6, 'Daryl Janmaat', 2, 'Feyenoord', 'Holanda', 0, 1),
	(500, 6, 'Terence Kongolo', 2, 'Feyenoord', 'Holanda', 0, 1),
	(501, 6, 'Bruno Martins Indi', 2, 'Feyenoord', 'Holanda', 0, 1),
	(502, 6, 'Karim Rekik', 2, 'PSV Eindhoven', 'Holanda', 0, 0),
	(503, 6, 'JoÃ«l Veltman', 2, 'Ajax', 'Holanda', 0, 1),
	(504, 6, 'Paul Verhaegh', 2, 'FC Augsburg', 'Alemania', 0, 1),
	(505, 6, 'Ron Vlaar', 2, 'Aston Villa', 'Inglaterra', 0, 1),
	(506, 6, 'Stefan de Vrij', 2, 'Feyenoord', 'Holanda', 0, 1),
	(507, 6, 'Daley Blind', 3, 'Ajax', 'Holanda', 0, 1),
	(508, 6, 'Jordy Clasie', 3, 'Feyenoord', 'Holanda', 0, 1),
	(509, 6, 'Leroy Fer', 3, 'Norwich City', 'Inglaterra', 0, 1),
	(510, 6, 'Jonathan de GuzmÃ¡n', 3, 'Swansea City', 'Inglaterra', 0, 1),
	(511, 6, 'Nigel de Jong', 3, 'AC Milan', 'Italia', 0, 1),
	(512, 6, 'Wesley Sneijder', 3, 'Galatasaray', 'TurquÃ­a', 0, 1),
	(513, 6, 'Tonny Trindade de Vilhena', 3, 'Feyenoord', 'Holanda', 0, 1),
	(514, 6, 'Rafael van der Vaart', 3, 'Hamburgo', 'Alemania', 0, 0),
	(515, 6, 'Georginio Wijnaldum', 3, 'PSV Eindhoven', 'Holanda', 0, 1),
	(516, 6, 'Jean-Paul BoÃ«tius', 4, 'Feyenoord', 'Holanda', 0, 0),
	(517, 6, 'Memphis Depay', 4, 'PSV Eindhoven', 'Holanda', 0, 1),
	(518, 6, 'Klaas Jan Huntelaar', 4, 'Schalke 04', 'Alemania', 0, 0),
	(519, 6, 'Dirk Kuyt', 4, 'FenerbahÃ§e', 'TurquÃ­a', 0, 1),
	(520, 6, 'Jeremain Lens', 4, 'DÃ­namo de Kiev', 'Ucrania', 0, 1),
	(521, 6, 'Robin van Persie', 4, 'Manchester United', 'Inglaterra', 0, 1),
	(522, 6, 'Quincy Promes', 4, 'FC Twente', 'Holanda', 0, 0),
	(523, 6, 'Arjen Robben', 4, 'Bayern Munich', 'Alemania', 0, 1),
	(524, 15, 'Joe Hart', 1, 'Manchester City', 'Inglaterra', 0, 1),
	(525, 15, 'Fraser Forster', 1, 'Celtic', 'Escocia', 0, 1),
	(526, 15, 'Ben Foster', 1, 'West Bromwich Albion', 'Inglaterra', 0, 1),
	(527, 15, 'Leighton Baines', 2, 'Everton', 'Inglaterra', 0, 1),
	(528, 15, 'Gary Cahill', 2, 'Chelsea', 'Inglaterra', 0, 1),
	(529, 15, 'Phil Jagielka', 2, 'Everton', 'Inglaterra', 0, 1),
	(530, 15, 'Glen Johnson', 2, 'Liverpool', 'Inglaterra', 0, 1),
	(531, 15, 'Phil Jones', 2, 'Manchester United', 'Inglaterra', 0, 1),
	(532, 15, 'Luke Shaw', 2, 'Southampton', 'Inglaterra', 0, 1),
	(533, 15, 'Chris Smalling', 2, 'Manchester United', 'Inglaterra', 0, 1),
	(534, 15, 'Ross Barkley', 3, 'Everton', 'Inglaterra', 0, 1),
	(535, 15, 'Steven Gerrard', 3, 'Liverpool', 'Inglaterra', 0, 1),
	(536, 15, 'Jordan Henderson', 3, 'Liverpool', 'Inglaterra', 0, 1),
	(537, 15, 'Adam Lallana', 3, 'Southampton', 'Inglaterra', 0, 1),
	(538, 15, 'Frank Lampard', 3, 'Chelsea', 'Inglaterra', 0, 1),
	(539, 15, 'James Milner', 3, 'Manchester City', 'Inglaterra', 0, 1),
	(540, 15, 'Alex Oxlade-Chamberlain', 3, 'Arsenal', 'Inglaterra', 0, 1),
	(541, 15, 'Raheem Sterling', 3, 'Liverpool', 'Inglaterra', 0, 1),
	(542, 15, 'Jack Wilshere', 3, 'Arsenal', 'Inglaterra', 0, 1),
	(543, 15, 'Rickie Lambert', 4, 'Southampton', 'Inglaterra', 0, 1),
	(544, 15, 'Wayne Rooney', 4, 'Manchester United', 'Inglaterra', 0, 1),
	(545, 15, 'Daniel Sturridge', 4, 'Liverpool', 'Inglaterra', 0, 1),
	(546, 15, 'Daniel Welbeck', 4, 'Manchester United', 'Inglaterra', 0, 1),
	(547, 14, 'Gianluigi Buffon', 1, 'Juventus', 'Italia', 0, 1),
	(548, 14, 'Salvatore Sirigu', 1, 'Paris Saint Germain', 'Francia', 0, 1),
	(549, 14, 'Mattia Perin', 1, 'Genoa', 'Italia', 0, 1),
	(550, 14, 'Ignazio Abate', 2, 'AC Milan', 'Italia', 0, 1),
	(551, 14, 'Andrea Barzagli', 2, 'Juventus', 'Italia', 0, 1),
	(552, 14, 'Leonardo Bonucci', 2, 'Juventus', 'Italia', 0, 1),
	(553, 14, 'Giorgio Chiellini', 2, 'Juventus', 'Italia', 0, 1),
	(554, 14, 'Matteo Darmian', 2, 'Torino', 'Italia', 0, 1),
	(555, 14, 'Mattia De Sciglio', 2, 'AC Milan', 'Italia', 0, 1),
	(556, 14, 'Cristian Maggio', 2, 'Napoli', 'Italia', 0, 0),
	(557, 14, 'Gabriel PalettaÂ ', 2, 'AC Parma', 'Italia', 0, 1),
	(558, 14, 'Manuel Pasqual', 2, 'Fiorentina', 'Italia', 0, 0),
	(559, 14, 'Andrea Ranocchia', 2, 'Inter de MilÃ¡n', 'Italia', 0, 0),
	(560, 14, 'Alberto Aquilani', 3, 'Fiorentina', 'Italia', 0, 1),
	(561, 14, 'Antonio Candreva', 3, 'Lazio', 'Italia', 0, 1),
	(562, 14, 'Daniele De Rossi', 3, 'Roma', 'Italia', 0, 1),
	(563, 14, 'Claudio Marchisio', 3, 'Juventus', 'Italia', 0, 1),
	(564, 14, 'Riccardo Montolivo', 3, 'AC Milan', 'Italia', 0, 0),
	(565, 14, 'Thiago Motta', 3, 'Paris Saint Germain', 'Francia', 0, 1),
	(566, 14, 'Marco ParoloÂ ', 3, 'AC Parma', 'Italia', 0, 1),
	(567, 14, 'Andrea Pirlo', 3, 'Juventus', 'Italia', 0, 1),
	(568, 14, 'RÃ´mulo Souza', 3, 'Verona', 'Italia', 0, 0),
	(569, 14, 'Marco Verratti', 3, 'Paris Saint Germain', 'Francia', 0, 1),
	(570, 14, 'Mario Balotelli', 4, 'AC Milan', 'Italia', 0, 1),
	(571, 14, 'Antonio Cassano', 4, 'Parma', 'Italia', 0, 1),
	(572, 14, 'Alessio Cerci', 4, 'Torino', 'Italia', 0, 1),
	(573, 14, 'Mattia Destro', 4, 'Roma', 'Italia', 0, 0),
	(574, 14, 'Ciro Immobile', 4, 'Torino', 'Italia', 0, 1),
	(575, 14, 'Lorenzo Insigne', 4, 'Napoli', 'Italia', 0, 1),
	(576, 14, 'Giuseppe Rossi', 4, 'Fiorentina', 'Italia', 0, 0),
	(577, 27, 'Anthony Lopes', 1, 'Lyon', 'Francia', 0, 1),
	(578, 27, 'Beto', 1, 'Sevilla', 'EspaÃ±a', 0, 1),
	(579, 27, 'Eduardo', 1, 'Braga', 'Portugal', 0, 1),
	(580, 27, 'Rui PatrÃ­cio', 1, 'Sporting de Lisboa', 'Portugal', 0, 1),
	(581, 27, 'AndrÃ© Almeida', 2, 'Benfica', 'Portugal', 0, 1),
	(582, 27, 'Antunes', 2, 'MÃ¡laga', 'EspaÃ±a', 0, 1),
	(583, 27, 'Bruno Alves', 2, 'FenerbahÃ§e', 'TurquÃ­a', 0, 1),
	(584, 27, 'FÃ¡bio CoentrÃ£o', 2, 'Real Madrid', 'EspaÃ±a', 0, 1),
	(585, 27, 'JoÃ£o Pereira', 2, 'Valencia', 'EspaÃ±a', 0, 1),
	(586, 27, 'Neto', 2, 'Zenit', 'Rusia', 0, 1),
	(587, 27, 'Pepe', 2, 'Real Madrid', 'EspaÃ±a', 0, 1),
	(588, 27, 'Ricardo Costa', 2, 'Valencia', 'EspaÃ±a', 0, 1),
	(589, 27, 'Rolando', 2, 'Inter de MilÃ¡n', 'Italia', 0, 1),
	(590, 27, 'AndrÃ© Gomes', 3, 'Benfica', 'Portugal', 0, 1),
	(591, 27, 'JoÃ£o MÃ¡rio', 3, 'VitÃ³ria SetÃºbal', 'Portugal', 0, 1),
	(592, 27, 'JoÃ£o Moutinho', 3, 'Monaco', 'Francia', 0, 1),
	(593, 27, 'Miguel Veloso', 3, 'Dinamo de Kiev', 'Ucrania', 0, 1),
	(594, 27, 'Raul MeirelesÂ ', 3, 'FenerbahÃ§e', 'TurquÃ­a', 0, 1),
	(595, 27, 'RÃºben Amorim', 3, 'Benfica', 'Portugal', 0, 1),
	(596, 27, 'William Carvalho', 3, 'Sporting de Lisboa', 'Portugal', 0, 1),
	(597, 27, 'Cristiano Ronaldo', 4, 'Real Madrid', 'EspaÃ±a', 0, 1),
	(598, 27, 'Ã‰der', 4, 'Braga', 'Portugal', 0, 1),
	(599, 27, 'HÃ©lder Postiga', 4, 'Lazio', 'Italia', 0, 1),
	(600, 27, 'Hugo Almeida', 4, 'Besiktas', 'TurquÃ­a', 0, 1),
	(601, 27, 'Ivan Cavaleiro', 4, 'Benfica', 'Portugal', 0, 1),
	(602, 27, 'Nani', 4, 'Manchester United', 'Inglaterra', 0, 1),
	(603, 27, 'Rafa', 4, 'Braga', 'Portugal', 0, 1),
	(604, 27, 'Ricardo QuaresmaÂ ', 4, 'FC Porto', 'Portugal', 0, 1),
	(605, 27, 'Varela', 4, 'FC Porto', 'Portugal', 0, 1),
	(606, 27, 'Vieirinha', 4, 'Wolfsburgo', 'Alemania', 0, 1),
	(607, 30, 'Igor Akinfeev', 1, 'CSKA de MoscÃº', 'Rusia', 0, 1),
	(608, 30, 'Yury LodyginÂ ', 1, 'Zenit', 'Rusia', 0, 1),
	(609, 30, 'Sergei Ryzhikov', 1, 'Rubin Kazan', 'Rusia', 0, 1),
	(610, 30, 'Alexander Anyukov', 2, 'Zenit', 'Rusia', 0, 1),
	(611, 30, 'Alexei Berezutsky', 2, 'CSKA de MoscÃº', 'Rusia', 0, 1),
	(612, 30, 'Vasily Berezutsky', 2, 'CSKA de MoscÃº', 'Rusia', 0, 1),
	(613, 30, 'Sergei Ignashevich', 2, 'CSKA de MoscÃº', 'Rusia', 0, 1),
	(614, 30, 'Georgy Shchennikov', 2, 'CSKA de MoscÃº', 'Rusia', 0, 1),
	(615, 30, 'Vladimir Granat', 2, 'DÃ­namo de MoscÃº', 'Rusia', 0, 1),
	(616, 30, 'Alexei KozlovÂ ', 2, 'DÃ­namo de MoscÃº', 'Rusia', 0, 1),
	(617, 30, 'Andrei Yeschenko', 2, 'Anzhi Makhachkala', 'Rusia', 0, 1),
	(618, 30, 'Dmitry KombarovÂ ', 2, 'Spartak de MoscÃº', 'Rusia', 0, 1),
	(619, 30, 'Andrei Semenov', 2, 'Terek Grozny', 'Rusia', 0, 1),
	(620, 30, 'Igor Denisov', 3, 'DÃ­namo de MoscÃº', 'Rusia', 0, 1),
	(621, 30, 'Yury Zhirkov', 3, 'DÃ­namo de MoscÃº', 'Rusia', 0, 1),
	(622, 30, 'Alan Dzagoev', 3, 'CSKA de MoscÃº', 'Rusia', 0, 1),
	(623, 30, 'Yury Gazinsky', 3, 'FC Krasnodar', 'Rusia', 0, 1),
	(624, 30, 'Roman Shirokov', 3, 'FC Krasnodar', 'Rusia', 0, 1),
	(625, 30, 'Denis Glushakov', 3, 'Spartak de MoscÃº', 'Rusia', 0, 1),
	(626, 30, 'Pavel Mogilevets', 3, 'Rubin Kazan', 'Rusia', 0, 1),
	(627, 30, 'Viktor Faizulin', 3, 'Zenit', 'Rusia', 0, 1),
	(628, 30, 'Oleg Shatov', 3, 'Zenit', 'Rusia', 0, 1),
	(629, 30, 'Vladimir Bystrov', 4, 'Anzhi Makhachkala', 'Rusia', 0, 1),
	(630, 30, 'Alexander Kerzhakov', 4, 'Zenit', 'Rusia', 0, 1),
	(631, 30, 'Artem Dzyuba', 4, 'Rostov', 'Rusia', 0, 1),
	(632, 30, 'Alexei Ionov', 4, 'DÃ­namo de MoscÃº', 'Rusia', 0, 1),
	(633, 30, 'Alexander Kokorin', 4, 'DÃ­namo de MoscÃº', 'Rusia', 0, 1),
	(634, 30, 'Maxim Kanunnikov', 4, 'Amkar Perm', 'Rusia', 0, 1),
	(635, 30, 'Pavel Pogrebnyak', 4, 'Reading', 'Inglaterra', 0, 1),
	(636, 30, 'Alexander Samedov', 4, 'Lokomotiv MoscÃº', 'Rusia', 0, 1),
	(637, 17, 'Diego Benaglio', 1, 'Wolfsburgo', 'Alemania', 0, 1),
	(638, 17, 'Roman BÃ¼rki', 1, 'Grasshopper', 'Suiza', 0, 1),
	(639, 17, 'Yann Sommer', 1, 'Basilea', 'Suiza', 0, 1),
	(640, 17, 'Steve von Bergen', 2, 'Young Boys de Berna', 'Suiza', 0, 0),
	(641, 17, 'Johannes Djourou', 2, 'Hamburgo', 'Alemania', 0, 1),
	(642, 17, 'Michael LangÂ ', 2, 'ZÃºrich Grasshopper', 'Suiza', 0, 1),
	(643, 17, 'Stephan Lichsteiner', 2, 'Juventus TurÃ­n', 'Italia', 0, 1),
	(644, 17, 'Ricardo RodriguezÂ ', 2, 'Wolfsburgo', 'Alemania', 0, 1),
	(645, 17, 'Â Fabian SchÃ¤r', 2, 'Basilea', 'Suiza', 0, 1),
	(646, 17, 'Philippe Senderos', 2, 'Valencia', 'EspaÃ±a', 0, 1),
	(647, 17, 'Reto Ziegler', 2, 'Sassuolo Calcio', 'Italia', 0, 1),
	(648, 17, 'Tranquillo Barnetta', 3, 'Eintracht FrÃ¡ncfort', 'Alemania', 0, 1),
	(649, 17, 'Valon BehramiÂ ', 3, 'NÃ¡poles', 'Italia', 0, 1),
	(650, 17, 'Blerim DzemailiÂ ', 3, 'NÃ¡poles', 'Italia', 0, 1),
	(651, 17, 'Gelson Fernandes', 3, 'Friburgo', 'Alemania', 0, 1),
	(652, 17, 'GÃ¶khan Inler', 3, 'NÃ¡poles', 'Italia', 0, 1),
	(653, 17, 'Xherdan ShaqiriÂ ', 3, 'Bayern MÃºnich', 'Alemania', 0, 1),
	(654, 17, 'Valentin Stocker', 3, 'Basilea', 'Suiza', 0, 1),
	(655, 17, 'Josip DrmicÂ ', 4, 'Bayer Leverkusen', 'Alemania', 0, 1),
	(656, 17, 'Mario Gavranovic', 4, 'FC ZÃºrich', 'Suiza', 0, 1),
	(657, 17, 'Admir Mehmedi', 4, 'Friburgo', 'Alemania', 0, 1),
	(658, 17, 'Haris Seferovic', 4, 'Real Sociedad', 'EspaÃ±a', 0, 1),
	(659, 17, 'Granit Xhaqa', 4, 'Borussia MÃ¶nchengladbach', 'Alemania', 0, 1),
	(660, 17, 'Marwin Hitz', 1, 'Augsburgo', 'Alemania', 1, 0),
	(661, 17, 'Timm Klose', 2, 'Wolfsburgo', 'Alamania', 1, 0),
	(662, 17, 'Silvan Widmer', 2, 'Udinese', 'Suiza', 1, 0),
	(663, 17, 'Eren Derdiyok', 4, 'Bayer Leverkusen', 'Alemania', 1, 0),
	(664, 17, 'Fabian Frei', 3, 'Basilea', 'Suiza', 1, 0),
	(665, 17, 'Pajtim Kasami', 3, 'Fulham', 'Inglaterra', 1, 1),
	(666, 17, 'Pirmin Schwegler', 3, 'Eintracht FrÃ¡ncfort', 'Alemania', 1, 0),
	(667, 31, 'Rais M"bolhi', 1, 'CSKA Sofia', 'Bulgaria', 0, 1),
	(668, 31, 'Mohamed Zemmamouche', 1, 'USM Argel', 'Argelia', 0, 1),
	(669, 31, 'Ezzdine Doukha', 1, 'USM El Harrach', 'Argelia', 0, 1),
	(670, 31, 'Mohamed Cdric', 1, 'CS Constantine', 'Argelia', 0, 1),
	(671, 31, 'Essaid Belkalem', 2, 'Watford', 'Inglaterra', 0, 1),
	(672, 31, 'Madjid Bougherra', 2, 'Lekhwiya SC', 'Qatar', 0, 1),
	(673, 31, 'Lyassine Cadamuro', 2, 'Mallorca', 'EspaÃ±a', 0, 1),
	(674, 31, 'Faouzi Ghoulam', 2, 'Napoli', 'Italia', 0, 1),
	(675, 31, 'Rafik Halliche', 2, 'Academia Coimbra', 'Portugal', 0, 1),
	(676, 31, 'Nacereddine Khoualed', 2, 'USM Argel', 'Argelia', 0, 1),
	(677, 31, 'Aissa Mandi', 2, 'Reims', 'Francia', 0, 1),
	(678, 31, 'Mehdi Mostefa', 2, 'Ajaccio', 'Francia', 0, 1),
	(679, 31, 'Carl Medjani', 2, 'Valenciennes', 'Francia', 0, 1),
	(680, 31, 'Djamel Mesbah', 2, 'Livorno', 'Italia', 0, 1),
	(681, 31, 'Nabil Bentaleb', 3, 'Tottenham Hotspur', 'Inglaterra', 0, 1),
	(682, 31, 'Ryad Boudebouz', 3, 'Bastia', 'Francia', 0, 1),
	(683, 31, 'Yacine Brahimi', 3, 'Granada', 'EspaÃ±a', 0, 1),
	(684, 31, 'Adlene Guedioura', 3, 'Crystal Palace', 'Inglaterra', 0, 1),
	(685, 31, 'Amir Karaoui', 3, 'ES Setif', 'Argelia', 0, 1),
	(686, 31, 'Medhi Lacen', 3, 'Getafe', 'EspaÃ±a', 0, 1),
	(687, 31, 'Saphir Taider', 3, 'Inter de MilÃ¡n', 'Italia', 0, 1),
	(688, 31, 'Hassen Yebda', 3, 'Udinese', 'Italia', 0, 1),
	(689, 31, 'Rafik Djebour', 4, 'Nottingham Forest', 'Inglaterra', 0, 1),
	(690, 31, 'Abdelmoumen Djabou', 4, 'Club Africain', 'TÃºnez', 0, 1),
	(691, 31, 'Sofiane Feghouli', 4, 'Valencia', 'EspaÃ±a', 0, 1),
	(692, 31, 'Ryad Mahrez', 4, 'Leicester City', 'Inglaterra', 0, 1),
	(693, 31, 'Islam Slimani', 4, 'Sporting Lisboa', 'Portugal', 0, 1),
	(694, 31, 'Hilal Soudani', 4, 'Dinamo Zagreb', 'Croacia', 0, 1),
	(695, 31, 'Foued Kadir', 4, 'Rennes', 'Francia', 0, 1),
	(696, 31, 'Nabil Ghilas', 4, 'FC Porto', 'Portugal', 0, 1),
	(697, 4, 'Charles Itandje', 1, 'Konyaspor', 'TurquÃ­a', 0, 1),
	(698, 4, 'Ndy AssembÃ©', 1, 'Guingamp', 'Francia', 0, 1),
	(699, 4, 'Sammy Ndjock', 1, 'Fetihespor', 'TurquÃ­a', 0, 1),
	(700, 4, 'LoÃ¯c Feudjou', 1, 'Coton Sport', 'CamerÃºn', 0, 1),
	(701, 4, 'Allan Nyom', 2, 'Granada', 'EspaÃ±a', 0, 1),
	(702, 4, 'Dany Nounkeu', 2, 'Besiktas', 'TurquÃ­a', 0, 1),
	(703, 4, 'CÃ©dric Djeugoue', 2, 'Coton Sport', 'CamerÃºn', 0, 1),
	(704, 4, 'AurÃ©lien Chedjou', 2, 'Galatasaray', 'TurquÃ­a', 0, 1),
	(705, 4, 'Nicolas Nkoulou', 2, 'Olympique Marsella', 'Francia', 0, 1),
	(706, 4, 'Armel Kana-Biyik', 2, 'Rennes', 'Francia', 0, 1),
	(707, 4, 'Henri Bedimo', 2, 'Lyon', 'Francia', 0, 1),
	(708, 4, 'BenoÃ®t Assou-Ekotto', 2, 'QPR', 'Inglaterra', 0, 1),
	(709, 4, 'Gaetang Bong', 2, 'Olympiakos', 'Grecia', 0, 1),
	(710, 4, 'Eyong Enoh', 3, 'Antalyaspor', 'TurquÃ­a', 0, 1),
	(711, 4, 'Jean II Makoun', 3, 'Rennes', 'Francia', 0, 1),
	(712, 4, 'Â JoÃ«l Matip', 3, 'Schalke', 'Alemania', 0, 1),
	(713, 4, 'StÃ©phane Mbia', 3, 'Sevilla', 'EspaÃ±a', 0, 1),
	(714, 4, 'Landry NguÃ©mo', 3, 'Burdeos', 'Francia', 0, 1),
	(715, 4, 'Alexandre SongÂ ', 3, 'Barcelona', 'EspaÃ±a', 0, 1),
	(716, 4, 'CÃ©dric Loe', 3, 'Osasuna', 'EspaÃ±a', 0, 1),
	(717, 4, 'Edgar Sally', 3, 'Lens', 'Francia', 0, 1),
	(718, 4, 'Samuel Eto\'o', 4, 'Chelsea', 'Inglaterra', 0, 1),
	(719, 4, 'Eric Choupo Moting', 4, 'Maguncia', 'Alemania', 0, 1),
	(720, 4, 'Benjamin MoukandjoÂ ', 4, 'Nancy', 'Francia', 0, 1),
	(721, 4, 'Vincent Aboubakar', 4, 'Lorient', 'Francia', 0, 1),
	(722, 4, 'Achille Webo', 4, 'FenerbahÃ§e', 'TurquÃ­a', 0, 1),
	(723, 4, 'Mohamadou Idrissou', 4, 'Kaiserslautern', 'Alemania', 0, 1),
	(724, 4, 'Fabrice Olinga', 4, 'Zulte-Waregem', 'BÃ©lgica', 0, 1),
	(725, 11, 'Boubacar Barry', 1, 'Lokeren', 'BÃ©lgica', 0, 1),
	(726, 11, 'Sayouba MandÃ©', 1, 'Stabaek', 'Noruega', 0, 1),
	(727, 11, 'Sylvain Gbohouo', 1, 'SÃ©wÃ© San Pedro', 'Costa de Marfil', 0, 1),
	(728, 11, 'Ali Badra SangarÃ©', 1, 'ASEC Mimosas', 'Costa de Marfil', 0, 0),
	(729, 11, 'Kolo TourÃ©', 2, 'Liverpool', 'Inglaterra', 0, 1),
	(730, 11, 'Arthur Boka', 2, 'Stuttgart', 'Alemania', 0, 1),
	(731, 11, 'Jean-Daniel Akpa Akpro', 3, 'Toulouse', 'Francia', 0, 1),
	(732, 11, 'Serge Aurier', 2, 'Toulouse', 'Francia', 0, 1),
	(733, 11, 'Ousmane Viera Diarrassouba', 2, 'Caykur Rizespor', 'TurquÃ­a', 0, 1),
	(734, 11, 'Didier Zokora', 2, 'Trabzonspor', 'TurquÃ­a', 0, 1),
	(735, 11, 'Constant Djakpa', 2, 'Eintracht Frankfurt', 'Alemania', 0, 1),
	(736, 11, 'Brice Dja DjÃ©djÃ©', 2, 'Marsella', 'Francia', 0, 0),
	(737, 11, 'Benjamin Angoua Brou', 2, 'Valenciennes', 'Francia', 0, 0),
	(738, 11, 'Souleymane Bamba', 2, 'Trabzonspor', 'TurquÃ­a', 0, 1),
	(739, 11, 'Yaya TourÃ©', 3, 'Manchester City', 'Inglaterra', 0, 1),
	(740, 11, 'IsmaÃ«l DiomandÃ©', 3, 'Saint-Etienne', 'Francia', 0, 1),
	(741, 11, 'Max Gradel', 3, 'Saint-Etienne', 'Francia', 0, 1),
	(742, 11, 'IsmaÃ«l Cheick TiotÃ©Â ', 3, 'Newcastle United', 'Inglaterra', 0, 1),
	(743, 11, 'Geoffroy Serey DiÃ©', 3, 'Basel FC', 'Suiza', 0, 1),
	(744, 11, 'Didier Ya Konan', 3, 'Hannover 96', 'Alemania', 0, 1),
	(745, 11, 'Didier Drogba', 4, 'Galatasaray', 'TurquÃ­a', 0, 1),
	(746, 11, 'Gervinho', 4, 'AS Roma', 'Italia', 0, 1),
	(747, 11, 'Salomon Kalou', 4, 'Lille', 'Francia', 0, 1),
	(748, 11, 'Wilfried Bony', 4, 'Swansea', 'Inglaterra', 0, 1),
	(749, 11, 'Giovanni Sio', 4, 'FC Basel', 'Suiza', 0, 1),
	(750, 11, 'Mathis Bolly', 3, 'DÃ¼sseldorf', 'Alemania', 0, 1),
	(751, 11, 'Seydou Doumbia', 4, 'CSKA MoscÃº', 'Rusia', 0, 0),
	(752, 11, 'Lacina TraorÃ©', 4, 'Everton', 'Inglaterra', 0, 0),
	(753, 28, 'Adam Larsen Kwarasey', 1, 'StrÃ¸msgodset', 'Noruega', 0, 1),
	(754, 28, 'Fatau Dauda', 1, 'Orlando Pirates', 'SudÃ¡frica', 0, 1),
	(755, 28, 'Stephen Adams', 1, 'Aduana Stars', 'Ghana', 0, 1),
	(756, 28, 'Samuel Inkoom', 2, 'Platanias', 'Grecia', 0, 1),
	(757, 28, 'Daniel Opare', 2, 'Standard Liege', 'BÃ©lgica', 0, 1),
	(758, 28, 'Harrison Afful', 2, 'Esperance', 'TÃºnez', 0, 1),
	(759, 28, 'Jeffery Schlupp', 2, 'Leicester City', 'Inglaterra', 0, 1),
	(760, 28, 'John Boye', 2, 'Rennes', 'Francia', 0, 1),
	(761, 28, 'Jonathan Mensah', 2, 'Evian', 'Francia', 0, 1),
	(762, 28, 'Rashid Sumaila', 2, 'Mamelodi Sundowns', 'SudÃ¡frica', 0, 1),
	(763, 28, 'Jerry Akaminko', 2, 'Eskisehirspor', 'TurquÃ­a', 0, 1),
	(764, 28, 'Michael Essien', 3, 'AC Milan', 'Italia', 0, 1),
	(765, 28, 'Sulley Ali Muntari', 3, 'AC Milan', 'Italia', 0, 1),
	(766, 28, 'Rabiu Mohammed', 3, 'Kuban Krasnodar', 'Rusia', 0, 1),
	(767, 28, 'Kwadwo Asamoah', 3, 'Juventus', 'Italia', 0, 1),
	(768, 28, 'Emmanuel Agyemang Badu', 3, 'Udinese', 'Italia', 0, 1),
	(769, 28, 'Afriyie Acquah', 3, 'Parma', 'Italia', 0, 1),
	(770, 28, 'Andre Ayew', 3, 'Marsella', 'Francia', 0, 1),
	(771, 28, 'Mubarak Wakaso', 3, 'Rubin Kazan', 'Rusia', 0, 1),
	(772, 28, 'Christian Atsu Twasam', 3, 'Vitesse Arnhem', 'Holanda', 0, 1),
	(773, 28, 'Albert AdomahÂ ', 3, 'Middlesbrough', 'Inglaterra', 0, 1),
	(774, 28, 'David Titi Accam', 3, 'Helsingborg', 'Suecia', 0, 1),
	(775, 28, 'Asamoah Gyan', 4, 'Al Ain', 'Emiratos Ãrabes Unidos', 0, 1),
	(776, 28, 'Kevin-Prince Boateng', 4, 'Schalke 04', 'Alemania', 0, 1),
	(777, 28, 'Abdul Majeed Waris', 4, 'Valenciennes', 'Francia', 0, 1),
	(778, 28, 'Jordan Ayew', 4, 'Sochaux', 'Francia', 0, 1),
	(779, 23, 'Vincent Enyeama', 1, 'Lille', 'Francia', 0, 1),
	(780, 23, 'Austin Ejide', 1, 'Hapoel Be\'er Sheva', 'Israel', 0, 1),
	(781, 23, 'Chigozie Agbim', 1, 'Gombe United', 'Nigeria', 0, 1),
	(782, 23, 'Daniel Akpeyi', 1, 'Warri Wolves', 'Nigeria', 0, 1),
	(783, 23, 'Elderson Echiejile', 2, 'Monaco', 'Francia', 0, 1),
	(784, 23, 'Efe Ambrose', 2, 'Celtic', 'Escocia', 0, 1),
	(785, 23, 'Godfrey Oboabona', 2, 'Rizespor', 'TurquÃ­a', 0, 1),
	(786, 23, 'Azubuike Egwuekwe', 2, 'Warri Wolves', 'Nigeria', 0, 1),
	(787, 23, 'Kenneth OmeruoÂ ', 2, 'Middlesbrough', 'Inglaterra', 0, 1),
	(788, 23, 'Juwon Oshaniwa', 2, 'Aschdod FC', 'Israel', 0, 1),
	(789, 23, 'Joseph Yobo', 2, 'Norwich City', 'Inglaterra', 0, 1),
	(790, 23, 'Kunle Odunlami', 2, 'Sunshine Stars', 'Nigeria', 0, 1),
	(791, 23, 'Mikel Obi', 3, 'Chelsea', 'Inglaterra', 0, 1),
	(792, 23, 'Ogenyi Onazi', 3, 'Lazio', 'Italia', 0, 1),
	(793, 23, 'Ramon AzeezÂ ', 3, 'AlmerÃ­a', 'EspaÃ±a', 0, 1),
	(794, 23, 'Ejike Uzoenyi', 3, 'Enugu Rangers', 'Nigeria', 0, 1),
	(795, 23, 'Gabriel Reuben', 3, 'Beveren', 'BÃ©lgica', 0, 1),
	(796, 23, 'Nosa IgieborÂ ', 3, 'Real Betis', 'EspaÃ±a', 0, 1),
	(797, 23, 'Joel Obi', 3, 'Parma', 'Italia', 0, 1),
	(798, 23, 'Michael Uchebo', 3, 'Cercle Brugge', 'BÃ©lgica', 0, 1),
	(799, 23, 'Sunday Mba', 3, 'Bastia', 'Francia', 0, 1),
	(800, 23, 'Ahmed Musa', 4, 'CSKA de MoscÃº', 'Rusia', 0, 1),
	(801, 23, 'Shola Ameobi', 4, 'Newcastle United', 'Inglaterra', 0, 1),
	(802, 23, 'Victor Moses', 4, 'Liverpool', 'Inglaterra', 0, 1),
	(803, 23, 'Emmanuel Emenike', 4, 'Fenerbahce', 'TurquÃ­a', 0, 1),
	(804, 23, 'Obinna NsoforÂ ', 4, 'Chievo Verona', 'Italia', 0, 1),
	(805, 23, 'Peter Osaze Odemwingie', 4, 'Stoke City', 'Inglaterra', 0, 1),
	(806, 23, 'Babatunde Michael', 4, 'Volyn', 'Ucrania', 0, 1),
	(807, 23, 'Nnamdi Oduamadi', 4, 'Varese', 'Italia', 0, 1),
	(808, 23, 'Uche Nwofor', 4, 'Heerenveen', 'Holanda', 0, 1),
	(809, 32, 'Jung Sung-Ryong', 1, 'Suwon Bluewings', 'Corea del Sur', 0, 1),
	(810, 32, 'Kim Seung-Gyu', 1, 'Ulsan Hyundai', 'Corea del Sur', 0, 1),
	(811, 32, 'Lee Bum-YoungÂ ', 1, 'Busan IPark', 'Corea del Sur', 0, 1),
	(812, 32, 'Hong Jeong-Ho', 2, 'Augsburgo', 'Alemania', 0, 1),
	(813, 32, 'Hwang Seok-Ho', 2, 'Sanfrecce Hiroshima', 'JapÃ³n', 0, 1),
	(814, 32, 'Kim Chang-SooÂ ', 2, 'Kashiwa Reysol', 'JapÃ³n', 0, 1),
	(815, 32, 'Kim Jin-Soo', 2, 'Albirex Niigata', 'JapÃ³n', 0, 1),
	(816, 32, 'Kim Young-Gwon', 2, 'Guangzhou Evergrande', 'China', 0, 1),
	(817, 32, 'Kwak Tae-Hwi', 2, 'Al Hilal', 'Arabia Saudita', 0, 1),
	(818, 32, 'Lee Yong', 2, 'Ulsan Hyundai', 'Corea del Sur', 0, 1),
	(819, 32, 'Yun Suk-Young', 2, 'Queens Park Rangers', 'Inglaterra', 0, 1),
	(820, 32, 'Ha Dae-Sung', 3, 'Beijing Guoan', 'China', 0, 1),
	(821, 32, 'Han Kook-Young', 3, 'Kashiwa Reysol', 'JapÃ³n', 0, 1),
	(822, 32, 'Ji Dong-Won', 3, 'Augsburgo', 'Alemania', 0, 1),
	(823, 32, 'Ki Sung-Yueng', 3, 'Sunderland', 'Inglaterra', 0, 1),
	(824, 32, 'Kim Bo-Kyung', 3, 'Cardiff City', 'Inglaterra', 0, 1),
	(825, 32, 'Lee Chung-Yong', 3, 'Bolton', 'Inglaterra', 0, 1),
	(826, 32, 'Park Jong-Woo', 3, 'Guangzhou R&F', 'China', 0, 1),
	(827, 32, 'Son Heung-Min', 3, 'Bayer Leverkusen', 'Alemania', 0, 1),
	(828, 32, 'Kim Shin-Wook', 4, 'Ulsan Hyundai', 'Corea del Sur', 0, 1),
	(829, 32, 'Koo Ja-Cheol', 4, 'Maguncia', 'Alemania', 0, 1),
	(830, 32, 'Lee Keun-Ho', 4, 'Sangju Sangmu', 'Corea del Sur', 0, 1),
	(831, 32, 'Chu-Young Park', 4, 'Watford', 'Inglaterra', 0, 1),
	(832, 24, 'Daniel Davari', 1, 'Eintracht Braunschweig', 'Alemania', 0, 1),
	(833, 24, 'Alireza Haghighi', 1, 'Sporting Covilha', 'Portugal', 0, 1),
	(834, 24, 'Rahman Ahmadi', 1, 'Sepahan', 'IrÃ¡n', 0, 1),
	(835, 24, 'Sousha Makani', 1, 'Foolad Khuzestan', 'IrÃ¡n', 0, 1),
	(836, 24, 'Khosro Heidari', 2, 'Esteghlal', 'IrÃ¡n', 0, 1),
	(837, 24, 'Hossein Mahini', 2, 'Persepolis', 'IrÃ¡n', 0, 1),
	(838, 24, 'Steven Beitashour', 2, 'Vancouver Whitecaps', 'CanadÃ¡', 0, 1),
	(839, 24, 'Pejman Montazeri', 2, 'Umm Salal', 'IrÃ¡n', 0, 1),
	(840, 24, 'Jalal Hosseini', 2, 'Persepolis', 'IrÃ¡n', 0, 1),
	(841, 24, 'Amir Sadeghi', 2, 'Esteghlal', 'IrÃ¡n', 0, 1),
	(842, 24, 'Mohammad Reza Khanzadeh', 2, 'Zob Ahan', 'IrÃ¡n', 0, 1),
	(843, 24, 'Ahmad Alenemeh', 2, 'Naft', 'Irak', 0, 1),
	(844, 24, 'Hashem Beikzadeh', 2, 'Esteghlal', 'IrÃ¡n', 0, 1),
	(845, 24, 'Ehsan Hajsafi', 2, 'Sepahan', 'IrÃ¡n', 0, 1),
	(846, 24, 'Mehrdad Pooladi', 2, 'Persepolis', 'IrÃ¡n', 0, 1),
	(847, 24, 'Javad Nekounam', 3, 'Al Kuwait', 'Kuwait', 0, 1),
	(848, 24, 'Andranik Teymourian', 3, 'Esteghlal', 'IrÃ¡n', 0, 1),
	(849, 24, 'Reza Haghighi', 3, 'Perseopolis', 'IrÃ¡n', 0, 1),
	(850, 24, 'Ghasem Hadadifar', 3, 'Zob Ahan', 'IrÃ¡n', 0, 1),
	(851, 24, 'Bakhtiyar Rahmani', 3, 'Foolad', 'IrÃ¡n', 0, 1),
	(852, 24, 'Alireza Jahanbakhsh', 3, 'Nec Nijmegen', 'Holanda', 0, 1),
	(853, 24, 'Ashkan Dejagah', 3, 'Fulham', 'Inglaterra', 0, 1),
	(854, 24, 'Masoud Shojaei', 4, 'Las Palmas', 'EspaÃ±a', 0, 1),
	(855, 24, 'Mohammad Reza Khalatbari', 4, 'Persepolis', 'IrÃ¡n', 0, 1),
	(856, 24, 'Mehdi Sharifi', 4, 'Sepahan', 'IrÃ¡n', 0, 1),
	(857, 24, 'Reza Ghoochannejhad', 4, 'Charlton Athletic', 'Inglaterra', 0, 1),
	(858, 24, 'Karim Ansarifard', 4, 'Persepolis', 'IrÃ¡n', 0, 1),
	(859, 24, 'Sardar Azmoun', 4, 'Rubin Kazan', 'Rusia', 0, 1),
	(860, 12, 'Eiji Kawashima', 1, 'Standard Liege', 'BÃ©lgica', 0, 1),
	(861, 12, 'Shusaku Nishikawa', 1, 'Urawa Reds', 'JapÃ³n', 0, 1),
	(862, 12, 'Shuichi Gonda', 1, 'FC Tokyo', 'JapÃ³n', 0, 1),
	(863, 12, 'Yasuyuki Konno', 2, 'Gamba Osaka', 'JapÃ³n', 0, 1),
	(864, 12, 'Masahiko Inoha', 2, 'Jubilo Iwata', 'JapÃ³n', 0, 1),
	(865, 12, 'Yuto Nagatomo', 2, 'Inter de MilÃ¡n', 'Italia', 0, 1),
	(866, 12, 'Masato Morishige', 2, 'FC Tokyo', 'JapÃ³n', 0, 1),
	(867, 12, 'Atsuto Uchida', 2, 'Schalke 04', 'Alemania', 0, 1),
	(868, 12, 'Maya Yoshida', 2, 'Southampton', 'Inglaterra', 0, 1),
	(869, 12, 'Hiroki Sakai', 2, 'Hannover 96', 'Alemania', 0, 1),
	(870, 12, 'Gotoku SakaiÂ ', 2, 'Stuttgart', 'Alemania', 0, 1),
	(871, 12, 'Yasuhito Endo', 3, 'Gamba Osaka', 'JapÃ³n', 0, 1),
	(872, 12, 'Makoto Hasebe', 3, 'Nuremberg', 'Alemania', 0, 1),
	(873, 12, 'Toshihiro Aoyama', 3, 'Sanfrecce Hiroshima', 'JapÃ³n', 0, 1),
	(874, 12, 'Hotaru Yamaguchi', 3, 'Cerezo Osaka', 'JapÃ³n', 0, 1),
	(875, 12, 'Keisuke Honda', 4, 'AC Milan', 'Italia', 0, 1),
	(876, 12, 'Shinji Kagawa', 4, 'Manchester United', 'Inglaterra', 0, 1),
	(877, 12, 'Yoshito Okubo', 4, 'Kawasaki Frontale', 'JapÃ³n', 0, 1),
	(878, 12, 'Shinji Okazaki', 4, 'Mainz', 'Alemania', 0, 1),
	(879, 12, 'Hiroshi Kiyotake', 3, 'Nuremberg', 'Alemania', 0, 1),
	(880, 12, 'Yoichiro Kakitani', 4, 'Cerezo Osaka', 'JapÃ³n', 0, 1),
	(881, 12, 'Manabu Saito', 4, 'Yokohama F-Marinos', 'JapÃ³n', 0, 1),
	(882, 12, 'Yuya Osako', 4, '1860 Munich', 'Alemania', 0, 1),
	(883, 8, 'Mat Ryan', 1, 'Club Brugge', 'BÃ©lgica', 0, 1),
	(884, 8, 'Mitch Langerak', 1, 'Borussia Dortmund', 'Alemania', 0, 1),
	(885, 8, 'Eugene Galekovic', 1, 'Adelaide United', 'Australia', 0, 1),
	(886, 8, 'Mark Birighitti', 1, 'Newcastle Jets', 'Australia', 0, 1),
	(887, 8, 'Ivan Franjic', 2, 'Brisbane Roar', 'Australia', 0, 1),
	(888, 8, 'Matthew Spiranovic', 2, 'Western Sydney Wanderers', 'Australia', 0, 1),
	(889, 8, 'Curtis Good', 2, 'Newcastle United', 'Inglaterra', 0, 1),
	(890, 8, 'Bailey Wright', 2, 'Preston North End', 'Inglaterra', 0, 1),
	(891, 8, 'Jason Davidson', 2, 'Heracles Almelo', 'Holanda', 0, 1),
	(892, 8, 'Luke Wilkshire', 2, 'DÃ­namo de MoscÃº', 'Rusia', 0, 1),
	(893, 8, 'Alex Wilkinson', 2, 'Jeonbuk Motors', 'Corea del Sur', 0, 1),
	(894, 8, 'Ryan McGowan', 2, 'Shandong Luneng', 'China', 0, 1),
	(895, 8, 'Mile Jedinak', 3, 'Crystal Palace', 'Inglaterra', 0, 1),
	(896, 8, 'Mark Milligan', 3, 'Melbourne Victory', 'Australia', 0, 1),
	(897, 8, 'James Holland', 3, 'Austria Viena', 'Austria', 0, 1),
	(898, 8, 'Massimo Luongo', 3, 'Swindon Town', 'Inglaterra', 0, 1),
	(899, 8, 'Adam Sarota', 3, 'FC Utrecht', 'Holanda', 0, 1),
	(900, 8, 'Oliver Bozanic', 3, 'Luzern', 'Suiza', 0, 1),
	(901, 8, 'Matt McKay', 3, 'Brisbane Roar', 'Australia', 0, 1),
	(902, 8, 'Mark Bresciano', 3, 'Al Gharafa', 'Qatar', 0, 1),
	(903, 8, 'Josh Brillante', 3, 'Newcastle Jets', 'Australia', 0, 1),
	(904, 8, 'Tim Cahill', 4, 'New York Red Bulls', 'EE.UU.', 0, 1),
	(905, 8, 'Josh Kennedy', 3, 'Nagoya Grampus', 'JapÃ³n', 0, 1),
	(906, 8, 'Tom Rogic', 4, 'Melbourne Victory', 'Australia', 0, 1),
	(907, 8, 'Dario Vidosic', 4, 'Sion', 'Suiza', 0, 1),
	(908, 8, 'Tommy Oar', 4, 'FC Utrecht', 'Holanda', 0, 1),
	(909, 8, 'James Troisi', 4, 'Melbourne Victory', 'Australia', 0, 1),
	(910, 8, 'Ben Halloran', 4, 'Fortuna DÃ¼sseldorf', 'Alemania', 0, 1),
	(911, 8, 'Adam Taggart', 4, 'Newcastle Jets', 'Australia', 0, 1),
	(912, 8, 'Matthew Leckie', 4, 'FSV Frankfurt', 'Alemania', 0, 1),
	(913, 9, 'Carlos Carbonero', 3, 'River Plate', 'Argentina', 0, 1),
	(914, 10, 'Vangelis Moras', 2, 'Verona', 'Italia', 0, 1),
	(916, 18, 'Moussa Sisoko', 3, '', '', 0, 1),
	(917, 18, 'Loic Remy', 4, '', '', 0, 1),
	(918, 18, 'Mickael Landreau', 1, '', '', 0, 1),
	(919, 3, 'Miguel Ponce', 2, '', '', 0, 1),
	(920, 3, 'Javier Aquino', 3, '', '', 0, 1);
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.posiciones
CREATE TABLE IF NOT EXISTS `posiciones` (
  `id_posicion` int(11) NOT NULL AUTO_INCREMENT,
  `posicion` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_posicion`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla brasil2014.posiciones: 4 rows
/*!40000 ALTER TABLE `posiciones` DISABLE KEYS */;
INSERT IGNORE INTO `posiciones` (`id_posicion`, `posicion`) VALUES
	(1, 'Arquero'),
	(2, 'Defensa'),
	(3, 'Mediocampista'),
	(4, 'Delantero');
/*!40000 ALTER TABLE `posiciones` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.puntos_apuestas
CREATE TABLE IF NOT EXISTS `puntos_apuestas` (
  `id_ptos_apuesta` int(11) NOT NULL AUTO_INCREMENT,
  `Marcador` int(11) DEFAULT NULL,
  `Ganador` int(11) DEFAULT NULL,
  `Goles_Un_Equipo` int(11) DEFAULT NULL,
  `Diferencia_Goles` int(11) DEFAULT NULL,
  `Marcador_Unico` int(11) DEFAULT NULL,
  `Marcador_Primer_Tiempo` int(11) DEFAULT NULL,
  `Minuto_Primer_Gol` int(11) DEFAULT NULL,
  `Jugador_Primer_Gol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ptos_apuesta`),
  KEY `idx_Calculo_Puntos` (`Marcador`,`Ganador`,`Goles_Un_Equipo`,`Diferencia_Goles`,`Marcador_Unico`,`Marcador_Primer_Tiempo`,`Minuto_Primer_Gol`,`Jugador_Primer_Gol`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Ejemplo de Reglas\r\n\r\nEjemplo: A vs B -> Marcador Final: 4 - ';

-- Volcando datos para la tabla brasil2014.puntos_apuestas: 1 rows
/*!40000 ALTER TABLE `puntos_apuestas` DISABLE KEYS */;
INSERT IGNORE INTO `puntos_apuestas` (`id_ptos_apuesta`, `Marcador`, `Ganador`, `Goles_Un_Equipo`, `Diferencia_Goles`, `Marcador_Unico`, `Marcador_Primer_Tiempo`, `Minuto_Primer_Gol`, `Jugador_Primer_Gol`) VALUES
	(1, 3, 1, 0, 2, 5, 2, 5, 2);
/*!40000 ALTER TABLE `puntos_apuestas` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.ranking_fechas_vistas
CREATE TABLE IF NOT EXISTS `ranking_fechas_vistas` (
  `Nombre` varchar(101) NOT NULL DEFAULT '',
  `Carton` varchar(20) NOT NULL DEFAULT '',
  `Puntos` int(11) NOT NULL DEFAULT '0',
  `fecha_vista` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Nombre`,`Carton`,`Puntos`,`fecha_vista`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla brasil2014.ranking_fechas_vistas: 127 rows
/*!40000 ALTER TABLE `ranking_fechas_vistas` DISABLE KEYS */;
INSERT IGNORE INTO `ranking_fechas_vistas` (`Nombre`, `Carton`, `Puntos`, `fecha_vista`) VALUES
	('alexis lascano', 'cartÃƒÂ³n_ tÃƒÂ³n_tÃ', 8, '2014-06-13 00:00:00'),
	('alexis lascano', 'carton_ton_ton', 14, '2014-06-14 00:00:00'),
	('alexis lascano', 'carton_ton_ton', 24, '2014-06-15 00:00:00'),
	('Alvaro Bernuy', 'CartonÃ©', 3, '2014-06-13 00:00:00'),
	('Alvaro Bernuy', 'CartonÃ©', 14, '2014-06-14 00:00:00'),
	('Alvaro Bernuy', 'CartonÃ©', 17, '2014-06-15 00:00:00'),
	('Alvaro Philippi', 'GanartÃ³n', 3, '2014-06-13 00:00:00'),
	('Alvaro Philippi', 'GanartÃ³n', 8, '2014-06-14 00:00:00'),
	('Alvaro Philippi', 'GanartÃ³n', 9, '2014-06-15 00:00:00'),
	('Andres  Mendez', 'DJCARTON', 1, '2014-06-13 00:00:00'),
	('Andres  Mendez', 'DJMENDEZ', 6, '2014-06-14 00:00:00'),
	('Andres  Mendez', 'DJMENDEZ', 9, '2014-06-15 00:00:00'),
	('Andres Medina', 'Carton ganador', 1, '2014-06-13 00:00:00'),
	('Andres Medina', 'Carton ganador', 4, '2014-06-14 00:00:00'),
	('Andres Medina', 'Carton ganador', 6, '2014-06-15 00:00:00'),
	('Barbara Delgadillo', 'Barberiti', 1, '2014-06-13 00:00:00'),
	('Barbara Delgadillo', 'Barberiti', 9, '2014-06-14 00:00:00'),
	('Barbara Delgadillo', 'Barberiti', 12, '2014-06-15 00:00:00'),
	('Benjamin Figueroa', 'cartiÃ±o', 1, '2014-06-13 00:00:00'),
	('Benjamin Figueroa', 'cartiÃ±o', 9, '2014-06-14 00:00:00'),
	('Benjamin Figueroa', 'cartiÃ±o', 17, '2014-06-15 00:00:00'),
	('Bernardo Medeiros', 'd-_-b', 1, '2014-06-13 00:00:00'),
	('Bernardo Medeiros', 'd-_-b', 7, '2014-06-14 00:00:00'),
	('Bernardo Medeiros', 'd-_-b', 8, '2014-06-15 00:00:00'),
	('Camilo Castillo', '12-06-2014', 1, '2014-06-13 00:00:00'),
	('Camilo Castillo', 'Castigol', 4, '2014-06-14 00:00:00'),
	('Camilo Castillo', 'Castigol', 7, '2014-06-15 00:00:00'),
	('Carlos Jovel', 'Carton Cacique', 6, '2014-06-13 00:00:00'),
	('Carlos Jovel', 'Carton Cacique', 9, '2014-06-14 00:00:00'),
	('Carlos Jovel', 'Carton Cacique', 16, '2014-06-15 00:00:00'),
	('Claudio Gonzalez', 'Forca Chile!', 1, '2014-06-13 00:00:00'),
	('Claudio Gonzalez', 'Forca Chile!', 1, '2014-06-14 00:00:00'),
	('Claudio Gonzalez', 'Forca Chile!', 1, '2014-06-15 00:00:00'),
	('Cristina Lopez', 'cricri', 5, '2014-06-13 00:00:00'),
	('Cristina Lopez', 'cricri', 15, '2014-06-14 00:00:00'),
	('Cristina Lopez', 'cricri', 16, '2014-06-15 00:00:00'),
	('Diana  Zorec', 'DZO Argentina', 6, '2014-06-13 00:00:00'),
	('Diana  Zorec', 'DZO Argentina', 11, '2014-06-14 00:00:00'),
	('Diana  Zorec', 'DZO Argentina', 14, '2014-06-15 00:00:00'),
	('Erika Kutscher', 'Erika', 1, '2014-06-13 00:00:00'),
	('Erika Kutscher', 'Erika', 4, '2014-06-14 00:00:00'),
	('Erika Kutscher', 'Erika', 8, '2014-06-15 00:00:00'),
	('Fabiola Barrientos', 'CartonFB', 6, '2014-06-13 00:00:00'),
	('Fabiola Barrientos', 'CartonFB', 11, '2014-06-14 00:00:00'),
	('Fabiola Barrientos', 'CartonFB', 14, '2014-06-15 00:00:00'),
	('Felipe Gaete', ' ', 1, '2014-06-13 00:00:00'),
	('Felipe Gaete', ' ', 12, '2014-06-14 00:00:00'),
	('Felipe Gaete', ' ', 19, '2014-06-15 00:00:00'),
	('Felipe ZÃºÃ±iga', 'CartÃ³n 02', 3, '2014-06-13 00:00:00'),
	('Felipe ZÃºÃ±iga', 'CartÃ³n 02', 11, '2014-06-14 00:00:00'),
	('Felipe ZÃºÃ±iga', 'CartÃ³n 02', 15, '2014-06-15 00:00:00'),
	('Felipe ZÃºÃ±iga', 'Vamos la U', 6, '2014-06-13 00:00:00'),
	('Felipe ZÃºÃ±iga', 'Vamos la U', 11, '2014-06-14 00:00:00'),
	('Felipe ZÃºÃ±iga', 'Vamos la U', 20, '2014-06-15 00:00:00'),
	('Francisco Barrientos', 'Lets rock', 1, '2014-06-13 00:00:00'),
	('Francisco Barrientos', 'Lets rock', 4, '2014-06-14 00:00:00'),
	('Francisco Barrientos', 'Lets rock', 12, '2014-06-15 00:00:00'),
	('Francisco Montero', 'Carton premiado', 1, '2014-06-13 00:00:00'),
	('Francisco Montero', 'Carton premiado', 6, '2014-06-14 00:00:00'),
	('Francisco Montero', 'Carton premiado', 9, '2014-06-15 00:00:00'),
	('Guillermo Cardoza', 'Carlton', 6, '2014-06-13 00:00:00'),
	('Guillermo Cardoza', 'Carlton', 9, '2014-06-14 00:00:00'),
	('Guillermo Cardoza', 'Carlton', 9, '2014-06-15 00:00:00'),
	('Herlen Rojas', 'carton_a1', 3, '2014-06-13 00:00:00'),
	('Herlen Rojas', 'herlenROJAs', 9, '2014-06-14 00:00:00'),
	('Herlen Rojas', 'herlenROJAs', 10, '2014-06-15 00:00:00'),
	('IGNACIO ERBETTA', 'Carton Ignacio', 4, '2014-06-14 00:00:00'),
	('IGNACIO ERBETTA', 'Carton Ignacio', 8, '2014-06-15 00:00:00'),
	('Ignacio Geissbuhler', 'FÃ¼-Carton', 1, '2014-06-13 00:00:00'),
	('Ignacio Geissbuhler', 'FÃ¼-Carton', 7, '2014-06-14 00:00:00'),
	('Ignacio Geissbuhler', 'FÃ¼-Carton', 10, '2014-06-15 00:00:00'),
	('Javier  Zambrano', 'Cartonnet', 1, '2014-06-13 00:00:00'),
	('Javier  Zambrano', 'Cartonnet', 2, '2014-06-14 00:00:00'),
	('Javier  Zambrano', 'Cartonnet', 3, '2014-06-15 00:00:00'),
	('Javier Anabalon', 'JAnabalon', 6, '2014-06-13 00:00:00'),
	('Javier Anabalon', 'JAnabalon', 9, '2014-06-14 00:00:00'),
	('Javier Anabalon', 'JAnabalon', 14, '2014-06-15 00:00:00'),
	('Javiera  Rojas', 'Rojita', 1, '2014-06-13 00:00:00'),
	('Javiera  Rojas', 'Rojita', 7, '2014-06-14 00:00:00'),
	('Javiera  Rojas', 'Rojita', 8, '2014-06-15 00:00:00'),
	('Jorge Sierra', 'Chile0EspaÃ±a6', 1, '2014-06-13 00:00:00'),
	('Jorge Sierra', 'Chile0EspaÃ±a6', 8, '2014-06-14 00:00:00'),
	('Jorge Sierra', 'Chile0EspaÃ±a6', 9, '2014-06-15 00:00:00'),
	('Mateo Buenahora', 'MBA Campeon', 1, '2014-06-13 00:00:00'),
	('Mateo Buenahora', 'MBA Campeon', 1, '2014-06-14 00:00:00'),
	('Mateo Buenahora', 'MBA Campeon', 2, '2014-06-15 00:00:00'),
	('Miguel Champin', 'Carton_oh!', 1, '2014-06-13 00:00:00'),
	('Miguel Champin', 'Carton_oh!', 7, '2014-06-14 00:00:00'),
	('Miguel Champin', 'Carton_oh!', 13, '2014-06-15 00:00:00'),
	('Paolo Escorza', 'Previa', 4, '2014-06-14 00:00:00'),
	('Paolo Escorza', 'Previa', 7, '2014-06-15 00:00:00'),
	('Patricio Droguett', 'Ganador', 1, '2014-06-13 00:00:00'),
	('Patricio Droguett', 'Ganador', 6, '2014-06-14 00:00:00'),
	('Patricio Droguett', 'Ganador', 10, '2014-06-15 00:00:00'),
	('Pedro Ortega', 'Ortegol', 3, '2014-06-13 00:00:00'),
	('Pedro Ortega', 'Ortegol', 8, '2014-06-14 00:00:00'),
	('Pedro Ortega', 'Ortegol', 8, '2014-06-15 00:00:00'),
	('Rodolfo Baeza', 'Ruuds', 1, '2014-06-13 00:00:00'),
	('Rodolfo Baeza', 'Ruuds', 12, '2014-06-14 00:00:00'),
	('Rodolfo Baeza', 'Ruuds', 15, '2014-06-15 00:00:00'),
	('Rodolfo Bernales', 'The Winner', 3, '2014-06-13 00:00:00'),
	('Rodolfo Bernales', 'The Winner', 11, '2014-06-14 00:00:00'),
	('Rodolfo Bernales', 'The Winner', 12, '2014-06-15 00:00:00'),
	('Rodolfo Salazar', 'Cartonier', 1, '2014-06-13 00:00:00'),
	('Rodolfo Salazar', 'Cartonier', 10, '2014-06-14 00:00:00'),
	('Rodolfo Salazar', 'Cartonier', 16, '2014-06-15 00:00:00'),
	('Ruth Escobar', 'brasil2014', 6, '2014-06-13 00:00:00'),
	('Ruth Escobar', 'FESE', 9, '2014-06-14 00:00:00'),
	('Ruth Escobar', 'FESE', 16, '2014-06-15 00:00:00'),
	('Sebastian Parodi', 'CartÃƒÂ³n SP', 6, '2014-06-13 00:00:00'),
	('Sebastian Parodi', 'CartÃƒÂ³n SP', 21, '2014-06-14 00:00:00'),
	('Sebastian Parodi', 'CartÃƒÂ³n SP', 28, '2014-06-15 00:00:00'),
	('Sergio Hudson', 'CartÃ³n Network', 3, '2014-06-13 00:00:00'),
	('Sergio Hudson', 'CartÃ³n Network', 6, '2014-06-14 00:00:00'),
	('Sergio Hudson', 'CartÃ³n Network', 9, '2014-06-15 00:00:00'),
	('Stefano Bertoni', 'Cartoni', 3, '2014-06-13 00:00:00'),
	('Stefano Bertoni', 'Cartoni', 6, '2014-06-14 00:00:00'),
	('Stefano Bertoni', 'Cartoni', 7, '2014-06-15 00:00:00'),
	('Tamara Moya', 'TitÃ¡n', 6, '2014-06-13 00:00:00'),
	('Tamara Moya', 'TitÃ¡n', 13, '2014-06-14 00:00:00'),
	('Tamara Moya', 'TitÃ¡n', 16, '2014-06-15 00:00:00'),
	('Victor Fuentes', 'cartÃ³n 1', 1, '2014-06-13 00:00:00'),
	('Victor Fuentes', 'cartÃ³n 1', 5, '2014-06-14 00:00:00'),
	('Victor Fuentes', 'cartÃ³n 1', 9, '2014-06-15 00:00:00'),
	('Victor Nivia', 'Carton_Victor', 6, '2014-06-13 00:00:00'),
	('Victor Nivia', 'Carton_Victor', 9, '2014-06-14 00:00:00'),
	('Victor Nivia', 'Carton_Victor', 10, '2014-06-15 00:00:00');
/*!40000 ALTER TABLE `ranking_fechas_vistas` ENABLE KEYS */;


-- Volcando estructura para tabla brasil2014.results
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
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_avance_equipos` (
	`Equipo` VARCHAR(28) NULL COLLATE 'utf8_general_ci',
	`id_equipo` BIGINT(20) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_avance_rondas
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
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_equipos_post_grupos` (
	`Equipo` VARCHAR(28) NULL COLLATE 'utf8_general_ci',
	`id_equipo` INT(11) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_fixture
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
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_octavos_de_final_dos` (
	`Grupo` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`id_equipo` INT(11) NOT NULL,
	`Equipo` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Code` VARCHAR(2) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_octavos_de_final_results
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
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_octavos_de_final_uno` (
	`Grupo` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`Equipo` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Nombre` VARCHAR(28) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_partidos_jugados
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_partidos_jugados` (
	`Partidos Jugados` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_partidos_jugados_grupos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_partidos_jugados_grupos` (
	`Grupo` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`MaxJ` DECIMAL(45,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_partidos_por_ronda
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_partidos_por_ronda` (
	`id_ronda` INT(11) NOT NULL,
	`Ronda` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Partidos` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_partidos_por_ronda_acum
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_partidos_por_ronda_acum` (
	`id_ronda` INT(11) NOT NULL,
	`Ronda` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Partidos` BIGINT(21) NOT NULL,
	`Total_Partidos` DECIMAL(42,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_puntos_carton
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
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_ranking` (
	`pagado` INT(11) NOT NULL,
	`id_carton` INT(11) NOT NULL,
	`Nombre` VARCHAR(101) NOT NULL COLLATE 'utf8_general_ci',
	`Carton` VARCHAR(20) NOT NULL COLLATE 'utf8_general_ci',
	`Puntos` DECIMAL(46,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_results
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
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_results_post_grupos` (
	`Equipo` VARCHAR(21) NOT NULL COLLATE 'utf8_general_ci',
	`id_equipo_new` INT(11) NULL,
	`id_equipo` BIGINT(11) NULL,
	`Pais` VARCHAR(50) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_seleccionados
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
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_selec_clubs` (
	`id_equipo` INT(11) NOT NULL,
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Club` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Numero de Jugadores` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_selec_pais
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_selec_pais` (
	`id_equipo` INT(11) NOT NULL,
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`pais_club` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Jugadores` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_selec_perc_pais
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_selec_perc_pais` (
	`id_equipo` INT(11) NOT NULL,
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`pais_club` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Jugadores` BIGINT(21) NOT NULL,
	`Porcentaje` DECIMAL(27,4) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_selec_perc_pais_top
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_selec_perc_pais_top` (
	`id_equipo` INT(11) NOT NULL,
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`pais_club` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Jugadores` BIGINT(21) NOT NULL,
	`Porcentaje` DECIMAL(27,4) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_selec_posic_pais
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_selec_posic_pais` (
	`id_equipo` INT(11) NOT NULL,
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Posicion` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`pais_club` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Numero de Jugadores` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_selec_total
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vw_selec_total` (
	`id_equipo` INT(11) NOT NULL,
	`Pais` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Jugadores` BIGINT(21) NOT NULL,
	`Reservas` DECIMAL(32,0) NULL
) ENGINE=MyISAM;


-- Volcando estructura para vista brasil2014.vw_avance_equipos
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_avance_equipos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_avance_equipos` AS SELECT epg.*
FROM vw_equipos_post_grupos epg
UNION ALL 
SELECT rpg.Equipo, rpg.id_equipo
FROM vw_results_post_grupos rpg ;


-- Volcando estructura para vista brasil2014.vw_avance_rondas
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
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_octavos_de_final_dos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_octavos_de_final_dos` AS SELECT g.grupo AS Grupo, e.Pais AS Pais, f.id_equipo AS id_equipo, f.Pais AS Equipo,f.Code AS Code
FROM vw_octavos_de_final_uno v
JOIN grupos g ON g.grupo = v.Grupo
JOIN equipos e ON e.Pais = v.Nombre
JOIN equipos f ON f.Pais = v.Equipo ;


-- Volcando estructura para vista brasil2014.vw_octavos_de_final_results
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
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_partidos_jugados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_partidos_jugados` AS SELECT COUNT(*) as `Partidos Jugados`
FROM results
WHERE goles_local IS NOT NULL AND goles_visita IS NOT NULL ;


-- Volcando estructura para vista brasil2014.vw_partidos_jugados_grupos
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_partidos_jugados_grupos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_partidos_jugados_grupos` AS SELECT Grupo, max(Jugados) as MaxJ
FROM vw_results_by_group
GROUP BY Grupo ;


-- Volcando estructura para vista brasil2014.vw_partidos_por_ronda
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
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_partidos_por_ronda_acum`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_partidos_por_ronda_acum` AS select `x`.`id_ronda` AS `id_ronda`,`x`.`Ronda` AS `Ronda`,`x`.`Partidos` AS `Partidos`,sum(`y`.`Partidos`) AS `Total_Partidos` from (`vw_partidos_por_ronda` `x` join `vw_partidos_por_ronda` `y`) where (`x`.`id_ronda` >= `y`.`id_ronda`) group by `x`.`id_ronda`,`x`.`Ronda` ;


-- Volcando estructura para vista brasil2014.vw_puntos_carton
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
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_ranking`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_ranking` AS SELECT cr.pagado, c.id_carton, CONCAT(c.Nombre,' ',c.Apellido) AS Nombre,c.Carton AS Carton,(((((SUM(c.pts_Marcador) + SUM(c.pts_Diferencia)) + SUM(c.pts_Resultado)) + SUM(c.pts_PT)) + SUM(c.pts_Minuto_PG)) + SUM(c.pts_Jugador_PG)) AS Puntos
FROM vw_puntos_carton c
JOIN cartones cr ON cr.id_carton = c.id_carton
GROUP BY c.id_user,c.Carton
ORDER BY (((((SUM(c.pts_Marcador) + SUM(c.pts_Diferencia)) + SUM(c.pts_Resultado)) + SUM(c.pts_PT)) + SUM(c.pts_Minuto_PG)) + SUM(c.pts_Jugador_PG)) DESC, CONCAT(c.Nombre,' ',c.Apellido),c.Carton ;


-- Volcando estructura para vista brasil2014.vw_results
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
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_results_by_group`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_results_by_group` AS select `v`.`Grupo` AS `Grupo`,`v`.`ID` AS `ID`,`v`.`Equipo` AS `Equipo`,`v`.`Codigo` AS `Codigo`,sum(`v`.`Jugados`) AS `Jugados`,sum(`v`.`Victorias`) AS `Victorias`,sum(`v`.`Empates`) AS `Empates`,sum(`v`.`Derrotas`) AS `Derrotas`,sum(`v`.`gFavor`) AS `Goles a Favor`,sum(`v`.`gContra`) AS `Goles en Contra`,(sum(`v`.`gFavor`) - sum(`v`.`gContra`)) AS `Diferencia de Goles`,((3 * sum(`v`.`Victorias`)) + (1 * sum(`v`.`Empates`))) AS `Puntos` from `vw_results_by_group_tmp` `v` group by `v`.`Grupo`,`v`.`Equipo` order by `v`.`Grupo`,((3 * sum(`v`.`Victorias`)) + (1 * sum(`v`.`Empates`))) desc,(sum(`v`.`gFavor`) - sum(`v`.`gContra`)) desc,sum(`v`.`gFavor`) desc,`v`.`ID` ;


-- Volcando estructura para vista brasil2014.vw_results_by_group_tmp
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
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_seleccionados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_seleccionados` AS select `e`.`id_equipo` AS `id_equipo`,`e`.`Code` AS `Code`,`e`.`Pais` AS `Pais`,`p`.`posicion` AS `Posicion`,`j`.`id_jugador` AS `id_jugador`,`j`.`Nombre` AS `Nombre`,`j`.`club` AS `Club`,`j`.`pais_club` AS `Pais del Club` from ((`jugadores` `j` join `equipos` `e` on((`e`.`id_equipo` = `j`.`id_equipo`))) join `posiciones` `p` on((`p`.`id_posicion` = `j`.`id_posicion`))) where ((`j`.`va_a_brasil` = 1) and (`j`.`reserva` = 0)) order by `e`.`id_equipo`,`p`.`id_posicion` ;


-- Volcando estructura para vista brasil2014.vw_selec_clubs
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_selec_clubs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_selec_clubs` AS select `e`.`id_equipo` AS `id_equipo`,`e`.`Pais` AS `Pais`,`j`.`club` AS `Club`,count(0) AS `Numero de Jugadores` from (`jugadores` `j` join `equipos` `e` on((`j`.`id_equipo` = `e`.`id_equipo`))) group by `e`.`Pais`,`j`.`club` order by `e`.`id_equipo`,`e`.`Pais`,count(0) desc,`j`.`club` ;


-- Volcando estructura para vista brasil2014.vw_selec_pais
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_selec_pais`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_selec_pais` AS select `e`.`id_equipo` AS `id_equipo`,`e`.`Pais` AS `Pais`,`j`.`pais_club` AS `pais_club`,count(0) AS `Jugadores` from (`jugadores` `j` join `equipos` `e` on((`j`.`id_equipo` = `e`.`id_equipo`))) where (`j`.`va_a_brasil` = 1) group by `e`.`Pais`,`j`.`pais_club` order by `e`.`id_equipo`,count(0) desc,`j`.`pais_club` ;


-- Volcando estructura para vista brasil2014.vw_selec_perc_pais
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_selec_perc_pais`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_selec_perc_pais` AS select `p`.`id_equipo` AS `id_equipo`,`p`.`Pais` AS `Pais`,`p`.`pais_club` AS `pais_club`,`p`.`Jugadores` AS `Jugadores`,((`p`.`Jugadores` / `t`.`Jugadores`) * 100) AS `Porcentaje` from (`vw_selec_total` `t` join `vw_selec_pais` `p` on(((`t`.`id_equipo` = `p`.`id_equipo`) and (`t`.`Pais` = `p`.`Pais`)))) ;


-- Volcando estructura para vista brasil2014.vw_selec_perc_pais_top
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_selec_perc_pais_top`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_selec_perc_pais_top` AS select `p`.`id_equipo` AS `id_equipo`,`p`.`Pais` AS `Pais`,`p`.`pais_club` AS `pais_club`,`p`.`Jugadores` AS `Jugadores`,`p`.`Porcentaje` AS `Porcentaje` from `vw_selec_perc_pais` `p` where ((select count(0) from `vw_selec_perc_pais` `f` where ((`f`.`id_equipo` = `p`.`id_equipo`) and (`f`.`Porcentaje` >= `p`.`Porcentaje`))) <= 3) order by 1,5 desc ;


-- Volcando estructura para vista brasil2014.vw_selec_posic_pais
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_selec_posic_pais`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_selec_posic_pais` AS select `e`.`id_equipo` AS `id_equipo`,`e`.`Pais` AS `Pais`,`p`.`posicion` AS `Posicion`,`j`.`pais_club` AS `pais_club`,count(0) AS `Numero de Jugadores` from ((`jugadores` `j` join `equipos` `e` on((`j`.`id_equipo` = `e`.`id_equipo`))) join `posiciones` `p` on((`p`.`id_posicion` = `j`.`id_posicion`))) where (`j`.`va_a_brasil` = 1) group by `e`.`Pais`,`p`.`posicion`,`j`.`pais_club` order by `e`.`id_equipo`,`e`.`Pais`,`p`.`posicion`,count(0) desc,`j`.`pais_club` ;


-- Volcando estructura para vista brasil2014.vw_selec_total
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vw_selec_total`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vw_selec_total` AS select `e`.`id_equipo` AS `id_equipo`,`e`.`Pais` AS `Pais`,count(0) AS `Jugadores`,sum(`j`.`reserva`) AS `Reservas` from (`jugadores` `j` join `equipos` `e` on((`j`.`id_equipo` = `e`.`id_equipo`))) where (`j`.`va_a_brasil` = 1) group by `e`.`Pais` order by `e`.`id_equipo`,count(0) desc ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2020 a las 23:41:17
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `zombie`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `status`) VALUES
(1, 'infeccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zombies`
--

CREATE TABLE `zombies` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_n` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `zombies`
--

INSERT INTO `zombies` (`id`, `nombre`, `date_n`, `status`) VALUES
(1, 'Raziel', '2020-10-28 18:07:30', 'infeccion'),
(7, 'Nuevo', '2020-10-28 20:29:03', 'Infeccion'),
(9, 'Raziel', '2020-10-28 20:39:49', 'violencia'),
(10, 'Nuevo', '2020-10-28 21:39:10', 'violencia'),
(11, 'Nuevo', '2020-10-28 21:39:25', 'desmayo'),
(12, 'Raziel', '2020-10-28 22:34:29', 'violencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zombie_status`
--

CREATE TABLE `zombie_status` (
  `id` int(11) NOT NULL,
  `id_zombie` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `fecharegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `zombies`
--
ALTER TABLE `zombies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `zombie_status`
--
ALTER TABLE `zombie_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_zombie_id_estado` (`id_estado`),
  ADD KEY `FK_zombie_id_zombie` (`id_zombie`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `zombies`
--
ALTER TABLE `zombies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `zombie_status`
--
ALTER TABLE `zombie_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `zombie_status`
--
ALTER TABLE `zombie_status`
  ADD CONSTRAINT `FK_zombie_id_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_zombie_id_zombie` FOREIGN KEY (`id_zombie`) REFERENCES `zombies` (`id`) ON DELETE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

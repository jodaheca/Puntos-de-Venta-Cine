-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2014 a las 04:43:58
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `puntosdeventa`
--
CREATE DATABASE IF NOT EXISTS `puntosdeventa` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `puntosdeventa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pdv_boleta`
--

CREATE TABLE IF NOT EXISTS `pdv_boleta` (
  `codigo_boleta` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_boleta` int(11) NOT NULL,
  `codigo_venta` int(11) NOT NULL,
  PRIMARY KEY (`codigo_boleta`),
  KEY `tipo_boleta` (`tipo_boleta`),
  KEY `codigo_venta` (`codigo_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pdv_combo`
--

CREATE TABLE IF NOT EXISTS `pdv_combo` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `precio_tarjeta` double NOT NULL,
  `precio_sin_tarjeta` double NOT NULL,
  `precio_puntos` int(11) NOT NULL,
  `puntos_generados` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pdv_empleado`
--

CREATE TABLE IF NOT EXISTS `pdv_empleado` (
  `identificacion` int(11) NOT NULL,
  `nombres` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  PRIMARY KEY (`identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pdv_empleado`
--

INSERT INTO `pdv_empleado` (`identificacion`, `nombres`, `apellidos`, `telefono`, `tipo_usuario`) VALUES
(471, 'Pablo ', 'Diaz', '4587965', 2),
(12345, 'Joaquin ', 'Hernandez', '3012186769', 1),
(145587, 'Carlos', 'Agudelo', '8368797', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pdv_login`
--

CREATE TABLE IF NOT EXISTS `pdv_login` (
  `propietario` int(11) NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasena` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `permisos` int(11) NOT NULL,
  KEY `propietario` (`propietario`),
  KEY `propietario_2` (`propietario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pdv_login`
--

INSERT INTO `pdv_login` (`propietario`, `usuario`, `contrasena`, `permisos`) VALUES
(12345, 'jodaheca', 'jodaheca', 1),
(145587, 'kike', 'kike', 2),
(471, 'pablo', 'pablo', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pdv_socio`
--

CREATE TABLE IF NOT EXISTS `pdv_socio` (
  `identificacion` int(11) NOT NULL,
  `nombres` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `puntosAcumulados` int(11) NOT NULL,
  PRIMARY KEY (`identificacion`),
  KEY `nombres` (`nombres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pdv_tarjeta`
--

CREATE TABLE IF NOT EXISTS `pdv_tarjeta` (
  `identificacion` int(11) NOT NULL,
  `codigo_tarjeta` int(11) NOT NULL,
  `fecha_expedicion` date NOT NULL,
  KEY `identificacion` (`identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pdv_tipo_boleta`
--

CREATE TABLE IF NOT EXISTS `pdv_tipo_boleta` (
  `codigo_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `costo_con_tarjeta` double NOT NULL,
  `costo_sin_tarjeta` double NOT NULL,
  `costo_con_puntos` int(11) NOT NULL,
  `puntos_generados` int(11) NOT NULL,
  PRIMARY KEY (`codigo_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pdv_venta`
--

CREATE TABLE IF NOT EXISTS `pdv_venta` (
  `codigo_venta` int(11) NOT NULL AUTO_INCREMENT,
  `total_venta` double NOT NULL,
  `puntos_totales` int(11) NOT NULL,
  `id_comprador` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  PRIMARY KEY (`codigo_venta`),
  KEY `id_comprados` (`id_comprador`,`id_vendedor`),
  KEY `id_comprador` (`id_comprador`),
  KEY `id_vendedor` (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pdv_venta_combo`
--

CREATE TABLE IF NOT EXISTS `pdv_venta_combo` (
  `codigo_venta` int(11) NOT NULL,
  `codigo_combo` int(11) NOT NULL,
  `numero_combos` int(11) NOT NULL,
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codigo`),
  KEY `codigo_venta` (`codigo_venta`,`codigo_combo`),
  KEY `codigo_combo` (`codigo_combo`),
  KEY `codigo_venta_2` (`codigo_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pdv_boleta`
--
ALTER TABLE `pdv_boleta`
  ADD CONSTRAINT `pdv_boleta_ibfk_1` FOREIGN KEY (`tipo_boleta`) REFERENCES `pdv_tipo_boleta` (`codigo_tipo`),
  ADD CONSTRAINT `pdv_boleta_ibfk_2` FOREIGN KEY (`codigo_venta`) REFERENCES `pdv_venta` (`codigo_venta`);

--
-- Filtros para la tabla `pdv_login`
--
ALTER TABLE `pdv_login`
  ADD CONSTRAINT `pdv_login_ibfk_1` FOREIGN KEY (`propietario`) REFERENCES `pdv_empleado` (`identificacion`);

--
-- Filtros para la tabla `pdv_tarjeta`
--
ALTER TABLE `pdv_tarjeta`
  ADD CONSTRAINT `pdv_tarjeta_ibfk_1` FOREIGN KEY (`identificacion`) REFERENCES `pdv_socio` (`identificacion`);

--
-- Filtros para la tabla `pdv_venta`
--
ALTER TABLE `pdv_venta`
  ADD CONSTRAINT `pdv_venta_ibfk_1` FOREIGN KEY (`id_comprador`) REFERENCES `pdv_socio` (`identificacion`),
  ADD CONSTRAINT `pdv_venta_ibfk_2` FOREIGN KEY (`id_vendedor`) REFERENCES `pdv_empleado` (`identificacion`);

--
-- Filtros para la tabla `pdv_venta_combo`
--
ALTER TABLE `pdv_venta_combo`
  ADD CONSTRAINT `pdv_venta_combo_ibfk_1` FOREIGN KEY (`codigo_venta`) REFERENCES `pdv_venta` (`codigo_venta`),
  ADD CONSTRAINT `pdv_venta_combo_ibfk_2` FOREIGN KEY (`codigo_combo`) REFERENCES `pdv_combo` (`codigo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

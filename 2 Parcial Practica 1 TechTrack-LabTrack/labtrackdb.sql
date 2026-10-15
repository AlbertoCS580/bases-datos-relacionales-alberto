-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2026 a las 21:23:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `labtrackdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_prestatario`
--

CREATE TABLE `alumno_prestatario` (
  `id_alumno` int(11) NOT NULL,
  `matricula` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `carrera` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alumno_prestatario`
--

INSERT INTO `alumno_prestatario` (`id_alumno`, `matricula`, `nombre`, `carrera`) VALUES
(1, 'S20230101', 'Alejandro Pérez', 'Ingeniería en Sistemas'),
(2, 'S20230102', 'Brenda Gómez', 'Ingeniería Industrial'),
(3, 'S20230103', 'Carlos Ramírez', 'Ingeniería en Sistemas'),
(4, 'S20230104', 'Diana Mendoza', 'Administración');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_lab`
--

CREATE TABLE `equipo_lab` (
  `id_equipo` int(11) NOT NULL,
  `num_inventario` varchar(50) NOT NULL,
  `tipo` enum('PC','Laptop','Monitor','Proyector','Switch') NOT NULL DEFAULT 'PC',
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(80) NOT NULL,
  `estado` enum('Disponible','Prestado','En Mantenimiento','Baja') DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `equipo_lab`
--

INSERT INTO `equipo_lab` (`id_equipo`, `num_inventario`, `tipo`, `marca`, `modelo`, `estado`) VALUES
(1, 'INV-PC-01', 'PC', 'Dell', 'OptiPlex 7090', 'Prestado'),
(2, 'INV-LAP-02', 'Laptop', 'Lenovo', 'ThinkPad E14', 'Disponible'),
(3, 'INV-PROY-03', 'Proyector', 'Epson', 'PowerLite E20', 'En Mantenimiento'),
(4, 'INV-SW-04', 'Switch', 'Cisco', 'Catalyst 2960', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `id_mantenimiento` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text NOT NULL,
  `costo` decimal(10,2) DEFAULT 0.00,
  `id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mantenimiento`
--

INSERT INTO `mantenimiento` (`id_mantenimiento`, `fecha`, `descripcion`, `costo`, `id_equipo`) VALUES
(1, '2026-02-15', 'Limpieza interna y cambio de pasta térmica', 150.00, 1),
(2, '2026-02-20', 'Reparación de lámpara de proyector', 1200.00, 3),
(3, '2026-02-25', 'Actualización de firmware de switch', 0.00, 4),
(4, '2026-03-01', 'Formateo y reinstalación de sistema operativo', 0.00, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id_prestamo` int(11) NOT NULL,
  `fecha_prestamo` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_devolucion` datetime DEFAULT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `fecha_prestamo`, `fecha_devolucion`, `id_equipo`, `id_alumno`) VALUES
(1, '2026-03-01 09:00:00', '2026-03-01 13:00:00', 1, 1),
(2, '2026-03-02 10:30:00', NULL, 1, 2),
(3, '2026-03-03 11:00:00', '2026-03-03 14:00:00', 3, 3),
(4, '2026-03-04 08:00:00', NULL, 2, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno_prestatario`
--
ALTER TABLE `alumno_prestatario`
  ADD PRIMARY KEY (`id_alumno`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- Indices de la tabla `equipo_lab`
--
ALTER TABLE `equipo_lab`
  ADD PRIMARY KEY (`id_equipo`),
  ADD UNIQUE KEY `num_inventario` (`num_inventario`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`id_mantenimiento`),
  ADD KEY `fk_manto_equipo` (`id_equipo`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `fk_prestamo_equipo` (`id_equipo`),
  ADD KEY `fk_prestamo_alumno` (`id_alumno`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno_prestatario`
--
ALTER TABLE `alumno_prestatario`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `equipo_lab`
--
ALTER TABLE `equipo_lab`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD CONSTRAINT `fk_manto_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipo_lab` (`id_equipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `fk_prestamo_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno_prestatario` (`id_alumno`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prestamo_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipo_lab` (`id_equipo`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

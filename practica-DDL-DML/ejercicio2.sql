-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-10-2026 a las 17:01:35
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
-- Base de datos: `universidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion`
--

CREATE TABLE `asignacion` (
  `id_asignacion` bigint(20) UNSIGNED NOT NULL,
  `id_profesor` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `grupo` varchar(10) NOT NULL,
  `periodo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignacion`
--

INSERT INTO `asignacion` (`id_asignacion`, `id_profesor`, `id_materia`, `grupo`, `periodo`) VALUES
(1, 1, 1, 'G101', '2026-1'),
(2, 1, 6, 'G101', '2026-1'),
(3, 2, 2, 'G102', '2026-1'),
(4, 2, 3, 'G101', '2026-1'),
(5, 3, 4, 'CB101', '2026-1'),
(6, 3, 5, 'CB102', '2026-1'),
(7, 4, 1, 'G102', '2026-1'),
(8, 4, 2, 'G101', '2026-1'),
(9, 5, 3, 'G102', '2026-1'),
(10, 5, 6, 'G102', '2026-1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id_materia` bigint(20) UNSIGNED NOT NULL,
  `clave` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `horas_semana` smallint(6) DEFAULT NULL CHECK (`horas_semana` > 0 and `horas_semana` <= 20),
  `departamento` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id_materia`, `clave`, `nombre`, `horas_semana`, `departamento`) VALUES
(1, 'BD101', 'Bases de Datos Relacionales', 5, 'Sistemas'),
(2, 'POO201', 'Programación Orientada a Objetos', 6, 'Sistemas'),
(3, 'RED301', 'Redes de Computadoras', 4, 'Sistemas'),
(4, 'CAL101', 'Cálculo Diferencial', 5, 'Ciencias Básicas'),
(5, 'ALGL102', 'Álgebra Lineal', 4, 'Ciencias Básicas'),
(6, 'ED0202', 'Estructura de Datos', 5, 'Sistemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` bigint(20) UNSIGNED NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `email` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `rfc`, `nombre`, `apellido`, `email`) VALUES
(1, 'GOMA800101HA1', 'Ana', 'Gómez', 'ana.gomez@upem.edu.mx'),
(2, 'LOMR750512HB2', 'Roberto', 'López', 'roberto.lopez@upem.edu.mx'),
(3, 'HERM880920HC3', 'María', 'Hernández', 'maria.hernandez@upem.edu.mx'),
(4, 'PERJ920315HD4', 'José', 'Pérez', 'jose.perez@upem.edu.mx'),
(5, 'RAMC851130HE5', 'Carlos', 'Ramírez', 'carlos.ramirez@upem.edu.mx');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`id_asignacion`),
  ADD UNIQUE KEY `uq_materia_grupo_periodo` (`id_materia`,`grupo`,`periodo`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id_materia`),
  ADD UNIQUE KEY `clave` (`clave`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD UNIQUE KEY `rfc` (`rfc`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `id_asignacion` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id_materia` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id_profesor` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

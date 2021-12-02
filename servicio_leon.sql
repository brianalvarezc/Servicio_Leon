-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2021 a las 10:54:09
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `servicio_leon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `cita_Id` int(10) NOT NULL,
  `cita_Cliente_Nombre` varchar(100) NOT NULL,
  `cita_Servicio_Id` int(10) NOT NULL,
  `cita_Fecha` varchar(100) NOT NULL,
  `cita_Hora` varchar(15) NOT NULL,
  `cita_Ubicacion` varchar(400) NOT NULL,
  `cita_Estado_Id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`cita_Id`, `cita_Cliente_Nombre`, `cita_Servicio_Id`, `cita_Fecha`, `cita_Hora`, `cita_Ubicacion`, `cita_Estado_Id`) VALUES
(14, 'Andres Toro', 11, '23/11/2023', '16:30', 'https://www.google.com/maps/@11.2307031,-74.2140439,3a,75y,163.56h,90t/data=!3m7!1e1!3m5!1si8SaTbQW83P0-3alYw9v8Q!2e0!6shttps://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=i8SaTbQW83P0-3alYw9v8Q&cb_client=search.revgeo_and_fetch.gps&w=96&h=64&yaw=163.5568&pitch=0&thumbfov=100!7i13312!8i6656?hl=es', 1),
(16, 'Brian Alvarez', 11, '23/11/2023', '16:30', 'https://www.google.com/maps/@11.2350557,-74.2059131,3a,75y,285.69h,90t/data=!3m7!1e1!3m5!1sP1R6FPRbbBexWB2HGz2fJA!2e0!6shttps:%2F%2Fstreetviewpixels-pa.googleapis.com%2Fv1%2Fthumbnail%3Fpanoid%3DP1R6FPRbbBexWB2HGz2fJA%26cb_client%3Dsearch.revgeo_and_fetch.gps%26w%3D96%26h%3D64%26yaw%3D285.68735%26pitch%3D0%26thumbfov%3D100!7i13312!8i6656?hl=es', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponible`
--

CREATE TABLE `disponible` (
  `disponible_Id` int(2) NOT NULL,
  `dispobible_Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `estado_Id` int(10) NOT NULL,
  `estado_Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`estado_Id`, `estado_Nombre`) VALUES
(1, 'Habilitado'),
(2, 'Deshabilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `producto_Id` int(10) NOT NULL,
  `producto_Nombre` varchar(100) NOT NULL,
  `producto_Precio` int(10) NOT NULL,
  `producto_Stock` int(6) NOT NULL,
  `producto_Estado_Id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `servicio_Id` int(10) NOT NULL,
  `servicio_Nombre` varchar(100) NOT NULL,
  `servicio_Precio` int(10) NOT NULL,
  `servicio_Estado_Id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`servicio_Id`, `servicio_Nombre`, `servicio_Precio`, `servicio_Estado_Id`) VALUES
(10, 'Mantenimiento de Portatiles Gamer', 95000, 1),
(11, 'Mantenimiento de Impresoras', 80000, 1),
(19, 'Mantenimiento de Computadores de mesa', 65000, 1),
(20, 'Mantenimiento de Computadores de mesa', 65000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario_Id` int(10) NOT NULL,
  `usuario_Nombre` varchar(100) NOT NULL,
  `usuario_Pass` varchar(10) NOT NULL,
  `usuario_Estado_Id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`cita_Id`),
  ADD KEY `cita_ibfk_3` (`cita_Estado_Id`),
  ADD KEY `cita_ibfk_4` (`cita_Servicio_Id`);

--
-- Indices de la tabla `disponible`
--
ALTER TABLE `disponible`
  ADD PRIMARY KEY (`disponible_Id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`estado_Id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`producto_Id`),
  ADD KEY `producto_Estado_Id` (`producto_Estado_Id`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`servicio_Id`),
  ADD KEY `servicio_ibfk_1` (`servicio_Estado_Id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_Id`),
  ADD KEY `usuario_Estado_Id` (`usuario_Estado_Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `cita_Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `disponible`
--
ALTER TABLE `disponible`
  MODIFY `disponible_Id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `estado_Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `producto_Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `servicio_Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`cita_Estado_Id`) REFERENCES `estados` (`estado_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cita_ibfk_4` FOREIGN KEY (`cita_Servicio_Id`) REFERENCES `servicio` (`servicio_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`producto_Estado_Id`) REFERENCES `estados` (`estado_Id`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`servicio_Estado_Id`) REFERENCES `estados` (`estado_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`usuario_Estado_Id`) REFERENCES `estados` (`estado_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

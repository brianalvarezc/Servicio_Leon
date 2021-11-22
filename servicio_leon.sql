-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2021 a las 13:11:29
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
  `cita_Fecha` varchar(100) NOT NULL,
  `cita_Hora` varchar(15) NOT NULL,
  `cita_Ubicacion` varchar(400) NOT NULL,
  `cita_Estado_Id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`cita_Id`, `cita_Cliente_Nombre`, `cita_Fecha`, `cita_Hora`, `cita_Ubicacion`, `cita_Estado_Id`) VALUES
(3, 'Brian Alvarez', '19/11/2021', '15:50', 'https://www.google.com/maps/place/Edificio+Beyreca+Calle15%23+3-36/@11.2443397,-74.2128433,19z/data=!3m1!4b1!4m5!3m4!1s0x8ef4f5a4c8487a55:0xde033284ae991bb7!8m2!3d11.2443486!4d-74.2122943?hl=es', 1),
(4, 'Kezia Mercado', '21/11/2021', '15:50', 'https://www.google.com/maps/place/Comuna+1,+Santa+Marta,+Magdalena/@11.2226874,-74.2232033,14z/data=!3m1!4b1!4m12!1m6!3m5!1s0x8ef4f5a4c8487a55:0xde033284ae991bb7!2sEdificio+Beyreca+Calle15%23+3-36!8m2!3d11.2443486!4d-74.2122943!3m4!1s0x8ef4f59ab6580d83:0x66899463359bdae7!8m2!3d11.2243734!4d-74.209128?hl=es', 1);

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
(1, 'Mantenimiento de Equipos PC', 55000, 1),
(2, 'Mantenimiento de impresoras', 80000, 1);

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
  ADD KEY `cita_Estado_Id` (`cita_Estado_Id`);

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
  ADD KEY `servicio_Estado_Id` (`servicio_Estado_Id`);

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
  MODIFY `cita_Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `servicio_Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`cita_Estado_Id`) REFERENCES `estados` (`estado_Id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`producto_Estado_Id`) REFERENCES `estados` (`estado_Id`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`servicio_Estado_Id`) REFERENCES `estados` (`estado_Id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`usuario_Estado_Id`) REFERENCES `estados` (`estado_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-10-2023 a las 18:59:02
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `características`
--

CREATE TABLE `características` (
  `id` int(11) NOT NULL,
  `caracteristica` varchar(30) NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `características`
--

INSERT INTO `características` (`id`, `caracteristica`, `activo`) VALUES
(1, 'Talla', 1),
(9, 'Color', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `estatus` tinyint(4) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  `fecha_baja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombres`, `apellidos`, `email`, `telefono`, `dni`, `estatus`, `fecha_alta`, `fecha_modifica`, `fecha_baja`) VALUES
(1, 'Andres', 'Casadiegos', 'andrescasadiegos89@gmail.com', '3138664917', '1004926948', 1, '2023-06-15 21:24:32', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_cliente` varchar(20) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `id_transaccion`, `fecha`, `status`, `email`, `id_cliente`, `total`) VALUES
(1, '56799100CY415370S', '2023-06-13 02:34:46', 'COMPLETED', 'sb-c76d926256484@personal.example.com', 'GRRWMMZPK2GD8', 4500.00),
(2, '2X358201542168048', '2023-06-13 02:41:57', 'COMPLETED', 'sb-c76d926256484@personal.example.com', 'GRRWMMZPK2GD8', 11000.00),
(3, '96R61208U5144325K', '2023-06-13 06:49:30', 'COMPLETED', 'sb-c76d926256484@personal.example.com', 'GRRWMMZPK2GD8', 6500.00),
(4, '5LD93029FB2090318', '2023-06-13 06:57:43', 'COMPLETED', 'sb-c76d926256484@personal.example.com', 'GRRWMMZPK2GD8', 6500.00),
(5, '19A03826826668928', '2023-06-13 06:59:29', 'COMPLETED', 'sb-c76d926256484@personal.example.com', 'GRRWMMZPK2GD8', 6500.00),
(6, '6BM914006F8054125', '2023-06-13 07:01:23', 'COMPLETED', 'sb-c76d926256484@personal.example.com', 'GRRWMMZPK2GD8', 6500.00),
(7, '2H529937JS8269031', '2023-06-13 07:02:03', 'COMPLETED', 'sb-c76d926256484@personal.example.com', 'GRRWMMZPK2GD8', 6500.00),
(8, '8S8237845H2745407', '2023-06-13 07:02:49', 'COMPLETED', 'sb-c76d926256484@personal.example.com', 'GRRWMMZPK2GD8', 6500.00),
(9, '7L367099E6600300Y', '2023-06-13 07:05:33', 'COMPLETED', 'sb-c76d926256484@personal.example.com', 'GRRWMMZPK2GD8', 6500.00),
(10, '8BX69224TM102133T', '2023-06-13 07:07:35', 'COMPLETED', 'sb-c76d926256484@personal.example.com', 'GRRWMMZPK2GD8', 6500.00),
(11, '5Y7161191P141525W', '2023-06-13 07:10:25', 'COMPLETED', 'sb-c76d926256484@personal.example.com', 'GRRWMMZPK2GD8', 6500.00),
(12, '3A277714KG719393C', '2023-06-13 21:36:19', 'COMPLETED', 'sb-c76d926256484@personal.example.com', 'GRRWMMZPK2GD8', 13000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id`, `id_compra`, `id_producto`, `nombre`, `precio`, `cantidad`) VALUES
(1, 2, 1, 'IPHONE 14', 4500.00, 1),
(2, 2, 2, 'SAMSUNG S23', 6500.00, 1),
(3, 3, 2, 'SAMSUNG S23', 6500.00, 1),
(4, 4, 2, 'SAMSUNG S23', 6500.00, 1),
(5, 5, 2, 'SAMSUNG S23', 6500.00, 1),
(6, 6, 2, 'SAMSUNG S23', 6500.00, 1),
(7, 7, 2, 'SAMSUNG S23', 6500.00, 1),
(8, 8, 2, 'SAMSUNG S23', 6500.00, 1),
(9, 9, 2, 'SAMSUNG S23', 6500.00, 1),
(10, 10, 2, 'SAMSUNG S23', 6500.00, 1),
(11, 11, 2, 'SAMSUNG S23', 6500.00, 1),
(12, 12, 2, 'SAMSUNG S23', 6500.00, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_prod_caracter`
--

CREATE TABLE `det_prod_caracter` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_caracteristica` int(11) NOT NULL,
  `valor` varchar(30) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `det_prod_caracter`
--

INSERT INTO `det_prod_caracter` (`id`, `id_producto`, `id_caracteristica`, `valor`, `stock`) VALUES
(11, 4, 1, 'S', 50),
(12, 4, 1, 'L', 50),
(13, 4, 1, 'M', 50),
(14, 4, 1, 'XS', 50),
(15, 4, 1, 'XL', 50),
(16, 4, 1, 'XXS', 50),
(17, 5, 1, 'S', 50),
(18, 5, 1, 'L', 50),
(19, 5, 1, 'M', 50),
(20, 5, 1, 'XS', 50),
(21, 5, 1, 'XL', 50),
(22, 5, 1, 'XXS', 50),
(23, 6, 1, 'S', 50),
(24, 6, 1, 'L', 50),
(25, 6, 1, 'M', 50),
(26, 6, 1, 'XS', 50),
(27, 6, 1, 'XL', 50),
(28, 6, 1, 'XXS', 50),
(47, 12, 1, 'S', 50),
(48, 12, 1, 'L', 50),
(49, 12, 1, 'M', 50),
(50, 12, 1, 'XS', 50),
(51, 12, 1, 'XL', 50),
(52, 12, 1, 'XXS', 50),
(53, 15, 1, 'S', 50),
(54, 15, 1, 'L', 50),
(55, 15, 1, 'M', 50),
(56, 15, 1, 'XS', 50),
(57, 15, 1, 'XL', 50),
(58, 15, 1, 'XXS', 50),
(59, 16, 1, 'S', 50),
(60, 16, 1, 'L', 50),
(61, 16, 1, 'M', 50),
(62, 16, 1, 'XS', 50),
(63, 16, 1, 'XL', 50),
(64, 16, 1, 'XXS', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descuento` tinyint(3) NOT NULL DEFAULT 0,
  `id_catetgoria` int(11) NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `descuento`, `id_catetgoria`, `activo`) VALUES
(4, 'Camiseta deportiva gris con amarillo', '<b>Producto</b><br><br>\r\nCamiseta deportiva gris con amarillo para hombre, elaborada en tela de algodón, cuenta con mangas cortas, un diseño tipo cincelada de pintura. ', 50000.00, 0, 1, 1),
(5, 'Camiseta deportiva azul', '<b>Producto</b><br><br>\r\nCamiseta deportiva blanca para hombre, elaborada en tela de algodón, cuenta con mangas cortas, un diseño con forma de triángulos.', 50000.00, 0, 1, 1),
(6, 'Camiseta deportiva rojo con azul', '<b>Producto</b><br><br>\r\nCamiseta deportiva rojo con azul para hombre, elaborada en tela de algodón, cuenta con mangas cortas, un diseño en forma de v mas líneas rojas.', 50000.00, 0, 1, 1),
(12, 'Camiseta deportiva edición Portugal', '<b>Producto</b><br><br>\r\nCamiseta deportiva de Portugal para hombre, elaborada en tela de algodón, cuenta con mangas cortas y viene con la equipacion de la selección de Portugal.', 50000.00, 0, 1, 1),
(15, 'Camiseta deportiva verde con gris', '<b>Producto</b><br><br>\r\nCamiseta deportiva verde con gris para hombre, elaborada en tela de algodón, cuenta con mangas cortas, un diseño muy minimalista.', 50000.00, 0, 1, 1),
(16, 'Camiseta deportiva azul con rojo', '<b>Producto</b><br><br>\r\nCamiseta deportiva azul con rojo para hombre, elaborada en tela de algodón, cuenta con mangas cortas, un diseño muy bonito.', 50000.00, 20, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(120) NOT NULL,
  `activacion` int(11) NOT NULL DEFAULT 1,
  `token` varchar(40) NOT NULL DEFAULT '0',
  `token_password` varchar(40) DEFAULT NULL,
  `password_request` int(11) NOT NULL DEFAULT 0,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`, `activacion`, `token`, `token_password`, `password_request`, `id_cliente`) VALUES
(1, 'Andres', '$2y$10$yUIBaJyLpIFVVqY4BvLMB.QSciF5c2GDCfKMNnV26zducuwM.cbBe', 1, '1da00042054b94aa7051b7c8646012b2', NULL, 0, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `características`
--
ALTER TABLE `características`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `det_prod_caracter`
--
ALTER TABLE `det_prod_caracter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_det_prod` (`id_producto`),
  ADD KEY `fk_det_caracter` (`id_caracteristica`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `características`
--
ALTER TABLE `características`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `det_prod_caracter`
--
ALTER TABLE `det_prod_caracter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `det_prod_caracter`
--
ALTER TABLE `det_prod_caracter`
  ADD CONSTRAINT `fk_det_caracter` FOREIGN KEY (`id_caracteristica`) REFERENCES `características` (`id`),
  ADD CONSTRAINT `fk_det_prod` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

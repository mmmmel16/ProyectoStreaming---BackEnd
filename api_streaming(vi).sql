-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2023 a las 06:56:41
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
-- Base de datos: `api_streaming`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventodeporte`
--

CREATE TABLE `eventodeporte` (
  `id_evento` int(11) NOT NULL,
  `nombre_evento` varchar(255) NOT NULL,
  `tipo_deporte` varchar(255) NOT NULL,
  `fecha_evento` date NOT NULL,
  `lugar_evento` varchar(255) NOT NULL,
  `img_evento` varchar(255) NOT NULL,
  `patrocinador_principal` varchar(255) NOT NULL,
  `horario_evento` time NOT NULL,
  `url_transmision` varchar(400) NOT NULL COMMENT 'https://www.youtube.com/watch?v=2IfTdw28WFY'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventodeporte`
--

INSERT INTO `eventodeporte` (`id_evento`, `nombre_evento`, `tipo_deporte`, `fecha_evento`, `lugar_evento`, `img_evento`, `patrocinador_principal`, `horario_evento`, `url_transmision`) VALUES
(8, 'Pico Fc vs Ferro', 'Nuevo Tipo de Deporte', '2023-05-05', 'Estadio Barrio Talleres', 'https://plataforma.iduo.com.ar/Panelcontenidos/Contenidos/t800-1611500538.jpeg', 'Patrocinador2', '09:00:00', 'tyVQk-BAWms'),
(9, 'Evento3', 'Deporte3', '2023-06-10', 'Lugar3', 'https://library.sportingnews.com/styles/crop_style_16_9_desktop/s3/2023-08/Voley%202023.jpg?h=920929c4&itok=geddfDuw', 'Patrocinador3', '10:00:00', 'DsJe0JPzapY'),
(10, 'Evento4', 'Basquet', '2023-11-22', 'Pico futbol', 'https://cnnespanol.cnn.com/wp-content/uploads/2023/10/GettyImages-1747141678-e1697838528134.jpg?quality=100&strip=info&w=940&h=530&crop=1', '', '00:00:00', 'jxPDgYFEwmU'),
(11, 'Evento5', 'safsdfsdfsd', '2023-11-15', 'sfdfsdf', 'https://www.elgrafico.com.ar/media/cache/pub_news_details_large/media/i/7b/3c/7b3c07e6c3716df97670f11e3ca2d958674e99e7.jpeg', 'dfdgd', '00:00:00', 'jxPDgYFEwmU'),
(12, 'Evento5', 'safsdfsdfsd', '2023-11-29', 'sfdfsdf', 'https://www.elgrafico.com.ar/media/cache/pub_news_details_large/media/i/7b/3c/7b3c07e6c3716df97670f11e3ca2d958674e99e7.jpeg', 'dfdgd', '00:00:00', 'jxPDgYFEwmU'),
(13, 'afsdfsd', 'fsdfdfds', '2023-11-30', 'sfdfsdfsd', 'https://a.espncdn.com/combiner/i?img=/photo/2023/1117/r1254173_1296x729_16-9.jpg', '', '00:00:00', 'jxPDgYFEwmU'),
(14, 'dfdsfdsf', 'asdasdad', '2023-11-28', 'dasdad', 'https://a.espncdn.com/combiner/i?img=/photo/2023/1117/r1254173_1296x729_16-9.jpg', '', '00:36:22', 'jxPDgYFEwmU'),
(15, 'FDGfdgdfg', 'dfgdfgfgd', '2023-11-26', 'dfsdfsdf', 'https://s10.s3c.es/imag/_v0/770x420/3/0/0/600x400_770x420-hombre-jugando-campo-de-golf.jpg', 'sfsdfd', '00:00:00', 'jxPDgYFEwmU'),
(16, 'FDGfdgdfg', 'dfgdfgfgd', '2023-11-26', 'dfsdfsdf', 'https://s10.s3c.es/imag/_v0/770x420/3/0/0/600x400_770x420-hombre-jugando-campo-de-golf.jpg', 'sfsdfd', '00:00:00', 'jxPDgYFEwmU'),
(17, 'sfsdfsdf', 'dfsfsdfdsf', '2023-11-25', 'asdasdas', 'https://depor.com/resizer/xp0-X8VSt0I0PPOqa6OcNKZGmVg=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/J5SDKRT65NFX3BJEOH3RON6YFQ.jpg', '', '00:00:00', 'jxPDgYFEwmU'),
(18, 'Torneo vs', 'Torneo', '2023-11-23', 'club Ferro', 'https://depor.com/resizer/xp0-X8VSt0I0PPOqa6OcNKZGmVg=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/J5SDKRT65NFX3BJEOH3RON6YFQ.jpg', '', '00:00:19', 'LuBXDin8k7s');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `eventodeporte`
--
ALTER TABLE `eventodeporte`
  ADD PRIMARY KEY (`id_evento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eventodeporte`
--
ALTER TABLE `eventodeporte`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

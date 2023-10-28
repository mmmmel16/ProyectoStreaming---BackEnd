-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2023 a las 00:45:36
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

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
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_admin` int(11) NOT NULL,
  `nombre_admin` varchar(255) NOT NULL,
  `email_admin` varchar(255) NOT NULL,
  `nivelAcc_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_admin`, `nombre_admin`, `email_admin`, `nivelAcc_admin`) VALUES
(8, 'Admin3', 'admin3@email.com', 1),
(9, 'Admin1', 'admin1@email.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clubdepor`
--

CREATE TABLE `clubdepor` (
  `id_club` int(11) NOT NULL,
  `nombre_club` varchar(255) NOT NULL,
  `deportes_club` varchar(255) NOT NULL,
  `ubicacion_club` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clubdepor`
--

INSERT INTO `clubdepor` (`id_club`, `nombre_club`, `deportes_club`, `ubicacion_club`) VALUES
(7, 'Club1', 'Deporte1', 'Ubicación1'),
(8, 'Club2', 'Deporte2', 'Ubicación2'),
(9, 'Club3', 'Deporte3', 'Ubicación3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidomult`
--

CREATE TABLE `contenidomult` (
  `id_contenido` int(11) NOT NULL,
  `tipo_contenido` varchar(255) NOT NULL,
  `enlace_contenido` varchar(255) NOT NULL,
  `fechaPublicacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contenidomult`
--

INSERT INTO `contenidomult` (`id_contenido`, `tipo_contenido`, `enlace_contenido`, `fechaPublicacion`) VALUES
(7, 'Video', 'enlace1.com', '2023-01-10'),
(8, 'Imagen', 'enlace2.com', '2023-02-15'),
(9, 'Audio', 'enlace3.com', '2023-03-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creador_mult`
--

CREATE TABLE `creador_mult` (
  `id_creador` int(11) NOT NULL,
  `nombre_creador` varchar(200) NOT NULL,
  `email_creador` varchar(250) NOT NULL,
  `especialidad_creador` text NOT NULL,
  `historialCont_creador` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `creador_mult`
--

INSERT INTO `creador_mult` (`id_creador`, `nombre_creador`, `email_creador`, `especialidad_creador`, `historialCont_creador`) VALUES
(7, 'Creador1', 'creador1@email.com', 'Especialidad1', 'Historial1'),
(8, 'Creador2', 'creador2@email.com', 'Especialidad2', 'Historial2'),
(9, 'Creador3', 'creador3@email.com', 'Especialidad3', 'Historial3');

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
  `horario_evento` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventodeporte`
--

INSERT INTO `eventodeporte` (`id_evento`, `nombre_evento`, `tipo_deporte`, `fecha_evento`, `lugar_evento`, `img_evento`, `patrocinador_principal`, `horario_evento`) VALUES
(1, 'EventoCard1', 'Futbol', '2023-10-31', 'Club Independiente', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVRxEDkA-DBZ7dqxS7TfyXcOF2imBmQO5Cvqw1wy9EU6CPd-0gbuWiuCns3mZL4QF3LJI&usqp=CAU', 'Facultad de Ingenieria UNLPam', '16:00:00'),
(2, 'EventoCard2', 'Handball', '2023-11-01', 'Campus UNLPam', 'https://i0.wp.com/radiodon.com.ar/wp-content/uploads/2023/06/UNLPam_voleyfemenino_JUAR_Patagonia_17junio2023.jpg?w=800&ssl=1', 'Trigo de Oro', '11:30:00'),
(3, 'EventoCard3', 'Voley', '2023-11-10', 'Escuela Normal', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOabxBpZRWmYCkyuhUB8D8nxz1bkhE1F-VUootRf5ogfyxERIrtmI5yaDoIbs3wbnJxb0&usqp=CAU', 'UNLPam', '19:00:00'),
(4, 'EventoCard4', 'Natacion', '2023-11-11', 'Club de Natacion GP', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxK1e0ztxL1LoeN_ruEqUQy175YUZI20DmLiJU5qTv9yq9LX2wcRjXXnf9w_qYstj_Sgw&usqp=CAU', 'Accesorios Deportivos GP', '12:00:00'),
(8, 'Pico Fc vs Ferro', 'Nuevo Tipo de Deporte', '2023-05-05', 'Estadio El Coloso de Barrio Talleres', 'https://plataforma.iduo.com.ar/Panelcontenidos/Contenidos/t800-1611500538.jpeg', 'Patrocinador2', '09:00:00'),
(9, 'Evento3', 'Deporte3', '2023-06-10', 'Lugar3', 'imagen3.jpg', 'Patrocinador3', '10:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fechaRegistro_usuario` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `email_usuario`, `password`, `fechaRegistro_usuario`) VALUES
(7, 'Usuario1', 'usuario1@email.com', '123', '2023-01-15 00:00:00'),
(8, 'Usuario2', 'usuario2@email.com', 'password456', '2023-02-20 00:00:00'),
(9, 'Usuario3', 'usuario3@email.com', 'clave789', '2023-03-10 00:00:00'),
(10, 'admin', 'admin@gmail.com', '$2y$10$aI0fjQaa3Q6ZWvnysEvYOO0NIoQvf/0lQZlIPpuKWh7FxKAWzbK/a', '2023-10-21 00:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `clubdepor`
--
ALTER TABLE `clubdepor`
  ADD PRIMARY KEY (`id_club`);

--
-- Indices de la tabla `contenidomult`
--
ALTER TABLE `contenidomult`
  ADD PRIMARY KEY (`id_contenido`);

--
-- Indices de la tabla `creador_mult`
--
ALTER TABLE `creador_mult`
  ADD PRIMARY KEY (`id_creador`);

--
-- Indices de la tabla `eventodeporte`
--
ALTER TABLE `eventodeporte`
  ADD PRIMARY KEY (`id_evento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `clubdepor`
--
ALTER TABLE `clubdepor`
  MODIFY `id_club` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `contenidomult`
--
ALTER TABLE `contenidomult`
  MODIFY `id_contenido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `creador_mult`
--
ALTER TABLE `creador_mult`
  MODIFY `id_creador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `eventodeporte`
--
ALTER TABLE `eventodeporte`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

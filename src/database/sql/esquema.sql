-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 18-08-2026 a las 14:16:55
-- Versión del servidor: 8.0.1-dmr
-- Versión de PHP: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel_prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abogados`
--

CREATE TABLE `abogados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cedula` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `abogados`
--

INSERT INTO `abogados` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `correo`, `direccion`, `created_at`, `updated_at`) VALUES
(1, '2001001001', 'Andrés', 'Gutiérrez', '3102000001', 'andres.gutierrez@bufete.com', 'Calle 12 # 8-15', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(2, '2001001002', 'Laura', 'Fernández', '3102000002', 'laura.fernandez@bufete.com', 'Carrera 10 # 15-22', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(3, '2001001003', 'Julián', 'Mendoza', '3102000003', 'julian.mendoza@bufete.com', 'Calle 20 # 6-18', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(4, '2001001004', 'Paola', 'Ramírez', '3102000004', 'paola.ramirez@bufete.com', 'Carrera 7 # 22-30', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(5, '2001001005', 'Sebastián', 'Vargas', '3102000005', 'sebastian.vargas@bufete.com', 'Calle 18 # 11-05', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(6, '2001001006', 'Natalia', 'Castro', '3102000006', 'natalia.castro@bufete.com', 'Carrera 14 # 9-12', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(7, '2001001007', 'Felipe', 'Moreno', '3102000007', 'felipe.moreno@bufete.com', 'Calle 25 # 13-40', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(8, '2001001008', 'Camila', 'Rojas', '3102000008', 'camila.rojas@bufete.com', 'Carrera 5 # 17-24', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(9, '2001001009', 'Ricardo', 'Torres', '3102000009', 'ricardo.torres@bufete.com', 'Calle 30 # 4-16', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(10, '2001001010', 'Mariana', 'López', '3102000010', 'mariana.lopez@bufete.com', 'Carrera 12 # 20-08', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(11, '2001001011', 'Daniel', 'Hernández', '3102000011', 'daniel.hernandez@bufete.com', 'Calle 16 # 7-33', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(12, '2001001012', 'Valentina', 'Pérez', '3102000012', 'valentina.perez@bufete.com', 'Carrera 8 # 25-14', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(13, '2001001013', 'Carlos', 'Navarro', '3102000013', 'carlos.navarro@bufete.com', 'Calle 22 # 10-27', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(14, '2001001014', 'Diana', 'Molina', '3102000014', 'diana.molina@bufete.com', 'Carrera 15 # 18-09', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(15, '2001001015', 'Santiago', 'Cárdenas', '3102000015', 'santiago.cardenas@bufete.com', 'Calle 28 # 12-35', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(16, '2001001016', 'Juliana', 'Acosta', '3102000016', 'juliana.acosta@bufete.com', 'Carrera 6 # 14-20', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(17, '2001001017', 'Miguel', 'Jiménez', '3102000017', 'miguel.jimenez@bufete.com', 'Calle 10 # 16-42', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(18, '2001001018', 'Alejandra', 'Suárez', '3102000018', 'alejandra.suarez@bufete.com', 'Carrera 11 # 21-17', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(19, '2001001019', 'Jorge', 'Silva', '3102000019', 'jorge.silva@bufete.com', 'Calle 35 # 9-28', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(20, '2001001020', 'Isabella', 'Márquez', '3102000020', 'isabella.marquez@bufete.com', 'Carrera 9 # 30-11', '2026-08-18 14:05:40', '2026-08-18 14:05:40');

--
-- Disparadores `abogados`
--
DELIMITER $$
CREATE TRIGGER `prevent_delete_abogados` BEFORE DELETE ON `abogados` FOR EACH ROW BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar registros de abogados";
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casos`
--

CREATE TABLE `casos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numero_expediente` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `estado_id` bigint(20) UNSIGNED NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_finalizacion` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `casos`
--

INSERT INTO `casos` (`id`, `numero_expediente`, `cliente_id`, `estado_id`, `fecha_inicio`, `fecha_finalizacion`, `created_at`, `updated_at`) VALUES
(1, 'EXP-2026-0001', 1, 1, '2026-01-05', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(2, 'EXP-2026-0002', 2, 2, '2026-01-08', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(3, 'EXP-2026-0003', 3, 3, '2026-01-10', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(4, 'EXP-2026-0004', 4, 4, '2026-01-12', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(5, 'EXP-2026-0005', 5, 5, '2026-01-15', '2026-03-20', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(6, 'EXP-2026-0006', 6, 1, '2026-01-18', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(7, 'EXP-2026-0007', 7, 2, '2026-01-20', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(8, 'EXP-2026-0008', 8, 3, '2026-01-22', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(9, 'EXP-2026-0009', 9, 4, '2026-01-25', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(10, 'EXP-2026-0010', 10, 5, '2026-01-28', '2026-04-05', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(11, 'EXP-2026-0011', 11, 1, '2026-02-01', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(12, 'EXP-2026-0012', 12, 2, '2026-02-03', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(13, 'EXP-2026-0013', 13, 3, '2026-02-05', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(14, 'EXP-2026-0014', 14, 4, '2026-02-07', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(15, 'EXP-2026-0015', 15, 5, '2026-02-10', '2026-05-15', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(16, 'EXP-2026-0016', 16, 1, '2026-02-12', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(17, 'EXP-2026-0017', 17, 2, '2026-02-15', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(18, 'EXP-2026-0018', 18, 3, '2026-02-18', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(19, 'EXP-2026-0019', 19, 4, '2026-02-20', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(20, 'EXP-2026-0020', 20, 5, '2026-02-22', '2026-06-01', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(21, 'EXP-2026-0021', 1, 2, '2026-02-25', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(22, 'EXP-2026-0022', 2, 3, '2026-02-27', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(23, 'EXP-2026-0023', 3, 1, '2026-03-01', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(24, 'EXP-2026-0024', 4, 5, '2026-03-03', '2026-06-10', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(25, 'EXP-2026-0025', 5, 3, '2026-03-05', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(26, 'EXP-2026-0026', 6, 2, '2026-03-08', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(27, 'EXP-2026-0027', 7, 1, '2026-03-10', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(28, 'EXP-2026-0028', 8, 4, '2026-03-12', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(29, 'EXP-2026-0029', 9, 3, '2026-03-15', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(30, 'EXP-2026-0030', 10, 5, '2026-03-18', '2026-07-02', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(31, 'EXP-2026-0031', 11, 1, '2026-03-20', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(32, 'EXP-2026-0032', 12, 2, '2026-03-22', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(33, 'EXP-2026-0033', 13, 3, '2026-03-25', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(34, 'EXP-2026-0034', 14, 4, '2026-03-28', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(35, 'EXP-2026-0035', 15, 5, '2026-04-01', '2026-07-10', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(36, 'EXP-2026-0036', 16, 1, '2026-04-03', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(37, 'EXP-2026-0037', 17, 2, '2026-04-05', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(38, 'EXP-2026-0038', 18, 3, '2026-04-08', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(39, 'EXP-2026-0039', 19, 4, '2026-04-10', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(40, 'EXP-2026-0040', 20, 5, '2026-04-12', '2026-07-20', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(41, 'EXP-2026-0041', 1, 3, '2026-04-15', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(42, 'EXP-2026-0042', 2, 1, '2026-04-18', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(43, 'EXP-2026-0043', 3, 2, '2026-04-20', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(44, 'EXP-2026-0044', 4, 3, '2026-04-22', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(45, 'EXP-2026-0045', 5, 5, '2026-04-25', '2026-08-01', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(46, 'EXP-2026-0046', 6, 1, '2026-05-01', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(47, 'EXP-2026-0047', 7, 2, '2026-05-05', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(48, 'EXP-2026-0048', 8, 3, '2026-05-08', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(49, 'EXP-2026-0049', 9, 4, '2026-05-10', NULL, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(50, 'EXP-2026-0050', 10, 5, '2026-05-15', '2026-08-10', '2026-08-18 14:05:40', '2026-08-18 14:05:40');

--
-- Disparadores `casos`
--
DELIMITER $$
CREATE TRIGGER `prevent_delete_casos` BEFORE DELETE ON `casos` FOR EACH ROW BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar registros de casos";
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_abogado`
--

CREATE TABLE `caso_abogado` (
  `caso_id` bigint(20) UNSIGNED NOT NULL,
  `abogado_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `caso_abogado`
--

INSERT INTO `caso_abogado` (`caso_id`, `abogado_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(1, 2, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(2, 3, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(2, 4, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(3, 5, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(3, 6, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(4, 7, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(4, 8, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(5, 9, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(5, 10, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(6, 11, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(6, 12, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(7, 13, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(7, 14, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(8, 15, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(8, 16, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(9, 17, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(9, 18, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(10, 19, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(10, 20, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(11, 1, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(11, 3, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(12, 2, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(12, 4, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(13, 5, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(13, 7, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(14, 6, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(14, 8, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(15, 9, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(15, 11, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(16, 10, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(16, 12, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(17, 13, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(17, 15, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(18, 14, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(18, 16, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(19, 17, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(19, 19, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(20, 18, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(20, 20, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(21, 1, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(21, 5, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(22, 2, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(22, 6, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(23, 3, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(23, 7, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(24, 4, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(24, 8, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(25, 9, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(25, 13, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(26, 10, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(26, 14, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(27, 11, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(27, 15, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(28, 12, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(28, 16, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(29, 13, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(29, 17, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(30, 14, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(30, 18, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(31, 15, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(31, 19, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(32, 16, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(32, 20, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(33, 1, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(33, 17, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(34, 2, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(34, 18, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(35, 3, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(35, 19, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(36, 4, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(36, 20, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(37, 1, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(37, 6, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(38, 2, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(38, 7, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(39, 3, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(39, 8, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(40, 4, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(40, 9, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(41, 5, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(41, 10, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(42, 6, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(42, 11, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(43, 7, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(43, 12, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(44, 8, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(44, 13, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(45, 9, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(45, 14, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(46, 10, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(46, 15, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(47, 11, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(47, 16, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(48, 12, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(48, 17, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(49, 13, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(49, 18, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(50, 14, '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(50, 19, '2026-08-18 14:05:40', '2026-08-18 14:05:40');

--
-- Disparadores `caso_abogado`
--
DELIMITER $$
CREATE TRIGGER `prevent_delete_caso_abogado` BEFORE DELETE ON `caso_abogado` FOR EACH ROW BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar relaciones entre casos y abogados";
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cedula` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `correo`, `direccion`, `created_at`, `updated_at`) VALUES
(1, '1001001001', 'Carlos', 'Martínez', '3001000001', 'carlos.martinez@gmail.com', 'Calle 10 # 5-20', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(2, '1001001002', 'María', 'Gómez', '3001000002', 'maria.gomez@gmail.com', 'Carrera 8 # 12-15', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(3, '1001001003', 'Juan', 'Rodríguez', '3001000003', 'juan.rodriguez@gmail.com', 'Calle 15 # 10-30', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(4, '1001001004', 'Laura', 'Hernández', '3001000004', 'laura.hernandez@gmail.com', 'Carrera 12 # 20-18', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(5, '1001001005', 'Andrés', 'López', '3001000005', 'andres.lopez@gmail.com', 'Calle 22 # 14-05', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(6, '1001001006', 'Diana', 'Torres', '3001000006', 'diana.torres@gmail.com', 'Carrera 5 # 18-42', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(7, '1001001007', 'Sebastián', 'Ramírez', '3001000007', 'sebastian.ramirez@gmail.com', 'Calle 30 # 7-11', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(8, '1001001008', 'Valentina', 'Castro', '3001000008', 'valentina.castro@gmail.com', 'Carrera 15 # 25-09', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(9, '1001001009', 'Felipe', 'Moreno', '3001000009', 'felipe.moreno@gmail.com', 'Calle 18 # 9-24', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(10, '1001001010', 'Camila', 'Vargas', '3001000010', 'camila.vargas@gmail.com', 'Carrera 7 # 16-33', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(11, '1001001011', 'Santiago', 'Rojas', '3001000011', 'santiago.rojas@gmail.com', 'Calle 12 # 22-10', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(12, '1001001012', 'Natalia', 'Suárez', '3001000012', 'natalia.suarez@gmail.com', 'Carrera 10 # 30-21', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(13, '1001001013', 'Miguel', 'Navarro', '3001000013', 'miguel.navarro@gmail.com', 'Calle 25 # 6-17', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(14, '1001001014', 'Paula', 'Mendoza', '3001000014', 'paula.mendoza@gmail.com', 'Carrera 4 # 11-28', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(15, '1001001015', 'Daniel', 'Cárdenas', '3001000015', 'daniel.cardenas@gmail.com', 'Calle 35 # 13-40', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(16, '1001001016', 'Juliana', 'Pérez', '3001000016', 'juliana.perez@gmail.com', 'Carrera 9 # 19-12', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(17, '1001001017', 'Ricardo', 'Jiménez', '3001000017', 'ricardo.jimenez@gmail.com', 'Calle 8 # 4-36', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(18, '1001001018', 'Alejandra', 'Silva', '3001000018', 'alejandra.silva@gmail.com', 'Carrera 14 # 27-08', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(19, '1001001019', 'Jorge', 'Acosta', '3001000019', 'jorge.acosta@gmail.com', 'Calle 20 # 16-25', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(20, '1001001020', 'Isabella', 'Molina', '3001000020', 'isabella.molina@gmail.com', 'Carrera 6 # 23-14', '2026-08-18 14:05:40', '2026-08-18 14:05:40');

--
-- Disparadores `clientes`
--
DELIMITER $$
CREATE TRIGGER `prevent_delete_clientes` BEFORE DELETE ON `clientes` FOR EACH ROW BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar registros de clientes";
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_caso`
--

CREATE TABLE `estados_caso` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estados_caso`
--

INSERT INTO `estados_caso` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Pendiente', 'El caso ha sido registrado y está pendiente de revisión.', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(2, 'En revisión', 'El caso está siendo analizado por el equipo jurídico.', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(3, 'En proceso', 'El caso se encuentra actualmente en proceso legal.', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(4, 'Suspendido', 'El caso se encuentra temporalmente suspendido por alguna circunstancia.', '2026-08-18 14:05:40', '2026-08-18 14:05:40'),
(5, 'Finalizado', 'El proceso del caso ha concluido.', '2026-08-18 14:05:40', '2026-08-18 14:05:40');

--
-- Disparadores `estados_caso`
--
DELIMITER $$
CREATE TRIGGER `prevent_delete_estados_caso` BEFORE DELETE ON `estados_caso` FOR EACH ROW BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar registros de estados";
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_08_17_130757_create_clientes_table', 1),
(5, '2026_08_17_131157_create_abogados_table', 1),
(6, '2026_08_17_131408_create_estados_caso_table', 1),
(7, '2026_08_17_131602_create_casos_table', 1),
(8, '2026_08_17_132004_create_caso_abogado_table', 1),
(9, '2026_08_17_132654_create_personal_access_tokens_table', 1),
(10, '2026_08_18_135521_add_delete_protection_to_legal_tables', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Disparadores `personal_access_tokens`
--
DELIMITER $$
CREATE TRIGGER `prevent_delete_personal_access_tokens` BEFORE DELETE ON `personal_access_tokens` FOR EACH ROW BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar tokens de autenticación";
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'admin@bufete.com', NULL, '$2y$12$AFWcki.vUrcwcOikiDvsXedabGREPrsFKwt8Ua/90jEzys6sgzd7G', NULL, '2026-08-17 14:42:35', '2026-08-17 14:42:35');

--
-- Disparadores `users`
--
DELIMITER $$
CREATE TRIGGER `prevent_delete_users` BEFORE DELETE ON `users` FOR EACH ROW BEGIN
                SIGNAL SQLSTATE "45000"
                SET MESSAGE_TEXT =
                    "No se permite eliminar usuarios";
            END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abogados`
--
ALTER TABLE `abogados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `abogados_cedula_unique` (`cedula`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indices de la tabla `casos`
--
ALTER TABLE `casos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `casos_numero_expediente_unique` (`numero_expediente`),
  ADD KEY `casos_cliente_id_foreign` (`cliente_id`),
  ADD KEY `casos_estado_id_foreign` (`estado_id`);

--
-- Indices de la tabla `caso_abogado`
--
ALTER TABLE `caso_abogado`
  ADD PRIMARY KEY (`caso_id`,`abogado_id`),
  ADD KEY `caso_abogado_abogado_id_foreign` (`abogado_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clientes_cedula_unique` (`cedula`);

--
-- Indices de la tabla `estados_caso`
--
ALTER TABLE `estados_caso`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estados_caso_nombre_unique` (`nombre`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abogados`
--
ALTER TABLE `abogados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `casos`
--
ALTER TABLE `casos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `estados_caso`
--
ALTER TABLE `estados_caso`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `casos`
--
ALTER TABLE `casos`
  ADD CONSTRAINT `casos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `casos_estado_id_foreign` FOREIGN KEY (`estado_id`) REFERENCES `estados_caso` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `caso_abogado`
--
ALTER TABLE `caso_abogado`
  ADD CONSTRAINT `caso_abogado_abogado_id_foreign` FOREIGN KEY (`abogado_id`) REFERENCES `abogados` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `caso_abogado_caso_id_foreign` FOREIGN KEY (`caso_id`) REFERENCES `casos` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

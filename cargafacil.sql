-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-04-2019 a las 03:41:31
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cargafacil`
--
CREATE DATABASE IF NOT EXISTS `cargafacil` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cargafacil`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo_multimedias`
--

CREATE TABLE `archivo_multimedias` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('PDF','XLSX','DOCX','XLS','DOC','JPG','JPEG','JPGE','PNG') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamano` int(11) NOT NULL,
  `id_publicacion` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo_multimedia_requisitos`
--

CREATE TABLE `archivo_multimedia_requisitos` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('PDF','XLSX','DOCX','XLS','DOC','JPG','JPEG','JPGE','PNG') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamano` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo_multimedia_usuarios`
--

CREATE TABLE `archivo_multimedia_usuarios` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('PDF','XLSX','DOCX','XLS','DOC','JPG','JPEG','JPGE','PNG') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamano` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargas`
--

CREATE TABLE `cargas` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('N','I','O') COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad_carga` int(11) NOT NULL,
  `id_polizas` bigint(20) UNSIGNED NOT NULL,
  `id_remitente` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_persona_remitente` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_destinatario` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_persona_destinario` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_departamento` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pais` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `nit` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99999999',
  `ano` int(11) NOT NULL,
  `tipo` enum('N','J') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_persona` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_licitantes`
--

CREATE TABLE `empresa_licitantes` (
  `id_publicacion` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_empresa` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_persona` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localizaciones`
--

CREATE TABLE `localizaciones` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitud_longitud` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_ciudad` bigint(20) UNSIGNED NOT NULL,
  `id_empresa` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_persona` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manifiestos`
--

CREATE TABLE `manifiestos` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_localizacion_origen` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_localizacion_destino` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_empresa_transporta` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_persona_transporta` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_conductor` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_dueno` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_vehiculo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_carga` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_total_viaje` decimal(19,3) NOT NULL,
  `valor_retencion_fuente` decimal(19,3) NOT NULL,
  `valor_retencion_ica` decimal(19,3) NOT NULL,
  `valor_neto_apagar` decimal(19,3) NOT NULL,
  `valor_anticipo` decimal(19,3) NOT NULL,
  `valor_saldo_pagar` decimal(19,3) NOT NULL,
  `id_lugar_pago` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `cargue_pagado_remitente` decimal(19,3) NOT NULL,
  `cargue_pagado_destinatario` decimal(19,3) NOT NULL,
  `observaciones` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `llegada_cargue` datetime NOT NULL,
  `llegada_descargue` datetime NOT NULL,
  `salida_cargue` datetime NOT NULL,
  `salida_descargue` datetime NOT NULL,
  `hora_cargue` time NOT NULL,
  `hora_descargue` time NOT NULL,
  `id_firma_destinatario` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_vehiculos`
--

CREATE TABLE `marca_vehiculos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_04_23_235011_create_pais_table', 1),
(4, '2019_04_23_235024_create_departamentos_table', 1),
(5, '2019_04_23_235036_create_ciudades_table', 1),
(6, '2019_04_23_235052_create_archivo_multimedia_usuarios_table', 1),
(7, '2019_04_23_235053_create_usuarios_table', 1),
(8, '2019_04_23_235054_create_telefonos_table', 1),
(9, '2019_04_23_235108_create_marca_vehiculos_table', 1),
(10, '2019_04_23_235115_create_vehiculos_table', 1),
(11, '2019_04_23_235126_create_archivo_multimedia_requisitos_table', 1),
(12, '2019_04_23_235133_create_empresas_table', 1),
(13, '2019_04_23_235139_create_localizaciones_table', 1),
(14, '2019_04_23_235140_create_requisito_cargas_table', 1),
(15, '2019_04_23_235148_create_polizas_table', 1),
(16, '2019_04_23_235154_create_cargas_table', 1),
(17, '2019_04_23_235201_create_manifiestos_table', 1),
(18, '2019_04_23_235208_create_remesa_cargas_table', 1),
(19, '2019_04_23_235214_create_viajes_table', 1),
(20, '2019_04_23_235228_create_publicacion_cargas_table', 1),
(21, '2019_04_23_235257_create_empresa_licitantes_table', 1),
(22, '2019_04_23_235306_create_notificacion_publicaciones_table', 1),
(23, '2019_04_23_235307_create_archivo_multimedias_table', 1),
(24, '2019_04_23_235313_create_notificacion_viajes_table', 1),
(25, '2019_04_23_235320_create_puntaje_viaje_conductores_table', 1),
(26, '2019_04_26_024932_create_viaje_localizacion_conductores_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_publicaciones`
--

CREATE TABLE `notificacion_publicaciones` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_publicacion` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_remite` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_per_remite` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_transporta` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_per_trans` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_carga` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_viajes`
--

CREATE TABLE `notificacion_viajes` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_publicacion` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_remite` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_per_remite` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_destino` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_per_destino` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_viaje` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polizas`
--

CREATE TABLE `polizas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion_cargas`
--

CREATE TABLE `publicacion_cargas` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prioridad` enum('A','M','B') COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_remitente` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_persona_remitente` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_carga` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntaje_viaje_conductores`
--

CREATE TABLE `puntaje_viaje_conductores` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` double NOT NULL,
  `id_viajes` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_transporta` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_per_trans` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_conductor` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remesa_cargas`
--

CREATE TABLE `remesa_cargas` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_cargue` datetime NOT NULL,
  `fecha_descargue` datetime NOT NULL,
  `hora_cargue` time NOT NULL,
  `hora_descargue` time NOT NULL,
  `tiempo_pactado_cargue` time NOT NULL,
  `tiempo_pactado_descargue` time NOT NULL,
  `id_carga` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_empresa_remitente` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_persona_remitente` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_empresa_destino` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_persona_destino` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_empresa_trans` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_persona_trans` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisito_cargas`
--

CREATE TABLE `requisito_cargas` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_archivo_requisito` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_empresa` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_persona` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numero` int(11) NOT NULL,
  `indicativo` int(11) NOT NULL,
  `tipo` enum('F','C') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_uno` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_dos` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido_uno` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_dos` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_completo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('CO','DU','OT','DE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `contrasena` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_firma` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_foto` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `placa` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ano_compra` int(11) DEFAULT NULL,
  `id_marca_vehiculo` bigint(20) UNSIGNED NOT NULL,
  `id_conductor` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE `viajes` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio_hora` datetime NOT NULL,
  `fecha_final_hora` datetime NOT NULL,
  `id_manifiesto` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_remision` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_carga` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_remitente` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_destino` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje_localizacion_conductores`
--

CREATE TABLE `viaje_localizacion_conductores` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_conductor` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_placa` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_viaje` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_punto` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivo_multimedias`
--
ALTER TABLE `archivo_multimedias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `archivo_multimedias_id_publicacion_foreign` (`id_publicacion`);

--
-- Indices de la tabla `archivo_multimedia_requisitos`
--
ALTER TABLE `archivo_multimedia_requisitos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `archivo_multimedia_usuarios`
--
ALTER TABLE `archivo_multimedia_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargas`
--
ALTER TABLE `cargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cargas_id_polizas_foreign` (`id_polizas`),
  ADD KEY `cargas_id_remitente_id_persona_remitente_foreign` (`id_remitente`,`id_persona_remitente`),
  ADD KEY `cargas_id_destinatario_id_persona_destinario_foreign` (`id_destinatario`,`id_persona_destinario`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciudades_id_departamento_foreign` (`id_departamento`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departamentos_id_pais_foreign` (`id_pais`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`nit`,`id_persona`),
  ADD KEY `empresas_id_persona_foreign` (`id_persona`);

--
-- Indices de la tabla `empresa_licitantes`
--
ALTER TABLE `empresa_licitantes`
  ADD KEY `empresa_licitantes_id_publicacion_foreign` (`id_publicacion`),
  ADD KEY `empresa_licitantes_id_empresa_id_persona_foreign` (`id_empresa`,`id_persona`);

--
-- Indices de la tabla `localizaciones`
--
ALTER TABLE `localizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `localizaciones_id_ciudad_foreign` (`id_ciudad`),
  ADD KEY `localizaciones_id_empresa_id_persona_foreign` (`id_empresa`,`id_persona`);

--
-- Indices de la tabla `manifiestos`
--
ALTER TABLE `manifiestos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manifiestos_id_localizacion_origen_foreign` (`id_localizacion_origen`),
  ADD KEY `manifiestos_id_localizacion_destino_foreign` (`id_localizacion_destino`),
  ADD KEY `manifiestos_id_empresa_transporta_id_persona_transporta_foreign` (`id_empresa_transporta`,`id_persona_transporta`),
  ADD KEY `manifiestos_id_conductor_foreign` (`id_conductor`),
  ADD KEY `manifiestos_id_dueno_foreign` (`id_dueno`),
  ADD KEY `manifiestos_id_vehiculo_foreign` (`id_vehiculo`),
  ADD KEY `manifiestos_id_carga_foreign` (`id_carga`),
  ADD KEY `manifiestos_id_lugar_pago_foreign` (`id_lugar_pago`),
  ADD KEY `manifiestos_id_firma_destinatario_foreign` (`id_firma_destinatario`);

--
-- Indices de la tabla `marca_vehiculos`
--
ALTER TABLE `marca_vehiculos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificacion_publicaciones`
--
ALTER TABLE `notificacion_publicaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notificacion_publicaciones_id_publicacion_foreign` (`id_publicacion`),
  ADD KEY `notificacion_publicaciones_id_remite_id_per_remite_foreign` (`id_remite`,`id_per_remite`),
  ADD KEY `notificacion_publicaciones_id_transporta_id_per_trans_foreign` (`id_transporta`,`id_per_trans`),
  ADD KEY `notificacion_publicaciones_id_carga_foreign` (`id_carga`);

--
-- Indices de la tabla `notificacion_viajes`
--
ALTER TABLE `notificacion_viajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notificacion_viajes_id_publicacion_foreign` (`id_publicacion`),
  ADD KEY `notificacion_viajes_id_remite_id_per_remite_foreign` (`id_remite`,`id_per_remite`),
  ADD KEY `notificacion_viajes_id_destino_id_per_destino_foreign` (`id_destino`,`id_per_destino`),
  ADD KEY `notificacion_viajes_id_viaje_foreign` (`id_viaje`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `polizas`
--
ALTER TABLE `polizas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `publicacion_cargas`
--
ALTER TABLE `publicacion_cargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publicacion_cargas_id_remitente_id_persona_remitente_foreign` (`id_remitente`,`id_persona_remitente`),
  ADD KEY `publicacion_cargas_id_carga_foreign` (`id_carga`);

--
-- Indices de la tabla `puntaje_viaje_conductores`
--
ALTER TABLE `puntaje_viaje_conductores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `puntaje_viaje_conductores_id_viajes_foreign` (`id_viajes`),
  ADD KEY `puntaje_viaje_conductores_id_transporta_id_per_trans_foreign` (`id_transporta`,`id_per_trans`),
  ADD KEY `puntaje_viaje_conductores_id_conductor_foreign` (`id_conductor`);

--
-- Indices de la tabla `remesa_cargas`
--
ALTER TABLE `remesa_cargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remesa_cargas_id_carga_foreign` (`id_carga`),
  ADD KEY `remesa_cargas_id_empresa_remitente_id_persona_remitente_foreign` (`id_empresa_remitente`,`id_persona_remitente`),
  ADD KEY `remesa_cargas_id_empresa_destino_id_persona_destino_foreign` (`id_empresa_destino`,`id_persona_destino`),
  ADD KEY `remesa_cargas_id_empresa_trans_id_persona_trans_foreign` (`id_empresa_trans`,`id_persona_trans`);

--
-- Indices de la tabla `requisito_cargas`
--
ALTER TABLE `requisito_cargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requisito_cargas_id_archivo_requisito_foreign` (`id_archivo_requisito`),
  ADD KEY `requisito_cargas_id_empresa_id_persona_foreign` (`id_empresa`,`id_persona`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `telefonos_id_usuario_foreign` (`id_usuario`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_correo_unique` (`correo`),
  ADD KEY `usuarios_id_firma_foreign` (`id_firma`),
  ADD KEY `usuarios_id_foto_foreign` (`id_foto`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `vehiculos_id_marca_vehiculo_foreign` (`id_marca_vehiculo`),
  ADD KEY `vehiculos_id_conductor_foreign` (`id_conductor`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `viajes_id_manifiesto_foreign` (`id_manifiesto`),
  ADD KEY `viajes_id_remision_foreign` (`id_remision`),
  ADD KEY `viajes_id_carga_foreign` (`id_carga`),
  ADD KEY `viajes_id_remitente_foreign` (`id_remitente`),
  ADD KEY `viajes_id_destino_foreign` (`id_destino`);

--
-- Indices de la tabla `viaje_localizacion_conductores`
--
ALTER TABLE `viaje_localizacion_conductores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `viaje_localizacion_conductores_id_conductor_foreign` (`id_conductor`),
  ADD KEY `viaje_localizacion_conductores_id_placa_foreign` (`id_placa`),
  ADD KEY `viaje_localizacion_conductores_id_viaje_foreign` (`id_viaje`),
  ADD KEY `viaje_localizacion_conductores_id_punto_foreign` (`id_punto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca_vehiculos`
--
ALTER TABLE `marca_vehiculos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `polizas`
--
ALTER TABLE `polizas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivo_multimedias`
--
ALTER TABLE `archivo_multimedias`
  ADD CONSTRAINT `archivo_multimedias_id_publicacion_foreign` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion_cargas` (`id`);

--
-- Filtros para la tabla `cargas`
--
ALTER TABLE `cargas`
  ADD CONSTRAINT `cargas_id_destinatario_id_persona_destinario_foreign` FOREIGN KEY (`id_destinatario`,`id_persona_destinario`) REFERENCES `empresas` (`nit`, `id_persona`),
  ADD CONSTRAINT `cargas_id_polizas_foreign` FOREIGN KEY (`id_polizas`) REFERENCES `polizas` (`id`),
  ADD CONSTRAINT `cargas_id_remitente_id_persona_remitente_foreign` FOREIGN KEY (`id_remitente`,`id_persona_remitente`) REFERENCES `empresas` (`nit`, `id_persona`);

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `ciudades_id_departamento_foreign` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id`);

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `departamentos_id_pais_foreign` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id`);

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_id_persona_foreign` FOREIGN KEY (`id_persona`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `empresa_licitantes`
--
ALTER TABLE `empresa_licitantes`
  ADD CONSTRAINT `empresa_licitantes_id_empresa_id_persona_foreign` FOREIGN KEY (`id_empresa`,`id_persona`) REFERENCES `empresas` (`nit`, `id_persona`),
  ADD CONSTRAINT `empresa_licitantes_id_publicacion_foreign` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion_cargas` (`id`);

--
-- Filtros para la tabla `localizaciones`
--
ALTER TABLE `localizaciones`
  ADD CONSTRAINT `localizaciones_id_ciudad_foreign` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id`),
  ADD CONSTRAINT `localizaciones_id_empresa_id_persona_foreign` FOREIGN KEY (`id_empresa`,`id_persona`) REFERENCES `empresas` (`nit`, `id_persona`);

--
-- Filtros para la tabla `manifiestos`
--
ALTER TABLE `manifiestos`
  ADD CONSTRAINT `manifiestos_id_carga_foreign` FOREIGN KEY (`id_carga`) REFERENCES `cargas` (`id`),
  ADD CONSTRAINT `manifiestos_id_conductor_foreign` FOREIGN KEY (`id_conductor`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `manifiestos_id_dueno_foreign` FOREIGN KEY (`id_dueno`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `manifiestos_id_empresa_transporta_id_persona_transporta_foreign` FOREIGN KEY (`id_empresa_transporta`,`id_persona_transporta`) REFERENCES `empresas` (`nit`, `id_persona`),
  ADD CONSTRAINT `manifiestos_id_firma_destinatario_foreign` FOREIGN KEY (`id_firma_destinatario`) REFERENCES `archivo_multimedia_usuarios` (`id`),
  ADD CONSTRAINT `manifiestos_id_localizacion_destino_foreign` FOREIGN KEY (`id_localizacion_destino`) REFERENCES `localizaciones` (`id`),
  ADD CONSTRAINT `manifiestos_id_localizacion_origen_foreign` FOREIGN KEY (`id_localizacion_origen`) REFERENCES `localizaciones` (`id`),
  ADD CONSTRAINT `manifiestos_id_lugar_pago_foreign` FOREIGN KEY (`id_lugar_pago`) REFERENCES `localizaciones` (`id`),
  ADD CONSTRAINT `manifiestos_id_vehiculo_foreign` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`placa`);

--
-- Filtros para la tabla `notificacion_publicaciones`
--
ALTER TABLE `notificacion_publicaciones`
  ADD CONSTRAINT `notificacion_publicaciones_id_carga_foreign` FOREIGN KEY (`id_carga`) REFERENCES `cargas` (`id`),
  ADD CONSTRAINT `notificacion_publicaciones_id_publicacion_foreign` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion_cargas` (`id`),
  ADD CONSTRAINT `notificacion_publicaciones_id_remite_id_per_remite_foreign` FOREIGN KEY (`id_remite`,`id_per_remite`) REFERENCES `empresas` (`nit`, `id_persona`),
  ADD CONSTRAINT `notificacion_publicaciones_id_transporta_id_per_trans_foreign` FOREIGN KEY (`id_transporta`,`id_per_trans`) REFERENCES `empresas` (`nit`, `id_persona`);

--
-- Filtros para la tabla `notificacion_viajes`
--
ALTER TABLE `notificacion_viajes`
  ADD CONSTRAINT `notificacion_viajes_id_destino_id_per_destino_foreign` FOREIGN KEY (`id_destino`,`id_per_destino`) REFERENCES `empresas` (`nit`, `id_persona`),
  ADD CONSTRAINT `notificacion_viajes_id_publicacion_foreign` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion_cargas` (`id`),
  ADD CONSTRAINT `notificacion_viajes_id_remite_id_per_remite_foreign` FOREIGN KEY (`id_remite`,`id_per_remite`) REFERENCES `empresas` (`nit`, `id_persona`),
  ADD CONSTRAINT `notificacion_viajes_id_viaje_foreign` FOREIGN KEY (`id_viaje`) REFERENCES `viajes` (`id`);

--
-- Filtros para la tabla `publicacion_cargas`
--
ALTER TABLE `publicacion_cargas`
  ADD CONSTRAINT `publicacion_cargas_id_carga_foreign` FOREIGN KEY (`id_carga`) REFERENCES `cargas` (`id`),
  ADD CONSTRAINT `publicacion_cargas_id_remitente_id_persona_remitente_foreign` FOREIGN KEY (`id_remitente`,`id_persona_remitente`) REFERENCES `empresas` (`nit`, `id_persona`);

--
-- Filtros para la tabla `puntaje_viaje_conductores`
--
ALTER TABLE `puntaje_viaje_conductores`
  ADD CONSTRAINT `puntaje_viaje_conductores_id_conductor_foreign` FOREIGN KEY (`id_conductor`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `puntaje_viaje_conductores_id_transporta_id_per_trans_foreign` FOREIGN KEY (`id_transporta`,`id_per_trans`) REFERENCES `empresas` (`nit`, `id_persona`),
  ADD CONSTRAINT `puntaje_viaje_conductores_id_viajes_foreign` FOREIGN KEY (`id_viajes`) REFERENCES `viajes` (`id`);

--
-- Filtros para la tabla `remesa_cargas`
--
ALTER TABLE `remesa_cargas`
  ADD CONSTRAINT `remesa_cargas_id_carga_foreign` FOREIGN KEY (`id_carga`) REFERENCES `cargas` (`id`),
  ADD CONSTRAINT `remesa_cargas_id_empresa_destino_id_persona_destino_foreign` FOREIGN KEY (`id_empresa_destino`,`id_persona_destino`) REFERENCES `empresas` (`nit`, `id_persona`),
  ADD CONSTRAINT `remesa_cargas_id_empresa_remitente_id_persona_remitente_foreign` FOREIGN KEY (`id_empresa_remitente`,`id_persona_remitente`) REFERENCES `empresas` (`nit`, `id_persona`),
  ADD CONSTRAINT `remesa_cargas_id_empresa_trans_id_persona_trans_foreign` FOREIGN KEY (`id_empresa_trans`,`id_persona_trans`) REFERENCES `empresas` (`nit`, `id_persona`);

--
-- Filtros para la tabla `requisito_cargas`
--
ALTER TABLE `requisito_cargas`
  ADD CONSTRAINT `requisito_cargas_id_archivo_requisito_foreign` FOREIGN KEY (`id_archivo_requisito`) REFERENCES `archivo_multimedia_requisitos` (`id`),
  ADD CONSTRAINT `requisito_cargas_id_empresa_id_persona_foreign` FOREIGN KEY (`id_empresa`,`id_persona`) REFERENCES `empresas` (`nit`, `id_persona`);

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `telefonos_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_id_firma_foreign` FOREIGN KEY (`id_firma`) REFERENCES `archivo_multimedia_usuarios` (`id`),
  ADD CONSTRAINT `usuarios_id_foto_foreign` FOREIGN KEY (`id_foto`) REFERENCES `archivo_multimedia_usuarios` (`id`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `vehiculos_id_conductor_foreign` FOREIGN KEY (`id_conductor`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `vehiculos_id_marca_vehiculo_foreign` FOREIGN KEY (`id_marca_vehiculo`) REFERENCES `marca_vehiculos` (`id`);

--
-- Filtros para la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD CONSTRAINT `viajes_id_carga_foreign` FOREIGN KEY (`id_carga`) REFERENCES `cargas` (`id`),
  ADD CONSTRAINT `viajes_id_destino_foreign` FOREIGN KEY (`id_destino`) REFERENCES `localizaciones` (`id`),
  ADD CONSTRAINT `viajes_id_manifiesto_foreign` FOREIGN KEY (`id_manifiesto`) REFERENCES `manifiestos` (`id`),
  ADD CONSTRAINT `viajes_id_remision_foreign` FOREIGN KEY (`id_remision`) REFERENCES `remesa_cargas` (`id`),
  ADD CONSTRAINT `viajes_id_remitente_foreign` FOREIGN KEY (`id_remitente`) REFERENCES `localizaciones` (`id`);

--
-- Filtros para la tabla `viaje_localizacion_conductores`
--
ALTER TABLE `viaje_localizacion_conductores`
  ADD CONSTRAINT `viaje_localizacion_conductores_id_conductor_foreign` FOREIGN KEY (`id_conductor`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `viaje_localizacion_conductores_id_placa_foreign` FOREIGN KEY (`id_placa`) REFERENCES `vehiculos` (`placa`),
  ADD CONSTRAINT `viaje_localizacion_conductores_id_punto_foreign` FOREIGN KEY (`id_punto`) REFERENCES `localizaciones` (`id`),
  ADD CONSTRAINT `viaje_localizacion_conductores_id_viaje_foreign` FOREIGN KEY (`id_viaje`) REFERENCES `viajes` (`id`);
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"full_screen\":\"on\",\"side_menu\":\"true\",\"pin_text\":\"false\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"cargafacil\",\"table\":\"notificacion_viajes\"},{\"db\":\"cargafacil\",\"table\":\"manifiestos\"},{\"db\":\"cargafacil\",\"table\":\"localizaciones\"},{\"db\":\"cargafacil\",\"table\":\"departamentos\"},{\"db\":\"cargafacil\",\"table\":\"pais\"},{\"db\":\"cargafacil\",\"table\":\"usuarios\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('', '2019-04-26 02:54:06', '{\"lang\":\"es\"}'),
('root', '2019-04-29 01:41:07', '{\"lang\":\"es\",\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-03-2025 a las 17:36:07
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `baseproyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE `accesos` (
  `id` int NOT NULL,
  `id_rol` int NOT NULL,
  `id_opcion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alertavencimiento`
--

CREATE TABLE `alertavencimiento` (
  `id` int NOT NULL,
  `id_producto` int NOT NULL,
  `fecha_alerta` datetime(3) NOT NULL,
  `estado_alerta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` int NOT NULL,
  `nombre_area` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_centro_formacion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas_centros_formacion`
--

CREATE TABLE `areas_centros_formacion` (
  `id` int NOT NULL,
  `id_area` int NOT NULL,
  `id_centro_formacion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `id` int NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ubicacion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centroformacion`
--

CREATE TABLE `centroformacion` (
  `id` int NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ubicacion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallesentrega`
--

CREATE TABLE `detallesentrega` (
  `id` int NOT NULL,
  `id_entrega` int NOT NULL,
  `id_producto` int NOT NULL,
  `id_instructor_receptor` int DEFAULT NULL,
  `id_ficha_formacion` int DEFAULT NULL,
  `visto_bueno_aprendiz` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallesolicitud`
--

CREATE TABLE `detallesolicitud` (
  `id` int NOT NULL,
  `id_solicitud` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_solicitada` int NOT NULL,
  `observaciones` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entregamaterial`
--

CREATE TABLE `entregamaterial` (
  `id` int NOT NULL,
  `id_solicitud` int NOT NULL,
  `id_usuario_responsable` int NOT NULL,
  `fecha_entrega` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `observaciones` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichasformacion`
--

CREATE TABLE `fichasformacion` (
  `id` int NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_titulado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `id` int NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int NOT NULL,
  `codigo_sena` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unspc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad` int NOT NULL,
  `unidad_medida` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_area` int DEFAULT NULL,
  `tipo_material` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registroproductos`
--

CREATE TABLE `registroproductos` (
  `id` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `id_bodega` int NOT NULL,
  `fecha_registro` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `nombre_rol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_usuarios`
--

CREATE TABLE `roles_usuarios` (
  `id` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_rol` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id` int NOT NULL,
  `id_usuario_solicitante` int NOT NULL,
  `fecha_solicitud` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `estado_solicitud` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulados`
--

CREATE TABLE `titulados` (
  `id` int NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `apellido` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cargo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_area` int DEFAULT NULL,
  `id_ficha` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_centros_formacion`
--

CREATE TABLE `usuarios_centros_formacion` (
  `id` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_centro_formacion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('5a621ff2-4afc-4a9e-93a7-50f9f4885d22', '96ff5418eae8054920b91d6e563b10abf7981d47a343271cc998ce4565e31d22', '2025-03-10 17:03:16.911', '20250305123850_baseproyecto1', NULL, NULL, '2025-03-10 17:03:16.077', 1),
('98f23f24-e070-4ff9-8f93-672a35d9c767', '1a49a100b00c87e3d81d3bfe1cc1ec9c7f25acae522ea30f98976fb542411b3c', '2025-03-10 17:03:17.047', '20250305162220_3baseproyecto', NULL, NULL, '2025-03-10 17:03:16.982', 1),
('a8903800-eb2c-4811-9460-3cb07c816987', '521f03d71e6b386c131e65487458d707713bc14d6b9528783e3afc32137a49fb', '2025-03-10 17:03:16.981', '20250305161514_baseproyecto2', NULL, NULL, '2025-03-10 17:03:16.912', 1),
('b1942c91-69f6-4c79-862a-0a0f4ad61b8a', '1bfb527c3215584cd26c70eb7dd0ab726b50443ea8a52e74513a5f452b77fb32', '2025-03-10 17:03:28.562', '20250310170328_4baseproyecto', NULL, NULL, '2025-03-10 17:03:28.328', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Accesos_id_rol_fkey` (`id_rol`),
  ADD KEY `Accesos_id_opcion_fkey` (`id_opcion`);

--
-- Indices de la tabla `alertavencimiento`
--
ALTER TABLE `alertavencimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AlertaVencimiento_id_producto_fkey` (`id_producto`);

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Areas_id_centro_formacion_fkey` (`id_centro_formacion`);

--
-- Indices de la tabla `areas_centros_formacion`
--
ALTER TABLE `areas_centros_formacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_centros_formacion_id_area_fkey` (`id_area`),
  ADD KEY `areas_centros_formacion_id_centro_formacion_fkey` (`id_centro_formacion`);

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `centroformacion`
--
ALTER TABLE `centroformacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detallesentrega`
--
ALTER TABLE `detallesentrega`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DetallesEntrega_id_entrega_fkey` (`id_entrega`),
  ADD KEY `DetallesEntrega_id_producto_fkey` (`id_producto`);

--
-- Indices de la tabla `detallesolicitud`
--
ALTER TABLE `detallesolicitud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DetalleSolicitud_id_solicitud_fkey` (`id_solicitud`),
  ADD KEY `DetalleSolicitud_id_producto_fkey` (`id_producto`);

--
-- Indices de la tabla `entregamaterial`
--
ALTER TABLE `entregamaterial`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fichasformacion`
--
ALTER TABLE `fichasformacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FichasFormacion_id_titulado_fkey` (`id_titulado`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Productos_id_area_fkey` (`id_area`);

--
-- Indices de la tabla `registroproductos`
--
ALTER TABLE `registroproductos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `RegistroProductos_id_producto_fkey` (`id_producto`),
  ADD KEY `RegistroProductos_id_bodega_fkey` (`id_bodega`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_usuarios_id_usuario_fkey` (`id_usuario`),
  ADD KEY `roles_usuarios_id_rol_fkey` (`id_rol`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `titulados`
--
ALTER TABLE `titulados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Usuarios_cedula_key` (`cedula`),
  ADD UNIQUE KEY `Usuarios_email_key` (`email`),
  ADD KEY `Usuarios_id_area_fkey` (`id_area`),
  ADD KEY `Usuarios_id_ficha_fkey` (`id_ficha`);

--
-- Indices de la tabla `usuarios_centros_formacion`
--
ALTER TABLE `usuarios_centros_formacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_centros_formacion_id_usuario_fkey` (`id_usuario`),
  ADD KEY `usuarios_centros_formacion_id_centro_formacion_fkey` (`id_centro_formacion`);

--
-- Indices de la tabla `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesos`
--
ALTER TABLE `accesos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alertavencimiento`
--
ALTER TABLE `alertavencimiento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `areas_centros_formacion`
--
ALTER TABLE `areas_centros_formacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bodega`
--
ALTER TABLE `bodega`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `centroformacion`
--
ALTER TABLE `centroformacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallesentrega`
--
ALTER TABLE `detallesentrega`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallesolicitud`
--
ALTER TABLE `detallesolicitud`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entregamaterial`
--
ALTER TABLE `entregamaterial`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fichasformacion`
--
ALTER TABLE `fichasformacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registroproductos`
--
ALTER TABLE `registroproductos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `titulados`
--
ALTER TABLE `titulados`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios_centros_formacion`
--
ALTER TABLE `usuarios_centros_formacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `Accesos_id_opcion_fkey` FOREIGN KEY (`id_opcion`) REFERENCES `opciones` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `Accesos_id_rol_fkey` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `alertavencimiento`
--
ALTER TABLE `alertavencimiento`
  ADD CONSTRAINT `AlertaVencimiento_id_producto_fkey` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `areas_centros_formacion`
--
ALTER TABLE `areas_centros_formacion`
  ADD CONSTRAINT `areas_centros_formacion_id_area_fkey` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `areas_centros_formacion_id_centro_formacion_fkey` FOREIGN KEY (`id_centro_formacion`) REFERENCES `centroformacion` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallesentrega`
--
ALTER TABLE `detallesentrega`
  ADD CONSTRAINT `DetallesEntrega_id_entrega_fkey` FOREIGN KEY (`id_entrega`) REFERENCES `entregamaterial` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `DetallesEntrega_id_producto_fkey` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallesolicitud`
--
ALTER TABLE `detallesolicitud`
  ADD CONSTRAINT `DetalleSolicitud_id_producto_fkey` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `DetalleSolicitud_id_solicitud_fkey` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `fichasformacion`
--
ALTER TABLE `fichasformacion`
  ADD CONSTRAINT `FichasFormacion_id_titulado_fkey` FOREIGN KEY (`id_titulado`) REFERENCES `titulados` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `Productos_id_area_fkey` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `registroproductos`
--
ALTER TABLE `registroproductos`
  ADD CONSTRAINT `RegistroProductos_id_bodega_fkey` FOREIGN KEY (`id_bodega`) REFERENCES `bodega` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `RegistroProductos_id_producto_fkey` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD CONSTRAINT `roles_usuarios_id_rol_fkey` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_usuarios_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `Usuarios_id_area_fkey` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Usuarios_id_ficha_fkey` FOREIGN KEY (`id_ficha`) REFERENCES `fichasformacion` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios_centros_formacion`
--
ALTER TABLE `usuarios_centros_formacion`
  ADD CONSTRAINT `usuarios_centros_formacion_id_centro_formacion_fkey` FOREIGN KEY (`id_centro_formacion`) REFERENCES `centroformacion` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_centros_formacion_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

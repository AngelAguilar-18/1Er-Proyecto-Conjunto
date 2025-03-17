-- Inserción de datos en la tabla Usuarios
INSERT INTO Usuarios (Nombre, Apellido, CorreoElectronico, Contraseña, Direccion, Telefono, TipoUsuario) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', '$2a$12$aQ1P6CJ3dCU/WRQvjf3bT.xp0zPGf9K2zvs1P2hGuwQPl/dGQ9vfK', 'Calle Mayor 123, Madrid', '612345678', 'cliente'),
('María', 'González', 'maria.gonzalez@email.com', '$2a$12$bR2Q5J4dFU/WBQpvj6fbU.zp8zIPf8K3zvs9P7hGcwQPm/dHD2vgK', 'Avenida Libertad 45, Barcelona', '623456789', 'cliente'),
('Carlos', 'Rodríguez', 'carlos.rodriguez@email.com', '$2a$12$cS3R6K5eGV/XCRqwk7gcV.zp9zJQg9K4zvs0P8hGdxQPn/dID3vhK', 'Plaza España 7, Sevilla', '634567890', 'cliente'),
('Laura', 'Fernández', 'laura.fernandez@email.com', '$2a$12$dT4S7L6fHW/YDSrxl8hdW.zp0zKRh0K5zvs2P9hGefQPo/dJE4viK', 'Calle Gran Vía 34, Valencia', '645678901', 'cliente'),
('Antonio', 'López', 'antonio.lopez@email.com', '$2a$12$eU5T8M7gIX/ZETsym9ieX.zp1zLSi1K6zvs3P0hGfgQPp/dKF5vjK', 'Avenida de la Paz 89, Bilbao', '656789012', 'cliente'),
('Sofía', 'Martínez', 'sofia.martinez@email.com', '$2a$12$fV6U9N8hJY/AEUszo0jfY.zp2zMTj2K7zvs4P1hGghQPq/dLG6vkK', 'Calle Alcalá 56, Madrid', '667890123', 'cliente'),
('Miguel', 'Sánchez', 'miguel.sanchez@email.com', '$2a$12$gW7V0O9iKZ/BFUtzp1kgZ.zp3zNUk3K8zvs5P2hGhiQPr/dMH7vlK', 'Paseo del Prado 12, Madrid', '678901234', 'cliente'),
('Ana', 'Díaz', 'ana.diaz@email.com', '$2a$12$hX8W1P0jLa/CFVtzq2lha.zp4zOVl4K9zvs6P3hGijQPs/dNI8vmK', 'Rambla Catalunya 23, Barcelona', '689012345', 'cliente'),
('Pablo', 'García', 'pablo.garcia@email.com', '$2a$12$iY9X2Q1kMb/DGWusr3mib.zp5zPWm5K0zvs7P4hGjkQPt/dOJ9vnK', 'Calle Sierpes 45, Sevilla', '690123456', 'administrador'),
('Elena', 'Hernández', 'elena.hernandez@email.com', '$2a$12$jZ0Y3R2lNc/EHXvts4njc.zp6zQXn6K1zvs8P5hGklQPu/dPK0voK', 'Plaza del Pilar 78, Zaragoza', '601234567', 'administrador');

-- Inserción de datos en la tabla Categorías
INSERT INTO Categorias (NombreCategoria, Descripcion) VALUES
('Electrónica', 'Productos electrónicos como smartphones, tablets y accesorios'),
('Hogar', 'Artículos para el hogar y decoración'),
('Moda', 'Ropa, calzado y accesorios de moda'),
('Deportes', 'Equipamiento y ropa deportiva'),
('Belleza', 'Productos de belleza y cuidado personal'),
('Libros', 'Libros físicos y digitales de diferentes géneros'),
('Juguetes', 'Juguetes y artículos para niños'),
('Jardín', 'Artículos para jardín y exteriores'),
('Alimentos', 'Productos alimenticios gourmet y básicos'),
('Mascotas', 'Productos para el cuidado y alimentación de mascotas');

-- Inserción de datos en la tabla Productos
INSERT INTO Productos (Nombre, Descripcion, Precio, Stock, CategoriaID, Imagen) VALUES
('Smartphone Galaxy S25', 'Último modelo de Samsung con pantalla AMOLED de 6.7 pulgadas', 899.99, 50, 1, 'images/smartphone_galaxy.jpg'),
('Aspiradora Robot XYZ', 'Aspiradora inteligente con mapeo láser y control por app', 349.99, 30, 2, 'images/aspiradora_robot.jpg'),
('Zapatillas Running Pro', 'Zapatillas ultraligeras para corredores profesionales', 129.95, 75, 4, 'images/zapatillas_running.jpg'),
('Set Cuidado Facial', 'Kit completo con 5 productos para el cuidado facial diario', 79.50, 40, 5, 'images/set_facial.jpg'),
('Novela "El camino invisible"', 'Bestseller internacional de ficción histórica', 24.99, 100, 6, 'images/novela_camino.jpg'),
('Consola de Videojuegos', 'Última generación con 1TB de almacenamiento y 2 mandos', 599.99, 20, 1, 'images/consola_videojuegos.jpg'),
('Sillón Reclinable', 'Sillón de cuero con función reclinable y masaje', 449.95, 15, 2, 'images/sillon_reclinable.jpg'),
('Bicicleta Montaña Pro', 'Bicicleta de montaña con 24 velocidades y suspensión doble', 799.00, 10, 4, 'images/bicicleta_montana.jpg'),
('Collar Antiestrés para Perros', 'Collar que libera feromonas para reducir la ansiedad', 39.95, 60, 10, 'images/collar_perros.jpg'),
('Set de Jardín', 'Conjunto de herramientas básicas para el cuidado del jardín', 85.50, 25, 8, 'images/set_jardin.jpg');

-- Inserción de datos en la tabla Carrito de compras
INSERT INTO CarritoCompras (UsuarioID, ProductoID, Cantidad, FechaAgregado) VALUES
(1, 3, 1, '2025-03-12 10:35:22'),
(2, 5, 2, '2025-03-13 14:20:15'),
(3, 1, 1, '2025-03-14 09:45:30'),
(4, 7, 1, '2025-03-14 16:50:10'),
(5, 9, 3, '2025-03-15 11:25:45'),
(1, 6, 1, '2025-03-15 13:15:20'),
(6, 4, 2, '2025-03-16 10:10:05'),
(7, 2, 1, '2025-03-16 17:30:40'),
(8, 10, 1, '2025-03-16 19:45:25'),
(9, 8, 1, '2025-03-17 08:05:50');

-- Inserción de datos en la tabla Órdenes
INSERT INTO Ordenes (UsuarioID, TotalCompra, EstadoPedido, FechaOrden) VALUES
(1, 729.94, 'entregado', '2025-02-10 14:30:20'),
(2, 49.98, 'entregado', '2025-02-15 09:20:15'),
(3, 899.99, 'enviado', '2025-02-20 16:45:30'),
(4, 449.95, 'enviado', '2025-02-25 11:10:45'),
(5, 119.85, 'en proceso', '2025-03-01 13:25:50'),
(6, 159.00, 'en proceso', '2025-03-05 15:40:25'),
(7, 349.99, 'pendiente', '2025-03-10 10:15:30'),
(8, 85.50, 'pendiente', '2025-03-12 12:35:20'),
(9, 799.00, 'pendiente', '2025-03-15 14:50:40'),
(10, 899.99, 'pendiente', '2025-03-17 09:05:15');

-- Inserción de datos en la tabla Detalles de la orden
INSERT INTO DetallesOrden (OrdenID, ProductoID, Cantidad, PrecioUnitario, Subtotal) VALUES
(1, 3, 1, 129.95, 129.95),
(1, 6, 1, 599.99, 599.99),
(2, 5, 2, 24.99, 49.98),
(3, 1, 1, 899.99, 899.99),
(4, 7, 1, 449.95, 449.95),
(5, 9, 3, 39.95, 119.85),
(6, 4, 2, 79.50, 159.00),
(7, 2, 1, 349.99, 349.99),
(8, 10, 1, 85.50, 85.50),
(9, 8, 1, 799.00, 799.00),
(10, 1, 1, 899.99, 899.99);

-- Inserción de datos en la tabla Métodos de pago
INSERT INTO MetodosPago (UsuarioID, TipoPago, DatosPago, EstadoPago) VALUES
(1, 'tarjeta', 'enc_data_1', 'completado'),
(2, 'PayPal', 'enc_data_2', 'completado'),
(3, 'tarjeta', 'enc_data_3', 'completado'),
(4, 'transferencia', 'enc_data_4', 'completado'),
(5, 'PayPal', 'enc_data_5', 'completado'),
(6, 'tarjeta', 'enc_data_6', 'pendiente'),
(7, 'transferencia', 'enc_data_7', 'pendiente'),
(8, 'efectivo', 'enc_data_8', 'pendiente'),
(9, 'tarjeta', 'enc_data_9', 'pendiente'),
(10, 'PayPal', 'enc_data_10', 'pendiente');

-- Inserción de datos en la tabla Envíos
INSERT INTO Envios (OrdenID, DireccionEnvio, MetodoEnvio, EstadoEnvio, NumeroSeguimiento, FechaEntregaEstimada) VALUES
(1, 'Calle Mayor 123, Madrid', 'Estándar', 'entregado', 'TRACK123456', '2025-02-15'),
(2, 'Avenida Libertad 45, Barcelona', 'Express', 'entregado', 'TRACK234567', '2025-02-18'),
(3, 'Plaza España 7, Sevilla', 'Estándar', 'enviado', 'TRACK345678', '2025-02-25'),
(4, 'Calle Gran Vía 34, Valencia', 'Express', 'enviado', 'TRACK456789', '2025-03-01'),
(5, 'Avenida de la Paz 89, Bilbao', 'Estándar', 'procesando', 'TRACK567890', '2025-03-07'),
(6, 'Calle Alcalá 56, Madrid', 'Express', 'procesando', 'TRACK678901', '2025-03-08'),
(7, 'Paseo del Prado 12, Madrid', 'Estándar', 'pendiente', NULL, '2025-03-15'),
(8, 'Rambla Catalunya 23, Barcelona', 'Express', 'pendiente', NULL, '2025-03-14'),
(9, 'Calle Sierpes 45, Sevilla', 'Estándar', 'pendiente', NULL, '2025-03-20'),
(10, 'Plaza del Pilar 78, Zaragoza', 'Express', 'pendiente', NULL, '2025-03-19');

-- Inserción de datos en la tabla Facturas
INSERT INTO Facturas (OrdenID, FechaEmision, Total, DatosFiscales) VALUES
(1, '2025-02-10 14:35:00', 729.94, 'NIF: 12345678A, Juan Pérez, Calle Mayor 123, Madrid'),
(2, '2025-02-15 09:25:00', 49.98, 'NIF: 23456789B, María González, Avenida Libertad 45, Barcelona'),
(3, '2025-02-20 16:50:00', 899.99, 'NIF: 34567890C, Carlos Rodríguez, Plaza España 7, Sevilla'),
(4, '2025-02-25 11:15:00', 449.95, 'NIF: 45678901D, Laura Fernández, Calle Gran Vía 34, Valencia'),
(5, '2025-03-01 13:30:00', 119.85, 'NIF: 56789012E, Antonio López, Avenida de la Paz 89, Bilbao'),
(6, '2025-03-05 15:45:00', 159.00, 'NIF: 67890123F, Sofía Martínez, Calle Alcalá 56, Madrid'),
(7, '2025-03-10 10:20:00', 349.99, 'NIF: 78901234G, Miguel Sánchez, Paseo del Prado 12, Madrid'),
(8, '2025-03-12 12:40:00', 85.50, 'NIF: 89012345H, Ana Díaz, Rambla Catalunya 23, Barcelona'),
(9, '2025-03-15 14:55:00', 799.00, 'NIF: 90123456I, Pablo García, Calle Sierpes 45, Sevilla'),
(10, '2025-03-17 09:10:00', 899.99, 'NIF: 01234567J, Elena Hernández, Plaza del Pilar 78, Zaragoza');
create database ProyectoConjunto1;
use ProyectoConjunto1;

CREATE TABLE Usuarios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL UNIQUE,
    Contraseña VARCHAR(255) NOT NULL,
    Direccion TEXT,
    Telefono VARCHAR(20),
    TipoUsuario ENUM('cliente', 'administrador') DEFAULT 'cliente'
);

-- Creación de tabla Categorías
CREATE TABLE Categorias (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NombreCategoria VARCHAR(50) NOT NULL UNIQUE,
    Descripcion TEXT
);

-- Creación de tabla Productos
CREATE TABLE Productos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL DEFAULT 0,
    CategoriaID INT,
    Imagen VARCHAR(255),  -- URL o ruta de la imagen
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(ID) ON DELETE SET NULL
);

-- Creación de tabla Carrito de compras
CREATE TABLE CarritoCompras (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL DEFAULT 1,
    FechaAgregado DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID) ON DELETE CASCADE,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ID) ON DELETE CASCADE
);

-- Creación de tabla Órdenes
CREATE TABLE Ordenes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT NOT NULL,
    TotalCompra DECIMAL(10, 2) NOT NULL,
    EstadoPedido ENUM('pendiente', 'en proceso', 'enviado', 'entregado') DEFAULT 'pendiente',
    FechaOrden DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID) ON DELETE CASCADE
);

-- Creación de tabla Detalles de la orden
CREATE TABLE DetallesOrden (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    OrdenID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrdenID) REFERENCES Ordenes(ID) ON DELETE CASCADE,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ID) ON DELETE CASCADE
);

-- Creación de tabla Métodos de pago
CREATE TABLE MetodosPago (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT NOT NULL,
    TipoPago ENUM('tarjeta', 'PayPal', 'transferencia', 'efectivo') NOT NULL,
    DatosPago TEXT,  -- Datos encriptados del pago
    EstadoPago ENUM('pendiente', 'completado', 'rechazado', 'reembolsado') DEFAULT 'pendiente',
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID) ON DELETE CASCADE
);

-- Creación de tabla Envíos
CREATE TABLE Envios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    OrdenID INT NOT NULL,
    DireccionEnvio TEXT NOT NULL,
    MetodoEnvio VARCHAR(50) NOT NULL,
    EstadoEnvio ENUM('pendiente', 'procesando', 'enviado', 'entregado') DEFAULT 'pendiente',
    NumeroSeguimiento VARCHAR(50),
    FechaEntregaEstimada DATE,
    FOREIGN KEY (OrdenID) REFERENCES Ordenes(ID) ON DELETE CASCADE
);

-- Creación de tabla Facturas
CREATE TABLE Facturas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    OrdenID INT NOT NULL,
    FechaEmision DATETIME DEFAULT CURRENT_TIMESTAMP,
    Total DECIMAL(10, 2) NOT NULL,
    DatosFiscales TEXT,
    FOREIGN KEY (OrdenID) REFERENCES Ordenes(ID) ON DELETE CASCADE
);

-- Índices para mejorar el rendimiento
CREATE INDEX idx_usuarios_correo ON Usuarios(CorreoElectronico);
CREATE INDEX idx_productos_categoria ON Productos(CategoriaID);
CREATE INDEX idx_carrito_usuario ON CarritoCompras(UsuarioID);
CREATE INDEX idx_ordenes_usuario ON Ordenes(UsuarioID);
CREATE INDEX idx_detalles_orden ON DetallesOrden(OrdenID);
CREATE INDEX idx_envios_orden ON Envios(OrdenID);
CREATE INDEX idx_facturas_orden ON Facturas(OrdenID);
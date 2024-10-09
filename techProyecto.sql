CREATE DATABASE tech4good;
USE tech4good;

CREATE TABLE donantes (
    id INT IDENTITY(1,1) PRIMARY KEY,  -- IDENTITY en SQL Server reemplaza AUTO_INCREMENT
    nombre NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL,
    telefono NVARCHAR(15),
    ubicacion NVARCHAR(100),
    created_at DATETIME DEFAULT GETDATE()  -- Fecha de creaci�n
);
GO


CREATE TABLE donaciones (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_donante INT NOT NULL,  -- Clave for�nea
    producto NVARCHAR(100) NOT NULL,
    estado NVARCHAR(20) DEFAULT 'pendiente',  -- No hay ENUM en SQL Server, as� que usamos NVARCHAR
    fecha_donacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_donante) REFERENCES donantes(id)  -- Clave for�nea que referencia a la tabla donantes
);
GO


CREATE TABLE productos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_donacion INT NOT NULL,
    tipo_producto NVARCHAR(100) NOT NULL,  -- Tipo de producto (Ej. Laptop, Tel�fono)
    marca NVARCHAR(100),
    modelo NVARCHAR(100),
    ubicacion_actual NVARCHAR(100) DEFAULT 'almacen',  -- Estado de ubicaci�n actual
    fecha_registro DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_donacion) REFERENCES donaciones(id)  -- Clave for�nea
);
GO


CREATE TABLE usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_usuario NVARCHAR(50) NOT NULL,
    password NVARCHAR(255) NOT NULL,  -- Contrase�a encriptada
    rol NVARCHAR(20) DEFAULT 'admin',  -- Roles: admin o empleado
    created_at DATETIME DEFAULT GETDATE()  -- Fecha de creaci�n
);
GO


CREATE TABLE reportes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tipo_reporte NVARCHAR(100) NOT NULL,  -- Tipo de reporte generado
    contenido NVARCHAR(MAX) NOT NULL,  -- Contenido del reporte
    fecha_generacion DATETIME DEFAULT GETDATE()  -- Fecha de generaci�n del reporte
);
GO

-- Insertar algunos donantes
INSERT INTO donantes (nombre, email, telefono, ubicacion)
VALUES 
('Juan P�rez', 'juan@example.com', '5551234567', 'Ciudad de M�xico'),
('Mar�a L�pez', 'maria@example.com', '5559876543', 'Monterrey');
GO

-- Insertar donaciones para los donantes
INSERT INTO donaciones (id_donante, producto, estado)
VALUES 
(1, 'Laptop Dell', 'pendiente'),
(2, 'Tel�fono Samsung', 'recibido');
GO

-- Insertar productos
INSERT INTO productos (id_donacion, tipo_producto, marca, modelo)
VALUES
(1, 'Laptop', 'Dell', 'Inspiron 15'),
(2, 'Tel�fono', 'Samsung', 'Galaxy S10');
GO



select * from productos;
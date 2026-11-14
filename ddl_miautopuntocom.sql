CREATE DATABASE IF NOT EXISTS MiAutoPuntoCom;
USE MiAutoPuntoCom;

-- Tabla Vehiculos
CREATE TABLE Vehiculos (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    color VARCHAR(30) NOT NULL,
    precio DECIMAL(12, 2) NOT NULL,
    vin VARCHAR(17) NOT NULL UNIQUE,
    tipo VARCHAR(30) NOT NULL,
    estado VARCHAR(10) NOT NULL,
    CONSTRAINT chk_anio CHECK (anio >= 1900 AND anio <= 2026),
    CONSTRAINT chk_precio_vehiculo CHECK (precio > 0),
    CONSTRAINT chk_estado CHECK (estado IN ('Nuevo', 'Usado'))
);

-- Tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    cedula VARCHAR(20) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    direccion VARCHAR(200) NOT NULL
);

-- Tabla Vendedores (se incluye fecha_nacimiento para validar la edad >= 21)
CREATE TABLE Vendedores (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    cedula VARCHAR(20) NOT NULL UNIQUE,
    fecha_nacimiento DATE NOT NULL,
    fecha_contratacion DATE NOT NULL,
    comision_porcentual DECIMAL(5, 2) NOT NULL,
    CONSTRAINT chk_comision CHECK (comision_porcentual >= 0 AND comision_porcentual <= 20),
    CONSTRAINT chk_edad_vendedor CHECK (fecha_nacimiento <= '2005-11-13')
);

-- Tabla Ventas
CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_vehiculo INT NOT NULL UNIQUE,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    fecha_venta DATE NOT NULL,
    precio_final DECIMAL(12, 2) NOT NULL,
    metodo_pago VARCHAR(20) NOT NULL,
    CONSTRAINT chk_precio_venta CHECK (precio_final > 0),
    CONSTRAINT chk_metodo_pago CHECK (metodo_pago IN ('efectivo', 'financiamiento', 'tarjeta')),
    CONSTRAINT fk_venta_vehiculo FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo),
    CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    CONSTRAINT fk_venta_vendedor FOREIGN KEY (id_vendedor) REFERENCES Vendedores(id_vendedor)
);



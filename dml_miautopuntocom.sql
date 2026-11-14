USE MiAutoPuntoCom;

-- 10 Vehículos
INSERT INTO Vehiculos (marca, modelo, anio, color, precio, vin, tipo, estado) VALUES
('Toyota', 'Corolla', 2025, 'Blanco', 24500.00, '1NXBR32E85Z500001', 'Sedán', 'Nuevo'),
('Toyota', 'RAV4', 2024, 'Gris', 34000.00, '2T3BFREV8EW100002', 'SUV', 'Nuevo'),
('Honda', 'Civic', 2022, 'Negro', 19500.00, '2HGFC2F59HH500003', 'Sedán', 'Usado'),
('Ford', 'Ranger', 2025, 'Azul', 41000.00, '1FTYR10D87P500004', 'Camioneta', 'Nuevo'),
('Hyundai', 'Tucson', 2023, 'Rojo', 26800.00, 'KM8J3CA46JU500005', 'SUV', 'Usado'),
('Toyota', 'Hilux', 2026, 'Plata', 45000.00, '8AJFZ29G006500006', 'Camioneta', 'Nuevo'),
('Nissan', 'Sentra', 2021, 'Blanco', 15200.00, '3N1AB7AP5HY500007', 'Sedán', 'Usado'),
('Mazda', 'CX-5', 2025, 'Gris', 32500.00, 'JM3KFBDM8K0500008', 'SUV', 'Nuevo'),
('Kia', 'Sportage', 2024, 'Negro', 28900.00, 'KNDPM3AC5K7500009', 'SUV', 'Usado'),
('Chevrolet', 'Colorado', 2023, 'Blanco', 33000.00, '1GCGTCE30G1500010', 'Camioneta', 'Usado');

-- 6 Clientes
INSERT INTO Clientes (nombre, apellido, cedula, telefono, email, direccion) VALUES
('Carlos', 'Mendoza', '1-1234-5678', '8811-2233', 'carlos.mendoza@email.com', 'San José, Escazú'),
('María', 'Fernández', '2-0456-0789', '8822-3344', 'maria.fernandez@email.com', 'Alajuela, Centro'),
('José', 'Ramírez', '3-0321-0654', '8833-4455', 'jose.ramirez@email.com', 'Cartago, Tres Ríos'),
('Laura', 'Gómez', '4-0987-0123', '8844-5566', 'laura.gomez@email.com', 'Heredia, Belén'),
('Andrés', 'Solís', '1-1555-0888', '8855-6677', 'andres.solis@email.com', 'San José, Curridabat'),
('Sofía', 'Vargas', '5-0444-0999', '8866-7788', 'sofia.vargas@email.com', 'Guanacaste, Liberia');

-- 4 Vendedores (todos mayores de 21 años)
INSERT INTO Vendedores (nombre, apellido, cedula, fecha_nacimiento, fecha_contratacion, comision_porcentual) VALUES
('Roberto', 'Jiménez', '1-1111-1111', '1990-05-14', '2020-01-15', 5.50),
('Elena', 'Castro', '2-2222-2222', '1995-08-22', '2021-06-01', 6.00),
('Diego', 'Mora', '3-3333-3333', '1988-11-30', '2019-03-10', 7.00),
('Valeria', 'Rojas', '4-4444-4444', '1998-02-10', '2023-09-20', 4.50);

-- 8 Ventas (quedan 2 vehículos disponibles: id 8 y id 10)
INSERT INTO Ventas (id_vehiculo, id_cliente, id_vendedor, fecha_venta, precio_final, metodo_pago) VALUES
(1, 1, 1, '2026-10-20', 24000.00, 'financiamiento'),
(2, 2, 1, '2026-11-02', 33500.00, 'tarjeta'),
(3, 3, 2, '2026-09-15', 19000.00, 'efectivo'),
(4, 4, 2, '2026-11-05', 40500.00, 'financiamiento'),
(5, 5, 3, '2026-08-10', 26000.00, 'tarjeta'),
(6, 1, 3, '2026-11-10', 44500.00, 'financiamiento'),
(7, 6, 4, '2026-10-28', 15000.00, 'efectivo'),
(9, 2, 1, '2026-11-12', 28500.00, 'tarjeta');

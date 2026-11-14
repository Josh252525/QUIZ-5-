USE MiAutoPuntoCom;

-- 1. Listar todos los vehículos disponibles (no vendidos) ordenados por precio descendente
SELECT v.*
FROM Vehiculos v
LEFT JOIN Ventas vt ON v.id_vehiculo = vt.id_vehiculo
WHERE vt.id_venta IS NULL
ORDER BY v.precio DESC;

-- 2. Mostrar el total de ventas realizadas por cada vendedor (nombre del vendedor y cantidad de ventas)
SELECT 
    CONCAT(vd.nombre, ' ', vd.apellido) AS vendedor,
    COUNT(vt.id_venta) AS cantidad_ventas
FROM Vendedores vd
LEFT JOIN Ventas vt ON vd.id_vendedor = vt.id_vendedor
GROUP BY vd.id_vendedor, vd.nombre, vd.apellido;

-- 3. Calcular el ingreso total generado por cada vendedor
SELECT 
    CONCAT(vd.nombre, ' ', vd.apellido) AS vendedor,
    COALESCE(SUM(vt.precio_final), 0) AS ingreso_total
FROM Vendedores vd
LEFT JOIN Ventas vt ON vd.id_vendedor = vt.id_vendedor
GROUP BY vd.id_vendedor, vd.nombre, vd.apellido;

-- 4. Encontrar el cliente que ha realizado la compra más costosa
SELECT 
    c.nombre,
    c.apellido,
    c.cedula,
    vt.precio_final AS monto_compra
FROM Clientes c
JOIN Ventas vt ON c.id_cliente = vt.id_cliente
ORDER BY vt.precio_final DESC
LIMIT 1;

-- 5. Listar los vehículos vendidos en el último mes con información del cliente comprador
SELECT 
    v.marca,
    v.modelo,
    v.anio,
    v.vin,
    vt.fecha_venta,
    vt.precio_final,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente_comprador,
    c.telefono,
    c.email
FROM Ventas vt
JOIN Vehiculos v ON vt.id_vehiculo = v.id_vehiculo
JOIN Clientes c ON vt.id_cliente = c.id_cliente
WHERE vt.fecha_venta >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 6. Calcular la comisión ganada por cada vendedor basado en sus ventas
SELECT 
    CONCAT(vd.nombre, ' ', vd.apellido) AS vendedor,
    vd.comision_porcentual,
    COALESCE(SUM(vt.precio_final * (vd.comision_porcentual / 100)), 0) AS comision_ganada
FROM Vendedores vd
LEFT JOIN Ventas vt ON vd.id_vendedor = vt.id_vendedor
GROUP BY vd.id_vendedor, vd.nombre, vd.apellido, vd.comision_porcentual;

-- 7. Mostrar el promedio de precios de vehículos vendidos agrupados por tipo
SELECT 
    v.tipo,
    ROUND(AVG(vt.precio_final), 2) AS promedio_precio_venta
FROM Ventas vt
JOIN Vehiculos v ON vt.id_vehiculo = v.id_vehiculo
GROUP BY v.tipo;

-- 8. Identificar qué marca de vehículo se ha vendido más veces
SELECT 
    v.marca,
    COUNT(vt.id_venta) AS total_vendidos
FROM Ventas vt
JOIN Vehiculos v ON vt.id_vehiculo = v.id_vehiculo
GROUP BY v.marca
ORDER BY total_vendidos DESC
LIMIT 1;

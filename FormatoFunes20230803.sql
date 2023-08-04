
-- Crearemos la base de datos fastfood
DROP DATABASE IF EXISTS `fastfood`;

CREATE DATABASE IF NOT EXISTS FASTFOOD;
USE FASTFOOD;


-- CREACION DE FUNCIONES
-- FUNCION 1: Esta función toma un rango de fechas como entrada y devuelve la cantidad total de productos vendidos entre esas fechas.

DELIMITER //

CREATE FUNCTION TotalProductosVendidos(
    fecha_inicio DATE,
    fecha_fin DATE
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total_vendidos INT;
    
    SELECT SUM(o.Id_Producto) INTO total_vendidos
    FROM ORDEN o
    INNER JOIN FACTURACION f ON o.Id_Orden = f.Id_Orden
    WHERE o.Fecha BETWEEN fecha_inicio AND fecha_fin;
    
    RETURN total_vendidos;
END //

DELIMITER ;

-- FUNCION 2 : Esta función devuelve la ciudad de los clientes que han hecho ordenes.
DELIMITER //

CREATE FUNCTION ClientesPorCiudad(ciudad_nombre VARCHAR(50))
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE clientes_ciudad INT;
    
    SELECT COUNT(o.Id_Cliente) INTO clientes_ciudad
    FROM ORDEN o
    INNER JOIN CLIENTES cl ON cl.Id_Cliente = o.Id_Cliente
    INNER JOIN CIUDADES c ON c.Id_Ciudad = cl.Id_Ciudad
    WHERE c.Nombre = ciudad_nombre;
	RETURN clientes_ciudad;
END //

DELIMITER ;


-- CREACION DE TABLAS

DROP TABLE IF EXISTS FACTURACION;
DROP TABLE IF EXISTS ORDEN;
DROP TABLE IF EXISTS PRODUCTO;
DROP TABLE IF EXISTS EMPLEADOS;
DROP TABLE IF EXISTS CLIENTES;
DROP TABLE IF EXISTS PROVEEDORES;
DROP TABLE IF EXISTS METODOPAGO;
DROP TABLE IF EXISTS DELIVERY;
DROP TABLE IF EXISTS CARGOS;
DROP TABLE IF EXISTS CIUDADES;

CREATE TABLE IF NOT EXISTS CARGOS (
    Id_Cargo INT NOT NULL UNIQUE AUTO_INCREMENT,
    Descripcion VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id_Cargo)
);

CREATE TABLE CIUDADES (
Id_Ciudad INT NOT NULL UNIQUE AUTO_INCREMENT,
Nombre VARCHAR (50) NOT NULL,
PRIMARY KEY (Id_Ciudad)
);

CREATE TABLE IF NOT EXISTS CLIENTES (
    Id_Cliente INT NOT NULL UNIQUE AUTO_INCREMENT,
    Nombre_Apellido VARCHAR(50) NOT NULL,
    Id_Ciudad INT,
    PRIMARY KEY (Id_Cliente),
     FOREIGN KEY (Id_Ciudad) REFERENCES CIUDADES (Id_Ciudad)
);

CREATE TABLE IF NOT EXISTS DELIVERY (
    Id_Delivery INT NOT NULL UNIQUE AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Id_Ciudad INT NOT NULL,
    PRIMARY KEY (Id_Delivery),
	FOREIGN KEY (Id_Ciudad) REFERENCES CIUDADES (Id_Ciudad)
    
);

CREATE TABLE IF NOT EXISTS METODOPAGO (
    Id_MPago INT NOT NULL UNIQUE AUTO_INCREMENT,
    Metodo VARCHAR(50) NOT NULL,
    EntidadFinanciera VARCHAR(10) NOT NULL,
    Cuotas INT NOT NULL,
    PRIMARY KEY (Id_MPago)
);

CREATE TABLE IF NOT EXISTS PROVEEDORES (
    Id_Proveedor INT NOT NULL UNIQUE AUTO_INCREMENT,
    Razon_Social VARCHAR(150) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Email VARCHAR(130) NOT NULL,
    PRIMARY KEY (Id_Proveedor)
);


CREATE TABLE IF NOT EXISTS EMPLEADOS (
    Id_Empleado INT NOT NULL UNIQUE AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Legajo INT NOT NULL,
    Horario VARCHAR(20) NOT NULL,
    Id_Cargo INT NOT NULL,
    PRIMARY KEY (Id_Empleado),
    FOREIGN KEY (Id_Cargo) REFERENCES CARGOS (Id_Cargo)
);


CREATE TABLE IF NOT EXISTS PRODUCTO (
    Id_Producto INT NOT NULL UNIQUE AUTO_INCREMENT,
    Descripcion VARCHAR(300) NOT NULL,
    Id_Proveedor INT NOT NULL,
    Cantidad INT NOT NULL,
    Valor FLOAT NOT NULL,
    PRIMARY KEY (Id_Producto),
    FOREIGN KEY (Id_Proveedor) REFERENCES PROVEEDORES (Id_Proveedor)
);

CREATE TABLE IF NOT EXISTS ORDEN (
    Id_Orden INT NOT NULL UNIQUE AUTO_INCREMENT,
    Id_Empleado INT NOT NULL,
    Id_Cliente INT NOT NULL,
    Id_Producto INT NOT NULL,
    Fecha DATE NOT NULL,
    Importe FLOAT NOT NULL,
    Id_Mpago INT NOT NULL,
    Mesa INT NOT NULL,
    PRIMARY KEY (Id_Orden),
    FOREIGN KEY (Id_Empleado) REFERENCES EMPLEADOS (Id_Empleado),
    FOREIGN KEY (Id_Cliente) REFERENCES CLIENTES (Id_Cliente),
    FOREIGN KEY (Id_Producto) REFERENCES PRODUCTO (Id_Producto),
    FOREIGN KEY (Id_Mpago) REFERENCES METODOPAGO (Id_MPago)
);

CREATE TABLE IF NOT EXISTS FACTURACION (
    Id_Factura INT NOT NULL UNIQUE AUTO_INCREMENT,
    Id_Orden INT NOT NULL,
    Id_Cliente INT NOT NULL,
    Id_Producto INT NOT NULL,
    Id_Delivery INT NOT NULL,
    Importe FLOAT NOT NULL,
    Mesa INT NOT NULL,
    PRIMARY KEY (Id_Factura),
    FOREIGN KEY (Id_Orden) REFERENCES ORDEN (Id_Orden),
    FOREIGN KEY (Id_Cliente) REFERENCES CLIENTES (Id_Cliente),
    FOREIGN KEY (Id_Producto) REFERENCES PRODUCTO (Id_Producto),
    FOREIGN KEY (Id_Delivery) REFERENCES DELIVERY (Id_Delivery)
);

-- INSERCION DE REGISTROS EN TABLAS

USE FASTFOOD;
-- Insertamos registros en la tabla CARGOS
INSERT INTO CARGOS (Descripcion) VALUES
    ('Gerente de Restaurante'),
    ('Encargado de Cocina'),
    ('Cajero'),
    ('Repartidor de Pedidos'),
    ('Cocinero'),
    ('Atendente de Servicio al Cliente'),
    ('Jefe de Sucursal'),
    ('Asistente de Cocina'),
    ('Mesero'),
    ('Supervisor de Limpieza'),
    ('Barista'),
    ('Asesor de Ventas'),
    ('Preparador de Alimentos'),
    ('Operador de Caja'),
    ('Ayudante de Cocina'),
    ('Expendedor de Bebidas'),
    ('Servidor de Mesas'),
    ('Auxiliar de Limpieza'),
    ('Recepcionista de Pedidos'),
    ('Ayudante de Repartidor');
   
   INSERT INTO CIUDADES (Nombre) VALUES
   ('Ciudad Autonoma'),
    ('Buenos Aires'), 
    ('Mataderos'), 
    ('Liniers'),
    ('Moron'),
    ('Ramos_Mejia'),
     ('San_Justo'),
    ('Lanus'), 
    ('Adrogue'), 
    ('Paternal'),
    ('La_Boca'),
    ('Nuñez'),
	('Coghlan'),
    ('Almagro'), 
    ('Banfield'), 
    ('Montegrande'),
    ('Zarate'),
    ('Padua');

-- Insertamos registros en la tabla DELIVERY

INSERT INTO DELIVERY (Nombre, Telefono, Direccion, Id_Ciudad) VALUES
('Juan Perez', '555-1234', 'Calle 1 123', 1),
('María Gómez', '555-5678', 'Avenida 2 456', 2),
('Carlos Rodríguez', '555-9876', 'Calle 3 789', 3),
('Laura Sánchez', '555-2345', 'Avenida 4 012', 4),
('Pedro Ramírez', '555-6789', 'Calle 5 345', 5),
('Ana Martínez', '555-3456', 'Avenida 6 678', 6),
('Luis Morales', '555-8765', 'Calle 7 901', 7),
('Diana Castro', '555-4321', 'Avenida 8 234', 8),
('Oscar Rivas', '555-7654', 'Calle 9 567', 9),
('Gabriela Fernández', '555-2109', 'Avenida 10 890', 10),
('José Navarro', '555-6543', 'Calle 11 1234', 11),
('Fernanda Ortega', '555-1098', 'Avenida 12 5678', 12),
('Ricardo Herrera', '555-5432', 'Calle 13 9012', 13),
('Silvia Vargas', '555-0987', 'Avenida 14 3456', 14),
('Andrés Mendoza', '555-3210', 'Calle 15 6789', 15),
('Valentina Paredes', '555-7654', 'Avenida 16 0123', 16),
('Martín Suárez', '555-0123', 'Calle 17 4567', 17),
('Natalia Torres', '555-5678', 'Avenida 18 8901', 18),
('Hugo López', '555-2345', 'Calle 19 2345', 1),
('Carolina Aguilar', '555-6789', 'Avenida 20 5678', 2),
('Sergio Rojas', '555-8765', 'Calle 21 9012', 3),
('Elena Montes', '555-5432', 'Avenida 22 3456', 4),
('Javier Mendoza', '555-0987', 'Calle 23 6789', 5),
('Isabel Ramos', '555-3210', 'Avenida 24 0123', 6),
('Miguel Torres', '555-7654', 'Calle 25 4567', 7),
('Verónica Castro', '555-0123', 'Avenida 26 8901', 8),
('Roberto Soto', '555-5678', 'Calle 27 2345', 9),
('Carmen Vargas', '555-2345', 'Avenida 28 5678', 10),
('Raul Rojas', '555-6789', 'Calle 29 9012', 11),
('Ana Maria Sosa', '555-4321', 'Avenida 30 3456', 12),
('David Méndez', '555-1098', 'Calle 31 6789', 13),
('Beatriz Delgado', '555-5432', 'Avenida 32 0123', 14),
('Francisco Luna', '555-8765', 'Calle 33 4567', 15),
('Patricia Navarro', '555-3210', 'Avenida 34 8901', 16),
('Rafael Rojas', '555-7654', 'Calle 35 2345', 17),
('Lorena Paredes', '555-0987', 'Avenida 36 5678', 18),
('Felipe Cordero', '555-5678', 'Calle 37 9012', 1),
('Mónica Guzmán', '555-2345', 'Avenida 38 3456', 2),
('Santiago Jiménez', '555-6789', 'Calle 39 6789', 3),
('Cecilia Mendoza', '555-4321', 'Avenida 40 0123', 4),
('Diego Herrera', '555-1098', 'Calle 41 4567', 5),
('Alejandra Torres', '555-5432', 'Avenida 42 8901', 6),
('Mario Ramos', '555-8765', 'Calle 43 2345', 7),
('Lucía Soto', '555-3210', 'Avenida 44 5678', 8),
('Andrés Montes', '555-7654', 'Calle 45 9012', 9),
('Natalia Rojas', '555-0123', 'Avenida 46 3456', 10),
('Jorge Navarro', '555-5678', 'Calle 47 6789', 11),
('Paula Delgado', '555-2345', 'Avenida 48 0123', 12),
('Sebastián Luna', '555-6789', 'Calle 49 3456', 13),
('Adriana Vargas', '555-0987', 'Avenida 50 6789', 14);


-- Insertamos registros en la tabla METODOPAGO
INSERT INTO METODOPAGO (Metodo, EntidadFinanciera, Cuotas) VALUES
    ('Tarjeta de Crédito VISA', 'Galicia', 12),
    ('Tarjeta de Crédito VISA', 'Frances', 6),
    ('Tarjeta de Débito VISA', 'ICBC', 1),
    ('Efectivo', 'N/A', 0),
    ('Transferencia Bancaria', 'N/A', 1),
    ('Tarjeta de Crédito AMERICAN EXPRESS', 'Santander', 3),
    ('Tarjeta de Débito MASTERCARD', 'Provincia', 1),
	('Tarjeta de Crédito MASTERCARD', 'ICBC', 6);
    
    -- Insertamos registros en la tabla PROVEEDORES
INSERT INTO PROVEEDORES (Razon_Social, Direccion, Telefono, Email) VALUES
    ('Distribuidora Alimentos SA', 'Av. Libertador 1520', 5551122334, 'pedidos@distribuidoraalimentos.com'),
    ('Comestibles del Sur', 'Calle Buenos Aires 123', 5552233445, 'pedidos@comestiblesdelsur.com'),
    ('Bebidas Refrescantes SA', 'Av. San Martín 789', 5553344556, 'pedidos@bebidasrefrescantes.com'),
    ('Frutas Frescas SRL', 'Calle Corrientes 456', 5554455667, 'pedidos@frutasfrescas.com'),
    ('Carnicería El Gaucho', 'Av. Callao 789', 5555566778, 'pedidos@carniceriaelgaucho.com'),
    ('Panadería La Esquina', 'Calle Maipú 1010', 5556677889, 'pedidos@panaderialaesquina.com'),
    ('Lácteos del Campo', 'Av. Belgrano 1414', 5557788990, 'pedidos@lacteosdelcampo.com'),
    ('Dulces Delicias', 'Calle San Juan 1717', 5558899001, 'pedidos@dulcesdelicias.com'),
    ('Pescadería Mar y Río', 'Av. Paseo Colón 2020', 5559900112, 'pedidos@pescaderiamaryrio.com'),
    ('Distribuidora de Bebidas SA', 'Calle 9 de Julio 2323', 5550011223, 'pedidos@distribuidoradebebidas.com'),
    ('Carnicería San Jorge', 'Av. Rivadavia 2626', 5551122334, 'pedidos@carniceriasanjorge.com'),
    ('Frutas Tropicales', 'Calle Entre Ríos 3232', 5552233445, 'pedidos@frutastropicales.com'),
    ('Bebidas del Mundo', 'Av. Córdoba 3434', 5553344556, 'pedidos@bebidasdelmundo.com'),
    ('Dulces Encantados', 'Calle Santa Fe 4040', 5554455667, 'pedidos@dulcesencantados.com'),
    ('Carnicería La Estancia', 'Av. Corrientes 4848', 5555566778, 'pedidos@carnicerialaestancia.com'),
    ('Pescadería Sabores del Mar', 'Calle Sarmiento 5252', 5556677889, 'pedidos@pescaderiasaboresdelmar.com'),
    ('Comestibles San Martín', 'Av. Pueyrredón 5656', 5557788990, 'pedidos@comestiblessanmartin.com'),
    ('Frutería Fruta Fresca', 'Calle Lavalle 6464', 5558899001, 'pedidos@fruteriafrutafresca.com'),
    ('Panadería El Molino', 'Av. Jujuy 7676', 5559900112, 'pedidos@panaderiaelmolino.com'),
    ('Distribuidora de Lácteos', 'Calle 25 de Mayo 888', 5550011223, 'pedidos@distribuidoradelacteos.com'),
    ('Carnicería El Patagónico', 'Av. Las Heras 999', 5551122334, 'pedidos@carniceriaelpatagonico.com'),
    ('Bebidas del Sol', 'Calle Junín 1010', 5552233445, 'pedidos@bebidasdelsol.com'),
    ('Dulces Sueños', 'Av. Santa Cruz 1212', 5553344556, 'pedidos@dulcessuenos.com'),
    ('Panadería El Sol', 'Calle La Rioja 2020', 5554455667, 'pedidos@panaderiaelsol.com'),
    ('Comestibles Las Heras', 'Av. Las Heras 707', 5555566778, 'pedidos@comestibleslasheras.com'),
    ('Distribuidora de Frutas', 'Calle San Luis 303', 5556677889, 'pedidos@distribuidoradefrutas.com'),
    ('Pescadería Pescados y Mariscos', 'Av. Sarmiento 404', 5557788990, 'pedidos@pescaderiaymariscos.com'),
    ('Bebidas del Río', 'Calle Río de Janeiro 505', 5558899001, 'pedidos@bebidasdelrio.com'),
    ('Carnicería Don José', 'Av. Santiago del Estero 606', 5559900112, 'pedidos@carniceriadonjose.com');

-- Insertar registros en la tabla CLIENTES
INSERT INTO CLIENTES (Nombre_Apellido,Id_Ciudad) VALUES
    ('Juan Pérez',1),
    ('María Gómez',2),
    ('Carlos Rodríguez',5),
    ('Laura Sánchez',6),
    ('Pedro Ramírez',18),
    ('Ana Martínez',8),
    ('Luis Morales',8),
    ('Diana Castro',8),
    ('Oscar Rivas',10),
    ('Gabriela Fernández',1),
    ('José Navarro',1),
    ('Fernanda Ortega',1),
    ('Ricardo Herrera',1),
    ('Silvia Vargas',3),
    ('Andrés Mendoza',6),
    ('Valentina Paredes',16),
    ('Martín Suárez',15),
    ('Natalia Torres',10),
    ('Hugo López',10),
    ('Carolina Aguilar',5),
    ('Sergio Rojas',9),
    ('Elena Montes',10),
    ('Javier Mendoza',1),
    ('Isabel Ramos',12),
    ('Miguel Torres',16),
    ('Verónica Castro',1),
    ('Roberto Soto',8),
    ('Carmen Vargas',9),
    ('Raul Rojas',10),
    ('Ana Maria Sosa',14),
    ('David Méndez',13),
    ('Beatriz Delgado',1),
    ('Francisco Luna',9),
    ('Patricia Navarro',9),
    ('Rafael Rojas',6),
    ('Lorena Paredes',7),
    ('Felipe Cordero',9),
    ('Mónica Guzmán',12),
    ('Santiago Jiménez',3),
    ('Cecilia Mendoza',3),
    ('Diego Herrera',3),
    ('Alejandra Torres',1);

-- Insertamos registros en la tabla EMPLEADOS
INSERT INTO EMPLEADOS (Nombre, Apellido, Legajo, Horario, Id_Cargo) VALUES
    ('Juan', 'López', 1001, '00:00 - 06:00', 1),
    ('María', 'García', 1002, '06:00 - 12:00', 2),
    ('Carlos', 'Martínez', 1003, '12:00 - 18:00', 3),
    ('Laura', 'Rodríguez', 1004, '18:00 - 00:00', 4),
    ('Pedro', 'Gómez', 1005, '00:00 - 06:00', 5),
    ('Ana', 'Fernández', 1006, '06:00 - 12:00', 1),
    ('Luis', 'Díaz', 1007, '12:00 - 18:00', 2),
    ('Diana', 'Pérez', 1008, '18:00 - 00:00', 3),
    ('Oscar', 'Hernández', 1009, '00:00 - 06:00', 4),
    ('Gabriela', 'Gutiérrez', 1010, '06:00 - 12:00', 5),
    ('José', 'Suárez', 1011, '12:00 - 18:00', 1),
    ('Fernanda', 'Torres', 1012, '18:00 - 00:00', 2),
    ('Ricardo', 'Ramírez', 1013, '00:00 - 06:00', 3),
    ('Silvia', 'López', 1014, '06:00 - 12:00', 4),
    ('Andrés', 'García', 1015, '12:00 - 18:00', 5),
    ('Valentina', 'Martínez', 1016, '18:00 - 00:00', 1),
    ('Martín', 'Rodríguez', 1017, '00:00 - 06:00', 2),
    ('Natalia', 'Gómez', 1018, '06:00 - 12:00', 3),
    ('Hugo', 'Fernández', 1019, '12:00 - 18:00', 4),
    ('Carolina', 'Díaz', 1020, '18:00 - 00:00', 5),
    ('Sergio', 'Pérez', 1021, '00:00 - 06:00', 1),
    ('Elena', 'Hernández', 1022, '06:00 - 12:00', 2),
    ('Javier', 'Gutiérrez', 1023, '12:00 - 18:00', 3),
    ('Isabel', 'Suárez', 1024, '18:00 - 00:00', 4),
    ('Miguel', 'Torres', 1025, '00:00 - 06:00', 5),
    ('Verónica', 'Ramírez', 1026, '06:00 - 12:00', 1),
    ('Roberto', 'López', 1027, '12:00 - 18:00', 2),
    ('Carmen', 'García', 1028, '18:00 - 00:00', 3),
    ('Raul', 'Martínez', 1029, '00:00 - 06:00', 4),
    ('Ana Maria', 'Rodríguez', 1030, '06:00 - 12:00', 5),
    ('David', 'Gómez', 1031, '12:00 - 18:00', 1),
    ('Beatriz', 'Fernández', 1032, '18:00 - 00:00', 2),
    ('Francisco', 'Díaz', 1033, '00:00 - 06:00', 3),
    ('Patricia', 'Pérez', 1034, '06:00 - 12:00', 4),
    ('Rafael', 'Hernández', 1035, '12:00 - 18:00', 5),
    ('Lorena', 'Gutiérrez', 1036, '18:00 - 00:00', 1),
    ('Felipe', 'Suárez', 1037, '00:00 - 06:00', 2),
    ('Mónica', 'Torres', 1038, '06:00 - 12:00', 3),
    ('Santiago', 'Ramírez', 1039, '12:00 - 18:00', 4),
    ('Cecilia', 'López', 1040, '18:00 - 00:00', 5);

-- Insertamos registros en la tabla PRODUCTO
INSERT INTO PRODUCTO (Descripcion, Id_Proveedor, Cantidad, Valor)
VALUES
    ('Hamburguesa Clásica', 1, 100, 5.99),
    ('Pizza Margarita', 2, 80, 7.50),
    ('Tacos de Pollo', 3, 120, 6.75),
    ('Sushi Variado', 4, 90, 12.99),
    ('Pasta Carbonara', 5, 110, 9.25),
    ('Ensalada César', 6, 70, 8.00),
    ('Refresco Cola', 7, 200, 2.50),
    ('Agua Mineral', 8, 150, 1.50),
    ('Cerveza Artesanal', 9, 180, 4.75),
    ('Vino Tinto', 10, 100, 18.50),
    ('Helado de Chocolate', 11, 50, 3.99),
    ('Cheesecake', 12, 40, 5.75),
    ('Hot Dog Americano', 13, 95, 3.25),
    ('Ceviche de Pescado', 14, 85, 11.99),
    ('Pollo al Curry', 15, 105, 9.75),
    ('Arroz con Frijoles', 16, 75, 6.50),
    ('Churrasco con Chimichurri', 17, 115, 13.99),
    ('Sopa de Tomate', 18, 65, 4.75),
    ('Gaseosa de Naranja', 19, 180, 2.25),
    ('Agua con Gas', 20, 150, 1.75),
    ('Cerveza Lager', 21, 120, 4.25),
    ('Vino Blanco', 22, 100, 16.99),
    ('Tarta de Manzana', 23, 60, 4.50),
    ('Muffin de Vainilla', 24, 40, 2.99),
    ('Empanadas de Carne', 25, 110, 7.25),
    ('Ramen Japonés', 26, 75, 9.99),
    ('Café Espresso', 27, 140, 2.50),
    ('Té Verde', 28, 120, 1.99),
    ('Batido de Frutas', 29, 100, 4.50);
    
-- Insertamos registros en la tabla ORDEN
INSERT INTO ORDEN (Id_Empleado, Id_Cliente, Id_Producto,Fecha, Importe, Id_Mpago, Mesa) VALUES
(1, 1, 1, '2023-07-25',20.50, 1, 5),
(2, 3, 5, '2023-06-15', 12.75, 2, 10),
(3, 2, 10, '2023-04-28', 18.99, 3, 15),
(4, 4, 15, '2023-03-12',22.50, 4, 20),
(20, 5, 17, '2023-05-20', 19.25, 4, 20),
(21, 1, 22, '2023-06-03', 13.50, 5, 25),
(22, 3, 27, '2023-02-18', 16.75, 6, 30);


-- Insertamos registros en la tabla FACTURACION
INSERT INTO FACTURACION (Id_Orden, Id_Cliente, Id_Producto, Id_Delivery, Importe, Mesa)
VALUES
    (1, 1, 1, 1, 20.50, 5),
    (2, 3, 5, 2, 12.75, 10),
    (3, 2, 10, 3, 18.99, 15),
    (4, 4, 15, 4, 22.50, 20),
    (5, 5, 20, 5, 14.25, 25),
    (6, 1, 25, 6, 16.99, 30),
    (7, 3, 29, 7, 10.50, 35);
    
    
    -- VISTAS
USE fastfood;

DROP VIEW IF EXISTS VistaOrdenes;
DROP VIEW IF EXISTS VistaProductos;
DROP VIEW IF EXISTS VistaFacturas;
DROP VIEW IF EXISTS VistaEmpleados;
DROP VIEW IF EXISTS VistaDeliveries;



-- CREACION DE VISTAS

-- VISTA 1: Vista que muestra información de la orden con el nombre completo del empleado que la atendió y el nombre del cliente que realizó la orden para
-- las ordenes que se realizaron entre un intervalo de fechas y que fueron para la mesa 10.

CREATE VIEW VistaOrdenes AS
SELECT o.Id_Orden, e.Nombre AS NombreEmpleado, e.Apellido AS ApellidoEmpleado, c.Nombre_Apellido AS NombreCliente
FROM ORDEN o
INNER JOIN EMPLEADOS e ON o.Id_Empleado = e.Id_Empleado
INNER JOIN CLIENTES c ON o.Id_Cliente = c.Id_Cliente
WHERE o.Fecha BETWEEN '2023-01-01' AND '2023-06-30'
AND o.Mesa = 10;



-- VISTA 2 : Vista que muestra información de los productos y sus proveedores, cuando la cantidad es igual o superior a 50 items y la razon social se encuentra en un grupo de busqueda:

CREATE VIEW VistaProductos AS
SELECT p.*
FROM PRODUCTO p
INNER JOIN PROVEEDORES pr ON p.Id_Proveedor = pr.Id_Proveedor
WHERE p.Cantidad >= 50
AND pr.Razon_Social in ('Panadería El Molino',
'Distribuidora de Lácteos',
'Carnicería El Patagónico',
'Bebidas del Sol',
'Dulces Sueños',
'Comestibles Las Heras',
'Distribuidora de Frutas',
'Pescadería Pescados y Mariscos'
);

-- VISTA 3: Vista que muestra las facturas en las cuales el importe es menor a 1000 y el perido es el primer semestre del 2023.

CREATE VIEW VistaFacturas AS
SELECT f.Id_Factura, o.Id_Orden, c.Nombre_Apellido AS NombreCliente
FROM FACTURACION f
INNER JOIN ORDEN o ON f.Id_Orden = o.Id_Orden
INNER JOIN CLIENTES c ON f.Id_Cliente = c.Id_Cliente
WHERE f.Importe <= 1000
AND o.Fecha BETWEEN '2023-01-01' AND '2023-06-30';

-- VISTA 4: Vista que muestra los empleados que tienen legajo mayor a 1004 y que tienen puesto de Gerente. 

CREATE VIEW VistaEmpleados AS
SELECT e.Id_Empleado, e.Nombre, e.Apellido, e.Legajo, c.Descripcion AS Cargo
FROM EMPLEADOS e
INNER JOIN CARGOS c ON e.Id_Cargo = c.Id_Cargo
WHERE e.Legajo >= 1004
AND c.Descripcion like 'Gerente%';

-- VISTA 5: Vista que muestra los deliverys que se hicieron para la ciudad de Mataderos.

CREATE VIEW VistaDeliveries AS
SELECT d.Id_Delivery, d.Nombre, c.Nombre AS NombreDelivery
FROM DELIVERY d
INNER JOIN CIUDADES c ON d.Id_Ciudad = c.Id_Ciudad
WHERE c.Nombre = 'Mataderos';


-- MUESTREO DE VISTAS

select *
from VistaEmpleados;
select *
from VistaFacturas;
select *
from VistaOrdenes;
select *
from VistaProductos;
select *
from VistaDeliveries;

-- LLAMADO A LAS FUNCIONES

SELECT TotalProductosVendidos('2023-01-01', '2023-06-30');
SELECT ClientesPorCiudad('Ciudad Autonoma');

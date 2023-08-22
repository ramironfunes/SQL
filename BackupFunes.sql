-- SE REALIZA UN BACKUP DEL PROYECTO FINAL CON RESGUARDO DE LAS TABLAS (cargos, ciudades, clientes, delivery, empleados, facturacion, log_facturacion, log_orden, metodopago, orden, producto, proveedores)

-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: fastfood
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `Id_Cargo` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Cargo`),
  UNIQUE KEY `Id_Cargo` (`Id_Cargo`),
  UNIQUE KEY `Descripcion` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (12,'Asesor de Ventas'),(8,'Asistente de Cocina'),(6,'Atendente de Servicio al Cliente'),(18,'Auxiliar de Limpieza'),(15,'Ayudante de Cocina'),(20,'Ayudante de Repartidor'),(11,'Barista'),(3,'Cajero'),(5,'Cocinero'),(2,'Encargado de Cocina'),(16,'Expendedor de Bebidas'),(1,'Gerente de Restaurante'),(7,'Jefe de Sucursal'),(9,'Mesero'),(14,'Operador de Caja'),(13,'Preparador de Alimentos'),(19,'Recepcionista de Pedidos'),(4,'Repartidor de Pedidos'),(17,'Servidor de Mesas'),(10,'Supervisor de Limpieza');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `Id_Ciudad` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Ciudad`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (9,'Adrogue'),(14,'Almagro'),(15,'Banfield'),(25,'Belgrano'),(2,'Buenos Aires'),(1,'Ciudad Autonoma'),(13,'Coghlan'),(23,'Grandburg'),(11,'La_Boca'),(8,'Lanus'),(4,'Liniers'),(3,'Mataderos'),(16,'Montegrande'),(5,'Moron'),(19,'Naranjos'),(12,'Nuñez'),(18,'Padua'),(10,'Paternal'),(24,'Pilar'),(6,'Ramos_Mejia'),(20,'Rosario'),(26,'San_Cristobal'),(7,'San_Justo'),(22,'Tesei'),(21,'Tigre'),(17,'Zarate');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Id_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nombre_Apellido` varchar(50) NOT NULL,
  `Id_Ciudad` int DEFAULT '1',
  PRIMARY KEY (`Id_Cliente`),
  UNIQUE KEY `Id_Cliente` (`Id_Cliente`),
  KEY `Id_Ciudad` (`Id_Ciudad`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`Id_Ciudad`) REFERENCES `ciudades` (`Id_Ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan Pérez',1),(2,'María Gómez',2),(3,'Carlos Rodríguez',5),(4,'Laura Sánchez',6),(5,'Pedro Ramírez',18),(6,'Ana Martínez',8),(7,'Luis Morales',8),(8,'Diana Castro',8),(9,'Oscar Rivas',10),(10,'Gabriela Fernández',1),(11,'José Navarro',1),(12,'Fernanda Ortega',1),(13,'Ricardo Herrera',1),(14,'Silvia Vargas',3),(15,'Andrés Mendoza',6),(16,'Valentina Paredes',16),(17,'Martín Suárez',15),(18,'Natalia Torres',10),(19,'Hugo López',10),(20,'Carolina Aguilar',5),(21,'Sergio Rojas',9),(22,'Elena Montes',10),(23,'Javier Mendoza',1),(24,'Isabel Ramos',12),(25,'Miguel Torres',16),(26,'Verónica Castro',1),(27,'Roberto Soto',8),(28,'Carmen Vargas',9),(29,'Raul Rojas',10),(30,'Ana Maria Sosa',14),(31,'David Méndez',13),(32,'Beatriz Delgado',1),(33,'Francisco Luna',9),(34,'Patricia Navarro',9),(35,'Rafael Rojas',6),(36,'Lorena Paredes',7),(37,'Felipe Cordero',9),(38,'Mónica Guzmán',12),(39,'Santiago Jiménez',3),(40,'Cecilia Mendoza',3),(41,'Diego Herrera',3),(42,'Alejandra Torres',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `Id_Delivery` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Id_Ciudad` int NOT NULL,
  PRIMARY KEY (`Id_Delivery`),
  UNIQUE KEY `Id_Delivery` (`Id_Delivery`),
  KEY `Id_Ciudad` (`Id_Ciudad`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`Id_Ciudad`) REFERENCES `ciudades` (`Id_Ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Juan Perez','555-1234','Calle 1 123',1),(2,'María Gómez','555-5678','Avenida 2 456',2),(3,'Carlos Rodríguez','555-9876','Calle 3 789',3),(4,'Laura Sánchez','555-2345','Avenida 4 012',4),(5,'Pedro Ramírez','555-6789','Calle 5 345',5),(6,'Ana Martínez','555-3456','Avenida 6 678',6),(7,'Luis Morales','555-8765','Calle 7 901',7),(8,'Diana Castro','555-4321','Avenida 8 234',8),(9,'Oscar Rivas','555-7654','Calle 9 567',9),(10,'Gabriela Fernández','555-2109','Avenida 10 890',10),(11,'José Navarro','555-6543','Calle 11 1234',11),(12,'Fernanda Ortega','555-1098','Avenida 12 5678',12),(13,'Ricardo Herrera','555-5432','Calle 13 9012',13),(14,'Silvia Vargas','555-0987','Avenida 14 3456',14),(15,'Andrés Mendoza','555-3210','Calle 15 6789',15),(16,'Valentina Paredes','555-7654','Avenida 16 0123',16),(17,'Martín Suárez','555-0123','Calle 17 4567',17),(18,'Natalia Torres','555-5678','Avenida 18 8901',18),(19,'Hugo López','555-2345','Calle 19 2345',1),(20,'Carolina Aguilar','555-6789','Avenida 20 5678',2),(21,'Sergio Rojas','555-8765','Calle 21 9012',3),(22,'Elena Montes','555-5432','Avenida 22 3456',4),(23,'Javier Mendoza','555-0987','Calle 23 6789',5),(24,'Isabel Ramos','555-3210','Avenida 24 0123',6),(25,'Miguel Torres','555-7654','Calle 25 4567',7),(26,'Verónica Castro','555-0123','Avenida 26 8901',8),(27,'Roberto Soto','555-5678','Calle 27 2345',9),(28,'Carmen Vargas','555-2345','Avenida 28 5678',10),(29,'Raul Rojas','555-6789','Calle 29 9012',11),(30,'Ana Maria Sosa','555-4321','Avenida 30 3456',12),(31,'David Méndez','555-1098','Calle 31 6789',13),(32,'Beatriz Delgado','555-5432','Avenida 32 0123',14),(33,'Francisco Luna','555-8765','Calle 33 4567',15),(34,'Patricia Navarro','555-3210','Avenida 34 8901',16),(35,'Rafael Rojas','555-7654','Calle 35 2345',17),(36,'Lorena Paredes','555-0987','Avenida 36 5678',18),(37,'Felipe Cordero','555-5678','Calle 37 9012',1),(38,'Mónica Guzmán','555-2345','Avenida 38 3456',2),(39,'Santiago Jiménez','555-6789','Calle 39 6789',3),(40,'Cecilia Mendoza','555-4321','Avenida 40 0123',4),(41,'Diego Herrera','555-1098','Calle 41 4567',5),(42,'Alejandra Torres','555-5432','Avenida 42 8901',6),(43,'Mario Ramos','555-8765','Calle 43 2345',7),(44,'Lucía Soto','555-3210','Avenida 44 5678',8),(45,'Andrés Montes','555-7654','Calle 45 9012',9),(46,'Natalia Rojas','555-0123','Avenida 46 3456',10),(47,'Jorge Navarro','555-5678','Calle 47 6789',11),(48,'Paula Delgado','555-2345','Avenida 48 0123',12),(49,'Sebastián Luna','555-6789','Calle 49 3456',13),(50,'Adriana Vargas','555-0987','Avenida 50 6789',14);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `Id_Empleado` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Legajo` int NOT NULL,
  `Horario` varchar(20) NOT NULL,
  `Id_Cargo` int NOT NULL,
  PRIMARY KEY (`Id_Empleado`),
  UNIQUE KEY `Id_Empleado` (`Id_Empleado`),
  KEY `Id_Cargo` (`Id_Cargo`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`Id_Cargo`) REFERENCES `cargos` (`Id_Cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Juan','López',1001,'00:00 - 06:00',1),(2,'María','García',1002,'06:00 - 12:00',2),(3,'Carlos','Martínez',1003,'12:00 - 18:00',3),(4,'Laura','Rodríguez',1004,'18:00 - 00:00',4),(5,'Pedro','Gómez',1005,'00:00 - 06:00',5),(6,'Ana','Fernández',1006,'06:00 - 12:00',1),(7,'Luis','Díaz',1007,'12:00 - 18:00',2),(8,'Diana','Pérez',1008,'18:00 - 00:00',3),(9,'Oscar','Hernández',1009,'00:00 - 06:00',4),(10,'Gabriela','Gutiérrez',1010,'06:00 - 12:00',5),(11,'José','Suárez',1011,'12:00 - 18:00',1),(12,'Fernanda','Torres',1012,'18:00 - 00:00',2),(13,'Ricardo','Ramírez',1013,'00:00 - 06:00',3),(14,'Silvia','López',1014,'06:00 - 12:00',4),(15,'Andrés','García',1015,'12:00 - 18:00',5),(16,'Valentina','Martínez',1016,'18:00 - 00:00',1),(17,'Martín','Rodríguez',1017,'00:00 - 06:00',2),(18,'Natalia','Gómez',1018,'06:00 - 12:00',3),(19,'Hugo','Fernández',1019,'12:00 - 18:00',4),(20,'Carolina','Díaz',1020,'18:00 - 00:00',5),(21,'Sergio','Pérez',1021,'00:00 - 06:00',1),(22,'Elena','Hernández',1022,'06:00 - 12:00',2),(23,'Javier','Gutiérrez',1023,'12:00 - 18:00',3),(24,'Isabel','Suárez',1024,'18:00 - 00:00',4),(25,'Miguel','Torres',1025,'00:00 - 06:00',5),(26,'Verónica','Ramírez',1026,'06:00 - 12:00',1),(27,'Roberto','López',1027,'12:00 - 18:00',2),(28,'Carmen','García',1028,'18:00 - 00:00',3),(29,'Raul','Martínez',1029,'00:00 - 06:00',4),(30,'Ana Maria','Rodríguez',1030,'06:00 - 12:00',5),(31,'David','Gómez',1031,'12:00 - 18:00',1),(32,'Beatriz','Fernández',1032,'18:00 - 00:00',2),(33,'Francisco','Díaz',1033,'00:00 - 06:00',3),(34,'Patricia','Pérez',1034,'06:00 - 12:00',4),(35,'Rafael','Hernández',1035,'12:00 - 18:00',5),(36,'Lorena','Gutiérrez',1036,'18:00 - 00:00',1),(37,'Felipe','Suárez',1037,'00:00 - 06:00',2),(38,'Mónica','Torres',1038,'06:00 - 12:00',3),(39,'Santiago','Ramírez',1039,'12:00 - 18:00',4),(40,'Cecilia','López',1040,'18:00 - 00:00',5);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacion` (
  `Id_Factura` int NOT NULL AUTO_INCREMENT,
  `Id_Orden` int NOT NULL,
  `Id_Cliente` int NOT NULL,
  `Id_Producto` int NOT NULL,
  `Id_Delivery` int NOT NULL,
  `Importe` float NOT NULL,
  `Mesa` int NOT NULL,
  PRIMARY KEY (`Id_Factura`),
  UNIQUE KEY `Id_Factura` (`Id_Factura`),
  KEY `Id_Orden` (`Id_Orden`),
  KEY `Id_Cliente` (`Id_Cliente`),
  KEY `Id_Producto` (`Id_Producto`),
  KEY `Id_Delivery` (`Id_Delivery`),
  CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`Id_Orden`) REFERENCES `orden` (`Id_Orden`),
  CONSTRAINT `facturacion_ibfk_2` FOREIGN KEY (`Id_Cliente`) REFERENCES `clientes` (`Id_Cliente`),
  CONSTRAINT `facturacion_ibfk_3` FOREIGN KEY (`Id_Producto`) REFERENCES `producto` (`Id_Producto`),
  CONSTRAINT `facturacion_ibfk_4` FOREIGN KEY (`Id_Delivery`) REFERENCES `delivery` (`Id_Delivery`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacion`
--

LOCK TABLES `facturacion` WRITE;
/*!40000 ALTER TABLE `facturacion` DISABLE KEYS */;
INSERT INTO `facturacion` VALUES (1,1,1,1,1,20.5,5),(2,2,3,5,2,12.75,10),(3,3,2,10,3,18.99,15),(4,4,4,15,4,22.5,20),(5,5,5,20,5,14.25,25),(6,6,1,25,6,16.99,30),(7,7,3,29,7,10.5,35);
/*!40000 ALTER TABLE `facturacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_del_facturacion` BEFORE DELETE ON `facturacion` FOR EACH ROW BEGIN
    INSERT INTO log_facturacion (Id_Factura, Importe, usuario, fecha, hora)
    VALUES (OLD.Id_Factura, OLD.Importe, USER(), CURDATE(), TIME(NOW()));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_facturacion`
--

DROP TABLE IF EXISTS `log_facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_facturacion` (
  `Id_Factura` int NOT NULL AUTO_INCREMENT,
  `Importe` float NOT NULL,
  `usuario` char(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`Id_Factura`),
  UNIQUE KEY `Id_Factura` (`Id_Factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_facturacion`
--

LOCK TABLES `log_facturacion` WRITE;
/*!40000 ALTER TABLE `log_facturacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_facturacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_orden`
--

DROP TABLE IF EXISTS `log_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_orden` (
  `Id_Orden` int NOT NULL AUTO_INCREMENT,
  `Id_Producto` int NOT NULL,
  `usuario` char(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`Id_Orden`),
  UNIQUE KEY `Id_Orden` (`Id_Orden`),
  KEY `Id_Producto` (`Id_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_orden`
--

LOCK TABLES `log_orden` WRITE;
/*!40000 ALTER TABLE `log_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodopago`
--

DROP TABLE IF EXISTS `metodopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodopago` (
  `Id_MPago` int NOT NULL AUTO_INCREMENT,
  `Metodo` varchar(50) NOT NULL,
  `EntidadFinanciera` varchar(10) NOT NULL,
  `Cuotas` int NOT NULL,
  PRIMARY KEY (`Id_MPago`),
  UNIQUE KEY `Id_MPago` (`Id_MPago`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodopago`
--

LOCK TABLES `metodopago` WRITE;
/*!40000 ALTER TABLE `metodopago` DISABLE KEYS */;
INSERT INTO `metodopago` VALUES (1,'Tarjeta de Crédito VISA','Galicia',12),(2,'Tarjeta de Crédito VISA','Frances',6),(3,'Tarjeta de Débito VISA','ICBC',1),(4,'Efectivo','N/A',0),(5,'Transferencia Bancaria','N/A',1),(6,'Tarjeta de Crédito AMERICAN EXPRESS','Santander',3),(7,'Tarjeta de Débito MASTERCARD','Provincia',1),(8,'Tarjeta de Crédito MASTERCARD','ICBC',6);
/*!40000 ALTER TABLE `metodopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `Id_Orden` int NOT NULL AUTO_INCREMENT,
  `Id_Empleado` int NOT NULL,
  `Id_Cliente` int NOT NULL,
  `Id_Producto` int NOT NULL,
  `Fecha` date NOT NULL,
  `Importe` float NOT NULL,
  `Id_Mpago` int NOT NULL,
  `Mesa` int NOT NULL,
  PRIMARY KEY (`Id_Orden`),
  UNIQUE KEY `Id_Orden` (`Id_Orden`),
  KEY `Id_Empleado` (`Id_Empleado`),
  KEY `Id_Cliente` (`Id_Cliente`),
  KEY `Id_Producto` (`Id_Producto`),
  KEY `Id_Mpago` (`Id_Mpago`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`),
  CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`Id_Cliente`) REFERENCES `clientes` (`Id_Cliente`),
  CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`Id_Producto`) REFERENCES `producto` (`Id_Producto`),
  CONSTRAINT `orden_ibfk_4` FOREIGN KEY (`Id_Mpago`) REFERENCES `metodopago` (`Id_MPago`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,1,1,1,'2023-07-25',20.5,1,5),(2,2,3,5,'2023-06-15',12.75,2,10),(3,3,2,10,'2023-04-28',18.99,3,15),(4,4,4,15,'2023-03-12',22.5,4,20),(5,20,5,17,'2023-05-20',19.25,4,20),(6,21,1,22,'2023-06-03',13.5,5,25),(7,22,3,27,'2023-02-18',16.75,6,30);
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_add_new_orden` AFTER INSERT ON `orden` FOR EACH ROW BEGIN
    INSERT INTO log_orden (Id_orden, Id_Producto, usuario, fecha, hora)
    VALUES (NEW.Id_orden, NEW.Id_Producto, USER(), CURDATE(), TIME(NOW()));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `Id_Producto` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(300) NOT NULL,
  `Id_Proveedor` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Valor` float NOT NULL,
  PRIMARY KEY (`Id_Producto`),
  UNIQUE KEY `Id_Producto` (`Id_Producto`),
  KEY `Id_Proveedor` (`Id_Proveedor`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedores` (`Id_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Hamburguesa Clásica',1,100,5.99),(2,'Pizza Margarita',2,80,7.5),(3,'Tacos de Pollo',3,120,6.75),(4,'Sushi Variado',4,90,12.99),(5,'Pasta Carbonara',5,110,9.25),(6,'Ensalada César',6,70,8),(7,'Refresco Cola',7,200,2.5),(8,'Agua Mineral',8,150,1.5),(9,'Cerveza Artesanal',9,180,4.75),(10,'Vino Tinto',10,100,18.5),(11,'Helado de Chocolate',11,50,3.99),(12,'Cheesecake',12,40,5.75),(13,'Hot Dog Americano',13,95,3.25),(14,'Ceviche de Pescado',14,85,11.99),(15,'Pollo al Curry',15,105,9.75),(16,'Arroz con Frijoles',16,75,6.5),(17,'Churrasco con Chimichurri',17,115,13.99),(18,'Sopa de Tomate',18,65,4.75),(19,'Gaseosa de Naranja',19,180,2.25),(20,'Agua con Gas',20,150,1.75),(21,'Cerveza Lager',21,120,4.25),(22,'Vino Blanco',22,100,16.99),(23,'Tarta de Manzana',23,60,4.5),(24,'Muffin de Vainilla',24,40,2.99),(25,'Empanadas de Carne',25,110,7.25),(26,'Ramen Japonés',26,75,9.99),(27,'Café Espresso',27,140,2.5),(28,'Té Verde',28,120,1.99),(29,'Batido de Frutas',29,100,4.5);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `Id_Proveedor` int NOT NULL AUTO_INCREMENT,
  `Razon_Social` varchar(150) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Email` varchar(130) NOT NULL,
  PRIMARY KEY (`Id_Proveedor`),
  UNIQUE KEY `Id_Proveedor` (`Id_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Distribuidora Alimentos SA','Av. Libertador 1520','5551122334','pedidos@distribuidoraalimentos.com'),(2,'Comestibles del Sur','Calle Buenos Aires 123','5552233445','pedidos@comestiblesdelsur.com'),(3,'Bebidas Refrescantes SA','Av. San Martín 789','5553344556','pedidos@bebidasrefrescantes.com'),(4,'Frutas Frescas SRL','Calle Corrientes 456','5554455667','pedidos@frutasfrescas.com'),(5,'Carnicería El Gaucho','Av. Callao 789','5555566778','pedidos@carniceriaelgaucho.com'),(6,'Panadería La Esquina','Calle Maipú 1010','5556677889','pedidos@panaderialaesquina.com'),(7,'Lácteos del Campo','Av. Belgrano 1414','5557788990','pedidos@lacteosdelcampo.com'),(8,'Dulces Delicias','Calle San Juan 1717','5558899001','pedidos@dulcesdelicias.com'),(9,'Pescadería Mar y Río','Av. Paseo Colón 2020','5559900112','pedidos@pescaderiamaryrio.com'),(10,'Distribuidora de Bebidas SA','Calle 9 de Julio 2323','5550011223','pedidos@distribuidoradebebidas.com'),(11,'Carnicería San Jorge','Av. Rivadavia 2626','5551122334','pedidos@carniceriasanjorge.com'),(12,'Frutas Tropicales','Calle Entre Ríos 3232','5552233445','pedidos@frutastropicales.com'),(13,'Bebidas del Mundo','Av. Córdoba 3434','5553344556','pedidos@bebidasdelmundo.com'),(14,'Dulces Encantados','Calle Santa Fe 4040','5554455667','pedidos@dulcesencantados.com'),(15,'Carnicería La Estancia','Av. Corrientes 4848','5555566778','pedidos@carnicerialaestancia.com'),(16,'Pescadería Sabores del Mar','Calle Sarmiento 5252','5556677889','pedidos@pescaderiasaboresdelmar.com'),(17,'Comestibles San Martín','Av. Pueyrredón 5656','5557788990','pedidos@comestiblessanmartin.com'),(18,'Frutería Fruta Fresca','Calle Lavalle 6464','5558899001','pedidos@fruteriafrutafresca.com'),(19,'Panadería El Molino','Av. Jujuy 7676','5559900112','pedidos@panaderiaelmolino.com'),(20,'Distribuidora de Lácteos','Calle 25 de Mayo 888','5550011223','pedidos@distribuidoradelacteos.com'),(21,'Carnicería El Patagónico','Av. Las Heras 999','5551122334','pedidos@carniceriaelpatagonico.com'),(22,'Bebidas del Sol','Calle Junín 1010','5552233445','pedidos@bebidasdelsol.com'),(23,'Dulces Sueños','Av. Santa Cruz 1212','5553344556','pedidos@dulcessuenos.com'),(24,'Panadería El Sol','Calle La Rioja 2020','5554455667','pedidos@panaderiaelsol.com'),(25,'Comestibles Las Heras','Av. Las Heras 707','5555566778','pedidos@comestibleslasheras.com'),(26,'Distribuidora de Frutas','Calle San Luis 303','5556677889','pedidos@distribuidoradefrutas.com'),(27,'Pescadería Pescados y Mariscos','Av. Sarmiento 404','5557788990','pedidos@pescaderiaymariscos.com'),(28,'Bebidas del Río','Calle Río de Janeiro 505','5558899001','pedidos@bebidasdelrio.com'),(29,'Carnicería Don José','Av. Santiago del Estero 606','5559900112','pedidos@carniceriadonjose.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vistadeliveries`
--

DROP TABLE IF EXISTS `vistadeliveries`;
/*!50001 DROP VIEW IF EXISTS `vistadeliveries`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistadeliveries` AS SELECT 
 1 AS `Id_Delivery`,
 1 AS `Nombre`,
 1 AS `NombreDelivery`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaempleados`
--

DROP TABLE IF EXISTS `vistaempleados`;
/*!50001 DROP VIEW IF EXISTS `vistaempleados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaempleados` AS SELECT 
 1 AS `Id_Empleado`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Legajo`,
 1 AS `Cargo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistafacturas`
--

DROP TABLE IF EXISTS `vistafacturas`;
/*!50001 DROP VIEW IF EXISTS `vistafacturas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistafacturas` AS SELECT 
 1 AS `Id_Factura`,
 1 AS `Id_Orden`,
 1 AS `NombreCliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaordenes`
--

DROP TABLE IF EXISTS `vistaordenes`;
/*!50001 DROP VIEW IF EXISTS `vistaordenes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaordenes` AS SELECT 
 1 AS `Id_Orden`,
 1 AS `NombreEmpleado`,
 1 AS `ApellidoEmpleado`,
 1 AS `NombreCliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaproductos`
--

DROP TABLE IF EXISTS `vistaproductos`;
/*!50001 DROP VIEW IF EXISTS `vistaproductos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaproductos` AS SELECT 
 1 AS `Id_Producto`,
 1 AS `Descripcion`,
 1 AS `Id_Proveedor`,
 1 AS `Cantidad`,
 1 AS `Valor`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'fastfood'
--
/*!50003 DROP FUNCTION IF EXISTS `ClientesPorCiudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ClientesPorCiudad`(ciudad_nombre VARCHAR(50)) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE clientes_ciudad INT;
    
    SELECT COUNT(o.Id_Cliente) INTO clientes_ciudad
    FROM ORDEN o
    INNER JOIN CLIENTES cl ON cl.Id_Cliente = o.Id_Cliente
    INNER JOIN CIUDADES c ON c.Id_Ciudad = cl.Id_Ciudad
    WHERE c.Nombre = ciudad_nombre;
	RETURN clientes_ciudad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TotalProductosVendidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TotalProductosVendidos`(
    fecha_inicio DATE,
    fecha_fin DATE
) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE total_vendidos INT;
    
    SELECT SUM(o.Id_Producto) INTO total_vendidos
    FROM ORDEN o
    INNER JOIN FACTURACION f ON o.Id_Orden = f.Id_Orden
    WHERE o.Fecha BETWEEN fecha_inicio AND fecha_fin;
    
    RETURN total_vendidos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProcessOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcessOrders`()
BEGIN
    DECLARE is_empty BOOLEAN;

    -- Verificar si la tabla ORDEN está vacía
    SELECT COUNT(*) = 0 INTO is_empty FROM ORDEN;

    -- Iniciar una transacción
    START TRANSACTION;
    -- Se elimina la restriccion para borrado de campos que sean FK.
	SET FOREIGN_KEY_CHECKS = 0;
    -- Eliminar registros si no está vacía.
    IF NOT is_empty THEN
        DELETE FROM ORDEN LIMIT 2;
        SELECT "Se eliminaron registros de la tabla ORDEN." AS Message;
    ELSE
        -- Insertar registros si está vacía.
        INSERT INTO ORDEN (Id_Empleado, Id_Cliente, Id_Producto, Fecha, Importe, Id_Mpago, Mesa)
        VALUES 
            (5, 4, 12, '2023-08-22', 1236, 1, 18),
            (6, 3, 10, '2023-08-10', 15, 1, 17),
            (1, 2, 5, '2023-08-05', 150, 1, 15),
            (10, 8, 5, '2023-08-01', 111, 1, 2),
            (8, 7, 9, '2023-07-30', 54, 1, 5);
        SELECT "Se insertaron 5 registros en la tabla ORDEN." AS Message;
    END IF;

    -- Confirmar o deshacer la transacción
    
    -- ROLLBACK;
    COMMIT; 
    -- Vuelvo a setear la restriccion de campos FK.
    SET FOREIGN_KEY_CHECKS = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_orden_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_orden_order`(IN field CHAR(20),tipo char(4))
BEGIN
	-- VALIDACION DE DATOS
    IF field <> '' AND tipo <> '' THEN
		SET @orden_order = CONCAT(' ORDER BY ', field, ' ',  tipo); # 'ORDER BY name'

	ELSE
		SET @orden_order = ''; -- PARA EL CASO QUE EL INGRESO ESTE VACIO, NO SE REALIZA NINGUN ORDENAMIENTO
    END IF;
    -- SE SETEA LA VARIABLE 'CONSULTA' CON LA CONCATENACION DEL ORDER BY MAS LOS DOS VALORES INGRESADOS.
    SET @consulta = CONCAT('SELECT * FROM fastfood.orden', @orden_order); # 'SELECT * FROM fastfood.orden ORDER BY name'
    -- SE EJECUTA LO INGRESADO Y CONVERTIDO A SENTENCIA SQL
    PREPARE clasify FROM @consulta;
    EXECUTE clasify;
    DEALLOCATE PREPARE clasify;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_cliente`(IN cliente CHAR(40))
BEGIN
	-- VALIDACION DE DATOS
    IF cliente <> ''  THEN
        INSERT INTO CLIENTES (Nombre_Apellido) VALUES (cliente); -- SE AGREGA EL CLIENTE
    ELSE
        SIGNAL SQLSTATE '45000' -- SI NO SE TIPEA NINGUN VALOR, NOS DEVUELVE UN ERROR EN LA CREACION.
        SET MESSAGE_TEXT = 'ERROR: NO SE PUDO CREAR EL CLIENTE. Verifique que todos los campos estén completos.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vistadeliveries`
--

/*!50001 DROP VIEW IF EXISTS `vistadeliveries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistadeliveries` AS select `d`.`Id_Delivery` AS `Id_Delivery`,`d`.`Nombre` AS `Nombre`,`c`.`Nombre` AS `NombreDelivery` from (`delivery` `d` join `ciudades` `c` on((`d`.`Id_Ciudad` = `c`.`Id_Ciudad`))) where (`c`.`Nombre` = 'Mataderos') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaempleados`
--

/*!50001 DROP VIEW IF EXISTS `vistaempleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaempleados` AS select `e`.`Id_Empleado` AS `Id_Empleado`,`e`.`Nombre` AS `Nombre`,`e`.`Apellido` AS `Apellido`,`e`.`Legajo` AS `Legajo`,`c`.`Descripcion` AS `Cargo` from (`empleados` `e` join `cargos` `c` on((`e`.`Id_Cargo` = `c`.`Id_Cargo`))) where ((`e`.`Legajo` >= 1004) and (`c`.`Descripcion` like 'Gerente%')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistafacturas`
--

/*!50001 DROP VIEW IF EXISTS `vistafacturas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistafacturas` AS select `f`.`Id_Factura` AS `Id_Factura`,`o`.`Id_Orden` AS `Id_Orden`,`c`.`Nombre_Apellido` AS `NombreCliente` from ((`facturacion` `f` join `orden` `o` on((`f`.`Id_Orden` = `o`.`Id_Orden`))) join `clientes` `c` on((`f`.`Id_Cliente` = `c`.`Id_Cliente`))) where ((`f`.`Importe` <= 1000) and (`o`.`Fecha` between '2023-01-01' and '2023-06-30')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaordenes`
--

/*!50001 DROP VIEW IF EXISTS `vistaordenes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaordenes` AS select `o`.`Id_Orden` AS `Id_Orden`,`e`.`Nombre` AS `NombreEmpleado`,`e`.`Apellido` AS `ApellidoEmpleado`,`c`.`Nombre_Apellido` AS `NombreCliente` from ((`orden` `o` join `empleados` `e` on((`o`.`Id_Empleado` = `e`.`Id_Empleado`))) join `clientes` `c` on((`o`.`Id_Cliente` = `c`.`Id_Cliente`))) where ((`o`.`Fecha` between '2023-01-01' and '2023-06-30') and (`o`.`Mesa` = 10)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaproductos`
--

/*!50001 DROP VIEW IF EXISTS `vistaproductos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaproductos` AS select `p`.`Id_Producto` AS `Id_Producto`,`p`.`Descripcion` AS `Descripcion`,`p`.`Id_Proveedor` AS `Id_Proveedor`,`p`.`Cantidad` AS `Cantidad`,`p`.`Valor` AS `Valor` from (`producto` `p` join `proveedores` `pr` on((`p`.`Id_Proveedor` = `pr`.`Id_Proveedor`))) where ((`p`.`Cantidad` >= 50) and (`pr`.`Razon_Social` in ('Panadería El Molino','Distribuidora de Lácteos','Carnicería El Patagónico','Bebidas del Sol','Dulces Sueños','Comestibles Las Heras','Distribuidora de Frutas','Pescadería Pescados y Mariscos'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-22 19:07:14

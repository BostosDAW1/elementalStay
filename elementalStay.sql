-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: elementalStay
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.23.04.1

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
-- Table structure for table `comunidades_autonomas`
--

DROP TABLE IF EXISTS `comunidades_autonomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunidades_autonomas` (
  `id_comunidad` int NOT NULL AUTO_INCREMENT,
  `comunidad_autonoma` varchar(75) NOT NULL,
  PRIMARY KEY (`id_comunidad`,`comunidad_autonoma`),
  UNIQUE KEY `comunidad_autonoma_UNIQUE` (`comunidad_autonoma`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunidades_autonomas`
--

LOCK TABLES `comunidades_autonomas` WRITE;
/*!40000 ALTER TABLE `comunidades_autonomas` DISABLE KEYS */;
INSERT INTO `comunidades_autonomas` VALUES (2,'Cantabria'),(3,'Madrid'),(1,'Valencia');
/*!40000 ALTER TABLE `comunidades_autonomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pagos`
--

DROP TABLE IF EXISTS `detalle_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pagos` (
  `id_detalle_pago` int NOT NULL AUTO_INCREMENT,
  `id_pago` int DEFAULT NULL,
  `descripcion` text,
  `id_hotel` int DEFAULT NULL,
  `id_servicio` int DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pago`),
  KEY `fk_detalle_pagos_1_idx_new` (`total`),
  KEY `fk_detalle_pagos_1_idx` (`total`),
  KEY `fk_detalle_pagos_2_idx` (`id_pago`),
  KEY `fk_detalle_pagos_3_idx` (`id_hotel`),
  KEY `fk_detalle_pagos_4_idx` (`id_servicio`),
  CONSTRAINT `fk_detalle_pagos_1` FOREIGN KEY (`total`) REFERENCES `pagos` (`total_pago`),
  CONSTRAINT `fk_detalle_pagos_2` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`),
  CONSTRAINT `fk_detalle_pagos_3` FOREIGN KEY (`id_hotel`) REFERENCES `hoteles` (`id_hotel`),
  CONSTRAINT `fk_detalle_pagos_4` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pagos`
--

LOCK TABLES `detalle_pagos` WRITE;
/*!40000 ALTER TABLE `detalle_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitaciones` (
  `id_habitacion` int NOT NULL,
  `id_hotel` int DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  `personas` int DEFAULT NULL,
  `m2` varchar(45) DEFAULT NULL,
  `wifi` tinyint DEFAULT NULL,
  `complementos_infantes` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_habitacion`),
  KEY `fk_habitacions_1_idx` (`id_hotel`),
  CONSTRAINT `fk_habitacions_1` FOREIGN KEY (`id_hotel`) REFERENCES `hoteles` (`id_hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitaciones`
--

LOCK TABLES `habitaciones` WRITE;
/*!40000 ALTER TABLE `habitaciones` DISABLE KEYS */;
INSERT INTO `habitaciones` VALUES (1,1,'Habitación Vista Mar',2,2,'25',1,1),(2,1,'Suite Familiar',4,4,'40',1,1),(3,1,'Habitación Doble Deluxe',2,2,'30',1,1),(4,1,'Habitación Triple',3,3,'35',1,0),(5,1,'Habitación Individual',1,1,'20',1,0),(6,2,'Habitación Estándar',2,2,'28',1,0),(7,2,'Suite con Terraza',4,4,'45',1,1),(8,2,'Habitación Familiar',3,3,'32',1,1),(9,2,'Habitación Doble Superior',2,2,'30',1,0),(10,2,'Habitación Individual Económica',1,1,'18',0,0),(16,3,'Habitación Vista al Mar',2,2,'26',1,1),(17,3,'Suite Ejecutiva',4,4,'48',1,1),(18,3,'Habitación Doble Premium',2,2,'30',1,0),(19,3,'Habitación Triple Confort',3,3,'36',1,1),(20,3,'Habitación Individual Superior',1,1,'22',0,0),(21,4,'Habitación Familiar Deluxe',4,4,'40',1,1),(22,4,'Suite con Jacuzzi',2,2,'35',1,0),(23,4,'Habitación Doble Estándar',2,2,'28',0,0),(24,4,'Habitación Triple Familiar',3,3,'32',1,1),(25,4,'Habitación Individual Económica',1,1,'18',0,0),(26,5,'Habitación Doble Vista Jardín',2,2,'30',1,1),(27,5,'Suite Familiar con Terraza',4,4,'45',1,1),(28,5,'Habitación Individual Confort',1,1,'20',0,0),(29,5,'Habitación Triple Estándar',3,3,'35',1,0),(30,5,'Habitación Doble Superior',2,2,'28',1,1),(31,6,'Habitación Deluxe con Balcón',2,2,'32',1,1),(32,6,'Suite Ejecutiva con Vista',4,4,'50',1,0),(33,6,'Habitación Doble Clásica',2,2,'29',0,0),(34,6,'Habitación Familiar Espaciosa',3,3,'40',1,1),(35,6,'Habitación Individual Económica',1,1,'18',0,0),(36,7,'Habitación Doble con Vista al Lago',2,2,'30',1,1),(37,7,'Suite Familiar con Balcón',4,4,'48',1,1),(38,7,'Habitación Individual Clásica',1,1,'22',0,0),(39,7,'Habitación Triple Confortable',3,3,'35',1,0),(40,7,'Habitación Doble Superior con Jacuzzi',2,2,'32',1,1),(41,8,'Habitación Estándar con Terraza',2,2,'28',1,0),(42,8,'Suite de Lujo',4,4,'50',1,1),(43,8,'Habitación Doble Premium',2,2,'30',0,0),(44,8,'Habitación Familiar Espaciosa',3,3,'40',1,1),(45,8,'Habitación Individual Económica',1,1,'18',0,0),(49,9,'Habitación Familiar Deluxe',4,4,'42',1,1),(50,9,'Habitación Doble Estándar',2,2,'28',0,0),(51,9,'Suite con Vista al Lago',3,3,'45',1,0),(52,9,'Habitación Individual Superior',1,1,'22',0,0),(53,9,'Habitación Doble Premium',2,2,'30',1,1),(59,10,'Habitación Doble con Vista al Jardín',2,2,'30',1,1),(60,10,'Suite Ejecutiva con Terraza',4,4,'55',1,0),(61,10,'Habitación Doble Estándar',2,2,'28',0,0),(62,10,'Habitación Familiar Deluxe',3,3,'40',1,1),(63,10,'Habitación Individual Confortable',1,1,'22',0,0),(69,11,'Habitación Doble con Vista al Mar',2,2,'30',1,1),(70,11,'Suite Familiar con Balcón',4,4,'55',1,0),(71,11,'Habitación Doble Estándar',2,2,'28',0,0),(72,11,'Habitación Triple Confortable',3,3,'40',1,1),(73,11,'Habitación Individual Clásica',1,1,'22',0,0),(74,12,'Habitación Doble Superior',2,2,'35',1,1),(75,12,'Suite de Lujo',4,4,'60',1,0),(76,12,'Habitación Doble Estándar',2,2,'28',0,0),(77,12,'Habitación Familiar Espaciosa',4,4,'45',1,1),(78,12,'Habitación Individual Económica',1,1,'20',0,0),(79,13,'Habitación Doble con Vista al Jardín',2,2,'30',1,1),(80,13,'Suite Familiar con Terraza',4,4,'55',1,0),(81,13,'Habitación Doble Clásica',2,2,'28',0,0),(82,13,'Habitación Triple Confortable',3,3,'40',1,1),(83,13,'Habitación Individual Estándar',1,1,'22',0,0),(84,14,'Habitación Doble Deluxe',2,2,'38',1,1),(85,14,'Suite Ejecutiva',4,4,'65',1,0),(86,14,'Habitación Doble Estándar',2,2,'30',0,0),(87,14,'Habitación Familiar con Vista',4,4,'50',1,1),(88,14,'Habitación Individual Confortable',1,1,'25',0,0),(89,15,'Habitación Doble con Balcón',2,2,'32',1,1),(90,15,'Suite de Lujo con Jacuzzi',4,4,'70',1,0),(91,15,'Habitación Doble Clásica',2,2,'28',0,0),(92,15,'Habitación Familiar Espaciosa',4,4,'48',1,1),(93,15,'Habitación Individual Económica',1,1,'22',0,0);
/*!40000 ALTER TABLE `habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoteles`
--

DROP TABLE IF EXISTS `hoteles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoteles` (
  `id_hotel` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `tipo_hotel` varchar(25) DEFAULT NULL,
  `comunidad_autonoma` varchar(75) DEFAULT NULL,
  `descripcion` text,
  `precio_noche` int DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_hotel`),
  UNIQUE KEY `idx_nombre_hotel` (`nombre`),
  KEY `fk_hoteles_1_idx` (`tipo_hotel`),
  KEY `fk_hoteles_2_idx` (`comunidad_autonoma`),
  CONSTRAINT `fk_hoteles_1` FOREIGN KEY (`tipo_hotel`) REFERENCES `tipo_hotel` (`tipo_hotel`),
  CONSTRAINT `fk_hoteles_2` FOREIGN KEY (`comunidad_autonoma`) REFERENCES `comunidades_autonomas` (`comunidad_autonoma`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoteles`
--

LOCK TABLES `hoteles` WRITE;
/*!40000 ALTER TABLE `hoteles` DISABLE KEYS */;
INSERT INTO `hoteles` VALUES (1,'Hotel Playa Valencia','playa','Valencia','Un elegante hotel frente al mar con vistas impresionantes y acceso directo a la playa.',115,'img/playa/img1.jpg'),(2,'Hotel Sol y Mar','playa','Valencia','Hotel moderno con piscina y restaurante gourmet, ideal para disfrutar del sol y la arena.',120,'img/playa/img2.jpg'),(3,'Hotel Mediterráneo','playa','Valencia','Ubicado en primera línea de playa, ofrece habitaciones con terraza y espectaculares puestas de sol.',125,'img/playa/img3.jpg'),(4,'Hotel Costa Azul','playa','Valencia','Hotel familiar con múltiples actividades acuáticas y servicio todo incluido.',118,'img/playa/img4.jpg'),(5,'Hotel Playa Dorada','playa','Valencia','Un refugio de lujo con spa y acceso a las mejores playas de Valencia.',122,'img/playa/img5.jpg'),(6,'Hotel Montaña Cantabria','montaña','Cantabria','Un acogedor hotel de montaña rodeado de naturaleza y rutas de senderismo.',98,'img/montaña/img1.jpg'),(7,'Hotel Picos de Europa','montaña','Cantabria','Ubicado en los Picos de Europa, este hotel ofrece vistas panorámicas y ambiente rústico.',102,'img/montaña/img2.jpg'),(8,'Hotel Valle de Liébana','montaña','Cantabria','Hotel rural con encanto, ideal para desconectar y disfrutar del aire puro de Cantabria.',100,'img/montaña/img3.jpg'),(9,'Hotel Cabañas del Bosque','montaña','Cantabria','Cabañas de madera en plena montaña, perfectas para una escapada en la naturaleza.',95,'img/montaña/img4.jpg'),(10,'Hotel Mirador de la Montaña','montaña','Cantabria','Hotel con un mirador espectacular y chimeneas en cada habitación para una experiencia acogedora.',105,'img/montaña/img5.jpg'),(11,'Hotel Ciudad Madrid','ciudad','Madrid','Moderno hotel en el centro de Madrid, con fácil acceso a las principales atracciones turísticas.',135,'img/ciudad/img1.jpg'),(12,'Hotel Gran Vía','ciudad','Madrid','Ubicado en la Gran Vía, este hotel ofrece lujo y comodidad en el corazón de la ciudad.',140,'img/ciudad/img2.jpg'),(13,'Hotel Plaza Mayor','ciudad','Madrid','A pocos metros de la Plaza Mayor, ideal para explorar la historia y cultura madrileña.',145,'img/ciudad/img3.jpg'),(14,'Hotel Retiro','ciudad','Madrid','Frente al Parque del Retiro, combina naturaleza y cercanía a la zona cultural de Madrid.',138,'img/ciudad/img4.jpg'),(15,'Hotel Centro Histórico','ciudad','Madrid','Situado en el casco histórico, con una arquitectura clásica y un ambiente sofisticado.',142,'img/ciudad/img5.jpg');
/*!40000 ALTER TABLE `hoteles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opiniones`
--

DROP TABLE IF EXISTS `opiniones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opiniones` (
  `id_opinion` int NOT NULL AUTO_INCREMENT,
  `id_hotel` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `calificacion` int DEFAULT NULL,
  `comentario` text,
  `fecha_opinion` date DEFAULT NULL,
  PRIMARY KEY (`id_opinion`),
  KEY `fk_opiniones_1_idx` (`id_hotel`),
  KEY `fk_opiniones_2_idx` (`id_usuario`),
  CONSTRAINT `fk_opiniones_1` FOREIGN KEY (`id_hotel`) REFERENCES `hoteles` (`id_hotel`),
  CONSTRAINT `fk_opiniones_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opiniones`
--

LOCK TABLES `opiniones` WRITE;
/*!40000 ALTER TABLE `opiniones` DISABLE KEYS */;
/*!40000 ALTER TABLE `opiniones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `metodo_pago` varchar(45) DEFAULT NULL,
  `total_pago` decimal(10,2) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `idx_total_pago` (`total_pago`),
  KEY `fk_pagos_1_idx_new` (`metodo_pago`),
  KEY `fk_pagos_1_idx` (`metodo_pago`),
  CONSTRAINT `fk_pagos_1` FOREIGN KEY (`metodo_pago`) REFERENCES `tipos_pagos` (`metodo_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises_usuario`
--

DROP TABLE IF EXISTS `paises_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises_usuario` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id_pais`),
  UNIQUE KEY `pais_UNIQUE` (`pais`)
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises_usuario`
--

LOCK TABLES `paises_usuario` WRITE;
/*!40000 ALTER TABLE `paises_usuario` DISABLE KEYS */;
INSERT INTO `paises_usuario` VALUES (187,'Afganistán'),(188,'Albania'),(189,'Alemania'),(190,'Andorra'),(191,'Angola'),(192,'Antigua y Barbuda'),(193,'Arabia Saudita'),(194,'Armenia'),(195,'Australia'),(196,'Austria'),(197,'Azerbaiyán'),(198,'Bahamas'),(199,'Bahrein'),(200,'Bangladés'),(201,'Barbados'),(202,'Baréin'),(203,'Bélgica'),(204,'Belice'),(205,'Benín'),(206,'Bielorrusia'),(207,'Birmania'),(208,'Bolivia'),(209,'Bosnia y Herzegovina'),(210,'Botsuana'),(211,'Brasil'),(212,'Brunéi'),(213,'Bulgaria'),(214,'Burkina Faso'),(215,'Burundi'),(216,'Cabo Verde'),(217,'Camboya'),(218,'Camerún'),(219,'Canadá'),(220,'Catar'),(221,'Chile'),(222,'China'),(223,'Chipre'),(224,'Colombia'),(225,'Comoras'),(226,'Congo'),(227,'Corea del Norte'),(228,'Corea del Sur'),(229,'Costa Rica'),(230,'Croacia'),(231,'Cuba'),(232,'Curazao'),(233,'Dinamarca'),(234,'Dominica'),(235,'Ecuador'),(236,'Egipto'),(237,'El Salvador'),(238,'Emiratos Árabes Unidos'),(239,'Eslovaquia'),(240,'Eslovenia'),(241,'España'),(242,'Estados Unidos'),(243,'Estonia'),(244,'Etiopía'),(245,'Filipinas'),(246,'Finlandia'),(247,'Fiyi'),(248,'Francia'),(249,'Gabón'),(250,'Gambia'),(251,'Gana'),(252,'Granada'),(253,'Grecia'),(254,'Guatemala'),(255,'Guinea'),(256,'Guinea Ecuatorial'),(257,'Guinea-Bisáu'),(258,'Guyana'),(259,'Haití'),(260,'Honduras'),(261,'Hungría'),(262,'India'),(263,'Indonesia'),(264,'Irak'),(265,'Irán'),(266,'Irlanda'),(267,'Islandia'),(268,'Islas Marshall'),(269,'Islas Salomón'),(270,'Israel'),(271,'Italia'),(272,'Jamaica'),(273,'Japón'),(274,'Jordania'),(275,'Kazajistán'),(276,'Kenia'),(277,'Kirguistán'),(278,'Kiribati'),(279,'Kuwait'),(280,'Laos'),(281,'Lesoto'),(282,'Letonia'),(283,'Líbano'),(284,'Liberia'),(285,'Libia'),(286,'Liechtenstein'),(287,'Lituania'),(288,'Luxemburgo'),(289,'Madagascar'),(290,'Malasia'),(291,'Malaui'),(292,'Maldivas'),(293,'Malí'),(294,'Malta'),(295,'Marruecos'),(296,'Mauricio'),(297,'Mauritania'),(298,'México'),(299,'Micronesia'),(300,'Moldavia'),(301,'Mónaco'),(302,'Mongolia'),(303,'Montenegro'),(304,'Mozambique'),(305,'Namibia'),(306,'Nauru'),(307,'Nepal'),(308,'Nicaragua'),(309,'Níger'),(310,'Nigeria'),(311,'Noruega'),(312,'Nueva Zelanda'),(313,'Omán'),(314,'Pakistán'),(315,'Palaos'),(316,'Panamá'),(317,'Papúa Nueva Guinea'),(318,'Paraguay'),(319,'Perú'),(320,'Polonia'),(321,'Portugal'),(322,'Reino Unido'),(323,'República Checa'),(324,'República Dominicana'),(325,'Ruanda'),(326,'Rumanía'),(327,'Samoa'),(328,'San Cristóbal y Nieves'),(329,'San Marino'),(330,'San Vicente y las Granadinas'),(331,'Santa Lucía'),(332,'Santo Tomé y Príncipe'),(333,'Senegal'),(334,'Serbia'),(335,'Seychelles'),(336,'Sierra Leona'),(337,'Singapur'),(338,'Siria'),(339,'Somalia'),(340,'Sri Lanka'),(341,'Sudáfrica'),(342,'Sudán'),(343,'Sudán del Sur'),(344,'Suecia'),(345,'Suiza'),(346,'Surinam'),(347,'Svajilandia'),(348,'Tailandia'),(349,'Tanzania'),(350,'Tayikistán'),(351,'Timor Oriental'),(352,'Togo'),(353,'Tonga'),(354,'Trinidad y Tobago'),(355,'Túnez'),(356,'Turkmenistán'),(357,'Turquía'),(358,'Tuvalu'),(360,'Ucrania'),(359,'Uganda'),(361,'Uruguay'),(362,'Uzbekistán'),(363,'Vanuatu'),(364,'Vaticano'),(365,'Venezuela'),(366,'Vietnam'),(367,'Yemen'),(368,'Yibuti'),(369,'Zambia'),(370,'Zimbabue');
/*!40000 ALTER TABLE `paises_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id_promocion` int NOT NULL AUTO_INCREMENT,
  `id_servicio` int DEFAULT NULL,
  `id_hotel` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `descuento` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_promocion`),
  KEY `fk_promociones_1_idx` (`id_servicio`),
  KEY `fk_promociones_2_idx` (`id_hotel`),
  CONSTRAINT `fk_promociones_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  CONSTRAINT `fk_promociones_2` FOREIGN KEY (`id_hotel`) REFERENCES `hoteles` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_hotel` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `dia_entrada` datetime DEFAULT NULL,
  `dia_salida` datetime DEFAULT NULL,
  `cantidad_personas` int DEFAULT NULL,
  `mascota` tinyint DEFAULT NULL,
  `plaza_coche_parking` tinyint DEFAULT NULL,
  `id_habitacions` int DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `fk_reservas_2_idx` (`id_hotel`),
  KEY `fk_reservas_1_idx` (`id_usuario`),
  KEY `fk_reservas_3_idx` (`id_habitacions`),
  CONSTRAINT `fk_reservas_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_reservas_2` FOREIGN KEY (`id_hotel`) REFERENCES `hoteles` (`id_hotel`),
  CONSTRAINT `fk_reservas_3` FOREIGN KEY (`id_habitacions`) REFERENCES `habitaciones` (`id_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `nombre_hotel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `fk_servicios_1_idx_new` (`nombre_hotel`),
  KEY `fk_servicios_1_idx` (`nombre_hotel`),
  CONSTRAINT `fk_servicios_1` FOREIGN KEY (`nombre_hotel`) REFERENCES `hoteles` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (10,'WiFi gratuito','Hotel Playa Valencia'),(11,'Desayuno incluido','Hotel Playa Valencia'),(12,'Servicio de limpieza diario','Hotel Playa Valencia'),(13,'Piscina exterior','Hotel Sol y Mar'),(14,'Spa y bienestar','Hotel Sol y Mar'),(15,'Restaurante con vista al mar','Hotel Sol y Mar'),(16,'Actividades acuáticas','Hotel Sol y Mar'),(17,'WiFi gratuito','Hotel Mediterráneo'),(18,'Desayuno buffet','Hotel Mediterráneo'),(19,'Acceso directo a la playa','Hotel Mediterráneo'),(20,'Restaurante gourmet','Hotel Costa Azul'),(21,'Bar en la piscina','Hotel Costa Azul'),(22,'Servicio de transporte al aeropuerto','Hotel Costa Azul'),(23,'Actividades recreativas','Hotel Costa Azul'),(24,'WiFi gratuito','Hotel Playa Dorada'),(25,'Club infantil','Hotel Playa Dorada'),(26,'Actividades deportivas en la playa','Hotel Playa Dorada'),(27,'Bar en la playa','Hotel Playa Dorada'),(28,'Senderismo guiado','Hotel Montaña Cantabria'),(29,'Desayuno típico de la región','Hotel Montaña Cantabria'),(30,'Alquiler de bicicletas','Hotel Montaña Cantabria'),(31,'Zona de spa y relajación','Hotel Montaña Cantabria'),(32,'Excursiones a la montaña','Hotel Picos de Europa'),(33,'Restaurante con comida local','Hotel Picos de Europa'),(34,'Guías turísticos disponibles','Hotel Picos de Europa'),(35,'Catas de vino','Hotel Valle de Liébana'),(36,'Senderismo y rutas naturales','Hotel Valle de Liébana'),(37,'Zona de juegos para niños','Hotel Valle de Liébana'),(38,'Cabañas privadas en la naturaleza','Hotel Cabañas del Bosque'),(39,'Actividades al aire libre','Hotel Cabañas del Bosque'),(40,'Barbacoa y picnic en el bosque','Hotel Cabañas del Bosque'),(41,'Vistas panorámicas','Hotel Mirador de la Montaña'),(42,'Senderismo guiado','Hotel Mirador de la Montaña'),(43,'Restaurante con cocina regional','Hotel Mirador de la Montaña'),(44,'WiFi gratuito en todo el hotel','Hotel Ciudad Madrid'),(45,'Centro de negocios','Hotel Ciudad Madrid'),(46,'Servicio de habitaciones 24 horas','Hotel Ciudad Madrid'),(47,'Gimnasio equipado','Hotel Ciudad Madrid'),(48,'Ubicación céntrica','Hotel Gran Vía'),(49,'Terraza en la azotea','Hotel Gran Vía'),(50,'Bar y lounge','Hotel Gran Vía'),(51,'Desayuno continental incluido','Hotel Gran Vía'),(52,'Ubicación en el corazón de la ciudad','Hotel Plaza Mayor'),(53,'Desayuno buffet','Hotel Plaza Mayor'),(54,'Recepción 24 horas','Hotel Plaza Mayor'),(55,'Servicio de transporte al aeropuerto','Hotel Plaza Mayor'),(56,'Jardín privado','Hotel Retiro'),(57,'Spa y wellness','Hotel Retiro'),(58,'Alquiler de bicicletas','Hotel Retiro'),(59,'Restaurante gourmet','Hotel Retiro'),(60,'Visitas guiadas a monumentos cercanos','Hotel Centro Histórico'),(61,'WiFi gratuito en áreas comunes','Hotel Centro Histórico'),(62,'Cafetería y bar','Hotel Centro Histórico'),(63,'Servicio de lavandería','Hotel Centro Histórico');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifas`
--

DROP TABLE IF EXISTS `tarifas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifas` (
  `id_tarifa` int NOT NULL AUTO_INCREMENT,
  `id_hotel` int DEFAULT NULL,
  `inicio_tarifa` date DEFAULT NULL,
  `fin_tarifa` date DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_tarifa`),
  KEY `fk_tarifas_1_idx` (`id_hotel`),
  CONSTRAINT `fk_tarifas_1` FOREIGN KEY (`id_hotel`) REFERENCES `hoteles` (`id_hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifas`
--

LOCK TABLES `tarifas` WRITE;
/*!40000 ALTER TABLE `tarifas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarifas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_hotel`
--

DROP TABLE IF EXISTS `tipo_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_hotel` (
  `id_tipo_hotel` int NOT NULL AUTO_INCREMENT,
  `tipo_hotel` varchar(25) NOT NULL,
  PRIMARY KEY (`id_tipo_hotel`,`tipo_hotel`),
  UNIQUE KEY `idx_tipo_hotel` (`tipo_hotel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_hotel`
--

LOCK TABLES `tipo_hotel` WRITE;
/*!40000 ALTER TABLE `tipo_hotel` DISABLE KEYS */;
INSERT INTO `tipo_hotel` VALUES (2,'ciudad'),(1,'montaña'),(3,'playa');
/*!40000 ALTER TABLE `tipo_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_pagos`
--

DROP TABLE IF EXISTS `tipos_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_pagos` (
  `id_tipo_pago` int NOT NULL AUTO_INCREMENT,
  `metodo_pago` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_pago`),
  UNIQUE KEY `idx_metodo_pago` (`metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_pagos`
--

LOCK TABLES `tipos_pagos` WRITE;
/*!40000 ALTER TABLE `tipos_pagos` DISABLE KEYS */;
INSERT INTO `tipos_pagos` VALUES (3,'facial'),(2,'paypal'),(1,'tarjeta');
/*!40000 ALTER TABLE `tipos_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(20) DEFAULT NULL,
  `nombre` varchar(35) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `nombre_pais` varchar(45) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `fk_usuarios_1_idx` (`nombre_pais`),
  CONSTRAINT `fk_usuarios_1` FOREIGN KEY (`nombre_pais`) REFERENCES `paises_usuario` (`pais`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (37,'76373838H','Hugo','Moreno','hugo@gmail.com',NULL,NULL,'$2y$10$FgYowSYdBiNFAyV32ZwMKO0ZPanA0k6jmYzqlrSIt3HgD6GvsGoz2'),(38,'64747474B','Bruno','Ostos','bruno1@gmail.com',NULL,NULL,'$2y$10$n3wcf1jyAhT7hZbkAQYqC.PlYodMal7Qq3W9wdC79irW35bAOKrAK');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-18 19:26:00

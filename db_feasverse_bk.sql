-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_feasverse
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_clientes`
--

DROP TABLE IF EXISTS `tb_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(20) NOT NULL,
  `apellido_cliente` varchar(20) NOT NULL,
  `dui_cliente` varchar(10) NOT NULL,
  `telefono_cliente` varchar(9) NOT NULL,
  `correo_cliente` varchar(30) NOT NULL,
  `direccion_cliente` varchar(30) NOT NULL,
  `clave_cliente` varchar(30) NOT NULL,
  `fecha_de_registro` date NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `estado_cliente` enum('Activo','Desactivo') DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `uq_correo_cliente` (`correo_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_clientes`
--

LOCK TABLES `tb_clientes` WRITE;
/*!40000 ALTER TABLE `tb_clientes` DISABLE KEYS */;
INSERT INTO `tb_clientes` VALUES (1,'Javier','Sánchez','22334455-6','334455607','javier.sanchez@email.com','Calle de los Olivos #1415','clave1415','2024-03-06','1994-06-12','Activo'),(2,'Carmen','Díaz','3445566-7','44556678','carmen.diaz@email.com','Avenida del Parque #1617','clave1617','2024-03-06','1987-02-20','Activo'),(3,'Pedro','Ramírez','44556477-8','516677889','pedro.ramirez@email.com','Calle de las Flores #1819','clave1819','2024-03-06','1998-04-30','Activo'),(4,'Laura','Torres','55637788-9','667588990','laura.torres@email.com','Boulevard de la Luna #2021','clave2021','2024-03-06','1981-10-08','Activo'),(5,'Martín','Flores','66778889-0','748899001','martin.flores@email.com','Calle de los Sueños #2223','clave2223','2024-03-06','1993-03-25','Activo'),(6,'Sofía','Lara','77889900-1','889900212','sofia.lara@email.com','Avenida de las Estrellas #2425','clave2425','2024-03-06','1986-05-14','Activo'),(7,'Gabriel','Ortega','88990011-2','990011223','gabriel.ortega@email.com','Calle de la Aurora #2627','clave2627','2024-03-06','1997-08-21','Activo'),(8,'Verónica','Mendoza','99001122-3','112233445','veronica.mendoza@email.com','Boulevard del Sol #2829','clave2829','2024-03-06','1989-12-02','Activo'),(9,'Raúl','Pinto','00112233-4','223344556','raul.pinto@email.com','Avenida del Cielo #3031','clave3031','2024-03-06','1996-01-09','Activo'),(10,'Julia','Cruz','11223344-5','334455667','julia.cruz@email.com','Calle del Mar #3233','clave3233','2024-03-06','1984-07-18','Activo'),(11,'Fernando','Salgado','22334555-6','045566778','fernando.salgado@email.com','Boulevard del Viento #3435','clave3435','2024-03-06','1991-09-26','Activo'),(12,'Lucía','Herrera','33445566-7','557677889','lucia.herrera@email.com','Calle del Océano #3637','clave3637','2024-03-06','1980-04-11','Activo'),(13,'Diego','Vega','44556977-8','667688990','diego.vega@email.com','Avenida de la Montaña #3839','clave3839','2024-03-06','1999-06-05','Activo'),(14,'Marta','Gutierrez','55667688-9','778499001','marta.gutierrez@email.com','Boulevard del Bosque #4041','clave4041','2024-03-06','1982-03-15','Activo'),(15,'Roberto','Suarez','66778859-0','889970112','roberto.suarez@email.com','Calle del Río #4243','clave4243','2024-03-06','1994-05-23','Activo'),(16,'Patricia','Ríos','88990012-2','990511223','patricia.rios@email.com','Avenida del Campo #4445','clave4445','2024-03-06','1996-11-14','Activo'),(17,'Gabriel','Molina','99001122-9','112236445','gabriel.molina@email.com','Boulevard de las Aves #4647','clave4647','2024-03-06','1989-02-28','Activo'),(18,'Silvia','Montes','77889900-3','223344656','silvia.montes@email.com','Calle de la Selva #4849','clave4849','2024-03-06','1987-08-30','Activo'),(19,'Jorge','Navarro','66778599-0','445566878','jorge.navarro@email.com','Boulevard del Desierto #5051','clave5051','2024-03-06','1994-01-17','Activo'),(20,'Natalia','Castañeda','44556577-8','667787990','natalia.castaneda@email.com','Avenida de la Luna #5253','clave5253','2024-03-06','1985-06-28','Activo'),(21,'Hugo','Contreras','55663788-9','879900112','hugo.contreras@email.com','Calle del Arco Iris #5455','clave5455','2024-03-06','1993-09-10','Activo'),(22,'Ana','Pérez','44546677-8','556977889','ana.perez@email.com','Boulevard de las Mariposas #56','clave5657','2024-03-06','1988-12-24','Activo'),(23,'Luis','Vargas','77889900-9','667784990','luis.vargas@email.com','Avenida del Vino #5859','clave5859','2024-03-06','1982-02-06','Activo'),(24,'Marcela','García','11223364-5','223444556','marcela.garcia@email.com','Calle de las Palmeras #6061','clave6061','2024-03-06','1991-08-14','Activo'),(25,'Ricardo','López','33545566-7','445266778','ricardo.lopez@email.com','Boulevard de las Flores #6263','clave6263','2024-03-06','1986-03-30','Activo'),(26,'Eva','Martínez','55767788-9','667780990','eva.martinez@email.com','Avenida de las Fuentes #6465','clave6465','2024-03-06','1980-11-09','Activo');
/*!40000 ALTER TABLE `tb_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_colores`
--

DROP TABLE IF EXISTS `tb_colores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_colores` (
  `id_color` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_color` varchar(20) NOT NULL,
  PRIMARY KEY (`id_color`),
  UNIQUE KEY `uq_nombre_color` (`nombre_color`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_colores`
--

LOCK TABLES `tb_colores` WRITE;
/*!40000 ALTER TABLE `tb_colores` DISABLE KEYS */;
INSERT INTO `tb_colores` VALUES (6,'Amarillo'),(25,'Aqua'),(2,'Azul'),(13,'Beige'),(5,'Blanco'),(22,'Caqui'),(12,'Celeste'),(16,'Cian'),(24,'Coral'),(23,'Fucsia'),(10,'Gris'),(21,'Índigo'),(19,'Lila'),(11,'Marrón'),(8,'Morado'),(9,'Naranja'),(4,'Negro'),(17,'Ocre'),(1,'Rojo'),(7,'Rosa'),(18,'Salmon'),(20,'Teal'),(14,'Turquesa'),(3,'Verde'),(15,'Violeta');
/*!40000 ALTER TABLE `tb_colores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comentarios`
--

DROP TABLE IF EXISTS `tb_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_comentarios` (
  `id_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_comentario` varchar(165) NOT NULL,
  `descripcion_comentario` varchar(165) NOT NULL,
  `calificacion_comentario` int(11) NOT NULL,
  `estado_comentario` enum('Activo','Desactivo') DEFAULT NULL,
  `fecha_del_comentario` date DEFAULT NULL,
  `id_detalles_pedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `fk_comentario_detalle` (`id_detalles_pedido`),
  CONSTRAINT `fk_comentario_detalle` FOREIGN KEY (`id_detalles_pedido`) REFERENCES `tb_detalles_pedidos` (`id_detalles_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comentarios`
--

LOCK TABLES `tb_comentarios` WRITE;
/*!40000 ALTER TABLE `tb_comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_comentarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_insert_tb_comentarios
BEFORE INSERT ON tb_comentarios
FOR EACH ROW
BEGIN
    IF NEW.fecha_del_comentario >= CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La fecha de entrega debe ser anterior a la fecha actual.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_costos_de_envio_por_departamento`
--

DROP TABLE IF EXISTS `tb_costos_de_envio_por_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_costos_de_envio_por_departamento` (
  `id_costo_de_envio_por_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_departamento` int(11) NOT NULL,
  `costo_de_envio` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_costo_de_envio_por_departamento`),
  UNIQUE KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `fk_costo_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `tb_departamentos` (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_costos_de_envio_por_departamento`
--

LOCK TABLES `tb_costos_de_envio_por_departamento` WRITE;
/*!40000 ALTER TABLE `tb_costos_de_envio_por_departamento` DISABLE KEYS */;
INSERT INTO `tb_costos_de_envio_por_departamento` VALUES (1,1,10.50),(2,2,12.75),(3,3,9.00),(4,4,11.25),(5,5,15.00),(6,6,13.50),(7,7,10.75),(8,8,14.25),(9,9,12.00),(10,10,16.50),(11,11,11.75),(12,12,13.00),(13,13,14.50),(14,14,12.25);
/*!40000 ALTER TABLE `tb_costos_de_envio_por_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_departamentos`
--

DROP TABLE IF EXISTS `tb_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_departamentos` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(100) NOT NULL,
  PRIMARY KEY (`id_departamento`),
  UNIQUE KEY `nombre_departamento` (`nombre_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_departamentos`
--

LOCK TABLES `tb_departamentos` WRITE;
/*!40000 ALTER TABLE `tb_departamentos` DISABLE KEYS */;
INSERT INTO `tb_departamentos` VALUES (1,'Ahuachapán'),(2,'Cabañas'),(3,'Chalatenango'),(4,'Cuscatlán'),(5,'La Libertad'),(6,'La Paz'),(7,'La Unión'),(8,'Morazán'),(9,'San Miguel'),(10,'San Salvador'),(11,'San Vicente'),(12,'Santa Ana'),(13,'Sonsonate'),(14,'Usulután');
/*!40000 ALTER TABLE `tb_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalle_zapatos`
--

DROP TABLE IF EXISTS `tb_detalle_zapatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_detalle_zapatos` (
  `id_detalle_zapato` int(11) NOT NULL AUTO_INCREMENT,
  `id_zapato` int(11) NOT NULL,
  `id_talla` int(11) NOT NULL,
  `cantidad_zapato` int(11) NOT NULL,
  `id_detalle_color_zapato` int(11) NOT NULL,
  `precio_unitario_zapato` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_zapato`),
  KEY `fk_talla` (`id_talla`),
  KEY `fk_zapato` (`id_zapato`),
  KEY `fk_detalle_color` (`id_detalle_color_zapato`),
  CONSTRAINT `fk_detalle_color` FOREIGN KEY (`id_detalle_color_zapato`) REFERENCES `tb_detalles_colores_zapatos` (`id_detalle_color_zapato`),
  CONSTRAINT `fk_talla` FOREIGN KEY (`id_talla`) REFERENCES `tb_tallas` (`id_talla`),
  CONSTRAINT `fk_zapato` FOREIGN KEY (`id_zapato`) REFERENCES `tb_zapatos` (`id_zapato`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalle_zapatos`
--

LOCK TABLES `tb_detalle_zapatos` WRITE;
/*!40000 ALTER TABLE `tb_detalle_zapatos` DISABLE KEYS */;
INSERT INTO `tb_detalle_zapatos` VALUES (1,1,1,5,1,89.99),(2,2,2,3,2,109.99),(3,3,3,8,3,74.99),(4,4,4,10,4,129.99),(5,5,5,7,5,59.99),(6,6,6,2,6,79.99),(7,7,7,4,7,94.99),(8,8,8,6,8,149.99),(9,9,9,3,9,69.99),(10,10,10,9,10,119.99),(11,11,11,12,11,54.99),(12,12,12,15,12,89.99),(13,13,13,8,13,79.99),(14,14,14,5,14,109.99),(15,15,15,7,15,64.99),(16,16,16,10,16,129.99),(17,17,17,4,17,44.99),(18,18,18,6,18,94.99),(19,19,19,3,19,69.99),(20,20,20,9,20,119.99),(21,21,21,12,21,54.99),(22,22,22,15,22,89.99),(23,23,23,8,23,79.99),(24,24,24,5,24,109.99),(25,25,25,7,25,64.99);
/*!40000 ALTER TABLE `tb_detalle_zapatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalles_colores_zapatos`
--

DROP TABLE IF EXISTS `tb_detalles_colores_zapatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_detalles_colores_zapatos` (
  `id_detalle_color_zapato` int(11) NOT NULL AUTO_INCREMENT,
  `foto_zapato_color` varchar(20) NOT NULL,
  `id_color` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_color_zapato`),
  KEY `fk_detalles_colores_zapatos` (`id_color`),
  CONSTRAINT `fk_detalles_colores_zapatos` FOREIGN KEY (`id_color`) REFERENCES `tb_colores` (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalles_colores_zapatos`
--

LOCK TABLES `tb_detalles_colores_zapatos` WRITE;
/*!40000 ALTER TABLE `tb_detalles_colores_zapatos` DISABLE KEYS */;
INSERT INTO `tb_detalles_colores_zapatos` VALUES (1,'rojo_1.jpg',1),(2,'azul_1.jpg',2),(3,'verde_1.jpg',3),(4,'negro_1.jpg',4),(5,'blanco_1.jpg',5),(6,'amarillo_1.jpg',6),(7,'rosa_1.jpg',7),(8,'morado_1.jpg',8),(9,'naranja_1.jpg',9),(10,'gris_1.jpg',10),(11,'marron_1.jpg',11),(12,'celeste_1.jpg',12),(13,'beige_1.jpg',13),(14,'turquesa_1.jpg',14),(15,'violeta_1.jpg',15),(16,'cian_1.jpg',16),(17,'ocre_1.jpg',17),(18,'salmon_1.jpg',18),(19,'lila_1.jpg',19),(20,'teal_1.jpg',20),(21,'indigo_1.jpg',21),(22,'caqui_1.jpg',22),(23,'fucsia_1.jpg',23),(24,'coral_1.jpg',24),(25,'aqua_1.jpg',25),(26,'rojo_zapato_1.jpg',25),(27,'azul_zapato_2.jpg',24),(28,'verde_zapato_3.jpg',23),(29,'negro_zapato_4.jpg',22),(30,'blanco_zapato_5.jpg',21),(31,'amarillo_zapato_6.jp',20),(32,'rosa_zapato_7.jpg',19),(33,'morado_zapato_8.jpg',18),(34,'naranja_zapato_9.jpg',17),(35,'gris_zapato_10.jpg',16),(36,'marron_zapato_11.jpg',15),(37,'celeste_zapato_12.jp',14),(38,'beige_zapato_13.jpg',13),(39,'turquesa_zapato_14.j',12),(40,'violeta_zapato_15.jp',11),(41,'cian_zapato_16.jpg',10),(42,'ocre_zapato_17.jpg',9),(43,'salmon_zapato_18.jpg',8),(44,'lila_zapato_19.jpg',7),(45,'teal_zapato_20.jpg',6),(46,'indigo_zapato_21.jpg',5),(47,'caqui_zapato_22.jpg',4),(48,'fucsia_zapato_23.jpg',3),(49,'coral_zapato_24.jpg',2),(50,'aqua_zapato_25.jpg',1);
/*!40000 ALTER TABLE `tb_detalles_colores_zapatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalles_pedidos`
--

DROP TABLE IF EXISTS `tb_detalles_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_detalles_pedidos` (
  `id_detalles_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido_cliente` int(11) NOT NULL,
  `id_detalle_zapato` int(11) NOT NULL,
  `cantidad_pedido` int(11) NOT NULL,
  `precio_del_zapato` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_detalles_pedido`),
  CONSTRAINT `ck_precio_del_zapato` CHECK (`precio_del_zapato` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalles_pedidos`
--

LOCK TABLES `tb_detalles_pedidos` WRITE;
/*!40000 ALTER TABLE `tb_detalles_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_detalles_pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_existencias_zapato
AFTER INSERT ON tb_detalles_pedidos
FOR EACH ROW
BEGIN
    UPDATE tb_detalle_zapatos
    SET cantidad_zapato = cantidad_zapato - NEW.cantidad_pedido
    WHERE id_detalle_zapato = NEW.id_detalle_zapato;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_marcas`
--

DROP TABLE IF EXISTS `tb_marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_marcas` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(20) NOT NULL,
  `foto_marca` varchar(20) NOT NULL,
  `descripcion_marca` varchar(100) NOT NULL,
  PRIMARY KEY (`id_marca`),
  UNIQUE KEY `uq_nombre_marca` (`nombre_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_marcas`
--

LOCK TABLES `tb_marcas` WRITE;
/*!40000 ALTER TABLE `tb_marcas` DISABLE KEYS */;
INSERT INTO `tb_marcas` VALUES (1,'Nike','nike_logo.jpg','Marca reconocida por sus innovadores diseños y tecnología en calzado deportivo.'),(2,'Adidas','adidas_logo.jpg','Empresa alemana conocida por sus productos deportivos y de moda, incluyendo una amplia gama de zapat'),(3,'Puma','puma_logo.jpg','Marca de ropa y calzado deportivo con un enfoque en el estilo y la comodidad.'),(4,'Reebok','reebok_logo.jpg','Empresa estadounidense especializada en calzado deportivo y ropa casual.'),(5,'Converse','converse_logo.jpg','Famosa por sus zapatillas estilo casual, especialmente las icónicas Chuck Taylor.'),(6,'Vans','vans_logo.jpg','Marca californiana conocida por sus zapatillas de skate y moda urbana.'),(7,'New Balance','newbalance_logo.jpg','Especializada en calzado deportivo con énfasis en la comodidad y el soporte.'),(8,'Timberland','timberland_logo.jpg','Reconocida por sus botas resistentes y calzado casual de calidad.'),(9,'Skechers','skechers_logo.jpg','Empresa estadounidense que ofrece una variedad de calzado cómodo y moderno.'),(10,'Dr. Martens','drmartens_logo.jpg','Famosa por sus botas con suela de aire, icónicas en la cultura punk y alternativa.'),(11,'Clarks','clarks_logo.jpg','Marca británica conocida por sus zapatos de calidad y diseño clásico.'),(12,'Salomon','salomon_logo.jpg','Especializada en calzado para deportes al aire libre y actividades de montaña.'),(13,'Birkenstock','birkenstock_logo.jpg','Famosa por sus sandalias y zuecos con plantillas ergonómicas.'),(14,'Under Armour','underarmour_logo.jpg','Marca de ropa y calzado deportivo, especialmente popular en el ámbito del fitness.'),(15,'Mizuno','mizuno_logo.jpg','Especializada en calzado deportivo, especialmente en running y deportes de equipo.'),(16,'Fila','fila_logo.jpg','Marca italiana conocida por su calzado deportivo y moda urbana.'),(17,'Merrell','merrell_logo.jpg','Enfocada en calzado para actividades al aire libre y senderismo.'),(18,'Asics','asics_logo.jpg','Especializada en calzado para correr y deportes de alto rendimiento.'),(19,'Crocs','crocs_logo.jpg','Famosa por sus zuecos de plástico ligero y cómodo.'),(20,'Hush Puppies','hushpuppies_logo.jpg','Conocida por sus zapatos casuales y cómodos.'),(21,'Ecco','ecco_logo.jpg','Marca danesa reconocida por su calzado de calidad y comodidad.'),(22,'Keen','keen_logo.jpg','Especializada en calzado para actividades al aire libre y sandalias deportivas.'),(23,'Caterpillar','caterpillar_logo.jpg','Famosa por sus botas de trabajo resistentes y duraderas.'),(24,'Vivobarefoot','vivobarefoot_logo.jp','Enfocada en calzado minimalista y barefoot para una experiencia natural.'),(25,'Saucony','saucony_logo.jpg','Especializada en calzado para correr con énfasis en la tecnología y rendimiento.');
/*!40000 ALTER TABLE `tb_marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mas_colores_de_zapatos`
--

DROP TABLE IF EXISTS `tb_mas_colores_de_zapatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mas_colores_de_zapatos` (
  `id_mas_color_de_zapato` int(11) NOT NULL AUTO_INCREMENT,
  `id_color` int(11) NOT NULL,
  `id_detalle_color_zapato` int(11) NOT NULL,
  PRIMARY KEY (`id_mas_color_de_zapato`),
  KEY `fk_mas_colores` (`id_detalle_color_zapato`),
  KEY `fk_color` (`id_color`),
  CONSTRAINT `fk_color` FOREIGN KEY (`id_color`) REFERENCES `tb_colores` (`id_color`),
  CONSTRAINT `fk_mas_colores` FOREIGN KEY (`id_detalle_color_zapato`) REFERENCES `tb_detalles_colores_zapatos` (`id_detalle_color_zapato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mas_colores_de_zapatos`
--

LOCK TABLES `tb_mas_colores_de_zapatos` WRITE;
/*!40000 ALTER TABLE `tb_mas_colores_de_zapatos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mas_colores_de_zapatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_niveles`
--

DROP TABLE IF EXISTS `tb_niveles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_niveles` (
  `id_nivel` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(20) NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_niveles`
--

LOCK TABLES `tb_niveles` WRITE;
/*!40000 ALTER TABLE `tb_niveles` DISABLE KEYS */;
INSERT INTO `tb_niveles` VALUES (1,'Admin'),(2,'Trabajador'),(3,'Repartidor');
/*!40000 ALTER TABLE `tb_niveles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedidos_clientes`
--

DROP TABLE IF EXISTS `tb_pedidos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pedidos_clientes` (
  `id_pedido_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_repartidor` int(11) NOT NULL,
  `estado_pedido` enum('Pendiente','En camino','Entregado') NOT NULL,
  `precio_total` decimal(8,2) NOT NULL,
  `fecha_de_inicio` date NOT NULL,
  `fecha_de_entrega` date DEFAULT NULL,
  `id_costo_de_envio_por_departamento` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido_cliente`),
  KEY `fk_pedidos_clientes` (`id_cliente`),
  KEY `fk_pedidos_repartidor` (`id_repartidor`),
  KEY `fk_pedidos_costo` (`id_costo_de_envio_por_departamento`),
  CONSTRAINT `fk_pedidos_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `tb_clientes` (`id_cliente`),
  CONSTRAINT `fk_pedidos_costo` FOREIGN KEY (`id_costo_de_envio_por_departamento`) REFERENCES `tb_costos_de_envio_por_departamento` (`id_costo_de_envio_por_departamento`),
  CONSTRAINT `fk_pedidos_repartidor` FOREIGN KEY (`id_repartidor`) REFERENCES `tb_trabajadores` (`id_trabajador`),
  CONSTRAINT `ck_precio_total` CHECK (`precio_total` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedidos_clientes`
--

LOCK TABLES `tb_pedidos_clientes` WRITE;
/*!40000 ALTER TABLE `tb_pedidos_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pedidos_clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_insert_tb_pedidos_clientes
BEFORE INSERT ON tb_pedidos_clientes
FOR EACH ROW
BEGIN
    IF NEW.fecha_de_entrega >= CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La fecha de entrega debe ser anterior a la fecha actual.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_insert_tb_pedidos_clientes_fi
BEFORE INSERT ON tb_pedidos_clientes
FOR EACH ROW
BEGIN
    IF NEW.fecha_de_inicio >= CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La fecha de entrega debe ser anterior a la fecha actual.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_tallas`
--

DROP TABLE IF EXISTS `tb_tallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tallas` (
  `id_talla` int(11) NOT NULL AUTO_INCREMENT,
  `num_talla` varchar(4) NOT NULL,
  PRIMARY KEY (`id_talla`),
  UNIQUE KEY `uq_num_talla` (`num_talla`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tallas`
--

LOCK TABLES `tb_tallas` WRITE;
/*!40000 ALTER TABLE `tb_tallas` DISABLE KEYS */;
INSERT INTO `tb_tallas` VALUES (1,'35'),(2,'36'),(3,'37'),(4,'38'),(5,'39'),(6,'40'),(7,'41'),(8,'42'),(9,'43'),(10,'44'),(11,'45'),(12,'46'),(13,'47'),(14,'48'),(15,'49'),(17,'5.5'),(16,'50'),(18,'6'),(19,'6.5'),(20,'7'),(21,'7.5'),(22,'8'),(23,'8.5'),(24,'9'),(25,'9.5');
/*!40000 ALTER TABLE `tb_tallas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_trabajadores`
--

DROP TABLE IF EXISTS `tb_trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_trabajadores` (
  `id_trabajador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_trabajador` varchar(20) NOT NULL,
  `apellido_trabajador` varchar(20) NOT NULL,
  `dui_trabajador` varchar(10) NOT NULL,
  `telefono_trabajador` varchar(9) NOT NULL,
  `correo_trabajador` varchar(30) NOT NULL,
  `clave_trabajador` varchar(30) NOT NULL,
  `fecha_de_registro` date NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `estado_trabajador` enum('Activo','Desactivo') NOT NULL,
  PRIMARY KEY (`id_trabajador`),
  KEY `fk_tb_trabajadores_tb_niveles` (`id_nivel`),
  CONSTRAINT `fk_tb_trabajadores_tb_niveles` FOREIGN KEY (`id_nivel`) REFERENCES `tb_niveles` (`id_nivel`),
  CONSTRAINT `ck_estado_trabajador` CHECK (`estado_trabajador` in ('Activo','Desactivo'))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_trabajadores`
--

LOCK TABLES `tb_trabajadores` WRITE;
/*!40000 ALTER TABLE `tb_trabajadores` DISABLE KEYS */;
INSERT INTO `tb_trabajadores` VALUES (1,'Juan','Pérez','12345678-9','123456789','juan.perez@email.com','clave123','2024-03-06','1990-01-15',1,'Activo'),(2,'María','López','98765432-1','987654321','maria.lopez@email.com','clave456','2024-03-06','1985-08-22',2,'Activo'),(3,'Elena','García','11122334-4','111223344','elena.garcia@email.com','clave789','2024-03-06','1982-04-10',3,'Activo'),(4,'Carlos','Rodríguez','87654321-0','876543210','carlos.rodriguez@email.com','claveabc','2024-03-06','1995-12-03',1,'Activo'),(5,'Ana','Martínez','56789012-3','567890123','ana.martinez@email.com','clavexyz','2024-03-06','1988-07-17',2,'Activo'),(6,'Luis','Gómez','11223344-5','112233445','luis.gomez@email.com','clave123','2024-03-06','1992-11-28',3,'Activo'),(7,'Isabel','Hernández','98765432-1','987654321','isabel.hernandez@email.com','clave456','2024-03-06','1983-09-05',1,'Activo'),(8,'Javier','Sánchez','22324455-6','223344556','javier.sanchez@email.com','clave789','2024-03-06','1994-06-12',2,'Activo'),(9,'Carmen','Díaz','33445566-7','334445667','carmen.diaz@email.com','claveabc','2024-03-06','1987-02-20',3,'Activo'),(10,'Pedro','Ramírez','44553677-8','445866778','pedro.ramirez@email.com','clavexyz','2024-03-06','1998-04-30',1,'Activo'),(11,'Laura','Torres','55867788-9','556670889','laura.torres@email.com','clave123','2024-03-06','1981-10-08',2,'Activo'),(12,'Martín','Flores','66778699-0','667783990','martin.flores@email.com','clave456','2024-03-06','1993-03-25',3,'Activo'),(13,'Sofía','Lara','77889600-1','776899001','sofia.lara@email.com','clave789','2024-03-06','1986-05-14',1,'Activo'),(14,'Gabriel','Ortega','88990011-2','859900112','gabriel.ortega@email.com','claveabc','2024-03-06','1997-08-21',2,'Activo'),(15,'Verónica','Mendoza','99001122-3','990011223','veronica.mendoza@email.com','clavexyz','2024-03-06','1989-12-02',3,'Activo'),(16,'Raúl','Pinto','00112233-4','001122334','raul.pinto@email.com','clave123','2024-03-06','1996-01-09',1,'Activo'),(17,'Julia','Cruz','11223344-5','112233445','julia.cruz@email.com','clave456','2024-03-06','1984-07-18',2,'Activo'),(18,'Fernando','Salgado','22634455-6','223344556','fernando.salgado@email.com','clave789','2024-03-06','1991-09-26',3,'Activo'),(19,'Lucía','Herrera','33445766-7','334454667','lucia.herrera@email.com','claveabc','2024-03-06','1980-04-11',1,'Activo'),(20,'Diego','Vega','44556477-8','445563778','diego.vega@email.com','clavexyz','2024-03-06','1999-06-05',2,'Activo'),(21,'Marta','Gutierrez','55467788-9','506677889','marta.gutierrez@email.com','clave123','2024-03-06','1982-03-15',3,'Activo'),(22,'Roberto','Suarez','66777899-0','667748990','roberto.suarez@email.com','clave456','2024-03-06','1994-05-23',1,'Activo'),(23,'Patricia','Ríos','88990011-2','889900172','patricia.rios@email.com','claveabc','2024-03-06','1996-11-14',3,'Activo'),(24,'Gabriel','Molina','99001122-3','990011223','gabriel.molina@email.com','clavexyz','2024-03-06','1989-02-28',1,'Activo'),(25,'Silvia','Montes','77889900-1','778699001','silvia.montes@email.com','clave789','2024-03-06','1987-08-30',2,'Activo');
/*!40000 ALTER TABLE `tb_trabajadores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_insert_tb_trabajadores
BEFORE INSERT ON tb_trabajadores
FOR EACH ROW
BEGIN
    IF NEW.fecha_de_nacimiento >= CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de nacimiento debe ser anterior a la fecha actual';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_zapatos`
--

DROP TABLE IF EXISTS `tb_zapatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_zapatos` (
  `id_zapato` int(11) NOT NULL AUTO_INCREMENT,
  `id_trabajador` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `nombre_zapato` varchar(20) NOT NULL,
  `genero_zapato` enum('Unisex','Masculino','Femenino') NOT NULL,
  `descripcion_zapato` varchar(200) NOT NULL,
  `estado_zapato` enum('Activo','Desactivo') NOT NULL,
  PRIMARY KEY (`id_zapato`),
  KEY `ck_estado_trabajador` (`id_trabajador`),
  KEY `fk_tb_zapatos_tb_marca` (`id_marca`),
  CONSTRAINT `ck_estado_trabajador` FOREIGN KEY (`id_trabajador`) REFERENCES `tb_trabajadores` (`id_trabajador`),
  CONSTRAINT `fk_tb_zapatos_tb_marca` FOREIGN KEY (`id_marca`) REFERENCES `tb_marcas` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_zapatos`
--

LOCK TABLES `tb_zapatos` WRITE;
/*!40000 ALTER TABLE `tb_zapatos` DISABLE KEYS */;
INSERT INTO `tb_zapatos` VALUES (1,1,1,'Air Max','Unisex','Zapatillas deportivas con tecnología Air Max de Nike.','Activo'),(2,2,2,'Ultra Boost','Masculino','Zapatillas de alto rendimiento para correr de Adidas.','Activo'),(3,2,3,'Ignite Flash','Femenino','Zapatillas de running elegantes y cómodas de Puma.','Activo'),(4,4,4,'Classic Leather','Unisex','Zapatillas clásicas de cuero de Reebok.','Activo'),(5,5,5,'Chuck Taylor All Sta','Unisex','Iconicas zapatillas altas de Converse.','Activo'),(6,2,6,'Old Skool','Unisex','Zapatillas de skate clásicas de Vans.','Activo'),(7,7,7,'Fresh Foam 1080','Unisex','Zapatillas de running con amortiguación de New Balance.','Activo'),(8,8,8,'6-Inch Premium Boot','Masculino','Botas de cuero impermeables de Timberland.','Activo'),(9,2,9,'Go Walk 4','Femenino','Zapatillas deportivas cómodas de Skechers.','Activo'),(10,10,10,'1460','Unisex','Botas clásicas con cordones de Dr. Martens.','Activo'),(11,11,11,'Wallabee','Masculino','Zapatos casuales y cómodos de Clarks.','Activo'),(12,2,12,'Speedcross 4','Unisex','Zapatillas de trail running de Salomon.','Activo'),(13,13,13,'Arizona','Unisex','Sandalias con plantilla ergonómica de Birkenstock.','Activo'),(14,2,14,'UA HOVR Phantom','Unisex','Zapatillas de running con tecnología HOVR de Under Armour.','Activo'),(15,15,15,'Wave Rider 24','Unisex','Zapatillas de running de alto rendimiento de Mizuno.','Activo'),(16,16,16,'Disruptor II','Unisex','Zapatillas chunky y retro de Fila.','Activo'),(17,2,17,'Moab 2','Unisex','Botas de senderismo duraderas de Merrell.','Activo'),(18,18,18,'Gel-Kayano 27','Unisex','Zapatillas de running de alto soporte de Asics.','Activo'),(19,19,19,'Classic Clog','Unisex','Zuecos ligeros y cómodos de Crocs.','Activo'),(20,2,20,'Hush Puppies GT','Unisex','Zapatos casuales y cómodos de Hush Puppies.','Activo'),(21,21,21,'Soft 7','Unisex','Zapatos de cuero de calidad de Ecco.','Activo'),(22,22,22,'Newport H2','Unisex','Sandalias deportivas y resistentes de Keen.','Activo'),(23,2,23,'Second Shift Steel T','Unisex','Botas de trabajo con punta de acero de Caterpillar.','Activo'),(24,24,24,'Primus Lite','Unisex','Calzado minimalista y barefoot de Vivobarefoot.','Activo'),(25,2,25,'Ride ISO 2','Unisex','Zapatillas de running con tecnología ISOFIT de Saucony.','Activo');
/*!40000 ALTER TABLE `tb_zapatos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-06 12:45:20

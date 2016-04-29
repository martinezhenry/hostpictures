CREATE DATABASE  IF NOT EXISTS `hostpictures` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `hostpictures`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hostpictures
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria_img`
--

DROP TABLE IF EXISTS `categoria_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_img` (
  `idcategoria_img` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcategoria_img`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_img`
--

LOCK TABLES `categoria_img` WRITE;
/*!40000 ALTER TABLE `categoria_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chv_images`
--

DROP TABLE IF EXISTS `chv_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chv_images` (
  `image_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(200) NOT NULL,
  `image_type` varchar(200) NOT NULL,
  `image_size` int(11) NOT NULL,
  `image_width` int(11) NOT NULL,
  `image_height` int(11) NOT NULL,
  `image_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uploader_ip` varchar(200) NOT NULL,
  `storage_id_bk` int(11) DEFAULT NULL,
  `image_delete_hash` varchar(200) NOT NULL,
  `likes` int(11) DEFAULT NULL,
  `viewed` int(11) DEFAULT NULL,
  `storage_id` int(11) NOT NULL,
  `cities_idcities` int(11) NOT NULL,
  `categoria_img_idcategoria_img` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `fk_chv_images_chv_storages_idx` (`storage_id`),
  KEY `fk_chv_images_cities1_idx` (`cities_idcities`),
  KEY `fk_chv_images_categoria_img1_idx` (`categoria_img_idcategoria_img`),
  CONSTRAINT `fk_chv_images_categoria_img1` FOREIGN KEY (`categoria_img_idcategoria_img`) REFERENCES `categoria_img` (`idcategoria_img`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_chv_images_chv_storages` FOREIGN KEY (`storage_id`) REFERENCES `chv_storages` (`storage_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_chv_images_cities1` FOREIGN KEY (`cities_idcities`) REFERENCES `cities` (`idcities`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chv_images`
--

LOCK TABLES `chv_images` WRITE;
/*!40000 ALTER TABLE `chv_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `chv_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chv_info`
--

DROP TABLE IF EXISTS `chv_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chv_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `info_key` varchar(200) NOT NULL,
  `info_value` varchar(200) NOT NULL,
  PRIMARY KEY (`info_id`),
  UNIQUE KEY `info_key` (`info_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chv_info`
--

LOCK TABLES `chv_info` WRITE;
/*!40000 ALTER TABLE `chv_info` DISABLE KEYS */;
INSERT INTO `chv_info` VALUES (1,'version','2.6.0');
/*!40000 ALTER TABLE `chv_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chv_options`
--

DROP TABLE IF EXISTS `chv_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chv_options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_key` varchar(200) NOT NULL,
  `option_value` varchar(200) NOT NULL,
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_key` (`option_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chv_options`
--

LOCK TABLES `chv_options` WRITE;
/*!40000 ALTER TABLE `chv_options` DISABLE KEYS */;
INSERT INTO `chv_options` VALUES (1,'maintenance','0');
/*!40000 ALTER TABLE `chv_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chv_storages`
--

DROP TABLE IF EXISTS `chv_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chv_storages` (
  `storage_id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_type` varchar(200) NOT NULL,
  `users_idusers` int(11) NOT NULL,
  PRIMARY KEY (`storage_id`),
  KEY `fk_chv_storages_users1_idx` (`users_idusers`),
  CONSTRAINT `fk_chv_storages_users1` FOREIGN KEY (`users_idusers`) REFERENCES `users` (`idusers`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chv_storages`
--

LOCK TABLES `chv_storages` WRITE;
/*!40000 ALTER TABLE `chv_storages` DISABLE KEYS */;
INSERT INTO `chv_storages` VALUES (1,'old',0),(2,'direct',0);
/*!40000 ALTER TABLE `chv_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `idcities` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countries_idcountries` int(11) NOT NULL,
  PRIMARY KEY (`idcities`),
  KEY `fk_cities_countries1_idx` (`countries_idcountries`),
  CONSTRAINT `fk_cities_countries1` FOREIGN KEY (`countries_idcountries`) REFERENCES `countries` (`idcountries`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `idcomments` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fec_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `likes` int(11) DEFAULT NULL,
  `chv_images_image_id` bigint(20) NOT NULL,
  PRIMARY KEY (`idcomments`),
  KEY `fk_comments_chv_images1_idx` (`chv_images_image_id`),
  CONSTRAINT `fk_comments_chv_images1` FOREIGN KEY (`chv_images_image_id`) REFERENCES `chv_images` (`image_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `idcountries` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso2` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso3` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idcountries`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Afganistán','Afghanistan','Afghanistan','AF','AFG','93'),(2,'Albania','Albania','Albanie','AL','ALB','355'),(3,'Alemania','Germany','Allemagne','DE','DEU','49'),(4,'Algeria','Algeria','Algérie','DZ','DZA','213'),(5,'Andorra','Andorra','Andorra','AD','AND','376'),(6,'Angola','Angola','Angola','AO','AGO','244'),(7,'Anguila','Anguilla','Anguilla','AI','AIA','1 264'),(8,'Antártida','Antarctica','L\'Antarctique','AQ','ATA','672'),(9,'Antigua y Barbuda','Antigua and Barbuda','Antigua et Barbuda','AG','ATG','1 268'),(10,'Antillas Neerlandesas','Netherlands Antilles','Antilles Néerlandaises','AN','ANT','599'),(11,'Arabia Saudita','Saudi Arabia','Arabie Saoudite','SA','SAU','966'),(12,'Argentina','Argentina','Argentine','AR','ARG','54'),(13,'Armenia','Armenia','L\'Arménie','AM','ARM','374'),(14,'Aruba','Aruba','Aruba','AW','ABW','297'),(15,'Australia','Australia','Australie','AU','AUS','61'),(16,'Austria','Austria','Autriche','AT','AUT','43'),(17,'Azerbayán','Azerbaijan','L\'Azerbaïdjan','AZ','AZE','994'),(18,'Bélgica','Belgium','Belgique','BE','BEL','32'),(19,'Bahamas','Bahamas','Bahamas','BS','BHS','1 242'),(20,'Bahrein','Bahrain','Bahreïn','BH','BHR','973'),(21,'Bangladesh','Bangladesh','Bangladesh','BD','BGD','880'),(22,'Barbados','Barbados','Barbade','BB','BRB','1 246'),(23,'Belice','Belize','Belize','BZ','BLZ','501'),(24,'Benín','Benin','Bénin','BJ','BEN','229'),(25,'Bhután','Bhutan','Le Bhoutan','BT','BTN','975'),(26,'Bielorrusia','Belarus','Biélorussie','BY','BLR','375'),(27,'Birmania','Myanmar','Myanmar','MM','MMR','95'),(28,'Bolivia','Bolivia','Bolivie','BO','BOL','591'),(29,'Bosnia y Herzegovina','Bosnia and Herzegovina','Bosnie-Herzégovine','BA','BIH','387'),(30,'Botsuana','Botswana','Botswana','BW','BWA','267'),(31,'Brasil','Brazil','Brésil','BR','BRA','55'),(32,'Brunéi','Brunei','Brunei','BN','BRN','673'),(33,'Bulgaria','Bulgaria','Bulgarie','BG','BGR','359'),(34,'Burkina Faso','Burkina Faso','Burkina Faso','BF','BFA','226'),(35,'Burundi','Burundi','Burundi','BI','BDI','257'),(36,'Cabo Verde','Cape Verde','Cap-Vert','CV','CPV','238'),(37,'Camboya','Cambodia','Cambodge','KH','KHM','855'),(38,'Camerún','Cameroon','Cameroun','CM','CMR','237'),(39,'Canadá','Canada','Canada','CA','CAN','1'),(40,'Chad','Chad','Tchad','TD','TCD','235'),(41,'Chile','Chile','Chili','CL','CHL','56'),(42,'China','China','Chine','CN','CHN','86'),(43,'Chipre','Cyprus','Chypre','CY','CYP','357'),(44,'Ciudad del Vaticano','Vatican City State','Cité du Vatican','VA','VAT','39'),(45,'Colombia','Colombia','Colombie','CO','COL','57'),(46,'Comoras','Comoros','Comores','KM','COM','269'),(47,'Congo','Congo','Congo','CG','COG','242'),(48,'Congo','Congo','Congo','CD','COD','243'),(49,'Corea del Norte','North Korea','Corée du Nord','KP','PRK','850'),(50,'Corea del Sur','South Korea','Corée du Sud','KR','KOR','82'),(51,'Costa de Marfil','Ivory Coast','Côte-d\'Ivoire','CI','CIV','225'),(52,'Costa Rica','Costa Rica','Costa Rica','CR','CRI','506'),(53,'Croacia','Croatia','Croatie','HR','HRV','385'),(54,'Cuba','Cuba','Cuba','CU','CUB','53'),(55,'Dinamarca','Denmark','Danemark','DK','DNK','45'),(56,'Dominica','Dominica','Dominique','DM','DMA','1 767'),(57,'Ecuador','Ecuador','Equateur','EC','ECU','593'),(58,'Egipto','Egypt','Egypte','EG','EGY','20'),(59,'El Salvador','El Salvador','El Salvador','SV','SLV','503'),(60,'Emiratos Árabes Unidos','United Arab Emirates','Emirats Arabes Unis','AE','ARE','971'),(61,'Eritrea','Eritrea','Erythrée','ER','ERI','291'),(62,'Eslovaquia','Slovakia','Slovaquie','SK','SVK','421'),(63,'Eslovenia','Slovenia','Slovénie','SI','SVN','386'),(64,'España','Spain','Espagne','ES','ESP','34'),(65,'Estados Unidos de América','United States of America','États-Unis d\'Amérique','US','USA','1'),(66,'Estonia','Estonia','L\'Estonie','EE','EST','372'),(67,'Etiopía','Ethiopia','Ethiopie','ET','ETH','251'),(68,'Filipinas','Philippines','Philippines','PH','PHL','63'),(69,'Finlandia','Finland','Finlande','FI','FIN','358'),(70,'Fiyi','Fiji','Fidji','FJ','FJI','679'),(71,'Francia','France','France','FR','FRA','33'),(72,'Gabón','Gabon','Gabon','GA','GAB','241'),(73,'Gambia','Gambia','Gambie','GM','GMB','220'),(74,'Georgia','Georgia','Géorgie','GE','GEO','995'),(75,'Ghana','Ghana','Ghana','GH','GHA','233'),(76,'Gibraltar','Gibraltar','Gibraltar','GI','GIB','350'),(77,'Granada','Grenada','Grenade','GD','GRD','1 473'),(78,'Grecia','Greece','Grèce','GR','GRC','30'),(79,'Groenlandia','Greenland','Groenland','GL','GRL','299'),(80,'Guadalupe','Guadeloupe','Guadeloupe','GP','GLP',''),(81,'Guam','Guam','Guam','GU','GUM','1 671'),(82,'Guatemala','Guatemala','Guatemala','GT','GTM','502'),(83,'Guayana Francesa','French Guiana','Guyane française','GF','GUF',''),(84,'Guernsey','Guernsey','Guernesey','GG','GGY',''),(85,'Guinea','Guinea','Guinée','GN','GIN','224'),(86,'Guinea Ecuatorial','Equatorial Guinea','Guinée Equatoriale','GQ','GNQ','240'),(87,'Guinea-Bissau','Guinea-Bissau','Guinée-Bissau','GW','GNB','245'),(88,'Guyana','Guyana','Guyane','GY','GUY','592'),(89,'Haití','Haiti','Haïti','HT','HTI','509'),(90,'Honduras','Honduras','Honduras','HN','HND','504'),(91,'Hong kong','Hong Kong','Hong Kong','HK','HKG','852'),(92,'Hungría','Hungary','Hongrie','HU','HUN','36'),(93,'India','India','Inde','IN','IND','91'),(94,'Indonesia','Indonesia','Indonésie','ID','IDN','62'),(95,'Irán','Iran','Iran','IR','IRN','98'),(96,'Irak','Iraq','Irak','IQ','IRQ','964'),(97,'Irlanda','Ireland','Irlande','IE','IRL','353'),(98,'Isla Bouvet','Bouvet Island','Bouvet Island','BV','BVT',''),(99,'Isla de Man','Isle of Man','Ile de Man','IM','IMN','44'),(100,'Isla de Navidad','Christmas Island','Christmas Island','CX','CXR','61'),(101,'Isla Norfolk','Norfolk Island','Île de Norfolk','NF','NFK',''),(102,'Islandia','Iceland','Islande','IS','ISL','354'),(103,'Islas Bermudas','Bermuda Islands','Bermudes','BM','BMU','1 441'),(104,'Islas Caimán','Cayman Islands','Iles Caïmans','KY','CYM','1 345'),(105,'Islas Cocos (Keeling)','Cocos (Keeling) Islands','Cocos (Keeling','CC','CCK','61'),(106,'Islas Cook','Cook Islands','Iles Cook','CK','COK','682'),(107,'Islas de Åland','Åland Islands','Îles Åland','AX','ALA',''),(108,'Islas Feroe','Faroe Islands','Iles Féro','FO','FRO','298'),(109,'Islas Georgias del Sur y Sandwich del Sur','South Georgia and the South Sandwich Islands','Géorgie du Sud et les Îles Sandwich du Sud','GS','SGS',''),(110,'Islas Heard y McDonald','Heard Island and McDonald Islands','Les îles Heard et McDonald','HM','HMD',''),(111,'Islas Maldivas','Maldives','Maldives','MV','MDV','960'),(112,'Islas Malvinas','Falkland Islands (Malvinas)','Iles Falkland (Malvinas','FK','FLK','500'),(113,'Islas Marianas del Norte','Northern Mariana Islands','Iles Mariannes du Nord','MP','MNP','1 670'),(114,'Islas Marshall','Marshall Islands','Iles Marshall','MH','MHL','692'),(115,'Islas Pitcairn','Pitcairn Islands','Iles Pitcairn','PN','PCN','870'),(116,'Islas Salomón','Solomon Islands','Iles Salomon','SB','SLB','677'),(117,'Islas Turcas y Caicos','Turks and Caicos Islands','Iles Turques et Caïques','TC','TCA','1 649'),(118,'Islas Ultramarinas Menores de Estados Unidos','United States Minor Outlying Islands','États-Unis Îles mineures éloignées','UM','UMI',''),(119,'Islas Vírgenes Británicas','Virgin Islands','Iles Vierges','VG','VG','1 284'),(120,'Islas Vírgenes de los Estados Unidos','United States Virgin Islands','Îles Vierges américaines','VI','VIR','1 340'),(121,'Israel','Israel','Israël','IL','ISR','972'),(122,'Italia','Italy','Italie','IT','ITA','39'),(123,'Jamaica','Jamaica','Jamaïque','JM','JAM','1 876'),(124,'Japón','Japan','Japon','JP','JPN','81'),(125,'Jersey','Jersey','Maillot','JE','JEY',''),(126,'Jordania','Jordan','Jordan','JO','JOR','962'),(127,'Kazajistán','Kazakhstan','Le Kazakhstan','KZ','KAZ','7'),(128,'Kenia','Kenya','Kenya','KE','KEN','254'),(129,'Kirgizstán','Kyrgyzstan','Kirghizstan','KG','KGZ','996'),(130,'Kiribati','Kiribati','Kiribati','KI','KIR','686'),(131,'Kuwait','Kuwait','Koweït','KW','KWT','965'),(132,'Líbano','Lebanon','Liban','LB','LBN','961'),(133,'Laos','Laos','Laos','LA','LAO','856'),(134,'Lesoto','Lesotho','Lesotho','LS','LSO','266'),(135,'Letonia','Latvia','La Lettonie','LV','LVA','371'),(136,'Liberia','Liberia','Liberia','LR','LBR','231'),(137,'Libia','Libya','Libye','LY','LBY','218'),(138,'Liechtenstein','Liechtenstein','Liechtenstein','LI','LIE','423'),(139,'Lituania','Lithuania','La Lituanie','LT','LTU','370'),(140,'Luxemburgo','Luxembourg','Luxembourg','LU','LUX','352'),(141,'México','Mexico','Mexique','MX','MEX','52'),(142,'Mónaco','Monaco','Monaco','MC','MCO','377'),(143,'Macao','Macao','Macao','MO','MAC','853'),(144,'Macedônia','Macedonia','Macédoine','MK','MKD','389'),(145,'Madagascar','Madagascar','Madagascar','MG','MDG','261'),(146,'Malasia','Malaysia','Malaisie','MY','MYS','60'),(147,'Malawi','Malawi','Malawi','MW','MWI','265'),(148,'Mali','Mali','Mali','ML','MLI','223'),(149,'Malta','Malta','Malte','MT','MLT','356'),(150,'Marruecos','Morocco','Maroc','MA','MAR','212'),(151,'Martinica','Martinique','Martinique','MQ','MTQ',''),(152,'Mauricio','Mauritius','Iles Maurice','MU','MUS','230'),(153,'Mauritania','Mauritania','Mauritanie','MR','MRT','222'),(154,'Mayotte','Mayotte','Mayotte','YT','MYT','262'),(155,'Micronesia','Estados Federados de','Federados Estados de','FM','FSM','691'),(156,'Moldavia','Moldova','Moldavie','MD','MDA','373'),(157,'Mongolia','Mongolia','Mongolie','MN','MNG','976'),(158,'Montenegro','Montenegro','Monténégro','ME','MNE','382'),(159,'Montserrat','Montserrat','Montserrat','MS','MSR','1 664'),(160,'Mozambique','Mozambique','Mozambique','MZ','MOZ','258'),(161,'Namibia','Namibia','Namibie','NA','NAM','264'),(162,'Nauru','Nauru','Nauru','NR','NRU','674'),(163,'Nepal','Nepal','Népal','NP','NPL','977'),(164,'Nicaragua','Nicaragua','Nicaragua','NI','NIC','505'),(165,'Niger','Niger','Niger','NE','NER','227'),(166,'Nigeria','Nigeria','Nigeria','NG','NGA','234'),(167,'Niue','Niue','Niou','NU','NIU','683'),(168,'Noruega','Norway','Norvège','NO','NOR','47'),(169,'Nueva Caledonia','New Caledonia','Nouvelle-Calédonie','NC','NCL','687'),(170,'Nueva Zelanda','New Zealand','Nouvelle-Zélande','NZ','NZL','64'),(171,'Omán','Oman','Oman','OM','OMN','968'),(172,'Países Bajos','Netherlands','Pays-Bas','NL','NLD','31'),(173,'Pakistán','Pakistan','Pakistan','PK','PAK','92'),(174,'Palau','Palau','Palau','PW','PLW','680'),(175,'Palestina','Palestine','La Palestine','PS','PSE',''),(176,'Panamá','Panama','Panama','PA','PAN','507'),(177,'Papúa Nueva Guinea','Papua New Guinea','Papouasie-Nouvelle-Guinée','PG','PNG','675'),(178,'Paraguay','Paraguay','Paraguay','PY','PRY','595'),(179,'Perú','Peru','Pérou','PE','PER','51'),(180,'Polinesia Francesa','French Polynesia','Polynésie française','PF','PYF','689'),(181,'Polonia','Poland','Pologne','PL','POL','48'),(182,'Portugal','Portugal','Portugal','PT','PRT','351'),(183,'Puerto Rico','Puerto Rico','Porto Rico','PR','PRI','1'),(184,'Qatar','Qatar','Qatar','QA','QAT','974'),(185,'Reino Unido','United Kingdom','Royaume-Uni','GB','GBR','44'),(186,'República Centroafricana','Central African Republic','République Centrafricaine','CF','CAF','236'),(187,'República Checa','Czech Republic','République Tchèque','CZ','CZE','420'),(188,'República Dominicana','Dominican Republic','République Dominicaine','DO','DOM','1 809'),(189,'Reunión','Réunion','Réunion','RE','REU',''),(190,'Ruanda','Rwanda','Rwanda','RW','RWA','250'),(191,'Rumanía','Romania','Roumanie','RO','ROU','40'),(192,'Rusia','Russia','La Russie','RU','RUS','7'),(193,'Sahara Occidental','Western Sahara','Sahara Occidental','EH','ESH',''),(194,'Samoa','Samoa','Samoa','WS','WSM','685'),(195,'Samoa Americana','American Samoa','Les Samoa américaines','AS','ASM','1 684'),(196,'San Bartolomé','Saint Barthélemy','Saint-Barthélemy','BL','BLM','590'),(197,'San Cristóbal y Nieves','Saint Kitts and Nevis','Saint Kitts et Nevis','KN','KNA','1 869'),(198,'San Marino','San Marino','San Marino','SM','SMR','378'),(199,'San Martín (Francia)','Saint Martin (French part)','Saint-Martin (partie française)','MF','MAF','1 599'),(200,'San Pedro y Miquelón','Saint Pierre and Miquelon','Saint-Pierre-et-Miquelon','PM','SPM','508'),(201,'San Vicente y las Granadinas','Saint Vincent and the Grenadines','Saint-Vincent et Grenadines','VC','VCT','1 784'),(202,'Santa Elena','Ascensión y Tristán de Acuña','Ascensión y Tristan de Acuña','SH','SHN','290'),(203,'Santa Lucía','Saint Lucia','Sainte-Lucie','LC','LCA','1 758'),(204,'Santo Tomé y Príncipe','Sao Tome and Principe','Sao Tomé et Principe','ST','STP','239'),(205,'Senegal','Senegal','Sénégal','SN','SEN','221'),(206,'Serbia','Serbia','Serbie','RS','SRB','381'),(207,'Seychelles','Seychelles','Les Seychelles','SC','SYC','248'),(208,'Sierra Leona','Sierra Leone','Sierra Leone','SL','SLE','232'),(209,'Singapur','Singapore','Singapour','SG','SGP','65'),(210,'Siria','Syria','Syrie','SY','SYR','963'),(211,'Somalia','Somalia','Somalie','SO','SOM','252'),(212,'Sri lanka','Sri Lanka','Sri Lanka','LK','LKA','94'),(213,'Sudáfrica','South Africa','Afrique du Sud','ZA','ZAF','27'),(214,'Sudán','Sudan','Soudan','SD','SDN','249'),(215,'Suecia','Sweden','Suède','SE','SWE','46'),(216,'Suiza','Switzerland','Suisse','CH','CHE','41'),(217,'Surinám','Suriname','Surinam','SR','SUR','597'),(218,'Svalbard y Jan Mayen','Svalbard and Jan Mayen','Svalbard et Jan Mayen','SJ','SJM',''),(219,'Swazilandia','Swaziland','Swaziland','SZ','SWZ','268'),(220,'Tadjikistán','Tajikistan','Le Tadjikistan','TJ','TJK','992'),(221,'Tailandia','Thailand','Thaïlande','TH','THA','66'),(222,'Taiwán','Taiwan','Taiwan','TW','TWN','886'),(223,'Tanzania','Tanzania','Tanzanie','TZ','TZA','255'),(224,'Territorio Británico del Océano Índico','British Indian Ocean Territory','Territoire britannique de l\'océan Indien','IO','IOT',''),(225,'Territorios Australes y Antárticas Franceses','French Southern Territories','Terres australes françaises','TF','ATF',''),(226,'Timor Oriental','East Timor','Timor-Oriental','TL','TLS','670'),(227,'Togo','Togo','Togo','TG','TGO','228'),(228,'Tokelau','Tokelau','Tokélaou','TK','TKL','690'),(229,'Tonga','Tonga','Tonga','TO','TON','676'),(230,'Trinidad y Tobago','Trinidad and Tobago','Trinidad et Tobago','TT','TTO','1 868'),(231,'Tunez','Tunisia','Tunisie','TN','TUN','216'),(232,'Turkmenistán','Turkmenistan','Le Turkménistan','TM','TKM','993'),(233,'Turquía','Turkey','Turquie','TR','TUR','90'),(234,'Tuvalu','Tuvalu','Tuvalu','TV','TUV','688'),(235,'Ucrania','Ukraine','L\'Ukraine','UA','UKR','380'),(236,'Uganda','Uganda','Ouganda','UG','UGA','256'),(237,'Uruguay','Uruguay','Uruguay','UY','URY','598'),(238,'Uzbekistán','Uzbekistan','L\'Ouzbékistan','UZ','UZB','998'),(239,'Vanuatu','Vanuatu','Vanuatu','VU','VUT','678'),(240,'Venezuela','Venezuela','Venezuela','VE','VEN','58'),(241,'Vietnam','Vietnam','Vietnam','VN','VNM','84'),(242,'Wallis y Futuna','Wallis and Futuna','Wallis et Futuna','WF','WLF','681'),(243,'Yemen','Yemen','Yémen','YE','YEM','967'),(244,'Yibuti','Djibouti','Djibouti','DJ','DJI','253'),(245,'Zambia','Zambia','Zambie','ZM','ZMB','260'),(246,'Zimbabue','Zimbabwe','Zimbabwe','ZW','ZWE','263');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_profile` blob,
  `fec_reg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hostpictures'
--

--
-- Dumping routines for database 'hostpictures'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-29 16:03:03
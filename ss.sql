-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: SS
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `brandId` int(10) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(45) NOT NULL,
  `numberOfProducts` int(255) NOT NULL,
  PRIMARY KEY (`brandId`),
  UNIQUE KEY `brandName` (`brandName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Apple',0),(2,'Samsung',2),(3,'Nokia',2),(4,'HTC',3),(5,'Lenove',0);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cId` int(255) NOT NULL AUTO_INCREMENT,
  `customerId` int(45) NOT NULL,
  `productId` int(45) NOT NULL,
  `quantity` int(45) NOT NULL,
  `addTime` time NOT NULL,
  `addDate` date NOT NULL,
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerId` int(10) NOT NULL AUTO_INCREMENT,
  `customerFname` varchar(45) NOT NULL,
  `customerLname` varchar(45) NOT NULL,
  `customerPhone` varchar(10) NOT NULL,
  `customerEmail` varchar(45) NOT NULL,
  `customerAddress` varchar(255) NOT NULL,
  `customerCity` varchar(45) NOT NULL,
  `customerState` varchar(45) DEFAULT NULL,
  `customerZip` varchar(6) NOT NULL,
  `customerPassword` varchar(45) NOT NULL,
  `type` enum('C','A') DEFAULT NULL,
  PRIMARY KEY (`customerId`),
  UNIQUE KEY `customerEmail_UNIQUE` (`customerEmail`),
  UNIQUE KEY `customerPhone_UNIQUE` (`customerPhone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Shree Ram','Bansal','9461214514','ram@gmail.com','badi basti','pushkar','raj','305022','ffdf','A'),(2,'parth','dadhich','9413368618','p02101997h@gmail.com','Bundi','bundi','Rajasthan','666666','parth123','C'),(3,'pankaj','parashar','7537470311','pankaj99@gmail.com','badi basti','pushkar','Rajasthan','305022','pankaj123','C'),(4,'Aashish','parashar','9649461439','aashu9@gmail.com','badi basti','pushkar','Rajasthan','305022','aashu123','C');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_order` (
  `orderId` int(255) NOT NULL AUTO_INCREMENT,
  `customerId` int(45) NOT NULL,
  `deliveryAddress` varchar(255) NOT NULL,
  `order_total` float NOT NULL,
  `payment_status` enum('paid','due') DEFAULT NULL,
  `delivery_status` enum('delivered','not delivered') DEFAULT NULL,
  `addTime` time NOT NULL,
  `addDate` date NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `orderDetailId` int(255) NOT NULL AUTO_INCREMENT,
  `orderId` int(45) NOT NULL,
  `productId` int(45) NOT NULL,
  `quantity` int(45) NOT NULL,
  PRIMARY KEY (`orderDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productId` int(255) NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) NOT NULL,
  `ModelNumber` varchar(100) NOT NULL,
  `MarketPrice` float NOT NULL,
  `SellingPrice` float NOT NULL,
  `brand` varchar(45) NOT NULL,
  `OS` varchar(45) NOT NULL,
  `RAM` int(45) NOT NULL,
  `ROM` int(45) NOT NULL,
  `clockSpeed` float NOT NULL,
  `expandable` int(255) NOT NULL,
  `netorkType` varchar(45) NOT NULL,
  `screenSize` float NOT NULL,
  `phoneType` enum('Smart Phone','Featured Phone') DEFAULT NULL,
  `simType` int(4) NOT NULL,
  `rearCamera` float NOT NULL,
  `frontCamera` float NOT NULL,
  `cores` int(10) NOT NULL,
  `fm` enum('Y','N') DEFAULT NULL,
  `wifi` enum('Y','N') DEFAULT NULL,
  `bluethooth` enum('Y','N') DEFAULT NULL,
  `GPRS` enum('Y','N') DEFAULT NULL,
  `USB` enum('Y','N') DEFAULT NULL,
  `FLASH` enum('Y','N') DEFAULT NULL,
  `addDate` date NOT NULL,
  `addTime` time NOT NULL,
  PRIMARY KEY (`productId`),
  UNIQUE KEY `productName` (`productName`),
  UNIQUE KEY `ModelNumber` (`ModelNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Samsung Galaxy y2','am100t',12999,10000,'Samsung','Android',4,16,2,128,'4G VOLTE',5.5,'Smart Phone',2,12,5,2,'Y','Y','Y','Y','Y','Y','2017-06-15','13:13:00'),(2,'Samsung Galaxy J7','SM-J710FZKUINS',12900,12900,'Samsung','Android',2,16,1.6,128,'4G VOLTE',5.5,'Smart Phone',2,13,5,8,'Y','Y','Y','Y','Y','Y','2017-06-15','13:19:00'),(3,'HTC Desire 820G+','Desire 820G+',11500,6900,'HTC','Android',1,16,1.6,32,'3G',5.5,'Smart Phone',2,13,8,8,'Y','Y','Y','Y','Y','Y','2017-06-15','13:25:00'),(4,'HTC Desire 816G','htc816g',8900,5999,'HTC','Android',1,8,1.7,32,'4G',5,'Smart Phone',2,13,5,8,'Y','Y','Y','Y','Y','Y','2017-06-15','13:28:00'),(5,'HTC Desire 626G Plus','D626PH',8900,5999,'HTC','Android',1,8,1.7,32,'4G',5,'Smart Phone',2,13,5,8,'Y','Y','Y','Y','Y','Y','2017-06-15','13:28:00'),(6,'Nokia 6','nk6',15999,13999,'Nokia','Android',2,16,1.7,128,'3G',5,'Smart Phone',2,13,5,8,'Y','Y','Y','Y','Y','Y','2017-06-15','13:28:00'),(7,'Nokia 7','nk7',12999,11999,'Nokia','Android',4,32,1.5,64,'4G',5.5,'Smart Phone',2,13,5,8,'Y','Y','Y','Y','Y','Y','2017-06-15','13:28:00');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `rId` int(255) NOT NULL AUTO_INCREMENT,
  `pId` int(45) NOT NULL,
  `reviewerName` varchar(255) NOT NULL,
  `reviewerEmail` varchar(255) NOT NULL,
  `review` varchar(255) NOT NULL,
  `reviewTime` time NOT NULL,
  `reviewDate` date NOT NULL,
  PRIMARY KEY (`rId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-25 14:16:53

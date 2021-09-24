-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: my_delivery
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `deliverymenu`
--

DROP TABLE IF EXISTS `deliverymenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverymenu` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `description` text,
  `price` int NOT NULL,
  `image` text,
  `nutrient_info` text,
  `allergie_info` text,
  `kcal` int NOT NULL,
  `recommend_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverymenu`
--

LOCK TABLES `deliverymenu` WRITE;
/*!40000 ALTER TABLE `deliverymenu` DISABLE KEYS */;
INSERT INTO `deliverymenu` VALUES (1,1,'돈까스 정식 세트','돈까스 도시락, 우동, 새우튀김 6개',12000,'donnkatsu.jpg','돈까스: 열량 2374kJ, 탄수화물 24.56g, 단백질 45.16g, 지방 30.6g, 우동: 960kJ, 탄수화물 47.56g, 단백질 7.04g, 지방 0.62g, 새우 튀김: 열량 516kj, 탄수화물 8.8g, 단백질 15.48g, 지방 2.37g','',890,35),(2,1,'라면 정식 세트','일반 라면, 돈까스 3조각, 새우튀김 6개',11000,'ramyun.jpg','','',880,32),(3,1,'우동 정식 세트','우동, 돈까스 3조각, 새우튀김 6개',11500,'udonn.jpg','','',850,33),(4,2,'돈까스 도시락','기본이 최고지!',7500,'donnkatsu.jpg','열량 2374kJ, 탄수화물 24.56g 설탕당 2.2g, 포화지방 9.89g, 다불포화지방 4.003g, 불포화 지방 13.437g, 콜레스테롤 184mg, 식이섬유 1.5g, 나트륨 901mg, 칼륨 614mg','',620,42),(5,2,'치즈 돈까스 도시락','',8000,'cheesedonnkatsu.jpg','열량 3016kj, 탄수화물 25.41g, 설탕당 2.46g, 단백질 57.87g, 포화지방 17.171g, 다불포화지방 4.318g, 불포화지방 16.385g, 콜레스테롤 217mg, 식이섬유 1.4g, 나트륨 1237mg, 칼륨 622mg','',710,0),(6,2,'고구마 치즈 돈까스 도시락','',9500,'gogumacheesedonnkatsu.jpg','열량 2878kj, 탄수화물 27.04g, 설탕당 2.98g, 단백질 54.36g, 포화지방 16.055g, 다불포화지방 4.039g, 불포화지방 15.318g, 콜레스테롤 203mg, 식이섬유 1.8g, 나트륨 1165mg, 칼륨 636mg','',680,0),(7,2,'카레 돈까스 도시락','',8000,'currydonnkatsu.jpg','열량 2309kJ, 탄수화물 53.12g, 설탕당 2.98g, 단백질 32.55g, 포화지방 5.311g, 다불포화지방 4.249g, 불포화지방 11.873g, 콜레스테롤 78mg, 식이섬유 7.7g, 나트륨 614mg, 칼륨 861mg','',552,0),(8,2,'스팸마요덮밥 도시락','',7500,'spammayo.jpg','열량 2510kJ, 탄수화물 86g, 단백질 18g, 지방 20g, 포화지방 6g, 콜레스테롤 85mg, 나트륨 1060mg','',600,33),(9,2,'치킨마요덮밥 도시락','',8000,'chickenmayo.jpg','열량 2966kJ, 탄수화물 110g, 설탕당 14g, 단백질 17g, 지방 17g, 포화지방 2.8g, 콜레스테롤 89mg, 나트륨 1395mg','',709,0),(10,2,'참치마요덮밥 도시락','',8000,'tunamayo.jpg','열량 3012kJ, 탄수화물 101g, 설탕당 3g, 단백질 22g, 지방 25g, 포화지방 4.8g, 콜레스테롤 20mg, 나트륨 950mg','',720,0),(11,2,'김치볶음밥 도시락','',7500,'kimchifriedrice.jpg','열량 1867kJ, 탄수화물 75g, 설탕당 2.46g, 단백질 8.75g, 지방 12.37g, 포화지방 1.8g, 다불포화지방 5g, 불포화지방 4.7g, 식이섬유 4g, 나트륨 844mg, 칼륨 520mg','',446,0),(12,2,'새우볶음밥 도시락','',8000,'ebifriedrice.jpg','열량 1342kJ, 탄수화물 41.88g, 설탕당 1.5g, 단백질 11g, 지방 11g, 포화지방 1.9g, 다불포화지방 5.3g, 불포화지방 3.4g, 콜레스테롤 127mg, 식이섬유 1.4g, 나트륨 925mg, 칼륨 164mg','',321,0),(13,2,'참치김치볶음밥 도시락','',8500,'tunakimchifriedrice.jpg','열량 2176kJ, 탄수화물 87g, 단백질 12g, 지방 14g, 포화지방 2.2g, 콜레스테롤 20mg, 나트륨 1060mg','',520,0),(14,3,'라면 도시락',NULL,5500,'ramyun.jpg','열량 2092kJ, 탄수화물 79g, 설탕당 4g, 단백질 10g, 지방 16g, 포화지방 8g, 나트륨 1790mg','',500,0),(15,3,'치즈라면 도시락',NULL,6000,'cheeseramyun.jpg','열량 2528kJ, 탄수화물 81g, 설탕당 3.6g, 단백질 14.7g, 지방 24.67g, 포화지방 9.9g, 다불포화지방 4.1g, 불포화지방 9.3g, 콜레스테롤 22mg, 식이섬유 4g, 나트륨 1221mg, 칼륨 431mg','',604,0),(16,3,'만두라면 도시락',NULL,7500,'manduramyun.jpg','라면: 열량 2092kJ, 탄수화물 79g, 설탕당 4g, 단백질 10g, 지방 16g, 포화지방 8g, 나트륨 1790mg, 고기만두 4개: 열량 1130kJ, 270kcal, 탄수화물 27g, 설탕당 1.1g, 단백질 12.8g, 지방 12g, 포화지방 3.6g, 트랜스지방 0.4g, 다불포화지방 2g, 불포화지방 5g, 콜레스테롤 32mg, 식이섬유 1g, 나트륨 372mg, 칼륨 192mg','',690,0),(17,3,'우동 도시락',NULL,5500,'udonn.jpg','열량 1690kJ, 탄수화물 65g, 단백질 17g, 지방 18g','',404,0),(18,3,'새우튀김 우동 도시락',NULL,6500,'ebiudonn.jpg','','',510,0),(19,4,'김말이튀김','김말이 튀김 6개',2000,'gimbapfried.jpg','열량 1567kJ, 탄수화물 44g, 설탕당 1.7g, 단백질 11.02g, 지방 17.26g, 포화지방 4.5g, 트랜스지방 4g, 다불포화지방 2.15g, 불포화지방 9g, 콜레스테롤 125mg, 식이섬유 2.4g, 나트륨 307mg, 칼륨 157mg','',375,0),(20,4,'새우튀김','새우튀김 5개 (100g)',2500,'ebihurai.jpg','열량 1200kJ, 탄수화물 20g, 단백질 12g, 지방 17g, 포화지방 2.9g, 트랜스지방 0.2g, 콜레스테롤 81mg, 나트륨 100mg, 나트륨 877mg','',276,38),(21,4,'고구마튀김','고구마튀김 6개 (115g)',2500,'gogumafried.jpg','열량 98kJ, 탄수화물 37g, 설탕당 2.4g, 단백질 4.12g, 지방 7.3g, 포화지방 0.55g, 다불포화지방 2.2g, 불포화지방 4.1g, 식이섬유 2.6g, 나트륨 302mg, 칼륨 222mg','',234,0),(22,4,'유부초밥','유부초밥 6개 (300g)',3000,'yuubusushi.jpg','열량 2253kJ, 탄수화물 73g, 설탕당 3.3g, 단백질 21g, 지방 19g, 포화지방 2.8g, 다불포화지방 10.7g, 불포화지방 4.2g, 식이섬유 5.1g, 나트륨 741mg, 칼륨 238mg','',540,0),(23,5,'생수','생수 500ml',1000,'water500ml.jpg','나트륨 18mg','',0,0),(24,5,'콜라','콜라 245ml',1500,'cola245ml.jpg','열량 435kJ, 탄수화물 26g, 설탕당 26g, 나트륨 7mg','',104,0),(25,5,'사이다','사이다 250ml',1500,'cider250ml.jpg','열량 460kJ, 탄수화물 27g, 설탕당 21g, 나트륨 5mg','',110,0);
/*!40000 ALTER TABLE `deliverymenu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-24 11:55:40

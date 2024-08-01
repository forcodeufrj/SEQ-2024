-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: for_code
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `apadrinhamento`
--

DROP TABLE IF EXISTS `apadrinhamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apadrinhamento` (
  `membro` text NOT NULL,
  `diretoria_membro` text NOT NULL,
  `padrinho` text NOT NULL,
  `diretoria_padrinho` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apadrinhamento`
--

LOCK TABLES `apadrinhamento` WRITE;
/*!40000 ALTER TABLE `apadrinhamento` DISABLE KEYS */;
INSERT INTO `apadrinhamento` VALUES ('Joao','PRO','Mariana','PRO'),('Rodrigo','MKT','Anna','MKT'),('Bianca','PRE','Eduarda','PRE'),('Renan','PRE','Eduarda','PRE'),('Anna','PES','Ana','PES'),('Vinicius','MKT','Anna','MKT');
/*!40000 ALTER TABLE `apadrinhamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membros`
--

DROP TABLE IF EXISTS `membros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membros` (
  `id_membros` int(11) NOT NULL,
  `membro` text NOT NULL,
  `idade` int(11) NOT NULL,
  `genero` text NOT NULL,
  `diretoria` text NOT NULL,
  `projeto` text NOT NULL,
  PRIMARY KEY (`id_membros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membros`
--

LOCK TABLES `membros` WRITE;
/*!40000 ALTER TABLE `membros` DISABLE KEYS */;
INSERT INTO `membros` VALUES (1,'Mariana',20,'F','PRO','MySQL'),(2,'Ana',19,'F','PES','C'),(3,'Eduarda',23,'F','PRE','Legado'),(4,'Rodrigo',21,'M','MKT','MySQL'),(5,'Joao',20,'M','PRO','MySQL'),(6,'Anna Gabriela',20,'F','MKT','C'),(7,'Lucas',21,'M','PES','C');
/*!40000 ALTER TABLE `membros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesquisa_satisfacao`
--

DROP TABLE IF EXISTS `pesquisa_satisfacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesquisa_satisfacao` (
  `ordem_preenchimento` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `diretoria` text NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`ordem_preenchimento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesquisa_satisfacao`
--

LOCK TABLES `pesquisa_satisfacao` WRITE;
/*!40000 ALTER TABLE `pesquisa_satisfacao` DISABLE KEYS */;
INSERT INTO `pesquisa_satisfacao` VALUES (1,'2024-08-12','PRO','Muito satisfeito'),(2,'2024-08-13','PES','Satisfeito'),(3,'2024-08-14','MKT','Muito satisfeito'),(4,'2024-08-12','PRO','Muito satisfeito'),(5,'2024-08-15','PRE','Pouco satisfeito'),(6,'2024-08-13','MKT','Satisfeito'),(7,'2024-08-12','PES','Muito satisfeito');
/*!40000 ALTER TABLE `pesquisa_satisfacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `nome` text NOT NULL,
  `fornecedor` text NOT NULL,
  `id_membro_constante` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco` int(11) NOT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'copos','grafica',1,50,15),(2,'camisas','grafica',2,30,40),(3,'chaveiro','grafica',3,20,20),(4,'adesivos','grafica',1,40,5);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projetos`
--

DROP TABLE IF EXISTS `projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projetos` (
  `id_projeto` int(11) NOT NULL,
  `nome_projeto` text NOT NULL,
  `quantidade_membros` int(11) NOT NULL,
  `project_owner` text NOT NULL,
  `tempo_estimado_mes` int(11) NOT NULL,
  PRIMARY KEY (`id_projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projetos`
--

LOCK TABLES `projetos` WRITE;
/*!40000 ALTER TABLE `projetos` DISABLE KEYS */;
INSERT INTO `projetos` VALUES (1,'C',5,'Matheus',6),(2,'WebScraping',3,'Leandro',5),(3,'OpenFOAM',2,'Carlos',8),(4,'MachineLearning',4,'Emanuel',10),(5,'MySQL',3,'Mariana',7),(6,'Space Invaders',2,'Leandro',6),(7,'POChE',2,'Mariana',4);
/*!40000 ALTER TABLE `projetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'for_code'
--

--
-- Dumping routines for database 'for_code'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-01 10:36:03

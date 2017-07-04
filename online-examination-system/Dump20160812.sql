-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: onlineexaminationsystem
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `AnswerID` int(11) NOT NULL AUTO_INCREMENT,
  `Answer` varchar(45) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  PRIMARY KEY (`AnswerID`),
  KEY `question_idx` (`QuestionID`),
  CONSTRAINT `question` FOREIGN KEY (`QuestionID`) REFERENCES `multichoicequestion` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (22,'lmn',11),(25,'mkejrlke',13),(28,'chatting',15),(31,'samjh',17),(32,'ni ',17),(33,'aata',17),(34,'fun',18),(35,'jekrf',19),(36,'kejr',19),(37,'ktre',19);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Computer Science and Engineering'),(2,'Civil Engineering'),(3,'Mechanical Engineering'),(4,'Electrical Engineering'),(5,'Electronic and Communication Engineering');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multichoicequestion`
--

DROP TABLE IF EXISTS `multichoicequestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multichoicequestion` (
  `QuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `Question` longtext NOT NULL,
  `Option1` varchar(45) NOT NULL,
  `Option2` varchar(45) NOT NULL,
  `Option3` varchar(45) NOT NULL,
  `Option4` varchar(45) NOT NULL,
  `TestID` int(11) NOT NULL,
  PRIMARY KEY (`QuestionID`),
  KEY `testnew_idx` (`TestID`),
  CONSTRAINT `testnew` FOREIGN KEY (`TestID`) REFERENCES `testdetails` (`TestID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multichoicequestion`
--

LOCK TABLES `multichoicequestion` WRITE;
/*!40000 ALTER TABLE `multichoicequestion` DISABLE KEYS */;
INSERT INTO `multichoicequestion` VALUES (11,'What is civil?','abc','xyz','lmn','pyy',30),(13,'Shut up guys.','jfkek','kejrk','kejr','mkejrlke',30),(15,'whats up?','nothing','working','talking','chatting',32),(17,'what is this buddy?','nothingh','samjh','ni ','aata',32),(18,'Why to study civil branch?','fun','girls','honey','shut',30),(19,'This is my second test?','jkjdf','jekrf','kejr','ktre',30);
/*!40000 ALTER TABLE `multichoicequestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  PRIMARY KEY (`result_id`),
  KEY `studentid_idx` (`student_id`),
  KEY `testid_idx` (`test_id`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`EnrollmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test_id` FOREIGN KEY (`test_id`) REFERENCES `testdetails` (`TestID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (4,10000,23),(5,10000,19),(6,10005,32),(7,10000,33),(8,10007,27),(9,10007,34),(10,10009,19),(11,10009,33),(12,10009,23),(13,10010,32),(14,10010,35),(15,10005,35);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `singlechoicequestions`
--

DROP TABLE IF EXISTS `singlechoicequestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `singlechoicequestions` (
  `QuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `Question` longtext NOT NULL,
  `Option1` varchar(45) NOT NULL,
  `Option2` varchar(45) NOT NULL,
  `Option3` varchar(45) NOT NULL,
  `Option4` varchar(45) NOT NULL,
  `Answer` varchar(45) NOT NULL,
  `TestID` int(11) NOT NULL,
  PRIMARY KEY (`QuestionID`),
  KEY `TestID_idx` (`TestID`),
  CONSTRAINT `TestID` FOREIGN KEY (`TestID`) REFERENCES `testdetails` (`TestID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `singlechoicequestions`
--

LOCK TABLES `singlechoicequestions` WRITE;
/*!40000 ALTER TABLE `singlechoicequestions` DISABLE KEYS */;
INSERT INTO `singlechoicequestions` VALUES (17,'your company name?','cognizant','tcs','wipro','infoysis','wipro',23),(18,'circle area?','ab','cd','ef','gh','gh',27),(20,'cognizant offices?','chennai','gurgaonnn','bangalore','kolkata','gurgaonnn',23);
/*!40000 ALTER TABLE `singlechoicequestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `EnrollmentID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Password` varchar(45) NOT NULL DEFAULT 'Password1',
  `Branch` int(11) NOT NULL,
  `FirstLogin` enum('false','true') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`EnrollmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (10000,'Rohit','Agarwal','geurohit.31@gmail.com','7411608536','nation@1',1,'true'),(10002,'Ankit','Tyagi',NULL,NULL,'nation@4',2,'true'),(10005,'Pradeep','Rocks',NULL,NULL,'nation@1',4,'true'),(10007,'Shivani','Agarwal','shivani@gmail.com','9837029971','nation@5',3,'true'),(10008,'Rinkesh','Garg',NULL,NULL,'nation@1',5,'true'),(10009,'Rahul','Sharma',NULL,NULL,'nation@1',1,'true'),(10010,'Sumit','Raj',NULL,NULL,'nation@1',4,'true'),(10011,'Ram','Lakhan',NULL,NULL,'Password1',5,'false');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `BranchID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_idx` (`BranchID`),
  CONSTRAINT `ID` FOREIGN KEY (`BranchID`) REFERENCES `branch` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'C Programming',1),(3,'Core Java',1),(4,'EFT',4),(5,'Electronics Basics',5),(6,'Mechanical Basics',3),(7,'Civil Basics',2),(8,'Electrical Basics',4);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testattempts`
--

DROP TABLE IF EXISTS `testattempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testattempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_id` int(11) NOT NULL,
  `test_marks` int(11) NOT NULL,
  `student_marks` int(11) NOT NULL,
  `percentage` varchar(10) NOT NULL,
  `grade` char(10) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `result_id_idx` (`result_id`),
  CONSTRAINT `result_id` FOREIGN KEY (`result_id`) REFERENCES `results` (`result_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testattempts`
--

LOCK TABLES `testattempts` WRITE;
/*!40000 ALTER TABLE `testattempts` DISABLE KEYS */;
INSERT INTO `testattempts` VALUES (9,4,12,6,'50%','D','Pass'),(10,5,4,2,'50%','D','Pass'),(11,5,4,4,'100%','A','Pass'),(12,6,4,2,'50%','D','Pass'),(13,7,12,4,'33%','D','Pass'),(14,8,1,0,'0%','E','Fail'),(15,8,1,0,'0%','E','Fail'),(16,8,1,1,'100%','A','Pass'),(17,9,10,5,'50%','D','Pass'),(18,10,4,3,'75%','B','Pass'),(19,11,12,4,'33%','D','Pass'),(20,12,12,12,'100%','A','Pass'),(21,13,4,2,'50%','D','Pass'),(22,13,4,2,'50%','D','Pass'),(23,13,4,4,'100%','A','Pass'),(24,14,6,2,'33%','D','Pass'),(25,14,6,4,'66%','C','Pass'),(26,15,6,4,'66%','C','Pass');
/*!40000 ALTER TABLE `testattempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdetails`
--

DROP TABLE IF EXISTS `testdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdetails` (
  `TestID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(45) NOT NULL,
  `Questions` int(11) NOT NULL DEFAULT '0',
  `Description` longtext NOT NULL,
  `Marks` int(11) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `SubjectID` int(11) NOT NULL,
  PRIMARY KEY (`TestID`),
  KEY `SubjectID_idx` (`SubjectID`),
  CONSTRAINT `SubjectID` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdetails`
--

LOCK TABLES `testdetails` WRITE;
/*!40000 ALTER TABLE `testdetails` DISABLE KEYS */;
INSERT INTO `testdetails` VALUES (19,'Java test intro',4,'This is my first java test.',1,'truefalse',1),(23,'Myshow',2,'This is my show buddy.',6,'single',3),(27,'Mechanical Test',1,'This is mech test',1,'single',6),(30,'Civil Only test',4,'This is civil test.',1,'multi',7),(32,'Multiple Choice',2,'This is multi choice question test.',2,'multi',8),(33,'Masti Test',3,'This is my masti test.',4,'truefalse',1),(34,'Mechy Test',2,'This is basic mechanical engg test.',5,'truefalse',6),(35,'Rocking',3,'This will be rocking',2,'truefalse',4);
/*!40000 ALTER TABLE `testdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truefalsequestions`
--

DROP TABLE IF EXISTS `truefalsequestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `truefalsequestions` (
  `QuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `Question` longtext NOT NULL,
  `Answer` varchar(40) NOT NULL,
  `TestID` int(11) NOT NULL,
  PRIMARY KEY (`QuestionID`),
  KEY `Test_idx` (`TestID`),
  CONSTRAINT `Test` FOREIGN KEY (`TestID`) REFERENCES `testdetails` (`TestID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truefalsequestions`
--

LOCK TABLES `truefalsequestions` WRITE;
/*!40000 ALTER TABLE `truefalsequestions` DISABLE KEYS */;
INSERT INTO `truefalsequestions` VALUES (4,'what is stringbilder?','false',19),(5,'you know servlet in advance java?','false',19),(6,'string is mutable?','true',19),(12,'are you nonsense?','true',19),(13,'did you watch grand masti?','true',33),(14,'Tajmahal is in agra?','false',33),(15,'Delhi is capital of india?','true',33),(16,'Hey do you know charlie?','true',34),(17,'you are from dehradun?','true',34),(18,'Hey are u rocking?','true',35),(19,'You know rohit?','false',35),(20,'are you from rudrapur?','true',35);
/*!40000 ALTER TABLE `truefalsequestions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-12  0:18:01

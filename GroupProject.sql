CREATE DATABASE  IF NOT EXISTS `group43schema` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `group43schema`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: group43schema
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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `status` enum('Booked','Cancelled','Arrived','Checked-In','Checked-Out','LWT','No-Show') DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `fk_appointments_Patients1_idx` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_appointments_Patients1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,3,'Booked','2020-01-14',4,'General health check'),(2,2,'Booked','2019-11-09',12,'Surgery consultation'),(3,10,'Cancelled','2020-12-16',7,'General health check'),(4,7,'Arrived','2020-01-14',4,'Emergency'),(5,6,'Arrived','2020-01-14',4,'Emergency'),(6,1,'Checked-In','2019-06-28',13,'General health check'),(7,3,'Checked-Out','2020-02-23',18,'Organ surgery'),(8,3,'LWT','2002-10-12',18,'General consultation'),(9,3,'No-Show','2020-03-04',17,'General consultation'),(10,1,'Cancelled','2020-12-14',15,'General consulation'),(11,10,'Booked','2020-01-13',14,'Yearly health check'),(12,3,'Cancelled','2020-12-15',11,'Yearly health check'),(13,3,'Cancelled','2020-12-18',7,'Emergency'),(14,5,'Cancelled','2020-12-05',12,'Mandatory health check'),(15,6,'Arrived','2018-11-19',12,'Mandatory health check');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctortreatment`
--

DROP TABLE IF EXISTS `doctortreatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctortreatment` (
  `doctor_treatment_id` int NOT NULL AUTO_INCREMENT,
  `symptoms` varchar(2000) DEFAULT NULL,
  `diagnosis` varchar(2000) DEFAULT NULL,
  `treatment` varchar(2000) DEFAULT NULL,
  `doctor_transfer_description` varchar(255) DEFAULT NULL,
  `appointment_id` int NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`doctor_treatment_id`),
  KEY `fk_DoctorTreatment_appointments1_idx` (`appointment_id`),
  KEY `fk_DoctorTreatment_Employees1_idx` (`employee_id`),
  CONSTRAINT `fk_DoctorTreatment_appointments1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`),
  CONSTRAINT `fk_DoctorTreatment_Employees1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctortreatment`
--

LOCK TABLES `doctortreatment` WRITE;
/*!40000 ALTER TABLE `doctortreatment` DISABLE KEYS */;
INSERT INTO `doctortreatment` VALUES (1,'Itchy nose, sweaty palms','Drug overdose, lack of water','Massage, itching cream','Drug addiction',1,1),(2,'Red eyes, dehydration','Lack of water, lack of exercise','Lozenges, eye drops','Lack of activity, dehydration',2,2),(3,'Dehydration, lightheadedness','Cocaine consumption, heavy smoking','Ointment for feet, stretching, running',NULL,3,2),(4,'Coughing blood, erectile dysfunction','Alcoholic, lack of friends','Exercise, viagra',NULL,4,3),(5,'Worsening eyesight, dry eyes','Food poisoning, lack of water','Adderall','Allergic reactions',2,3),(6,'Numb feet, itchy arms','Dengue fever, rash','Pain relievers','Disease',1,2),(7,'Red spots on legs, swollen thighs','Allergic reaction, scratching','Clarinex, Allegra',NULL,7,1),(8,'Burning sensation on cheeks','Lack of water, food poisoning','Hydrocortisone cream','Weak gut microbiome',8,2),(9,'Swollen veins on feet, swollen thighs','Varicocele, allergic reaction','Hydrocosrtisone cream','Blood clotting',9,4),(10,'Red eyes, dehydration','Lack of water, weed smoker','Fruit juice, electrolyte drinks',NULL,10,1);
/*!40000 ALTER TABLE `doctortreatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `hour_rate` float DEFAULT NULL,
  `position` enum('Doctor','Nurse','Manager','Secretary','Administrative Assistant') DEFAULT NULL,
  `street_address` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Junior','Mass',23.15,'Secretary','4343 Pearl Street','Streetsville','Ontario','L5M 1X2'),(2,'Megan','Markle',20,'Secretary','4501 Heatherleigh','Cooksville','Ontario','L5A 1V9'),(3,'Sharlene','Cordova',20,'Secretary','3547 Stum Lake Road','Tatla Lake','British Columbia','V0L 1V0'),(4,'Diego','Nunca',NULL,'Doctor','2350 Leslie Street','Newmarket','Ontario','L3Y 2A3'),(5,'Luca','Puede',22,'Secretary','4812 Kinchant Street','Sardis','British Columbia','V2R 1C8'),(6,'Antonio','Pasqua',27,'Nurse','416 Hardy Street','Kelowna','British Columbia','V1Y 8H2'),(7,'May','Hung',NULL,'Doctor','1853 Paris Street','Sudbury','Ontario','P3E 4K2'),(8,'Chris','Ayles',35,'Nurse','3799 Tchesinkut Lake Rd','Smithers','British Columbia','V0J 2N0'),(9,'Sanford','Gottit',24.5,'Nurse','784 Runnymede Rd','Toronto','Ontario','M6S 2Z7'),(10,'Mark','Angel',18,'Secretary','3451 Cardero St','Vancouver','British Columbia','S4P 3Y2'),(11,'Yokic','Mann',NULL,'Doctor','3654 James Street','Burnaby','British Columbia','V5G 4W7'),(12,'Liam','Anderson',NULL,'Doctor','3414 Nelson Street','Raith','Ontario','P0T 2N0'),(13,'Ava','Ramirez',NULL,'Doctor','2571 Papineau Avenue','Montreal','Quebec','H2K 4J5'),(14,'Noah','Patel',NULL,'Doctor','3603 St Jean Baptiste St','La Pocatiere','Quebec','G0R 1Z0'),(15,'Mia','Williams',NULL,'Doctor','3654 Brew Creek Rd','Port Hardy','British Columbia','V0N 2P0'),(16,'Elijah','Gonzalez',NULL,'Doctor','3642 Cork St','Guelph','Ontario','N1H 2W8'),(17,'Isabella','Zhang',NULL,'Doctor','4288 St. John Street','Drake','Saskatchewan','S4P 3Y2'),(18,'Lucas','Thompson',NULL,'Doctor','4051 Tycos Dr','Toronto','Ontario','M5T 1T4'),(19,'Juan ','Emilio',31.5,'Nurse','2084 Albert Street','London','Ontario','N5W 5K6'),(20,'Emilia','Zona',30,'Nurse','2733 Carlson Road','Prince George','British Columbia','V2L 5E5'),(21,'Noah','Hasbeen',27.8,'Nurse','347 Port Washington Rd','Delburne','Alberta','T0M 0V0'),(22,'Emilio','Juan',32,'Nurse','3830 Ontario St','St Catharines','Ontario','L2N 1S8'),(23,'Benjamin ','Martin',25,'Administrative Assistant','688 Jasper Ave','Edmonton','Alberta','T5J 3N6'),(24,'Sophia','Whitehead',26.5,'Administrative Assistant','4650 50th Street','Vegreville','Alberta','T9C 1S1'),(25,'Maximus ','Blackwood',60,'Manager','4962 Tycos Dr','Toronto','Ontario','M5T 1T4');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(45) DEFAULT NULL,
  `exam_price` float DEFAULT NULL,
  `exam_results` varchar(2000) DEFAULT NULL,
  `doctor_treatment_id` int DEFAULT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `fk_Exam_DoctorTreatment1_idx` (`doctor_treatment_id`),
  CONSTRAINT `fk_Exam_DoctorTreatment1` FOREIGN KEY (`doctor_treatment_id`) REFERENCES `doctortreatment` (`doctor_treatment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'X-ray',250,'Benign',1),(2,'Blood work',900,'Benign',7),(3,'Blood work',1000,'Terminal',2),(4,'Ultrasound',790,'Broken rib',1),(5,'X-ray',300,'Broken bone on arm',3),(6,'CT scan',838,'Damaged blood vessels',4),(7,'Biopsy',4350,'Benign tumour',5),(8,'Blood work',460,'Lack of vitamins and minerals',3),(9,'Colonoscopy',2200,'Clean rectum',1),(10,'Pap smear',10,'No cervical cancer',1);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `medical_expenses_total` float DEFAULT NULL,
  `booking_penalty` float DEFAULT NULL,
  `paid_by_patient` float DEFAULT NULL,
  `insurance_covered` float DEFAULT NULL,
  `appointment_id` int NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `fk_Invoices_appointments1_idx` (`appointment_id`),
  CONSTRAINT `fk_Invoices_appointments1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,420.11,NULL,100,320.11,2),(2,561,NULL,0,561,4),(3,1185,50,385,800,6),(4,1070.9,NULL,70.9,1000,8),(5,302.78,NULL,150,152.78,10),(6,150,NULL,50,100,1),(7,693.88,50,293.88,400,3),(8,521.33,NULL,21.33,500,5),(9,1950.55,NULL,950.55,1000,7),(10,750,50,250,500,9);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurseobservation`
--

DROP TABLE IF EXISTS `nurseobservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurseobservation` (
  `nurse_observation_id` int NOT NULL AUTO_INCREMENT,
  `symptoms` varchar(2000) DEFAULT NULL,
  `blood_pressure` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `temperature_deg` float DEFAULT NULL,
  `height_cm` int DEFAULT NULL,
  `weight_kg` int DEFAULT NULL,
  `appointment_id` int NOT NULL,
  `nurse_id` int DEFAULT NULL,
  PRIMARY KEY (`nurse_observation_id`),
  KEY `fk_NurseObservation_appointments1_idx` (`appointment_id`),
  KEY `fk_NurseObservation_Employee1_idx` (`nurse_id`),
  CONSTRAINT `fk_NurseObservation_appointments1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`),
  CONSTRAINT `fk_NurseObservation_Employee1` FOREIGN KEY (`nurse_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurseobservation`
--

LOCK TABLES `nurseobservation` WRITE;
/*!40000 ALTER TABLE `nurseobservation` DISABLE KEYS */;
INSERT INTO `nurseobservation` VALUES (1,'Blue-ish skin, mild headache','120/80',35.1,165,54,1,6),(2,'Diarrhea, dizziness','112/79',36.2,168,77,3,19),(3,'Severe headache, fast heart rate','115/82',36.5,180,94,5,9),(4,'Lightheadedness, mild rash','110/69',38.2,210,109,7,9),(5,'Mild headache','120/72',40,176,74,9,20),(6,'High fever','130/90',37.8,166,98,2,20),(7,'Phlegm, itchiness on arms','132/90',35.7,153,85,4,8),(8,'Diarrhea, dehydration, white tongue','122/75',38.5,168,146,6,8),(9,'Runny nose, mild headache, lack of hunger','140/91',37.6,170,63,8,6),(10,'Coughing, itchy throat, white tongue','139/88',37.5,178,75,10,9);
/*!40000 ALTER TABLE `nurseobservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `permanent_doctor_id` int DEFAULT NULL,
  `email` varchar(100) DEFAULT 'example@example.com',
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `primary_member_id` int DEFAULT NULL,
  `relationship_to_primary` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `fk_Patients_Employees1_idx` (`permanent_doctor_id`) /*!80000 INVISIBLE */,
  KEY `primary_member_id` (`primary_member_id`),
  CONSTRAINT `fk_Patients_Employees1` FOREIGN KEY (`permanent_doctor_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`primary_member_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Diego','Tsukayama','2001-07-25',7,'abcd@efgh.com','(538) 936-9169','3916 Wilmar Farm Road',2,'Son'),(2,'Bill','Clinton','1950-08-28',NULL,'8lfdrj2d2@icznn.com','(976) 661-7873','4690 Clover Drive',1,'Father'),(3,'Nelson ','Ortiz','2001-05-13',11,'x7l6b5@qiott.com','(717) 951-3182','4611 Adams Drive',12,'Father'),(4,'Albert','Conrad','1980-03-12',NULL,'suq2j8cojky4@ezztt.com','(501) 539-2608','3842 Hiney Road',NULL,NULL),(5,'Illia','Konik','2002-06-07',NULL,'fun3lw566e0@qiott.com','(470) 238-2993','3033 Saint James Drive',6,'Brother'),(6,'Jack','Carr','1987-10-11',7,'80ogelwc6s1n@qiott.com','(724) 429-9434','1659 Beechwood Drive',5,'Brother'),(7,'Rick','Yona','1990-09-18',NULL,'9qgytdrd4vw@wuuvo.com','(889) 359-0899','4889 Patton Lane',NULL,NULL),(8,'Sigrid','Raimondo','1983-12-20',NULL,'pd68ibcw@qiott.com','(692) 367-7141','2057 Stonecoal Road',NULL,NULL),(9,'Hannah','Salman','2000-07-18',7,'wahsz31glko@qiott.com','(816) 515-4193','2968 Leisure Lane',13,NULL),(10,'Charles','Iosif','1970-03-25',NULL,'dy77om8@qiott.com','(493) 356-4376','528 Trainer Avenue',14,'Husband'),(11,'Merle','Isaac','1973-02-24',NULL,'b16h6w9c@ezztt.com','(967) 588-8055','683 Queens Lane',NULL,NULL),(12,'Gerald','Cailin','1960-07-07',16,'vckt15rwi@icznn.com','(444) 910-6262','596 Sunburst Drive',3,'Son'),(13,'Marcelle','Imaculada','1998-10-04',18,'4lu0m2c@qiott.com','(514) 480-9258','4060 Progress Way',9,NULL),(14,'Mitsuko','Wendi','2001-08-13',NULL,'c831hs@qiott.com','(688) 205-4300','2899 Brentwood Drive',10,'Wife'),(15,'Melanie','Louiza','2002-08-24',NULL,'feeewd@icznn.com','(826) 251-0328','2852 Point Street',NULL,NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salarypayment`
--

DROP TABLE IF EXISTS `salarypayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salarypayment` (
  `salary_payment_id` int NOT NULL AUTO_INCREMENT,
  `total_hours` float DEFAULT NULL,
  `biweekly_payments` float DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`salary_payment_id`),
  KEY `fk_SalaryPayments_Employees1_idx` (`employee_id`),
  CONSTRAINT `fk_SalaryPayments_Employees1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salarypayment`
--

LOCK TABLES `salarypayment` WRITE;
/*!40000 ALTER TABLE `salarypayment` DISABLE KEYS */;
INSERT INTO `salarypayment` VALUES (1,110,2200,'2021-04-04',2),(2,114,2639.1,'2023-01-15',1),(3,108,3402,'2016-01-18',19),(4,110,2420,'2017-01-20',5),(5,68,1836,'2012-05-28',6),(6,112,3113.6,'2022-10-07',21),(7,80,2160,'2023-01-12',6),(8,82,1640,'2022-08-12',2),(9,83,1660,'2019-10-25',2),(10,100,2000,'2015-02-05',2),(11,70,1715,'2015-11-30',9),(12,99,2970,'2016-08-11',20),(13,87,2418.6,'2018-10-10',21),(14,75,1837.5,'2016-12-12',9),(15,95,3040,'2018-06-06',22),(16,79,2133,'2017-03-04',6),(17,83,2614.5,'2017-09-09',19),(18,64,1568,'2023-07-27',9),(19,72,2304,'2022-08-22',22),(20,92,2484,'2022-05-15',6),(21,80,1852,'2019-10-29',1),(22,75,1350,'2018-12-25',10),(23,71,1562,'2017-09-09',5),(24,76,1520,'2018-10-01',2),(25,74,1480,'2019-11-21',2),(26,79,1828.85,'2020-05-16',1),(27,72,1296,'2021-10-14',10),(28,76,1672,'2022-11-11',5);
/*!40000 ALTER TABLE `salarypayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `shift_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `hours` float DEFAULT NULL,
  PRIMARY KEY (`shift_id`),
  KEY `fk_TwoWeekWorkingHours_Employees1_idx` (`employee_id`),
  CONSTRAINT `fk_TwoWeekWorkingHours_Employees1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,1,'2023-01-23',7),(2,2,'2023-05-16',7),(3,3,'2023-06-21',6),(4,4,'2023-07-03',7),(5,5,'2023-09-15',6),(6,6,'2023-10-30',6),(7,7,'2023-10-31',6),(8,9,'2023-11-15',7),(9,8,'2023-10-14',6),(10,4,'2023-12-01',7);
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-02 20:09:48

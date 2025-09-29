-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurantchaindb
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `Branch_ID` int NOT NULL,
  `Restaurant_ID` int NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Manager_Name` varchar(100) DEFAULT NULL,
  `Contact_No` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Branch_ID`),
  KEY `Restaurant_ID` (`Restaurant_ID`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`Restaurant_ID`) REFERENCES `restaurant` (`Restaurant_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,1,'London','Alice Johnson','1234567890'),(2,2,'New York','Bob Smith','0987654321'),(3,3,'Tokyo','Hiro Tanaka','9876543210'),(4,4,'Mexico City','Carlos Garcia','4567891230'),(5,5,'Rome','Luigi Rossi','1237894560'),(6,6,'Texas','James Carter','6543219870'),(7,7,'Mumbai','Rajesh Kumar','7891234560'),(8,8,'Beijing','Li Wei','3219876540'),(9,9,'Berlin','Anna Schmidt','9873216540'),(10,10,'Sydney','Jack Wilson','6547891230');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Category_ID` int NOT NULL,
  `Category_Name` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Main Course','Meals as mains'),(2,'Snacks','Light snacks'),(3,'Desserts','Sweet treats'),(4,'Beverages','Drinks and refreshments'),(5,'Appetizers','Starters and small bites'),(6,'Soups','Warm and comforting soups'),(7,'Salads','Healthy and fresh salads'),(8,'Grilled Items','Grilled specialties'),(9,'Sandwiches','Quick meals'),(10,'Breakfast','Morning meals');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_ID` int NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Emma','Johnson','emma.johnson@example.com','1234567890'),(2,'Liam','Smith','liam.smith@example.com','0987654321'),(3,'Olivia','Brown','olivia.brown@example.com','9876543210'),(4,'Noah','Davis','noah.davis@example.com','4567891230'),(5,'Sophia','Taylor','sophia.taylor@example.com','1237894560'),(6,'James','Wilson','james.wilson@example.com','6543219870'),(7,'Mia','Clark','mia.clark@example.com','7891234560'),(8,'Lucas','Moore','lucas.moore@example.com','3219876540'),(9,'Charlotte','Hall','charlotte.hall@example.com','9873216540'),(10,'Elijah','Lee','elijah.lee@example.com','6547891230');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `Inventory_ID` int NOT NULL,
  `Ingredient_Name` varchar(100) NOT NULL,
  `Quantity` int NOT NULL,
  `Unit` enum('kg','g','pcs','liters') NOT NULL,
  `Reorder_Level` int NOT NULL,
  `Branch_ID` int NOT NULL,
  PRIMARY KEY (`Inventory_ID`),
  KEY `Branch_ID` (`Branch_ID`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`),
  CONSTRAINT `inventory_chk_1` CHECK ((`Quantity` >= 0)),
  CONSTRAINT `inventory_chk_2` CHECK ((`Reorder_Level` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'Cheese',50,'kg',10,1),(2,'Tomatoes',30,'kg',5,2),(3,'Beef',20,'kg',5,3),(4,'Chicken',40,'kg',8,4),(5,'Flour',100,'kg',15,5),(6,'Sugar',60,'kg',10,6),(7,'Eggs',200,'pcs',50,7),(8,'Lettuce',25,'kg',6,8),(9,'Chocolate',15,'kg',3,9),(10,'Bacon',20,'kg',5,10);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `Menu_ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Category_ID` int NOT NULL,
  PRIMARY KEY (`Menu_ID`),
  KEY `Category_ID` (`Category_ID`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`),
  CONSTRAINT `menu_chk_1` CHECK ((`Price` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Margherita Pizza','Classic cheese and tomato pizza',9.99,1),(2,'Cheeseburger','Beef patty with melted cheese',8.49,2),(3,'Chocolate Cake','Rich chocolate dessert',6.99,3),(4,'Mojito','Mint and lime refreshing drink',4.99,4),(5,'Nachos','Crispy nachos with cheese',5.99,5),(6,'Tomato Soup','Warm tomato soup with herbs',4.49,6),(7,'Caesar Salad','Classic Caesar salad with dressing',7.99,7),(8,'Grilled Chicken','Succulent grilled chicken',12.99,8),(9,'Club Sandwich','Double-layered sandwich',6.49,9),(10,'Pancakes','Fluffy pancakes with syrup',5.99,10);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Order_ID` int NOT NULL,
  `Customer_ID` int NOT NULL,
  `Branch_ID` int NOT NULL,
  `Menu_ID` int NOT NULL,
  `Order_Date` date NOT NULL,
  `Quantity` int NOT NULL,
  `Total_Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Branch_ID` (`Branch_ID`),
  KEY `Menu_ID` (`Menu_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`Menu_ID`) REFERENCES `menu` (`Menu_ID`),
  CONSTRAINT `orders_chk_1` CHECK ((`Quantity` > 0)),
  CONSTRAINT `orders_chk_2` CHECK ((`Total_Price` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,1,'2025-01-01',2,19.98),(2,2,2,2,'2025-01-02',1,8.49),(3,3,3,3,'2025-01-03',3,20.97),(4,4,4,4,'2025-01-04',4,19.96),(5,5,5,5,'2025-01-05',1,5.99),(6,6,6,6,'2025-01-06',2,8.98),(7,7,7,7,'2025-01-07',3,23.97),(8,8,8,8,'2025-01-08',1,12.99),(9,9,9,9,'2025-01-09',2,12.98),(10,10,10,10,'2025-01-10',3,17.97);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `Owner_ID` int NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Owner_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'John','Doe'),(2,'Alice','Smith'),(3,'Robert','Brown'),(4,'Emma','Jones'),(5,'Liam','Taylor'),(6,'Sophia','Wilson'),(7,'James','Davis'),(8,'Mia','Clark'),(9,'Oliver','Moore'),(10,'Amelia','Hall');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `Report_ID` int NOT NULL,
  `Sales_Performance` enum('High','Medium','Low') NOT NULL,
  `Inventory_Status` enum('Sufficient','Low','Critical') DEFAULT 'Sufficient',
  `Report_Date` date NOT NULL,
  PRIMARY KEY (`Report_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,'High','Sufficient','2025-01-01'),(2,'Medium','Low','2025-01-02'),(3,'Low','Critical','2025-01-03'),(4,'High','Sufficient','2025-01-04'),(5,'Medium','Low','2025-01-05'),(6,'High','Critical','2025-01-06'),(7,'Medium','Sufficient','2025-01-07'),(8,'High','Low','2025-01-08'),(9,'Medium','Sufficient','2025-01-09'),(10,'Low','Critical','2025-01-10');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `Reservation_ID` int NOT NULL,
  `Customer_ID` int NOT NULL,
  `Branch_ID` int NOT NULL,
  `Reservation_Date` date NOT NULL,
  `No_of_People` int NOT NULL,
  `Status` enum('Confirmed','Pending','Cancelled') NOT NULL,
  PRIMARY KEY (`Reservation_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Branch_ID` (`Branch_ID`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`),
  CONSTRAINT `reservation_chk_1` CHECK ((`No_of_People` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,1,'2025-01-01',4,'Confirmed'),(2,2,2,'2025-01-02',2,'Pending'),(3,3,3,'2025-01-03',5,'Confirmed'),(4,4,4,'2025-01-04',3,'Cancelled'),(5,5,5,'2025-01-05',6,'Confirmed'),(6,6,6,'2025-01-06',7,'Confirmed'),(7,7,7,'2025-01-07',8,'Pending'),(8,8,8,'2025-01-08',9,'Confirmed'),(9,9,9,'2025-01-09',4,'Confirmed'),(10,10,10,'2025-01-10',2,'Cancelled');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `Restaurant_ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Type` enum('Italian','American','Japanese','Mexican','Barbecue','Indian','Chinese','Vegan','Seafood') NOT NULL,
  `Owner_ID` int NOT NULL,
  PRIMARY KEY (`Restaurant_ID`),
  KEY `Owner_ID` (`Owner_ID`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`Owner_ID`) REFERENCES `owner` (`Owner_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Pizza Palace','Italian',1),(2,'Burger Haven','American',2),(3,'Sushi Corner','Japanese',3),(4,'Taco Fiesta','Mexican',4),(5,'Pasta Paradise','Italian',5),(6,'BBQ Grill','Barbecue',6),(7,'Curry Kitchen','Indian',7),(8,'Dim Sum Delight','Chinese',8),(9,'Vegan Bliss','Vegan',9),(10,'Seafood Shack','Seafood',10);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `Sales_ID` int NOT NULL,
  `Order_ID` int NOT NULL,
  `Sales_Date` date NOT NULL,
  `Total_Amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Sales_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`),
  CONSTRAINT `sales_chk_1` CHECK ((`Total_Amount` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,'2025-01-01',19.98),(2,2,'2025-01-02',8.49),(3,3,'2025-01-03',20.97),(4,4,'2025-01-04',19.96),(5,5,'2025-01-05',5.99),(6,6,'2025-01-06',8.98),(7,7,'2025-01-07',23.97),(8,8,'2025-01-08',12.99),(9,9,'2025-01-09',12.98),(10,10,'2025-01-10',17.97);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `Supplier_ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Contact_No` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Fresh Produce Co.','123 Green Lane, London','1234567890'),(2,'Meat Supplies Ltd.','456 Red Street, New York','0987654321'),(3,'Dairy Farms','789 Blue Avenue, Tokyo','9876543210'),(4,'Grain Wholesalers','101 Yellow Road, Mexico City','4567891230'),(5,'Baking Essentials','202 Pink Blvd, Rome','1237894560'),(6,'Sweeteners Inc.','303 Orange Dr, Texas','6543219870'),(7,'Egg Producers','404 Violet Lane, Mumbai','7891234560'),(8,'Leafy Greens','505 Indigo Street, Beijing','3219876540'),(9,'Chocolate World','606 Brown Rd, Berlin','9873216540'),(10,'Pork Distributors','707 Black Alley, Sydney','6547891230');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-21  2:05:43

-- Create all tables WITHOUT foreign key constraints
CREATE DATABASE apartment_management;
USE apartment_management;

-- Table structure for table `auth`
CREATE TABLE `auth` (
  `user_id` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '12345678',
  `id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table structure for table `block`
CREATE TABLE `block` (
  `block_no` int NOT NULL,
  `block_name` varchar(10) DEFAULT NULL,
  `complaints` varchar(100) DEFAULT NULL,
  `room_no` int DEFAULT NULL,
  PRIMARY KEY (`block_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table structure for table `block_admin`
CREATE TABLE `block_admin` (
  `admin_id` int NOT NULL,
  `admin_name` varchar(20) DEFAULT NULL,
  `block_no` int DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table structure for table `employee`
CREATE TABLE `employee` (
  `emp_id` int NOT NULL,
  `emp_name` varchar(30) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `emp_type` varchar(20) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `block_no` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table structure for table `identity`
CREATE TABLE `identity` (
  `proof` varchar(15) DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `tenant_id` int DEFAULT NULL,
  UNIQUE KEY `proof` (`proof`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table structure for table `owner`
CREATE TABLE `owner` (
  `owner_id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `aggrement_status` varchar(20) NOT NULL,
  `room_no` int DEFAULT NULL,
  `dob` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table structure for table `rental`
CREATE TABLE `rental` (
  `doj` varchar(20) DEFAULT NULL,
  `monthly_rent` int DEFAULT NULL,
  `room_no` int DEFAULT NULL,
  `tenant_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table structure for table `room`
CREATE TABLE `room` (
  `room_no` int NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `parking_slot` varchar(10) DEFAULT NULL,
  `reg_no` int DEFAULT NULL,
  `block_no` int DEFAULT NULL,
  PRIMARY KEY (`room_no`),
  UNIQUE KEY `parking_slot` (`parking_slot`),
  UNIQUE KEY `reg_no` (`reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table structure for table `tenant`
CREATE TABLE `tenant` (
  `tenant_id` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `dob` varchar(10) DEFAULT NULL,
  `stat` varchar(10) DEFAULT NULL,
  `room_no` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Recreate the views
CREATE VIEW `avt` AS select `tenant`.`tenant_id` AS `tenant_id`,`tenant`.`room_no` AS `room_no`,`tenant`.`dob` AS `dob`,`tenant`.`name` AS `name`,`tenant`.`age` AS `age` from `tenant`;
CREATE VIEW `o` AS select `block`.`complaints` AS `complaints` from `block`;
CREATE VIEW `oo` AS select `block`.`complaints` AS `complaints`,`block`.`room_no` AS `room_no` from `block`;
CREATE VIEW `tav` AS select `tenant`.`tenant_id` AS `tenant_id`,`tenant`.`room_no` AS `room_no`,`tenant`.`dob` AS `dob`,`tenant`.`name` AS `name` from `tenant`;


-- Create the admin user for the application
INSERT INTO block_admin (admin_id, admin_name, block_no) VALUES (101, 'Main Admin', 1);

-- Create the login credentials for the admin
INSERT INTO auth (user_id, password, id) VALUES ('a-101', 'admin123', 101);
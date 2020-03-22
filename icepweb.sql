-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2020 at 11:11 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `icepweb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_admin` (IN `_id` INT, IN `_first_name` VARCHAR(255), IN `_last_name` VARCHAR(255), IN `_username` VARCHAR(255), IN `_phone_no` VARCHAR(255), IN `_email` VARCHAR(255), IN `_password` VARCHAR(255))  BEGIN
	IF _id = 0 THEN
    	INSERT INTO admin_reg(first_name,last_name,username,phone_no,email,password)
        VALUES (_first_name,_last_name,_username,_phone_no,_email,_password);
        
        SET _id = LAST_INSERT_ID();
    ELSE
    	UPDATE admin_reg
        SET 
        	first_name = _first_name,
        	last_name = _last_name,
            username = _username,
            phone_no = _phone_no,
            email = _email,
            password = _password
        WHERE id = _id;
    END IF;
        
        SELECT _id AS 'id';
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_profile` (IN `_id` INT, IN `_first_name` VARCHAR(50), IN `_last_name` VARCHAR(50), IN `_phone_no` VARCHAR(10), IN `_email` VARCHAR(50), IN `_password` VARCHAR(50))  BEGIN
	IF _id = 0 THEN
    	INSERT INTO register(first_name,last_name,phone_no,email,password)
        VALUES (_first_name,_last_name,_phone_no,_email,_password);
        
        SET _id = LAST_INSERT_ID();
    ELSE
    	UPDATE register
        SET 
        	first_name = _first_name,
        	last_name = _last_name,
            phone_no = _phone_no,
            email = _email,
            password = _password
        WHERE id = _id;
    END IF;
        
        SELECT _id AS 'id';
  END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_reg`
--

CREATE TABLE `admin_reg` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_reg`
--

INSERT INTO `admin_reg` (`id`, `first_name`, `last_name`, `username`, `email`, `phone_no`, `password`) VALUES
(1, 'ty', 'mod', 'tymod17', 'tymod17@gmail.com', '0671987531', '12345'),
(3, 'oop', 'mod', '214888780', 'test7@gmail.com', '0172169400', '123456789'),
(4, 'ty', 'mo', 'tymo17', 'tymo157@gmail.com', '0712169400', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `applicantinfo`
--

CREATE TABLE `applicantinfo` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobileno` varchar(10) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `idno` varchar(13) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `proglanguages` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applicantinfo`
--

INSERT INTO `applicantinfo` (`id`, `firstname`, `lastname`, `email`, `mobileno`, `specialization`, `idno`, `gender`, `proglanguages`) VALUES
(1, 'fanie', '', 'test7@gmail.com', '0860010111', 'web and application development', '9601105944089', 'male', 'java,c,python'),
(2, 'koketso', 'modify', 'kkooo@gmail.com', '0785522145', 'sulti', '1996111751010', 'male', 'java'),
(3, ' lethu', 'masondo', 'home', '0998766654', 'Software Development', '7789287771899', 'Male', ' java'),
(4, 'Victor', 'Manakana', 'vtmanakana@gmail.com', '0723569576', 'Software Development', '9710215310082', 'Male', 'Ruby'),
(7, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '),
(50, ' ', ' ', 'victor', ' ', ' ', ' ', ' ', ' '),
(55, ' koketso', ' vcxfd', 'victor@gmail', ' ', ' ', 'manakana vict', ' ', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `daily_reports`
--

CREATE TABLE `daily_reports` (
  `id` int(11) NOT NULL,
  `student_no` varchar(9) NOT NULL,
  `report` varchar(255) NOT NULL,
  `report_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daily_reports`
--

INSERT INTO `daily_reports` (`id`, `student_no`, `report`, `report_date`) VALUES
(1, '214788780', 'did only backend', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `file_uploads`
--

CREATE TABLE `file_uploads` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `first_name`, `last_name`, `phone_no`, `email`, `password`) VALUES
(1, 'kay', 'mod', '0172169400', 'testme@gmail.com', '123456789'),
(2, 'test', 'me', '0658440731', 'kktstest@gmail.com', '123456799##'),
(3, 'me', 'too', '0671987531', 'at@yahoo.com', '123456789'),
(23, 'oop', 'mod', '0172169400', 'test44@gmail.com', '123456789'),
(24, 'test me', 'test', '0785522146', 'testme123@gmail.com', '12345@G '),
(26, 'ty', 'mo', '0712169400', 'tymo157@gmail.com', '12345'),
(28, 'ty', 'mo', '0712169400', 'tymo554@gmail.com', '12345'),
(29, 'kay', 'modise', '0712163004', 'kay@gmail.co.za', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_reg`
--
ALTER TABLE `admin_reg`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `applicantinfo`
--
ALTER TABLE `applicantinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`);

--
-- Indexes for table `daily_reports`
--
ALTER TABLE `daily_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_reg`
--
ALTER TABLE `admin_reg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `applicantinfo`
--
ALTER TABLE `applicantinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `daily_reports`
--
ALTER TABLE `daily_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `file_uploads`
--
ALTER TABLE `file_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

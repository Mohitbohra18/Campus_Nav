-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2025 at 09:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `campus_navigation`
--

-- --------------------------------------------------------

--
-- Table structure for table `nodes_outer`
--

CREATE TABLE `nodes_outer` (
  `node_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nodes_outer`
--

INSERT INTO `nodes_outer` (`node_id`, `name`, `description`, `type`, `latitude`, `longitude`) VALUES
(1, 'Graphic Era Hill University', 'Main Campus', 'Main Campus', 30.273494434815, 77.999930611374),
(2, 'Marina Hostel', 'Girl\'s Hostel', 'Hostel', 30.272142617392, 77.999839946174),
(3, 'GEHU-GATE1', 'Gate number 1 for GEHU', 'Gate', 30.273308356815, 77.999298180457),
(4, 'GEHU-Gate 2', 'Gate number 2 for GEHU near Marina', 'gate', 30.272637974821, 77.999936792012),
(5, 'GEHU-Gate3', 'Gate number 3 for GEHU', 'Gate', 30.272401409184, 78.000996851965),
(6, 'Agriculture Building', 'Building For Agriculture and BBA students', 'Building', 30.271791822139, 78.001499120626),
(7, 'Sai Hostel', 'Hostel For Boys', 'Hostel', 30.271025549095, 78.001679095742),
(8, 'Mother Teressa Hostel', 'Hostel For Girls', 'Hostel', 30.271272852107, 77.998595833785),
(9, 'Sarojini Hostel', 'Hostel For Girls', 'Hostel', 30.268647673692, 77.99647965243),
(10, 'Priyadarshini Hostel', 'Hostel For Girls', 'Hostel', 30.268785413505, 77.996119135228),
(11, 'Alaknanda Hostel', 'Hostel For Girls', 'Hostel', 30.268748838104, 77.998079894451),
(12, 'GEU-Gate 2', 'Graphic Era Deemed to be University gate 2', 'Gate', 30.268723971552, 77.997837111737),
(13, 'Subhash Chandra Bose Hostel', 'Hostel for boys', 'Hostel', 30.271247111049, 77.997883211646),
(14, 'Sardar Bhagat Singh Hostel', 'Hostel For Boys', 'Hostel', 30.271191962054, 77.997635352122),
(15, 'GEU-Gate 1', 'GEU Main Gate', 'Gate', 30.2687898811, 77.995213186001),
(16, 'Silver Jubilee Convention Centre', 'Convention Centre', 'Building', 30.269440647673, 77.995185789187),
(17, 'Laxmi Bai Hostel', 'Hostel For Girls', 'Hostel', 30.267884788399, 77.99355278619),
(18, 'Chandra Shekhar Azad Hostel', 'Hostel for Boys', 'Hostel', 30.267584140447, 77.994146288656),
(19, 'Sardar Patel Hostel/ Mess', 'Hostel and Mess', 'Hostel/Mess', 30.267610255423, 77.993905586744),
(20, 'CS-IT Building', 'Building for B.tech Students of GEU', 'Building', 30.269031251675, 77.993095899634),
(21, 'Graphic Era Global School', 'School', 'Building', 30.268925813836, 77.995175745693),
(22, 'Graphic Era Bus Parking', 'Parking for Graphic Era Transportation', 'Bus Parking', 30.271046533666, 77.996025318738);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nodes_outer`
--
ALTER TABLE `nodes_outer`
  ADD PRIMARY KEY (`node_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nodes_outer`
--
ALTER TABLE `nodes_outer`
  MODIFY `node_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2025 at 09:24 PM
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
-- Table structure for table `edges_outer`
--

CREATE TABLE `edges_outer` (
  `edge_id` bigint(20) NOT NULL,
  `from_node` bigint(20) DEFAULT NULL,
  `to_node` bigint(20) DEFAULT NULL,
  `weight` double NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `edges_outer`
--

INSERT INTO `edges_outer` (`edge_id`, `from_node`, `to_node`, `weight`, `description`) VALUES
(147, 3, 22, 400, 'Path From Gate 1 to Graphic Era bus Parking'),
(148, 3, 4, 77, 'Path From GEHU gate 1 to GEHU gate 2'),
(149, 4, 2, 79, 'Path From gate 2 to marina hostel'),
(150, 4, 5, 140, 'Path From Gate 2 to Gate 3'),
(151, 5, 6, 93, 'Path From Gehu gate 3 to School Of Agriculture'),
(152, 6, 8, 400, 'Path From Agriculture Building to Mother Teressa Hostel'),
(153, 8, 10, 450, 'Path From Mother Teressa Hostel To Priyadarshini Hostel'),
(154, 10, 9, 13, 'Path From Priyadarshini To Sarojini'),
(155, 10, 11, 240, 'Path From Priyadarshini To Alaknanda Hostel'),
(156, 11, 12, 22, 'Path from Alaknanda Hostel to GEU Gate 2'),
(157, 4, 13, 260, 'Path from GEHU gate 2 to SC Bose Hostel'),
(158, 13, 14, 30, 'Path From SC Bose hostel to Sardar Bhagat Singh Hostel'),
(159, 13, 16, 350, 'Path From SC BOSE hostel to Silver Jubilee Convention Centre'),
(160, 16, 21, 92, 'Path from convention center to Graphic Era global School'),
(161, 21, 15, 52, 'Path From Graphic Era Global School to GEU gate 1'),
(162, 15, 20, 160, 'Path From GEU gate 1 to CS IT building'),
(163, 15, 18, 190, 'Path From GEU gate 1 to CS Azad hostel'),
(164, 18, 19, 19, 'Path From CS Azad hostel to Sardar Patel Hostel/Mess'),
(165, 19, 17, 32, 'Path From Sardar Patel Hostel/Mess to Laxmi Bai Hostel'),
(166, 17, 20, 120, 'Path From Laxmi Bai Hostel to CS IT building via Tunnel'),
(167, 3, 1, 120, 'Path From gate 1 to GEHU Main Campus'),
(168, 4, 1, 74, 'Path From Gate2 to GEHU main campus'),
(169, 5, 1, 180, 'Path From Gehu gate 3 to gehu main campus'),
(170, 5, 7, 260, 'Path from Gehu Gate 3 to Sai Hostel'),
(171, 22, 3, 400, 'Path From Graphic Era bus Parking to Gate 1'),
(172, 4, 3, 77, 'Path From GEHU gate 2 to GEHU gate 1'),
(173, 2, 4, 79, 'Path From marina hostel to gate 2'),
(174, 5, 4, 140, 'Path From Gehu Gate 3 to Gehu Gate 2'),
(175, 6, 5, 93, 'Path From School Of Agriculture to Gehu gate 3'),
(176, 8, 6, 400, 'Path From Mother Teressa Hostel to Agriculture Building'),
(177, 9, 10, 13, 'Path From Sarojini To Priyadarshini'),
(178, 11, 10, 240, 'Path From Alaknanda To Priyadarshini Hostel'),
(179, 12, 11, 22, 'Path from GEU Gate 2 to Alaknanda Hostel'),
(180, 13, 4, 260, 'Path from SC Bose Hostel to GEHU gate 2'),
(181, 14, 13, 30, 'Path From Sardar Bhagat Singh Hostel to SC Bose hostel'),
(182, 16, 13, 350, 'Path From Silver Jubilee Convention Centre to SC BOSE hostel'),
(183, 21, 16, 92, 'Path from Graphic Era global School to Convention center'),
(184, 15, 21, 52, 'Path From GEU gate 1 to Graphic Era Global School'),
(185, 20, 15, 160, 'Path From CS IT building to GEU gate 1'),
(186, 18, 15, 190, 'Path From CS Azad hostel to GEU gate 1'),
(187, 19, 18, 19, 'Path From Sardar Patel Hostel/Mess to CS Azad hostel'),
(188, 17, 19, 32, 'Path From Laxmi Bai Hostel to Sardar Patel Hostel/Mess'),
(189, 20, 17, 120, 'Path From CS IT building to Laxmi Bai Hostel via Tunnel'),
(190, 1, 3, 120, 'Path From GEHU Main Campus to GEHU gate 1'),
(191, 1, 4, 74, 'Path From GEHU main campus to GEHU Gate2'),
(192, 1, 5, 180, 'Path From Gehu main campus to Gehu gate 3'),
(193, 7, 5, 260, 'Path from Sai Hostel to Gehu Gate 3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `edges_outer`
--
ALTER TABLE `edges_outer`
  ADD PRIMARY KEY (`edge_id`),
  ADD KEY `from_node` (`from_node`),
  ADD KEY `to_node` (`to_node`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `edges_outer`
--
ALTER TABLE `edges_outer`
  MODIFY `edge_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `edges_outer`
--
ALTER TABLE `edges_outer`
  ADD CONSTRAINT `edges_outer_ibfk_1` FOREIGN KEY (`from_node`) REFERENCES `nodes_outer` (`node_id`),
  ADD CONSTRAINT `edges_outer_ibfk_2` FOREIGN KEY (`to_node`) REFERENCES `nodes_outer` (`node_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

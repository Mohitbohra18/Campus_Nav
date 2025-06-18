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
-- Table structure for table `edges_hill`
--

CREATE TABLE `edges_hill` (
  `edge_id` int(11) NOT NULL,
  `from_node` int(11) NOT NULL,
  `to_node` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `edges_hill`
--

INSERT INTO `edges_hill` (`edge_id`, `from_node`, `to_node`, `weight`, `description`) VALUES
(1, 1, 2, 3, 'Main block to cse block'),
(2, 2, 1, 3, 'cse to main'),
(3, 1, 3, 3, 'main to btech 1 HOD'),
(4, 3, 1, 3, 'btech to main'),
(5, 1, 4, 3, 'Main to mech'),
(6, 4, 1, 3, 'mech to main'),
(7, 5, 6, 3, 'Gate 1 to canteen'),
(8, 6, 5, 3, 'canteen to gate 1'),
(9, 5, 18, 3, 'Gate to back wing parking'),
(10, 18, 5, 3, 'parking to back gate'),
(11, 18, 19, 3, 'Parking to civil block'),
(12, 19, 18, 3, 'civil to back parking'),
(13, 6, 8, 3, 'canteen to ground'),
(14, 8, 6, 3, 'ground to canteen'),
(15, 6, 9, 3, 'sports arena'),
(16, 9, 6, 3, 'back to canteen'),
(17, 8, 1, 3, 'ground to main block'),
(18, 1, 8, 3, 'main to ground'),
(19, 8, 7, 3, 'main to workshop'),
(20, 7, 8, 3, 'workshop to main'),
(21, 9, 10, 3, 'arena to bb court'),
(22, 10, 9, 3, 'bb court to arena'),
(23, 8, 9, 3, 'ground to arena'),
(24, 9, 8, 3, 'arena to ground'),
(25, 10, 11, 3, 'bb court to vb court'),
(26, 11, 10, 3, 'vb court to bb court'),
(27, 9, 12, 3, 'arena to gate 2'),
(28, 12, 9, 3, 'gate 2 to arena'),
(29, 11, 13, 3, 'vb to tigerhill'),
(30, 13, 11, 3, 'tigerhill to vb'),
(31, 10, 14, 3, 'bb to gate 3'),
(32, 14, 10, 3, 'gate 3 to bb'),
(33, 8, 14, 3, 'grnd to gate 3'),
(34, 14, 8, 3, 'gate 3 to grnd'),
(35, 14, 16, 3, 'gate 3 to agri'),
(36, 16, 14, 3, 'agri to gate 3'),
(37, 16, 15, 3, 'agri to canteen'),
(38, 15, 16, 3, 'canteen to agri'),
(39, 12, 17, 3, ',marina to gate 2'),
(40, 17, 12, 3, 'gate 2 to marina'),
(41, 1, 2, 100, 'Path from Main Building to Library'),
(42, 2, 3, 150, 'Path from Library to Cafeteria'),
(43, 3, 4, 200, 'Path from Cafeteria to Parking Lot'),
(44, 4, 5, 300, 'Path from Parking Lot to Sports Complex'),
(45, 1, 3, 180, 'Direct path from Main Building to Cafeteria'),
(46, 1, 2, 100, 'Path from Main Building to Library'),
(47, 2, 3, 150, 'Path from Library to Cafeteria'),
(48, 3, 4, 200, 'Path from Cafeteria to Parking Lot'),
(49, 4, 5, 300, 'Path from Parking Lot to Sports Complex'),
(50, 1, 3, 180, 'Direct path from Main Building to Cafeteria');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `edges_hill`
--
ALTER TABLE `edges_hill`
  ADD PRIMARY KEY (`edge_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `edges_hill`
--
ALTER TABLE `edges_hill`
  MODIFY `edge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

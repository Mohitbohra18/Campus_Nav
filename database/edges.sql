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
-- Table structure for table `edges`
--

CREATE TABLE `edges` (
  `edge_id` int(11) NOT NULL,
  `from_node` int(11) NOT NULL,
  `to_node` int(11) NOT NULL,
  `weight` int(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `edges`
--

INSERT INTO `edges` (`edge_id`, `from_node`, `to_node`, `weight`, `description`) VALUES
(1, 1, 2, 3, 'Path from Entrance Gate 1 to Guest House 1'),
(2, 2, 1, 3, 'Path from Guest House 1 to Entrance Gate 1'),
(3, 2, 3, 3, 'Path from Guest House 1 to Chancellor\'s Residence'),
(4, 3, 2, 3, 'Path from Chancellor\'s Residence to Guest House 1'),
(5, 3, 4, 3, 'Path from Chancellor\'s Residence to QuickBite Cafe'),
(6, 4, 3, 3, 'Path from QuickBite Cafe to Chancellor\'s Residence'),
(7, 4, 5, 3, 'Path from QuickBite Cafe to Dept. of Management/Chanakya block'),
(8, 5, 4, 3, 'Path from Dept. of Management/Chanakya block to QuickBite Cafe'),
(9, 5, 6, 3, 'Path from Dept. of Management/Chanakya block to Dept. of Biotech'),
(10, 6, 5, 3, 'Path from Dept. of Biotech to Dept. of Management/Chanakya block'),
(11, 5, 8, 3, 'Path from Dept. of Management/Chanakya block to Dept. of Mech. & Automobile Engg.'),
(12, 8, 5, 3, 'Path from Dept. of Mech. & Automobile Engg. to Dept. of Management/Chanakya block'),
(13, 6, 7, 3, 'Path from Dept. of Biotech to Dept. of Petroleum Engg.'),
(14, 7, 6, 3, 'Path from Dept. of Petroleum Engg. to Dept. of Biotech'),
(15, 7, 10, 3, 'Path from Dept. of Petroleum Engg. to Param Computer Lab'),
(16, 10, 7, 3, 'Path from Param Computer Lab to Dept. of Petroleum Engg.'),
(17, 8, 9, 3, 'Path from Dept. of Mech. & Automobile Engg. to Dept. of Mech. & Automobile Engg. Workshop'),
(18, 9, 8, 3, 'Path from Dept. of Mech. & Automobile Engg. Workshop to Dept. of Mech. & Automobile Engg.'),
(19, 8, 21, 3, 'Path from Dept. of Mech. & Automobile Engg. to Girls Hostel (LaxmiBai)'),
(20, 21, 8, 3, 'Path from Girls Hostel (LaxmiBai) to Dept. of Mech. & Automobile Engg.'),
(21, 10, 11, 3, 'Path from Param Computer Lab to Aryabhatt Lab'),
(22, 11, 10, 3, 'Path from Aryabhatt Lab to Param Computer Lab'),
(23, 10, 12, 3, 'Path from Param Computer Lab to Santoshanand Library Block'),
(24, 12, 10, 3, 'Path from Santoshanand Library Block to Param Computer Lab'),
(25, 11, 12, 3, 'Path from Aryabhatt Lab to Santoshanand Library Block'),
(26, 12, 11, 3, 'Path from Santoshanand Library Block to Aryabhatt Lab'),
(27, 12, 13, 3, 'Path from Santoshanand Library Block to Dept. of Civil Engg.'),
(28, 13, 12, 3, 'Path from Dept. of Civil Engg. to Santoshanand Library Block'),
(29, 12, 14, 3, 'Path from Santoshanand Library Block to Dept. of Electrical Engg.'),
(30, 14, 12, 3, 'Path from Dept. of Electrical Engg. to Santoshanand Library Block'),
(31, 13, 14, 3, 'Path from Dept. of Civil Engg. to Dept. of Electrical Engg.'),
(32, 14, 13, 3, 'Path from Dept. of Electrical Engg. to Dept. of Civil Engg.'),
(33, 14, 15, 3, 'Path from Dept. of Electrical Engg. to Administrative Block'),
(34, 15, 14, 3, 'Path from Administrative Block to Dept. of Electrical Engg.'),
(35, 15, 16, 3, 'Path from Administrative Block to Student Community Centre'),
(36, 16, 15, 3, 'Path from Student Community Centre to Administrative Block'),
(37, 16, 17, 3, 'Path from Student Community Centre to Canteen'),
(38, 17, 16, 3, 'Path from Canteen to Student Community Centre'),
(39, 17, 18, 3, 'Path from Canteen to Security/Tuck Shop/Dispensary'),
(40, 18, 17, 3, 'Path from Security/Tuck Shop/Dispensary to Canteen'),
(41, 18, 19, 3, 'Path from Security/Tuck Shop/Dispensary to Bank/ATM'),
(42, 19, 18, 3, 'Path from Bank/ATM to Security/Tuck Shop/Dispensary'),
(43, 18, 24, 3, 'Path from Security/Tuck Shop/Dispensary to Convention Centre /Underground Parking'),
(44, 24, 18, 3, 'Path from Convention Centre /Underground Parking to Security/Tuck Shop/Dispensary'),
(45, 18, 28, 3, 'Path from Security/Tuck Shop/Dispensary to Subway/Tunnel'),
(46, 28, 18, 3, 'Path from Subway/Tunnel to Security/Tuck Shop/Dispensary'),
(47, 19, 20, 3, 'Path from Bank/ATM to Boys Hostel (Chandra Shekhar Azad)'),
(48, 20, 19, 3, 'Path from Boys Hostel (Chandra Shekhar Azad) to Bank/ATM'),
(49, 20, 21, 3, 'Path from Boys Hostel (Chandra Shekhar Azad) to Girls Hostel (LaxmiBai)'),
(50, 21, 20, 3, 'Path from Girls Hostel (LaxmiBai) to Boys Hostel (Chandra Shekhar Azad)'),
(51, 21, 22, 3, 'Path from Girls Hostel (LaxmiBai) to Girls Hostel (Sarojini)'),
(52, 22, 21, 3, 'Path from Girls Hostel (Sarojini) to Girls Hostel (LaxmiBai)'),
(53, 22, 23, 3, 'Path from Girls Hostel (Sarojini) to Graphic Era Global School (prep)'),
(54, 23, 22, 3, 'Path from Graphic Era Global School (prep) to Girls Hostel (Sarojini)'),
(55, 23, 24, 3, 'Path from Graphic Era Global School (prep) to Convention Centre /Underground Parking'),
(56, 24, 23, 3, 'Path from Convention Centre /Underground Parking to Graphic Era Global School (prep)'),
(57, 24, 25, 3, 'Path from Convention Centre /Underground Parking to CS/IT Block'),
(58, 25, 24, 3, 'Path from CS/IT Block to Convention Centre /Underground Parking'),
(59, 25, 26, 3, 'Path from CS/IT Block to BasketBall Court'),
(60, 26, 25, 3, 'Path from BasketBall Court to CS/IT Block'),
(61, 26, 27, 3, 'Path from BasketBall Court to GEU Main Ground'),
(62, 27, 26, 3, 'Path from GEU Main Ground to BasketBall Court'),
(63, 27, 28, 3, 'Path from GEU Main Ground to Subway/Tunnel'),
(64, 28, 27, 3, 'Path from Subway/Tunnel to GEU Main Ground'),
(65, 28, 29, 3, 'Path from Subway/Tunnel to Boys Hostel (Sardar Patel)'),
(66, 29, 28, 3, 'Path from Boys Hostel (Sardar Patel) to Subway/Tunnel'),
(67, 29, 30, 3, 'Path from Boys Hostel (Sardar Patel) to Entrance Gate 2'),
(68, 30, 29, 3, 'Path from Entrance Gate 2 to Boys Hostel (Sardar Patel)'),
(69, 30, 31, 3, 'Path from Entrance Gate 2 to Old MCA block'),
(70, 31, 30, 3, 'Path from Old MCA block to Entrance Gate 2'),
(71, 31, 32, 3, 'Path from Old MCA block to Chairman\'s Residence'),
(72, 32, 31, 3, 'Path from Chairman\'s Residence to Old MCA block'),
(73, 32, 33, 3, 'Path from Chairman\'s Residence to Girls Hostel (Priyadarshini)'),
(74, 33, 32, 3, 'Path from Girls Hostel (Priyadarshini) to Chairman\'s Residence'),
(75, 33, 34, 3, 'Path from Girls Hostel (Priyadarshini) to Dept. of Allied Sciences'),
(76, 34, 33, 3, 'Path from Dept. of Allied Sciences to Girls Hostel (Priyadarshini)'),
(77, 34, 35, 3, 'Path from Dept. of Allied Sciences to Badminton Court'),
(78, 35, 34, 3, 'Path from Badminton Court to Dept. of Allied Sciences'),
(79, 35, 36, 3, 'Path from Badminton Court to Bus Stand'),
(80, 36, 35, 3, 'Path from Bus Stand to Badminton Court'),
(81, 36, 37, 3, 'Path from Bus Stand to Dept. of Electronics Engg.'),
(82, 37, 36, 3, 'Path from Dept. of Electronics Engg. to Bus Stand');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `edges`
--
ALTER TABLE `edges`
  ADD PRIMARY KEY (`edge_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `edges`
--
ALTER TABLE `edges`
  MODIFY `edge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

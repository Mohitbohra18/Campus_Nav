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
-- Table structure for table `nodes_hill`
--

CREATE TABLE `nodes_hill` (
  `node_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nodes_hill`
--

INSERT INTO `nodes_hill` (`node_id`, `name`, `description`, `type`, `latitude`, `longitude`) VALUES
(1, 'Main Building', 'Main Building of the campus', 'Other', 30.273355380188303, 78.00009618078433),
(2, 'Dept. of CSE', 'CSE Deaprtment of the campus', 'Department', 30.27353821548184, 78.00035223033204),
(3, 'BTech first year HOD', 'CSE First Year Dept ', 'Department', 30.273885776821032, 77.99957263835302),
(4, 'Dept. of Mechanical Engg..', 'Mechanical dept', 'Department', 30.273790422781413, 77.99936846326024),
(5, 'Gate no 1', 'Back Gate', 'Other', 30.27327918241658, 77.99921616951868),
(6, 'Tuck shop(Seema Didi)/Canteen', 'Canteen', 'Facility', 30.273197129950262, 77.99943470383275),
(7, 'Mechanical Workshop(Ist year)/MD lab', 'First year mech and civil labs', 'Lab', 30.27329865350688, 78.00096720536257),
(8, 'Main Ground/Helipad', 'Main ground of GEHU', 'Other', 30.272887228791816, 78.00040030334927),
(9, 'Sports block/Sports Arena', 'Sports area', 'Facility', 30.272557258873523, 78.0001145725758),
(10, 'Basketball Court', 'Ground', 'Facility', 30.272196169170837, 78.00053932897508),
(11, 'Volleyball Court', 'Ground', 'Facility', 30.272301479895233, 78.00042808706127),
(12, 'Gate no 2', 'Middle Gate', 'Other', 30.272513820510834, 77.99983644839361),
(13, 'Tiger Hill/Sitting Area', 'Attraction point', 'Other', 30.272497980419235, 78.00056655609745),
(14, 'Gate no 3', 'Front Gate', 'Other', 30.272395870400015, 78.00099811543383),
(15, 'Tuck Shop (Agri)/Canteen', 'Canteen', 'Facility', 30.272045625761383, 78.00140379116338),
(16, 'Agriculture Block', 'Second building', 'Other', 30.271826184404155, 78.00144545544497),
(17, 'Marina Hostel', 'Hostel for girls', 'Hostel', 30.272245847805472, 77.99830039976278),
(18, 'Back Wing Parking', 'Parking for 2 wheeler bikes', 'Other', 30.273694092198784, 77.99917889754639),
(19, 'Dept of Civil Engg..', 'Civil block', 'Department', 30.273867613001507, 77.99966293490132);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nodes_hill`
--
ALTER TABLE `nodes_hill`
  ADD PRIMARY KEY (`node_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nodes_hill`
--
ALTER TABLE `nodes_hill`
  MODIFY `node_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

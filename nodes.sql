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
-- Table structure for table `nodes`
--

CREATE TABLE `nodes` (
  `node_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nodes`
--

INSERT INTO `nodes` (`node_id`, `name`, `description`, `type`, `latitude`, `longitude`) VALUES
(1, 'Entrance Gate1', 'Main entrance to the campus', 'Other', 30.26866377574195, 77.99477182717678),
(2, 'Guest House 1', 'Guest accommodation', 'Other', 30.268756903485095, 77.99740196913869),
(3, 'Chancellor\'s Residence', 'Residence of the Chancellor', 'Other', 30.26833242188399, 77.9959315355522),
(4, 'QuickBite Cafe', 'HM dept Cafe', 'Facility', 30.267972190268104, 77.99655557806767),
(5, 'Dept. of Management/Chanakya block', 'Department of Management', 'Department', 30.267590719238356, 77.99705349431181),
(6, 'Dept. of Biotech', 'Department of Biotechnology', 'Department', 30.26729112726501, 77.99627992654612),
(7, 'Dept. of Petroleum Engg.', 'Department of Petroleum Engineering', 'Department', 30.267768352985517, 77.99641192422042),
(8, 'Dept. of Mech. & Automobile Engg.', 'Department of Mechanical and Automobile Engineerin', 'Department', 30.26816338807707, 77.99628299625948),
(9, 'Dept. of Mech. & Automobile Engg. Workshop', 'Workshop for Mechanical and Automobile Engineering', 'Department', 30.268357433358, 77.99659535118222),
(10, 'Param Computer Lab', 'Main computer lab', 'Lab', 30.267430567295428, 77.99612138597061),
(11, 'Aryabhatt Lab', 'Research lab', 'Lab', 30.267693076340752, 77.99580387499667),
(12, 'Santoshanand Library Block', 'Main library', 'Other', 30.267432911129276, 77.99570617931238),
(13, 'Dept. of Civil Engg.', 'Department of Civil Engineering', 'Department', 30.26678996134876, 77.99548739379279),
(14, 'Dept. of Electrical Engg.', 'Department of Electrical Engineering', 'Department', 30.267534867848358, 77.99546601075515),
(15, 'Administrative Block', 'Administrative offices', 'Other', 30.267602002368147, 77.99507867612272),
(16, 'Student Community Centre', 'Student activity center', 'Other', 30.26717096488096, 77.99470785923451),
(17, 'Canteen', 'Main campus canteen', 'Facility', 30.26719384121971, 77.99441929120498),
(18, 'Security/Tuck Shop/Dispensary', 'Security office and tucky shop (You Are Here)', 'Facility', 30.268534015833495, 77.99507711156159),
(19, 'Bank/ATM', 'Banking services', 'Facility', 30.268673938303397, 77.99485223362528),
(20, 'Boys Hostel(Chandra Shekhar Azad)', 'Boys hostel', 'Hostel', 30.267431806128805, 77.99411145032714),
(21, 'Girls Hostel(LaxmiBai)', 'Girls hostel', 'Hostel', 30.267735166400488, 77.99368566018488),
(22, 'Girls Hostel (Sarojini)', 'girls hostel ', 'Hostel', 30.268627057388468, 77.99647732425102),
(23, 'Graphic Era Global School(prep)', 'School on campus', 'Other', 30.268876682601242, 77.99513833865227),
(24, 'Convention Centre /Underground Parking', 'Auditorium and parking area', 'Other', 30.269431733005913, 77.99511896166334),
(25, 'CS/IT Block', 'Computer Science and IT block', 'Department', 30.268455160672335, 77.99376606070508),
(26, 'BasketBall Court', 'Basketball court', 'Facility', 30.26708861553187, 77.99598666552775),
(27, 'GEU Main Ground', 'Playground for Cricket, Football etc', 'Facility', 30.268176598815206, 77.99447332961631),
(28, 'Subway/Tunnel', 'Subway passage to CS-IT Block', 'Other', 30.26792227370589, 77.99390029905949),
(29, 'Boys Hostel(Sardar Patel)', 'Hostel', 'Hostel', 30.267615199182934, 77.99388437652581),
(30, 'Entrance Gate 2', 'Secondary entrance gate', 'Other', 30.26871615266086, 77.99783171994521),
(31, 'Old MCA block', 'Department', 'Other', 30.26748845282655, 77.996560433921),
(32, 'Chairman\'s Residence', 'Residence of Chairman Sir', 'Residence', 30.26846713095567, 77.99568030984175),
(33, 'Girls Hostel(Priyadarshini)', 'Girls Hostel', 'Hostel', 30.268794867473304, 77.9961531391846),
(34, 'Dept. of Allied Sciences', 'PCB block', 'Department', 30.267316981286434, 77.99697700375079),
(35, 'Badminton Court', 'Sports area', 'Facility', 30.266900552543266, 77.99506482313802),
(36, 'Bus Stand', 'Bus Stand', 'Other', 30.268300228422166, 77.99794337650978),
(37, 'Dept. of Electronics Eng.', 'Department of Electronics Engineering', 'Department', 30.26738730069516, 77.99501567547341);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nodes`
--
ALTER TABLE `nodes`
  ADD PRIMARY KEY (`node_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nodes`
--
ALTER TABLE `nodes`
  MODIFY `node_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

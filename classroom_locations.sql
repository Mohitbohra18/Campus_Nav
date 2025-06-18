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
-- Table structure for table `classroom_locations`
--

CREATE TABLE `classroom_locations` (
  `id` int(11) NOT NULL,
  `room_code` varchar(20) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `building` varchar(50) NOT NULL,
  `floor` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classroom_locations`
--

INSERT INTO `classroom_locations` (`id`, `room_code`, `room_name`, `building`, `floor`, `description`, `created_at`) VALUES
(1, 'B2LAB2', 'Lab2', 'Back', '1', 'Lab: Auto-Cad Lab', '2025-06-18 18:01:08'),
(2, 'B2FR1', 'Faculty room', 'Back', '1', 'Staff room', '2025-06-18 18:01:08'),
(3, 'B2CR201', 'CR201', 'Back', '1', 'Classroom', '2025-06-18 18:01:08'),
(4, 'B2CR202', 'CR202', 'Back', '1', 'Classroom', '2025-06-18 18:01:08'),
(5, 'B2CR203', 'CR203', 'Back', '1', 'Classroom', '2025-06-18 18:01:08'),
(6, 'B2CR204', 'CR204', 'Back', '1', 'Classroom', '2025-06-18 18:01:08'),
(7, 'B2CR205', 'CR205', 'Back', '1', 'Classroom', '2025-06-18 18:01:08'),
(8, 'B2ERP1', 'ERPcell', 'Back', '1', 'Enquiry area', '2025-06-18 18:01:08'),
(9, 'B2CL8', 'Lab8', 'Back', '1', 'Lab', '2025-06-18 18:01:08'),
(10, 'B2S1', 'BackStair1', 'Back', '1', 'Stairs', '2025-06-18 18:01:08'),
(11, 'B2S2', 'BackStair2', 'Back', '1', 'Stairs', '2025-06-18 18:01:08'),
(12, 'F2CR207', 'CR207', 'Front', '1', 'Classroom', '2025-06-18 18:01:08'),
(13, 'F2CR206', 'CR206', 'Front', '1', 'Classroom', '2025-06-18 18:01:08'),
(14, 'F2LT201', 'LT201', 'Front', '1', 'Lecture Theatre', '2025-06-18 18:01:08'),
(15, 'F2LT202', 'LT202', 'Front', '1', 'Lecture Theatre', '2025-06-18 18:01:08'),
(16, 'F2PAN1', 'Pantry', 'Front', '1', 'Pantry', '2025-06-18 18:01:08'),
(17, 'F2TCL12', 'TCL12', 'Front', '1', 'Lab: Thin Client Lab', '2025-06-18 18:01:08'),
(18, 'F2LIB1', 'Library', 'Front', '1', 'Study Point', '2025-06-18 18:01:08'),
(19, 'F2CO1', 'ChancellorOffice', 'Front', '1', 'Chancellor\'s office', '2025-06-18 18:01:08'),
(20, 'F2VCO1', 'Vice-ChancellorOffice', 'Front', '1', 'Vice Chancellor\'s office', '2025-06-18 18:01:08'),
(21, 'F2S1', 'FrontStair1', 'Front', '1', 'Stairs', '2025-06-18 18:01:08'),
(22, 'F2S2', 'FrontStair2', 'Front', '1', 'Stairs', '2025-06-18 18:01:08'),
(23, 'F2CS1', 'CircularStair1', 'Front', '1', 'Stairs', '2025-06-18 18:01:08'),
(24, 'F2CS2', 'CircularStair2', 'Front', '1', 'Stairs', '2025-06-18 18:01:08'),
(25, 'M2SR1', 'ServerRoom', 'Middle', '1', 'Enquiry area', '2025-06-18 18:01:08'),
(26, 'M2SR2', 'StaffRoom', 'Middle', '1', 'Staff room', '2025-06-18 18:01:08'),
(27, 'M2S1', 'MidStair', 'Middle', '1', 'Stairs', '2025-06-18 18:01:08'),
(28, 'B3PHARM1', 'Pharmacology', 'Back', '2', 'Lab', '2025-06-18 18:01:08'),
(29, 'B3PHARMCHEM', 'PharmaceuticalChemistry1', 'Back', '2', 'Lab', '2025-06-18 18:01:08'),
(30, 'B3PHARMC2', 'Pharmaceutics2', 'Back', '2', 'Lab', '2025-06-18 18:01:08'),
(31, 'B3PHARMC1', 'Pharmaceutics1', 'Back', '2', 'Lab', '2025-06-18 18:01:08'),
(32, 'B3PHARMCOG1', 'Pharmacognosy1', 'Back', '2', 'Lab', '2025-06-18 18:01:08'),
(33, 'B3CL7', 'Lab7', 'Back', '2', 'Lab', '2025-06-18 18:01:08'),
(34, 'B3CL3', 'Lab3', 'Back', '2', 'Lab', '2025-06-18 18:01:08'),
(35, 'B3S1', 'BackStair1', 'Back', '2', 'Stairs', '2025-06-18 18:01:08'),
(36, 'B3S2', 'BackStair2', 'Back', '2', 'Stairs', '2025-06-18 18:01:08'),
(37, 'F3DFA', 'DeptofFineArts', 'Front', '2', 'Staff room', '2025-06-18 18:01:08'),
(38, 'F3LT302', 'LT302', 'Front', '2', 'Lecture Theatre', '2025-06-18 18:01:08'),
(39, 'F3CR305', 'CR305', 'Front', '2', 'Classroom', '2025-06-18 18:01:08'),
(40, 'F3CR301', 'CR301', 'Front', '2', 'Classroom', '2025-06-18 18:01:08'),
(41, 'F3LT301', 'LT301', 'Front', '2', 'Lecture Theatre', '2025-06-18 18:01:08'),
(42, 'F3CR303', 'CR303', 'Front', '2', 'Classroom', '2025-06-18 18:01:08'),
(43, 'F3CR302', 'CR302', 'Front', '2', 'Classroom', '2025-06-18 18:01:08'),
(44, 'F3NHSTAFF', 'NewHall', 'Front', '2', 'Staff room', '2025-06-18 18:01:08'),
(45, 'F3CR304', 'CR304', 'Front', '2', 'Classroom', '2025-06-18 18:01:08'),
(46, 'F3DVAG', 'DeptofVisualArtsandGaming', 'Front', '2', 'Staff room: A&G Dept. Seating Area', '2025-06-18 18:01:08'),
(47, 'F3S1', 'FrontStair1', 'Front', '2', 'Stairs', '2025-06-18 18:01:08'),
(48, 'F3S2', 'FrontStair2', 'Front', '2', 'Stairs', '2025-06-18 18:01:08'),
(49, 'F3CS1', 'CircularStair1', 'Front', '2', 'Stairs', '2025-06-18 18:01:08'),
(50, 'F3CS2', 'CircularStair2', 'Front', '2', 'Stairs', '2025-06-18 18:01:08'),
(51, 'M3SR1', 'StaffRoom1', 'Middle', '2', 'Staff room', '2025-06-18 18:01:08'),
(52, 'M3SR2', 'StaffRoom2', 'Middle', '2', 'Staff room', '2025-06-18 18:01:08'),
(53, 'M3S1', 'MidStair', 'Middle', '2', 'Stairs', '2025-06-18 18:01:08'),
(54, 'B4CLIOT', 'IoTLab', 'Back', '3', 'Lab: Internet of Things Lab', '2025-06-18 18:01:08'),
(55, 'B4CR401', 'CR401', 'Back', '3', 'Classroom', '2025-06-18 18:01:08'),
(56, 'B4FACRDM', 'Faculty room(Maths)', 'Back', '3', 'Staff room', '2025-06-18 18:01:08'),
(57, 'B4ELECTRICALLAB1', 'ElectricalLab', 'Back', '3', 'Lab', '2025-06-18 18:01:08'),
(58, 'B4LD&MPLAB', 'LDlab', 'Back', '3', 'Lab', '2025-06-18 18:01:08'),
(59, 'B4ELECTRONICLAB', 'ElectronicsLab', 'Back', '3', 'Lab', '2025-06-18 18:01:08'),
(60, 'B4CR402', 'CR402', 'Back', '3', 'Classroom', '2025-06-18 18:01:08'),
(61, 'B4BTECHHOD1', 'BtechHODFirst', 'Back', '3', 'Enquiry Area', '2025-06-18 18:01:08'),
(62, 'B4CL4', 'Lab4', 'Back', '3', 'Lab', '2025-06-18 18:01:08'),
(63, 'B4S1', 'BackStair1', 'Back', '3', 'Stairs', '2025-06-18 18:01:08'),
(64, 'B4S2', 'BackStair2', 'Back', '3', 'Stairs', '2025-06-18 18:01:08'),
(65, 'F4CR403', 'CR403', 'Front', '3', 'Classroom', '2025-06-18 18:01:08'),
(66, 'F4LT401', 'LT401', 'Front', '3', 'Lecture Theatre', '2025-06-18 18:01:08'),
(67, 'F4CR404', 'CR404', 'Front', '3', 'Classroom', '2025-06-18 18:01:08'),
(68, 'F4DEPTCSE', 'DeptofCSE', 'Front', '3', 'Staff room', '2025-06-18 18:01:08'),
(69, 'F4MACL1', 'MAClab', 'Front', '3', 'Lab', '2025-06-18 18:01:08'),
(70, 'F4CR405', 'CR405', 'Front', '3', 'Classroom', '2025-06-18 18:01:08'),
(71, 'F4TCL34', 'TCL34', 'Front', '3', 'Lab: Thin Client Lab', '2025-06-18 18:01:08'),
(72, 'F4LT402', 'LT402', 'Front', '3', 'Lecture Theatre', '2025-06-18 18:01:08'),
(73, 'F4CR406', 'CR406', 'Front', '3', 'Classroom', '2025-06-18 18:01:08'),
(74, 'F4S1', 'FrontStair1', 'Front', '3', 'Stairs', '2025-06-18 18:01:08'),
(75, 'F4S2', 'FrontStair2', 'Front', '3', 'Stairs', '2025-06-18 18:01:08'),
(76, 'F4CS1', 'CircularStair1', 'Front', '3', 'Stairs', '2025-06-18 18:01:08'),
(77, 'F4CS2', 'CircularStair2', 'Front', '3', 'Stairs', '2025-06-18 18:01:08'),
(78, 'M4SR1', 'Staff Room1', 'Middle', '3', 'Staff Room', '2025-06-18 18:01:08'),
(79, 'M4SR2', 'Staff Room2', 'Middle', '3', 'Staff Room', '2025-06-18 18:01:08'),
(80, 'M4S1', 'MidStair', 'Middle', '3', 'Stairs', '2025-06-18 18:01:08'),
(81, 'B5CR501', 'CR501', 'Back', '4', 'Classroom', '2025-06-18 18:01:08'),
(82, 'B5PHYHOD', 'PhysicsHOD', 'Back', '4', 'Enquiry Area', '2025-06-18 18:01:08'),
(83, 'B5PHYLAB', 'PhysicsLab', 'Back', '4', 'Lab', '2025-06-18 18:01:08'),
(84, 'B5CL5', 'Lab5', 'Back', '4', 'Lab', '2025-06-18 18:01:08'),
(85, 'B5IAPTLAB', 'IAPTLab', 'Back', '4', 'Lab: Indianasm Indian Asian Physics Olympaid Lab', '2025-06-18 18:01:08'),
(86, 'B5CR502', 'CR502', 'Back', '4', 'Classroom', '2025-06-18 18:01:08'),
(87, 'B5FR1', 'FacultyRoom', 'Back', '4', 'Staff room: Physics Dept. Seating', '2025-06-18 18:01:08'),
(88, 'B5CHEMLAB', 'ChemistryLab', 'Back', '4', 'Lab', '2025-06-18 18:01:08'),
(89, 'B5S1', 'BackStair1', 'Back', '4', 'Stairs', '2025-06-18 18:01:08'),
(90, 'B5S2', 'BackStair2', 'Back', '4', 'Stairs', '2025-06-18 18:01:08'),
(91, 'F5CR503', 'CR503', 'Front', '4', 'Classroom', '2025-06-18 18:01:08'),
(92, 'F5LT501', 'LT501', 'Front', '4', 'Lecture Theatre', '2025-06-18 18:01:08'),
(93, 'F5HODFD', 'HODFaishonDesign', 'Front', '4', 'Enquiry Area: Fasion Design Dept. Seating', '2025-06-18 18:01:08'),
(94, 'F5NFDCR1', 'FDCR', 'Front', '4', 'Classroom: Fasion Deisgn CR', '2025-06-18 18:01:08'),
(95, 'F5GCL1', 'GCLab1', 'Front', '4', 'Lab: Garment Consutruction Lab', '2025-06-18 18:01:08'),
(96, 'F5GCL2', 'GCLab2', 'Front', '4', 'Lab: Garment Consutruction Lab', '2025-06-18 18:01:08'),
(97, 'F5LT502', 'LT502', 'Front', '4', 'Lecture Theatre', '2025-06-18 18:01:08'),
(98, 'F5CR504', 'CR504', 'Front', '4', 'Classroom', '2025-06-18 18:01:08'),
(99, 'F5S1', 'FrontStair1', 'Front', '4', 'Stairs', '2025-06-18 18:01:08'),
(100, 'F5S2', 'FrontStair2', 'Front', '4', 'Stairs', '2025-06-18 18:01:08'),
(101, 'F5CS1', 'CircularStair1', 'Front', '4', 'Stairs', '2025-06-18 18:01:08'),
(102, 'F5CS2', 'CircularStair2', 'Front', '4', 'Stairs', '2025-06-18 18:01:08'),
(103, 'M5SR1', 'StaffRoom1', 'Middle', '4', 'Staff room', '2025-06-18 18:01:08'),
(104, 'M5SR2', 'StaffRoom2', 'Middle', '4', 'Staff room', '2025-06-18 18:01:08'),
(105, 'M5S1', 'MidStair', 'Middle', '4', 'Stairs', '2025-06-18 18:01:08'),
(106, 'B6FR1', 'Facultyroom', 'Back', '5', 'Staff room', '2025-06-18 18:01:08'),
(107, 'B6CR601', 'CR601', 'Back', '5', 'Classroom', '2025-06-18 18:01:08'),
(108, 'B6CR602', 'CR602', 'Back', '5', 'Classroom', '2025-06-18 18:01:08'),
(109, 'B6CR603', 'CR603', 'Back', '5', 'Classroom', '2025-06-18 18:01:08'),
(110, 'B6CR604', 'CR604', 'Back', '5', 'Classroom', '2025-06-18 18:01:08'),
(111, 'B6CR605', 'CR605', 'Back', '5', 'Classroom', '2025-06-18 18:01:08'),
(112, 'B6LAWLIB', 'LawLibrary', 'Back', '5', 'Study Point', '2025-06-18 18:01:08'),
(113, 'B6S1', 'BackStair1', 'Back', '5', 'Stairs', '2025-06-18 18:01:08'),
(114, 'B6S2', 'BackStair2', 'Back', '5', 'Stairs', '2025-06-18 18:01:08'),
(115, 'F5NMATHSR', 'StaffRoomMaths', 'Front', '5', 'Staff room', '2025-06-18 18:01:08'),
(116, 'F5NSSOFC', 'NSSoffice', 'Front', '5', 'office', '2025-06-18 18:01:08'),
(117, 'F5NCCOFC', 'NCCoffice', 'Front', '5', 'office', '2025-06-18 18:01:08'),
(118, 'F5NA1', 'NewAudi', 'Front', '5', 'Hall', '2025-06-18 18:01:08'),
(119, 'F5MOOTC', 'MootCourt', 'Front', '5', 'Lab', '2025-06-18 18:01:08'),
(120, 'F5GREENROOOM', 'GreenRoom', 'Front', '5', 'Lab: (mass and media com lab)', '2025-06-18 18:01:08'),
(121, 'F5KPNAUTIYAL', 'KPaudi', 'Front', '5', 'Hall', '2025-06-18 18:01:08'),
(122, 'F5GLASS/GREEN', 'GlassRoom', 'Front', '5', 'Lab', '2025-06-18 18:01:08'),
(123, 'F5RDCELLOFC', 'RADcell', 'Front', '5', 'Staff room', '2025-06-18 18:01:08'),
(124, 'F5LT602', 'LT602', 'Front', '5', 'Lecture Theatre', '2025-06-18 18:01:08'),
(125, 'F5PDPSR', 'StaffRoomPDP', 'Front', '5', 'Staff room', '2025-06-18 18:01:08'),
(126, 'F5LAWSR', 'StaffRoomLaw', 'Front', '5', 'Staff room', '2025-06-18 18:01:08'),
(127, 'F5CR606', 'CR606', 'Front', '5', 'Classroom', '2025-06-18 18:01:08'),
(128, 'F5LT601', 'LT601', 'Front', '5', 'Lecture Theatre', '2025-06-18 18:01:08'),
(129, 'F5FR', 'FacultyRoom', 'Front', '5', 'Staff room', '2025-06-18 18:01:08'),
(130, 'F6S1', 'FrontStair1', 'Front', '5', 'Stairs', '2025-06-18 18:01:08'),
(131, 'F6S2', 'FrontStair2', 'Front', '5', 'Stairs', '2025-06-18 18:01:08'),
(132, 'F6CS1', 'CIRCULARSTAIR1', 'Front', '5', 'Stairs', '2025-06-18 18:01:08'),
(133, 'F6CS2', 'CIRCULARSTAIR2', 'Front', '5', 'Stairs', '2025-06-18 18:01:08'),
(134, 'M5SR12', 'StaffRoom12', 'Middle', '5', 'Staff room', '2025-06-18 18:01:08'),
(135, 'M5CL6', 'Lab6', 'Back', '5', 'lab', '2025-06-18 18:01:08'),
(136, 'M6S1', 'MidStair', 'Middle', '5', 'Stairs', '2025-06-18 18:01:08'),
(137, 'B0S1', 'BackStair1', 'Back', '-1', 'Stairs', '2025-06-18 18:01:08'),
(138, 'B0S2', 'BackStair2', 'Back', '-1', 'Stairs', '2025-06-18 18:01:08'),
(139, 'F0CRA', 'CR-A', 'Front', '-1', 'Classroom', '2025-06-18 18:01:08'),
(140, 'F0CRB', 'CR-B', 'Front', '-1', 'Classroom', '2025-06-18 18:01:08'),
(141, 'F0CCTVR', 'CCTVRoom', 'Front', '-1', 'Security Office', '2025-06-18 18:01:08'),
(142, 'F0PHDRCELL', 'PhDCell', 'Front', '-1', 'Enquiry Area', '2025-06-18 18:01:08'),
(143, 'F0REGISTRAR', 'RegistrarOffice(Basement)', 'Front', '-1', 'Enquiry Area', '2025-06-18 18:01:08'),
(144, 'F0FEECELL', 'FeeCell', 'Front', '-1', 'Fee related Enquiry Area', '2025-06-18 18:01:08'),
(145, 'F0IDCARD', 'ID-CardOffice', 'Front', '-1', 'ID-Card Enquiry Area', '2025-06-18 18:01:08'),
(146, 'F0EXAMINATIONCELL', 'Examination Cell(CoE)', 'Front', '-1', 'Enquiry Area', '2025-06-18 18:01:08'),
(147, 'F0LD&MPL2', 'ldlab2', 'Front', '-1', 'Lab', '2025-06-18 18:01:08'),
(148, 'F0CSR', 'CentralStaffRoom', 'Front', '-1', 'Enquiry Area', '2025-06-18 18:01:08'),
(149, 'F0CAO', 'CheifAdministrativeOffice', 'Front', '-1', 'Enquiry Area', '2025-06-18 18:01:08'),
(150, 'F0RRA', 'RR-A', 'Front', '-1', 'Classroom', '2025-06-18 18:01:08'),
(151, 'F0RRB', 'RR-B', 'Front', '-1', 'Classroom', '2025-06-18 18:01:08'),
(152, 'F0RRC', 'RR-C', 'Front', '-1', 'Classroom', '2025-06-18 18:01:08'),
(153, 'F0RRD', 'RR-D', 'Front', '-1', 'Classroom', '2025-06-18 18:01:08'),
(154, 'F0RRE', 'RR-E', 'Front', '-1', 'Classroom', '2025-06-18 18:01:08'),
(155, 'F0RRF', 'RR-F', 'Front', '-1', 'Classroom', '2025-06-18 18:01:08'),
(156, 'F0RRG', 'RR-G', 'Front', '-1', 'Classroom', '2025-06-18 18:01:08'),
(157, 'F0RRH', 'RR-H', 'Front', '-1', 'Classroom', '2025-06-18 18:01:08'),
(158, 'F0WORKSHOP', 'Workshop', 'Front', '-1', 'Lab', '2025-06-18 18:01:08'),
(159, 'F0MDLAB', 'ManualDrawingLab', 'Front', '-1', 'Lab', '2025-06-18 18:01:08'),
(160, 'F0CIVENGLAB', 'CivilEnggLab', 'Front', '-1', 'Lab', '2025-06-18 18:01:08'),
(161, 'F0FDWORKSHOP', 'FasionDesignWorkshop', 'Front', '-1', 'Lab', '2025-06-18 18:01:08'),
(162, 'F0S1', 'FrontStair1', 'Front', '-1', 'Stairs', '2025-06-18 18:01:08'),
(163, 'F0S2', 'FrontStair2', 'Front', '-1', 'Stairs', '2025-06-18 18:01:08'),
(164, 'F0S3', 'CircularStair1', 'Front', '-1', 'Stairs', '2025-06-18 18:01:08'),
(165, 'F0S4', 'CircularSTair2', 'Front', '-1', 'Stairs', '2025-06-18 18:01:08'),
(166, 'M0S1', 'MidStair', 'Middle', '-1', 'Stairs', '2025-06-18 18:01:08'),
(167, 'B1CR101', 'CR101', 'Back', '0', 'Classroom: just after back entry gate', '2025-06-18 18:01:08'),
(168, 'B1FR1', 'Faculty room', 'Back', '0', 'Not an Enquiry Office', '2025-06-18 18:01:08'),
(169, 'B1PAHRMCHEM2', 'Pharmaceutical chemistry 2', 'Back', '0', 'Lab: just after cr 101', '2025-06-18 18:01:08'),
(170, 'B1CR102', 'CR102', 'Back', '0', 'Classroom: after Instrumentation lab', '2025-06-18 18:01:08'),
(171, 'B1CR103', 'CR103', 'Back', '0', 'Classroom: after cr 102', '2025-06-18 18:01:08'),
(172, 'B1CR104', 'CR104', 'Back', '0', 'Classroom: after cr 103', '2025-06-18 18:01:08'),
(173, 'B1WIFIZONE', 'Wifi Zone', 'Back', '0', 'Sitting spot: in front of cr 102', '2025-06-18 18:01:08'),
(174, 'B1CL1', 'Lab1', 'Back', '0', 'Lab: left wing(from lift area)after CR 101', '2025-06-18 18:01:08'),
(175, 'B1CL10', 'Lab10', 'Back', '0', 'Lab: right wing(from lift area) after cr 103', '2025-06-18 18:01:08'),
(176, 'BPCO', 'PlacementCellOffice', 'Back', '0', 'Staff room: in front of cr 101', '2025-06-18 18:01:08'),
(177, 'B1S1', 'Stairs 13', 'Back', '0', 'Stairs', '2025-06-18 18:01:08'),
(178, 'B1S2', 'Stairs 14', 'Back', '0', 'Stairs', '2025-06-18 18:01:08'),
(179, 'F1RECEPTION', 'Reception area', 'Front', '0', 'Enquiry area: just after front gate entry', '2025-06-18 18:01:08'),
(180, 'F1OPENAUDI', 'open audi', 'Front', '0', 'Sitting spot: front open area', '2025-06-18 18:01:08'),
(181, 'F1GATE2', 'Gate No.-02', 'Front', '0', 'Entry Point', '2025-06-18 18:01:08'),
(182, 'F1MEETINGHALL', 'Meeting Hall', 'Front', '0', 'Hall', '2025-06-18 18:01:08'),
(183, 'F1GATE3', 'Gate No.-03', 'Front', '0', 'Entry Point', '2025-06-18 18:01:08'),
(184, 'F1RESEACHCELL', 'Research and Development cell', 'Middle', '0', 'Enquiry Area', '2025-06-18 18:01:08'),
(185, 'F1REGISTRAROFC2', 'Registrar Office', 'Middle', '0', 'Enqiery Area', '2025-06-18 18:01:08'),
(186, 'F1CR105', 'CR 105', 'Front', '0', 'Classroom', '2025-06-18 18:01:08'),
(187, 'F1BOSCH', 'Conference hall/BOSCH lab', 'Front', '0', 'Hall: Career Skills Lab', '2025-06-18 18:01:08'),
(188, 'F1SEMINARHALL', 'Seminar Hall', 'Front', '0', 'Hall', '2025-06-18 18:01:08'),
(189, 'F1MIROOM', 'MI Room', 'Front', '0', 'Medical emergency', '2025-06-18 18:01:08'),
(190, 'F1ADDCELL', 'Admission Enquiry', 'Front', '0', 'Enquiry area', '2025-06-18 18:01:08'),
(191, 'F1ADDCELL2', 'Administrative Area', 'Front', '0', 'Enquiry area', '2025-06-18 18:01:08'),
(192, 'F1UBUNTU', 'Computere Centre', 'Front', '0', 'Lab: Ubantu Lab', '2025-06-18 18:01:08'),
(193, 'F1S1', 'Stairs 8', 'Front', '0', 'Stairs', '2025-06-18 18:01:08'),
(194, 'F1S2', 'Stairs 9', 'Front', '0', 'Stairs', '2025-06-18 18:01:08'),
(195, 'F1CS1', 'Stairs 10(CIRCULAR STAIRS)', 'Front', '0', 'Stairs', '2025-06-18 18:01:08'),
(196, 'F1CS2', 'Stairs 11(CIRCULAR STAIRS)', 'Front', '0', 'Stairs', '2025-06-18 18:01:08'),
(197, 'M1GATE1', 'Gate No.-01', 'Middle', '0', 'Entry Point', '2025-06-18 18:01:08'),
(198, 'M1S1', 'Stairs 12', 'Middle', '0', 'Stairs', '2025-06-18 18:01:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classroom_locations`
--
ALTER TABLE `classroom_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_code` (`room_code`),
  ADD KEY `idx_room_code` (`room_code`),
  ADD KEY `idx_building` (`building`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classroom_locations`
--
ALTER TABLE `classroom_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

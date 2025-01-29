-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2024 at 07:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `complaint_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `sno` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `id` varchar(50) DEFAULT NULL,
  `type_of_complaint` varchar(100) DEFAULT NULL,
  `prblm` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `material` varchar(100) DEFAULT NULL,
  `year` varchar(25) DEFAULT NULL,
  `section` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `curdate` date DEFAULT curdate(),
  `status` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`sno`, `username`, `id`, `type_of_complaint`, `prblm`, `description`, `material`, `year`, `section`, `department`, `curdate`, `status`) VALUES
(1, 'Pangi Nireesha', 'A21126510047', 'electricity', 'Not Working Properly', 'From past 1month fan is not working', 'fan', '1', 'A', 'cse', '2024-04-12', '1'),
(2, 'Pangi Nireesha', 'A21126510047', 'cleaning', 'Washrooms', 'From past 1week  washrooms are not cleaning', 'toilets', '3', 'B', 'cse', '2024-04-12', '0'),
(3, 'Pangi Nireesha', 'A21126510047', 'electronic', 'Type of Problem', 'Need 5keyboards for the lab 102', 'Keyboards', 'Staff', 'Lab', 'cse', '2024-04-13', '0'),
(4, 'Pangi Nireesha', 'A21126510047', 'plumber', 'Replace', 'Damaged', 'Taps', 'Staff', 'Cabin', 'it', '2024-04-13', '0'),
(5, 'Nireesha p', 'A21126510047', 'electricity', 'Requirement', 'Need it immediately', 'fan', '2', 'Cabin', 'cse', '2024-04-14', '0'),
(6, 'Nireesha p', 'A21126510047', 'cleaning', 'Surroundings', 'not cleaned', 'near cse department', 'Staff', 'Surroundings', 'cse', '2024-04-14', '0'),
(7, 'Nireesha p', 'A21126510047', 'electronic', 'Not Working Properly', 'total of 5mouses', 'Mouse', 'Staff', 'Lab', 'it', '2024-04-14', '0'),
(8, 'Sanjana', 'L100101', 'electronic', 'Replace', 'need an immediate replacement for 5pc\'s, 5mouses', 'Pc\'s, Mouses', 'Staff', 'Lab', 'it', '2024-04-14', '0');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `sno` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `id` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`sno`, `name`, `department`, `role`, `id`) VALUES
(3, 'Taruni Priya Pangi', 'cse', 'management', 'M10012'),
(4, 'Sudheer ', 'ece', 'management', 'M10013');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `rollno` varchar(15) DEFAULT NULL,
  `year` varchar(1) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `section` char(1) DEFAULT NULL,
  `role` varchar(50) DEFAULT 'management'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `rollno`, `year`, `department`, `section`, `role`) VALUES
(6, 'Nireesha  Pangi', 'A21126510047', '3', 'cse', '3', 'student');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `sno` int(11) NOT NULL,
  `id` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`sno`, `id`, `username`, `role`, `password`) VALUES
(6, 'M10012', 'Taruni Priya', 'management', 'manage'),
(7, 'M10013', 'Sudheer ', 'management', 'manage'),
(16, 'A21126510047', 'Nireesha p', 'student', '12345'),
(19, 'L100101', 'Sanjana', 'technisian', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `unique_name_department_role` (`name`,`department`,`role`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rollno` (`rollno`),
  ADD UNIQUE KEY `unique_combination` (`rollno`,`year`,`section`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

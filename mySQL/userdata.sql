-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2020 at 07:30 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userdata`
--

-- --------------------------------------------------------

--
-- Table structure for table `datauser`
--

CREATE TABLE `datauser` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(70) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datauser`
--

INSERT INTO `datauser` (`id`, `username`, `password`, `name`, `status`) VALUES
(1, 'user1', '12345678', 'thanyawit duangsaeng', 'คณะผู้ตรวจ');

-- --------------------------------------------------------

--
-- Table structure for table `durable`
--

CREATE TABLE `durable` (
  `id` int(11) NOT NULL,
  `code_no` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `machine_number` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `responsible` varchar(100) NOT NULL,
  `position` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `durable`
--

INSERT INTO `durable` (`id`, `code_no`, `name`, `brand`, `machine_number`, `status`, `responsible`, `position`) VALUES
(1, '1234', 'โต๊ะ', 'supreme', '1234a', 1, 'บาส', 'ICT003'),
(2, '123456', 'โต๊ะ', 'supreme', '123456789', 1, 'บาส', 'ICT001'),
(3, '123457', 'โต๊ะ', 'supreme', '123456790', 1, 'บาส', 'ICT002'),
(4, '123458', 'โต๊ะ', 'supreme', '123456791', 1, 'บาส', 'ICT003'),
(5, '123459', 'โต๊ะ', 'supreme', '123456792', 1, 'บาส', 'ICT004'),
(6, '123460', 'โต๊ะ', 'supreme', '123456793', 1, 'บาส', 'ICT005'),
(7, '123461', 'โต๊ะ', 'supreme', '123456794', 1, 'thanyawit duangsaeng', 'ICT006');

-- --------------------------------------------------------

--
-- Table structure for table `statusdurable`
--

CREATE TABLE `statusdurable` (
  `status` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statusdurable`
--

INSERT INTO `statusdurable` (`status`, `name`) VALUES
(1, 'ใช้งานได้'),
(2, 'ชำรุด');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datauser`
--
ALTER TABLE `datauser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `durable`
--
ALTER TABLE `durable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `statusdurable`
--
ALTER TABLE `statusdurable`
  ADD PRIMARY KEY (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datauser`
--
ALTER TABLE `datauser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `durable`
--
ALTER TABLE `durable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `statusdurable`
--
ALTER TABLE `statusdurable`
  MODIFY `status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `durable`
--
ALTER TABLE `durable`
  ADD CONSTRAINT `durable_ibfk_1` FOREIGN KEY (`status`) REFERENCES `statusdurable` (`status`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

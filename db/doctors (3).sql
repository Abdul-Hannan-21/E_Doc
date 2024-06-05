-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Jun 05, 2024 at 04:02 PM
-- Server version: 8.4.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctors`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `Diagnosis` text NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `email`, `phone`, `image_name`, `Diagnosis`, `user_id`) VALUES
(9, 'doc1 new edit', 'newtonnewton0003@gmail.com', '2323232', 'uploaded_images/28_radiopaedia.png', 'fever', 1),
(10, 'my new edit', 'abdulhannan.rana2002@gmail.com', '1112332', 'uploaded_images/27_radiopaedia.png', 'chest pain', 2),
(11, 'doc 1 pa', 'newtonnewton0003@gmail.com', '2323232', 'uploaded_images/31_radiopaedia.png', 'cancer', 1),
(12, 'my pa', 'admin@gmail.com', '2323232', '', 'couging', 2),
(14, 'Abdul ', 'newtonnewton0003@gmail.com', '1112332', 'uploaded_images/18_Electronic_medical_record_3___1_.jpg', 'cancer', 3),
(15, 'alex', 'alex@gmail.com', '12123', 'uploaded_images/2_flower_729513.jpg', 'pain', 4),
(16, 'test', 'test@gmail.com', '111', 'uploaded_images/4_alberta_2297204.jpg', 'test', 4),
(17, 'test', 'test@gmail.com', '1234', 'uploaded_images/9_background_gf14a9789d_1920.jpg', 'pain', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` int NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `Username`, `Email`, `Password`) VALUES
(1, 'doc', 'doc@gmail.com', '123'),
(2, 'my', 'my@gmail.com', '321'),
(3, 'newdoc', 'newdoc@gmail.com', '123'),
(4, 'john1', 'john1@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

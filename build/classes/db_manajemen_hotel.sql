-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 30, 2024 at 02:43 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_manajemen_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `check_in`
--

CREATE TABLE `check_in` (
  `id` int NOT NULL,
  `id_reservasi` int NOT NULL,
  `id_pegawai` int NOT NULL,
  `tanggal_checkin` datetime NOT NULL,
  `catatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `check_out`
--

CREATE TABLE `check_out` (
  `id` int NOT NULL,
  `id_checkin` int NOT NULL,
  `id_pegawai` int NOT NULL,
  `tanggal_checkout` datetime NOT NULL,
  `catatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id` int NOT NULL,
  `nomor` int NOT NULL,
  `tipe` int NOT NULL,
  `harga_permalam` double NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','resepsionis') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `username`, `email`, `no_telp`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin', '-', 'admin', 'admin'),
(24, 'resepsionis', 'resepsionis', 'resepsionis@gmail.com', '088219334678', 'resepsionis', 'resepsionis'),
(28, 'admindfsa', 'admin', 'sdfasdf', '12312', 'dfsdafa', 'resepsionis'),
(29, 'sdfsdfsd', 'admin1', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'resepsionis'),
(30, 'dfasfa', 'admin2', 'sdfasd', 'fasdfa', 'dfadf', 'resepsionis');

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id` int NOT NULL,
  `id_kamar` int NOT NULL,
  `id_pegawai` int NOT NULL,
  `id_tamu` int NOT NULL,
  `tanggal_checkin` datetime NOT NULL,
  `tanggal_checkout` datetime NOT NULL,
  `tanggal_reservasi` datetime NOT NULL,
  `status` enum('booking','check-in','check-out') NOT NULL DEFAULT 'booking',
  `total_pembayaran` double NOT NULL,
  `status_pembayaran` enum('dibayar','belum dibayar') NOT NULL DEFAULT 'belum dibayar',
  `jumlah_tamu` int NOT NULL,
  `catatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `no_identitas` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`id`, `nama`, `no_identitas`, `email`, `no_telp`, `alamat`) VALUES
(1, 'dwiki', '09823182930', 'dwiki@gmail.com', '098231223', 'jalan jalan'),
(2, 'dwiki', '123123', 'dwiki@gmail.com', '', ''),
(3, 'dwikilagi', '1231234', 'sdfasdf', '123123123', 'dfsdfasdfsadf');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_kamar`
--

CREATE TABLE `tipe_kamar` (
  `id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tipe_kamar`
--

INSERT INTO `tipe_kamar` (`id`, `nama`, `deskripsi`) VALUES
(1, 'Suite', 'Kamar ini menyediakan berbagai pilihan seperti free spa, makan, minum, dan mandi bunga');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `check_in`
--
ALTER TABLE `check_in`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_reservasi` (`id_reservasi`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `check_out`
--
ALTER TABLE `check_out`
  ADD KEY `id_checkin` (`id_checkin`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipe` (`tipe`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kamar` (`id_kamar`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_tamu` (`id_tamu`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipe_kamar`
--
ALTER TABLE `tipe_kamar`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `check_in`
--
ALTER TABLE `check_in`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tamu`
--
ALTER TABLE `tamu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tipe_kamar`
--
ALTER TABLE `tipe_kamar`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `check_in`
--
ALTER TABLE `check_in`
  ADD CONSTRAINT `check_in_ibfk_1` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id`),
  ADD CONSTRAINT `check_in_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`);

--
-- Constraints for table `check_out`
--
ALTER TABLE `check_out`
  ADD CONSTRAINT `check_out_ibfk_1` FOREIGN KEY (`id_checkin`) REFERENCES `check_in` (`id`),
  ADD CONSTRAINT `check_out_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`);

--
-- Constraints for table `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`tipe`) REFERENCES `tipe_kamar` (`id`);

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`id_tamu`) REFERENCES `tamu` (`id`),
  ADD CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id`),
  ADD CONSTRAINT `reservasi_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

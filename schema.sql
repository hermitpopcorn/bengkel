-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 21, 2016 at 09:39 AM
-- Server version: 5.6.30-0ubuntu0.15.10.1
-- PHP Version: 5.6.11-1ubuntu3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proto_bengkel`
--
CREATE DATABASE IF NOT EXISTS `proto_bengkel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `proto_bengkel`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(10) UNSIGNED NOT NULL,
  `kode` varchar(8) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `merk` varchar(32) DEFAULT NULL,
  `kategori` varchar(32) DEFAULT NULL,
  `harga` decimal(15,2) UNSIGNED NOT NULL,
  `stok` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kode`, `nama`, `merk`, `kategori`, `harga`, `stok`) VALUES
(1, NULL, 'Federal Matic', 'FEDERAL', 'OLI', 24550.00, 10),
(2, NULL, 'Top One MT', 'TOP ONE', 'OLI', 50000.00, 10),
(3, NULL, 'Busi generik', 'GENERIK', 'BUSI', 20000.00, 5);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id_karyawan` int(10) UNSIGNED NOT NULL,
  `aktivitas` varchar(255) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id_karyawan`, `aktivitas`, `waktu`) VALUES
(1, 'login', '2016-06-24 02:14:05'),
(1, 'login', '2016-06-24 02:18:52'),
(1, 'login', '2016-06-24 02:19:41'),
(1, 'login', '2016-06-24 02:20:05'),
(1, 'login', '2016-06-24 02:20:31'),
(1, 'login', '2016-06-24 03:34:06'),
(1, 'login', '2016-06-27 02:59:08'),
(1, 'login', '2016-06-27 03:09:37'),
(1, 'login', '2016-06-27 03:13:04'),
(1, 'login', '2016-06-27 03:13:19'),
(1, 'login', '2016-06-27 03:13:42'),
(1, 'login', '2016-06-27 03:15:21'),
(1, 'login', '2016-06-27 03:15:34'),
(1, 'login', '2016-06-27 03:15:54'),
(1, 'login', '2016-06-27 03:16:36'),
(1, 'login', '2016-06-27 03:47:39'),
(1, 'login', '2016-06-27 03:48:14'),
(1, 'login', '2016-06-27 03:48:49'),
(1, 'login', '2016-06-27 03:53:47'),
(1, 'login', '2016-06-27 03:54:00'),
(1, 'login', '2016-06-27 03:54:33'),
(1, 'login', '2016-06-27 03:55:20'),
(1, 'login', '2016-06-27 03:56:12'),
(1, 'login', '2016-06-27 04:54:51'),
(1, 'login', '2016-07-12 02:41:53'),
(1, 'login', '2016-07-17 16:34:09'),
(1, 'login', '2016-07-17 16:35:42'),
(1, 'login', '2016-07-17 16:41:14'),
(1, 'login', '2016-07-17 16:43:07'),
(1, 'login', '2016-07-17 16:44:41'),
(1, 'login', '2016-07-17 16:53:09'),
(1, 'login', '2016-07-17 16:54:19'),
(1, 'login', '2016-07-18 06:40:49'),
(1, 'login', '2016-07-18 06:44:03'),
(1, 'mengedit data barang dengan ID 1', '2016-07-18 06:44:14'),
(1, 'mengedit data barang dengan ID 1', '2016-07-18 06:44:21'),
(1, 'login', '2016-07-18 06:45:31'),
(1, 'mengedit data barang dengan ID 1', '2016-07-18 06:46:04'),
(1, 'login', '2016-07-18 06:46:46'),
(1, 'login', '2016-07-18 06:48:29'),
(1, 'login', '2016-07-18 06:48:51'),
(1, 'login', '2016-07-18 06:49:28'),
(1, 'login', '2016-07-18 06:56:55'),
(1, 'login', '2016-07-18 06:57:45'),
(1, 'login', '2016-07-18 07:00:31'),
(1, 'login', '2016-07-18 07:00:54'),
(1, 'login', '2016-07-18 07:03:39'),
(1, 'login', '2016-07-18 07:05:18'),
(1, 'login', '2016-07-18 07:05:32'),
(1, 'login', '2016-07-18 07:05:41'),
(1, 'mengedit data barang dengan ID 1', '2016-07-18 07:05:54'),
(1, 'mengedit data barang dengan ID 1', '2016-07-18 07:06:01'),
(1, 'login', '2016-07-18 07:06:42'),
(1, 'login', '2016-07-18 07:19:12'),
(1, 'login', '2016-07-18 07:20:31'),
(1, 'login', '2016-07-18 07:21:24'),
(1, 'login', '2016-07-18 07:22:07'),
(1, 'login', '2016-07-19 03:54:37'),
(1, 'login', '2016-07-19 03:54:50'),
(1, 'login', '2016-07-19 03:55:47'),
(1, 'login', '2016-07-19 03:58:02'),
(1, 'login', '2016-07-19 03:59:54'),
(1, 'login', '2016-07-19 04:02:52'),
(1, 'login', '2016-07-19 04:20:20'),
(1, 'login', '2016-07-19 04:22:16'),
(1, 'login', '2016-07-19 04:27:34'),
(1, 'login', '2016-07-20 02:52:34'),
(1, 'login', '2016-07-20 02:53:34'),
(1, 'login', '2016-07-20 02:53:46'),
(1, 'login', '2016-07-20 02:53:59'),
(1, 'login', '2016-07-20 02:55:20'),
(1, 'login', '2016-07-20 02:56:40'),
(1, 'login', '2016-07-20 02:57:22'),
(1, 'login', '2016-07-20 03:32:09'),
(1, 'login', '2016-07-20 03:32:42'),
(1, 'login', '2016-07-20 03:33:27'),
(1, 'login', '2016-07-20 03:34:04'),
(1, 'login', '2016-07-20 03:34:32'),
(1, 'login', '2016-07-20 03:36:01'),
(1, 'login', '2016-07-20 03:36:19'),
(1, 'login', '2016-07-20 03:36:37'),
(1, 'login', '2016-07-20 03:36:43'),
(1, 'login', '2016-07-20 03:37:38'),
(1, 'login', '2016-07-20 03:39:38'),
(1, 'login', '2016-07-20 03:40:24'),
(1, 'menyimpan data transaksi penjualan (ID: 1)', '2016-07-20 03:40:31'),
(1, 'login', '2016-07-20 03:43:26'),
(1, 'menyimpan data transaksi penjualan (ID: 2)', '2016-07-20 03:44:07'),
(1, 'login', '2016-07-20 03:45:46'),
(1, 'login', '2016-07-20 03:46:49'),
(1, 'login', '2016-07-20 03:48:14'),
(1, 'login', '2016-07-20 03:48:44');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `tanggal` datetime NOT NULL,
  `beli_dari` varchar(64) DEFAULT NULL,
  `karyawan_pencatat` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_barang`
--

CREATE TABLE `pembelian_barang` (
  `id_pembelian` int(10) UNSIGNED NOT NULL,
  `id_barang` int(10) UNSIGNED NOT NULL,
  `jumlah` decimal(15,2) UNSIGNED NOT NULL,
  `harga_satuan` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(10) UNSIGNED NOT NULL,
  `tanggal` datetime NOT NULL,
  `nama_pembeli` varchar(255) DEFAULT NULL,
  `karyawan_pencatat` int(10) UNSIGNED NOT NULL,
  `biaya_service` decimal(15,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `tanggal`, `nama_pembeli`, `karyawan_pencatat`, `biaya_service`) VALUES
(1, '2016-07-20 00:00:00', '', 1, 0.00),
(2, '2016-07-20 10:43:00', 'andre', 1, 45000.00);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_barang`
--

CREATE TABLE `penjualan_barang` (
  `id_penjualan` int(10) UNSIGNED NOT NULL,
  `id_barang` int(10) UNSIGNED NOT NULL,
  `harga_satuan` decimal(15,2) UNSIGNED NOT NULL,
  `jumlah` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_barang`
--

INSERT INTO `penjualan_barang` (`id_penjualan`, `id_barang`, `harga_satuan`, `jumlah`) VALUES
(1, 3, 20000.00, 4),
(1, 1, 24550.00, 2),
(2, 3, 20000.00, 3),
(2, 1, 24550.00, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` char(64) NOT NULL,
  `level` enum('admin','karyawan') NOT NULL DEFAULT 'karyawan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`) VALUES
(1, 'admin', '9d844f666ad44d6e76e8627d37af4cea8823b9d0796ceffee537fa569649f925', 'admin'),
(2, 'karyawan', 'e8504a445a84e48e49cb97abfc448a57789d461381a8903f6a3653b7831ddc0f', 'karyawan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tanggal` (`tanggal`);

--
-- Indexes for table `pembelian_barang`
--
ALTER TABLE `pembelian_barang`
  ADD KEY `id_pembelian` (`id_pembelian`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tanggal` (`tanggal`);

--
-- Indexes for table `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  ADD KEY `id_penjualan` (`id_penjualan`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian_barang`
--
ALTER TABLE `pembelian_barang`
  ADD CONSTRAINT `pembelian_barang_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id`),
  ADD CONSTRAINT `pembelian_barang_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`);

--
-- Constraints for table `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  ADD CONSTRAINT `penjualan_barang_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id`),
  ADD CONSTRAINT `penjualan_barang_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2022 at 01:54 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `putri_domas`
--

-- --------------------------------------------------------

--
-- Table structure for table `member_token`
--

CREATE TABLE `member_token` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `auth_key` varchar(255) CHARACTER SET utf16 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_booking`
--

CREATE TABLE `tb_booking` (
  `id` int(11) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `no_hp` int(12) NOT NULL,
  `ktp` int(20) NOT NULL,
  `tgl_booking` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_booking`
--

INSERT INTO `tb_booking` (`id`, `nama`, `alamat`, `no_hp`, `ktp`, `tgl_booking`, `batas_bayar`) VALUES
(2, 'FATIKHAH NURJAMIL', 'wareng,butuh,purworejo', 8976589, 123456789, '2022-06-06 00:20:22', '2022-06-06 00:00:00'),
(3, 'FATIKHAH ', 'wareng,butuh,purworejo', 8976589, 123456789, '2022-06-06 18:28:40', '2022-06-21 18:28:40'),
(15, '', '', 0, 0, '2022-06-28 00:00:00', '2022-07-13 23:52:17');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kost`
--

CREATE TABLE `tb_kost` (
  `id_kost` int(11) NOT NULL,
  `nama_kost` varchar(120) CHARACTER SET latin1 NOT NULL,
  `keterangan` varchar(200) CHARACTER SET latin1 NOT NULL,
  `type_kost` varchar(40) CHARACTER SET latin1 NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kost`
--

INSERT INTO `tb_kost` (`id_kost`, `nama_kost`, `keterangan`, `type_kost`, `harga`, `stok`, `gambar`) VALUES
(1, 'lavender', 'laveneder non AC', 'typesatu', 500000, 15, 'type1.jpg'),
(2, 'Aster', 'Aster AC', 'typedua', 1000000, 8, 'type2.jpg'),
(3, 'Mawar', 'Mawar Non AC + Properti', 'typetiga', 700000, 12, 'type3.jpg'),
(4, 'Anggrek', 'Anggrek AC + Properti', 'typeempat', 1500000, 15, 'type4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_sewa`
--

CREATE TABLE `tb_sewa` (
  `id` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `nama_kost` varchar(60) NOT NULL,
  `harga` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_sewa`
--

INSERT INTO `tb_sewa` (`id`, `id_booking`, `nama_kost`, `harga`) VALUES
(1, 7, 'Aster', 1000000),
(2, 8, 'lavender', 500000),
(3, 15, 'lavender', 500000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(3, 'fatikhah nurjamil', 'fatikhahnurjamil21@gmail.com', 'fotokuu.jpg', '$2y$10$UQwJUNVjVTJbn8w2M756..JDC9UtwDKnOSdZG/pISRn/7bMd9iRWW', 1, 1, 1654708770);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `member_token`
--
ALTER TABLE `member_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_booking`
--
ALTER TABLE `tb_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kost`
--
ALTER TABLE `tb_kost`
  ADD PRIMARY KEY (`id_kost`);

--
-- Indexes for table `tb_sewa`
--
ALTER TABLE `tb_sewa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member_token`
--
ALTER TABLE `member_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_booking`
--
ALTER TABLE `tb_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_kost`
--
ALTER TABLE `tb_kost`
  MODIFY `id_kost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_sewa`
--
ALTER TABLE `tb_sewa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

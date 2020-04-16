-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Apr 2020 pada 03.47
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rent_motor`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `kode_jenis` varchar(20) NOT NULL,
  `nama_jenis` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` varchar(20) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `tgl_lahir` varchar(20) DEFAULT NULL,
  `alamat` varchar(20) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `motor`
--

CREATE TABLE `motor` (
  `kode_motor` varchar(20) NOT NULL,
  `merk_motor` varchar(20) DEFAULT NULL,
  `tahun_rilis` varchar(20) DEFAULT NULL,
  `harga` varchar(20) DEFAULT NULL,
  `stok` varchar(20) DEFAULT NULL,
  `kode_jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjam`
--

CREATE TABLE `peminjam` (
  `no_peminjam` varchar(20) NOT NULL,
  `id_member` varchar(20) NOT NULL,
  `kode_jenis` varchar(20) NOT NULL,
  `kode_motor` varchar(20) NOT NULL,
  `tgl_pinjam` varchar(20) NOT NULL,
  `harga` varchar(20) NOT NULL,
  `jumlah` varchar(20) NOT NULL,
  `total` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `kode_kembali` varchar(20) NOT NULL,
  `tgl_pinjam` varchar(20) DEFAULT NULL,
  `tgl_kembali` varchar(20) DEFAULT NULL,
  `denda` varchar(20) DEFAULT NULL,
  `lama_pinjam` varchar(20) NOT NULL,
  `total` varchar(20) NOT NULL,
  `kode_motor` varchar(20) DEFAULT NULL,
  `id_member` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`kode_jenis`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `motor`
--
ALTER TABLE `motor`
  ADD PRIMARY KEY (`kode_motor`),
  ADD KEY `kode_jenis` (`kode_jenis`);

--
-- Indeks untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`no_peminjam`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `kode_jenis` (`kode_jenis`),
  ADD KEY `kode_motor` (`kode_motor`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`kode_kembali`),
  ADD KEY `kode_motor` (`kode_motor`),
  ADD KEY `id_member` (`id_member`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `motor`
--
ALTER TABLE `motor`
  ADD CONSTRAINT `motor_ibfk_1` FOREIGN KEY (`kode_jenis`) REFERENCES `jenis` (`kode_jenis`);

--
-- Ketidakleluasaan untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  ADD CONSTRAINT `peminjam_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`),
  ADD CONSTRAINT `peminjam_ibfk_2` FOREIGN KEY (`kode_jenis`) REFERENCES `jenis` (`kode_jenis`),
  ADD CONSTRAINT `peminjam_ibfk_3` FOREIGN KEY (`kode_motor`) REFERENCES `motor` (`kode_motor`);

--
-- Ketidakleluasaan untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`),
  ADD CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`kode_motor`) REFERENCES `motor` (`kode_motor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

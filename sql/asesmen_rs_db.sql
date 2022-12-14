-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2022 at 03:12 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asesmen_rs_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `a_indikator`
--

CREATE TABLE `a_indikator` (
  `id` int(5) NOT NULL,
  `a_jpenilaian_id` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `type` varchar(128) NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `a_jabatan`
--

CREATE TABLE `a_jabatan` (
  `id` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_jabatan`
--

INSERT INTO `a_jabatan` (`id`, `nama`, `deskripsi`, `cdate`, `is_active`, `is_deleted`) VALUES
(1, 'Account Officer edit', 'ao', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `a_jpenilaian`
--

CREATE TABLE `a_jpenilaian` (
  `id` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `a_modules`
--

CREATE TABLE `a_modules` (
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT '',
  `level` int(1) NOT NULL DEFAULT 0 COMMENT 'depth level of menu, 0 mean outer 3 deeper submenu',
  `has_submenu` int(1) NOT NULL DEFAULT 0 COMMENT '1 mempunyai submenu, 2 tidak mempunyai submenu',
  `children_identifier` varchar(255) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_default` enum('allowed','denied') NOT NULL DEFAULT 'denied',
  `is_visible` int(1) NOT NULL DEFAULT 1,
  `priority` int(3) NOT NULL DEFAULT 0 COMMENT '0 mean higher 999 lower',
  `fa_icon` varchar(255) NOT NULL DEFAULT 'fa fa-home' COMMENT 'font-awesome icon on menu',
  `utype` varchar(48) NOT NULL DEFAULT 'internal' COMMENT 'type module : internal, external'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='list modul yang ada dimenu atau tidak ada dimenu';

--
-- Dumping data for table `a_modules`
--

INSERT INTO `a_modules` (`identifier`, `name`, `path`, `level`, `has_submenu`, `children_identifier`, `is_active`, `is_default`, `is_visible`, `priority`, `fa_icon`, `utype`) VALUES
('admin_akun_user', 'Kustomer', 'admin/akun/user', 1, 0, 'akun', 1, 'denied', 1, 90, 'fa fa-users', 'internal'),
('admin_api_doc', 'Dokumentasi', 'admin/api/doc', 1, 0, 'api', 1, 'denied', 1, 1, 'fa fa-book', 'internal'),
('akun', 'Akun', '#', 0, 1, NULL, 1, 'denied', 1, 20, 'fa fa-users', 'internal'),
('akun_pengguna', 'Administrator', 'akun/pengguna', 1, 0, 'akun', 1, 'denied', 1, 90, 'fa fa-users', 'internal'),
('akun_user', 'Kustomer', 'akun/user', 1, 0, 'akun', 1, 'denied', 1, 90, 'fa fa-users', 'internal'),
('api', 'API', '#', 0, 1, NULL, 1, 'denied', 1, 80, 'fa fa-cog', 'internal'),
('api_doc', 'Dokumentasi', 'api/doc', 1, 0, 'api', 1, 'denied', 1, 1, 'fa fa-book', 'internal'),
('dashboard', 'Dashboard', '#', 0, 1, NULL, 1, 'denied', 1, 0, 'fa fa-home', 'internal'),
('laporan', 'Laporan', '#', 0, 1, NULL, 1, 'denied', 1, 90, 'fa fa-book', 'internal'),
('laporan_order', 'Order', 'laporan/order', 1, 0, 'laporan', 1, 'denied', 1, 1, 'fa fa-cogs', 'internal'),
('laporan_pengiriman', 'Pengiriman', 'laporan/pengiriman', 1, 0, 'laporan', 1, 'denied', 1, 1, 'fa fa-cogs', 'internal'),
('order', 'Kirim Paket', 'order', 0, 1, NULL, 1, 'denied', 1, 20, 'fa fa-exchange', 'internal'),
('partner', 'Partner', '#', 0, 1, NULL, 1, 'denied', 1, 20, 'fa fa-handshake-o', 'internal'),
('partner_reseller', 'Reseller', 'admin/partner/reseller', 1, 0, 'partner', 1, 'denied', 1, 90, 'fa fa-users', 'internal'),
('pengaturan', 'Pengaturan', 'pengaturan', 0, 1, NULL, 1, 'denied', 1, 90, 'fa fa-cogs', 'internal'),
('pengaturan_alamat', 'Alamat', 'pengaturan/alamat', 1, 0, 'pengaturan', 1, 'denied', 1, 5, 'fa fa-home', 'internal'),
('pengaturan_env', 'Environment', 'pengaturan/env', 1, 0, 'pengaturan', 1, 'denied', 1, 1, 'fa fa-cogs', 'internal'),
('pengaturan_perusahaan', 'Perusahaan', 'pengaturan/perusahaan', 1, 0, 'pengaturan', 1, 'denied', 1, 1, 'fa fa-users', 'internal'),
('pengaturan_user', 'User', 'pengaturan/user', 1, 0, 'pengaturan', 1, 'denied', 1, 1, 'fa fa-users', 'internal'),
('tracking', 'Tracking', 'tracking', 0, 1, NULL, 1, 'denied', 1, 20, 'fa fa-truck', 'internal');

-- --------------------------------------------------------

--
-- Table structure for table `a_pengguna`
--

CREATE TABLE `a_pengguna` (
  `id` int(6) UNSIGNED NOT NULL,
  `a_company_id` int(3) UNSIGNED DEFAULT NULL COMMENT 'penempatan',
  `a_company_nama` varchar(78) NOT NULL DEFAULT '-',
  `a_company_kode` varchar(32) NOT NULL DEFAULT '-',
  `a_jabatan_id` int(3) UNSIGNED DEFAULT NULL,
  `a_jabatan_nama` varchar(255) NOT NULL DEFAULT 'Staff',
  `username` varchar(24) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `welcome_message` varchar(255) NOT NULL,
  `scope` enum('all','current_below','current_only','none') NOT NULL DEFAULT 'none',
  `nip` varchar(32) DEFAULT '-',
  `alamat` varchar(150) NOT NULL DEFAULT '',
  `alamat2` varchar(150) NOT NULL DEFAULT '',
  `alamat_kecamatan` varchar(150) NOT NULL DEFAULT '',
  `alamat_kabkota` varchar(150) NOT NULL DEFAULT '',
  `alamat_provinsi` varchar(150) NOT NULL DEFAULT '',
  `alamat_negara` varchar(150) NOT NULL DEFAULT '',
  `alamat_kodepos` varchar(12) NOT NULL DEFAULT ' ',
  `tempat_lahir` varchar(150) NOT NULL DEFAULT '',
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` int(1) UNSIGNED NOT NULL DEFAULT 1,
  `status_pernikahan` enum('belum menikah','menikah','duda','janda') NOT NULL DEFAULT 'belum menikah',
  `telp_rumah` varchar(25) DEFAULT NULL,
  `telp_hp` varchar(25) DEFAULT NULL,
  `bank_rekening_nomor` varchar(78) NOT NULL DEFAULT '',
  `bank_rekening_nama` varchar(150) NOT NULL DEFAULT '',
  `bank_nama` varchar(150) NOT NULL DEFAULT '',
  `npwp` varchar(128) NOT NULL DEFAULT '',
  `kerja_terakhir` varchar(150) NOT NULL DEFAULT '',
  `kerja_terakhir_jabatan` varchar(78) NOT NULL DEFAULT '',
  `kerja_terakhir_gaji` decimal(18,0) DEFAULT NULL,
  `pendidikan_terakhir` varchar(150) NOT NULL DEFAULT '',
  `pendidikan_terakhir_jenjang` enum('SD','SMP','SMA','S1','D3','D2','S2') NOT NULL DEFAULT 'SMA',
  `pendidikan_terakhir_tahun` year(4) NOT NULL DEFAULT 1971,
  `ibu_nama` varchar(150) NOT NULL DEFAULT '',
  `ibu_pekerjaan` varchar(78) NOT NULL DEFAULT '',
  `tgl_kerja_mulai` date DEFAULT NULL,
  `tgl_kerja_akhir` date DEFAULT NULL,
  `tgl_kontrak_akhir` date DEFAULT NULL,
  `karyawan_status` enum('Kontrak','Magang','Tetap','Harian Lepas') NOT NULL,
  `nama_perusahaan` varchar(128) NOT NULL DEFAULT '',
  `is_karyawan` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` int(1) UNSIGNED NOT NULL DEFAULT 1,
  `a_pengguna_id` int(6) UNSIGNED DEFAULT NULL COMMENT 'atasan langsung',
  `is_admin_master` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabel pengguna';

--
-- Dumping data for table `a_pengguna`
--

INSERT INTO `a_pengguna` (`id`, `a_company_id`, `a_company_nama`, `a_company_kode`, `a_jabatan_id`, `a_jabatan_nama`, `username`, `password`, `email`, `nama`, `foto`, `welcome_message`, `scope`, `nip`, `alamat`, `alamat2`, `alamat_kecamatan`, `alamat_kabkota`, `alamat_provinsi`, `alamat_negara`, `alamat_kodepos`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `status_pernikahan`, `telp_rumah`, `telp_hp`, `bank_rekening_nomor`, `bank_rekening_nama`, `bank_nama`, `npwp`, `kerja_terakhir`, `kerja_terakhir_jabatan`, `kerja_terakhir_gaji`, `pendidikan_terakhir`, `pendidikan_terakhir_jenjang`, `pendidikan_terakhir_tahun`, `ibu_nama`, `ibu_pekerjaan`, `tgl_kerja_mulai`, `tgl_kerja_akhir`, `tgl_kontrak_akhir`, `karyawan_status`, `nama_perusahaan`, `is_karyawan`, `is_active`, `a_pengguna_id`, `is_admin_master`) VALUES
(1, NULL, '-', '-', NULL, 'Staff', 'mimind', '$2y$10$FudYvQFvkQGm3mMt8fLN2uY.eaW6cLxKJfTnUFTMxfg9srDgki9.a', 'daeng@thecloudalert.com', 'Administrator', 'media/pengguna/2021/05/c4ca4238a0b923820dcc509a6f75849b3151.jpg', 'Selamat Beraktifitas', 'all', '-', '', '', '', '', '', '', '', '', NULL, 1, 'belum menikah', '', '', '', '', '', '', '', '', '0', '', 'SMA', 1971, '', '', '0000-00-00', '0000-00-00', NULL, 'Kontrak', '', 0, 1, NULL, 1),
(402, NULL, '-', '-', NULL, 'Staff', '', '$2y$10$P1X2OqhipTMdeGCs8cWqAOck6cw0Kye1zj5W/OeCuQXy5Zs2IS2gO', 'rezziqbal@gmail.com', 'Rezza Muhammad Iqbal', '', '', 'none', '-', 'Jl. Kutawaringin No 9 Rt 1 Rw 7 Desa/Kec. Kutawaringin Kabupaten Bandung', '', '', '', '', '', ' ', '', NULL, 1, 'belum menikah', NULL, '085789701750', '', '', '', '', '', '', NULL, '', 'SMA', 1971, '', '', NULL, NULL, NULL, 'Kontrak', 'Sukahiji', 0, 1, NULL, 0),
(403, NULL, '-', '-', NULL, 'Sales', 'sehadi', '$2y$10$6yakajGNZmqK/VZe9goNkut//aU4/.EWFwx3fKXJFtRv6c3vce3Le', 'sehadi@gmail.com', 'SEHADI', 'media/pengguna/2021/05/c4ca4238a0b923820dcc509a6f75849b3151.jpg', 'Selamat Beraktifitas', 'all', '-', '', '', '', '', '', '', '', '', NULL, 1, 'belum menikah', '', '', '', '', '', '', '', '', '0', '', 'SMA', 1971, '', '', '0000-00-00', '0000-00-00', NULL, 'Kontrak', '', 0, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `a_pengguna_module`
--

CREATE TABLE `a_pengguna_module` (
  `id` int(8) UNSIGNED NOT NULL,
  `a_pengguna_id` int(6) UNSIGNED DEFAULT NULL,
  `a_modules_identifier` varchar(255) DEFAULT NULL,
  `rule` enum('allowed','disallowed','allowed_except','disallowed_except') NOT NULL DEFAULT 'allowed',
  `tmp_active` enum('N','Y') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='hak akses pengguna';

--
-- Dumping data for table `a_pengguna_module`
--

INSERT INTO `a_pengguna_module` (`id`, `a_pengguna_id`, `a_modules_identifier`, `rule`, `tmp_active`) VALUES
(1, 1, NULL, 'allowed_except', 'N'),
(3189, 403, 'akun', 'allowed', 'N'),
(3190, 403, 'admin_akun_user', 'allowed', 'N'),
(3191, 403, 'partner', 'allowed', 'N'),
(3192, 403, 'partner_reseller', 'allowed', 'N'),
(3193, 403, 'api', 'allowed', 'N'),
(3194, 403, 'admin_api_doc', 'allowed', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `a_rs`
--

CREATE TABLE `a_rs` (
  `id` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 0,
  `is_deleted` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `a_ruangan`
--

CREATE TABLE `a_ruangan` (
  `id` int(5) NOT NULL,
  `a_rs_id` int(5) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `kd_ruangan` varchar(20) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_ruangan`
--

INSERT INTO `a_ruangan` (`id`, `a_rs_id`, `nama`, `kd_ruangan`, `deskripsi`, `gambar`, `cdate`, `is_active`, `is_deleted`) VALUES
(6, 0, 'sakinah mawaddah warahmah', 'SK-0123', 'ruangan ini', '', '0000-00-00 00:00:00', 1, 0),
(7, 0, 'Pasien - 03', 'RP-03123', 'ruang pasien ini', '', '0000-00-00 00:00:00', 1, 0),
(10, 0, 'Bedah - 01', 'RB-0133', 'ruang bedah ini', '', '0000-00-00 00:00:00', 1, 0),
(11, 0, 'Bedah - 02', 'RB-02', 'ruang\r\n', '', '0000-00-00 00:00:00', 1, 0),
(12, 0, 'Rontgen', 'RR-IPO234', 'ruang x-ray', '', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `a_unit`
--

CREATE TABLE `a_unit` (
  `id` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_unit`
--

INSERT INTO `a_unit` (`id`, `nama`, `deskripsi`, `cdate`, `is_active`, `is_deleted`) VALUES
(1, 'Kursi Roda edit', 'kursi roda', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `b_user`
--

CREATE TABLE `b_user` (
  `id` int(11) NOT NULL,
  `b_user_id` int(11) DEFAULT NULL COMMENT 'atasan',
  `a_unit_id` int(5) DEFAULT NULL,
  `a_jabatan_id` int(5) UNSIGNED DEFAULT NULL,
  `google_id` varchar(128) NOT NULL DEFAULT '',
  `kode` varchar(24) DEFAULT NULL,
  `kode_lama` varchar(64) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(128) NOT NULL DEFAULT '',
  `foto` varchar(255) NOT NULL DEFAULT '',
  `welcome_message` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `fnama` varchar(255) NOT NULL DEFAULT '',
  `lnama` varchar(78) NOT NULL DEFAULT ' ',
  `alamat` varchar(78) NOT NULL DEFAULT '',
  `alamat2` varchar(78) DEFAULT NULL,
  `kelurahan` varchar(78) NOT NULL DEFAULT '',
  `kecamatan` varchar(78) NOT NULL DEFAULT '',
  `kabkota` varchar(150) NOT NULL DEFAULT '',
  `provinsi` varchar(150) NOT NULL DEFAULT '',
  `negara` varchar(255) NOT NULL DEFAULT 'Indonesia',
  `kodepos` varchar(25) NOT NULL DEFAULT '',
  `kelamin` int(1) NOT NULL DEFAULT 1 COMMENT '1 laki-laki 0 perempuan',
  `tlahir` varchar(78) NOT NULL DEFAULT '-' COMMENT 'tempat lahir',
  `bdate` date NOT NULL DEFAULT '1970-01-01' COMMENT 'tanggal lahir',
  `cdate` datetime NOT NULL COMMENT 'tanggal pembuatan',
  `adate` date DEFAULT NULL COMMENT 'tanggal aktifasi',
  `edate` date DEFAULT NULL COMMENT 'tanggal berakhir membership',
  `telp` varchar(25) NOT NULL DEFAULT '',
  `fb` varchar(255) NOT NULL DEFAULT '',
  `fb_id` int(11) DEFAULT NULL,
  `ig` varchar(255) NOT NULL DEFAULT '',
  `ig_id` int(11) DEFAULT NULL,
  `deposit` float NOT NULL DEFAULT 0 COMMENT 'saldo_deposit',
  `reward_poin` int(7) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL DEFAULT ' ',
  `reg_from` varchar(64) NOT NULL DEFAULT 'online',
  `know_from` varchar(48) DEFAULT NULL,
  `umur` int(3) NOT NULL DEFAULT 20,
  `npwp` varchar(128) NOT NULL DEFAULT '',
  `api_reg_date` date DEFAULT NULL,
  `api_reg_token` varchar(48) DEFAULT NULL,
  `api_web_date` date DEFAULT NULL,
  `api_web_token` varchar(24) DEFAULT NULL,
  `api_mobile_date` date DEFAULT NULL,
  `api_mobile_token` varchar(24) DEFAULT NULL,
  `fcm_token` varchar(255) NOT NULL DEFAULT ' ',
  `device` varchar(24) NOT NULL DEFAULT 'web',
  `apikey` varchar(28) NOT NULL DEFAULT '',
  `is_agree` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_confirmed` int(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1 ya, 0 belum konfirmasi, flag setelah konfirmasi',
  `is_premium` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_wa_verified` int(1) NOT NULL DEFAULT 1,
  `is_wa_send` int(1) NOT NULL DEFAULT 1,
  `is_active` int(1) UNSIGNED NOT NULL DEFAULT 1,
  `is_deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabel pengguna, bisa member atau user vendor,';

--
-- Dumping data for table `b_user`
--

INSERT INTO `b_user` (`id`, `b_user_id`, `a_unit_id`, `a_jabatan_id`, `google_id`, `kode`, `kode_lama`, `email`, `username`, `foto`, `welcome_message`, `password`, `fnama`, `lnama`, `alamat`, `alamat2`, `kelurahan`, `kecamatan`, `kabkota`, `provinsi`, `negara`, `kodepos`, `kelamin`, `tlahir`, `bdate`, `cdate`, `adate`, `edate`, `telp`, `fb`, `fb_id`, `ig`, `ig_id`, `deposit`, `reward_poin`, `image`, `reg_from`, `know_from`, `umur`, `npwp`, `api_reg_date`, `api_reg_token`, `api_web_date`, `api_web_token`, `api_mobile_date`, `api_mobile_token`, `fcm_token`, `device`, `apikey`, `is_agree`, `is_confirmed`, `is_premium`, `is_wa_verified`, `is_wa_send`, `is_active`, `is_deleted`) VALUES
(30, 402, NULL, NULL, '', NULL, NULL, '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', 'Rezza Muhammad Iqbal', ' ', 'Jl. Kutawaringin No 9 RT 01 RW 07 Desa/Kec. Kutawaringin Kab. Bandung', NULL, '', '', '', '', 'Indonesia', '', 1, '-', '1970-01-01', '0000-00-00 00:00:00', NULL, NULL, '085789701750', '', NULL, '', NULL, 0, 0, ' ', 'online', NULL, 20, '', NULL, NULL, NULL, NULL, NULL, NULL, ' ', 'web', '', 0, 0, 0, 1, 1, 1, 0),
(32, 31, NULL, NULL, '', NULL, NULL, 'rezziqbal@gmail.com', '', '', '', '$2y$10$KgrGRhnkHRMX94k0pnXlsOiQSpIy7SstZSDoH/9dIO.3rZZ0obqnO', 'Rezza Muhammad Iqbal', ' ', 'Jl. Kutawaringin Desa KUtawaringin', NULL, '', 'Kutawaringin', 'Kabupaten Bandung', 'Jawa Barat', 'Indonesia', '40911', 1, '-', '1970-01-01', '0000-00-00 00:00:00', NULL, NULL, '08578970175', '', NULL, '', NULL, 0, 0, ' ', 'online', NULL, 20, '', NULL, NULL, NULL, NULL, NULL, NULL, ' ', 'web', '', 0, 0, 0, 1, 1, 1, 0),
(37, NULL, NULL, NULL, '', NULL, NULL, 'drosanda@outlook.co.id', 'drosanda', '', '', '$2y$10$YxehvrbD0KguQs12jwFZ4e6CaKpEjlsmOloIISadcO9oeXGHoghDW', 'Daeng Rosanda', ' ', '', '', '', '', '', '', 'Indonesia', '', 1, '-', '1970-01-01', '2021-06-16 16:52:42', NULL, NULL, '6341 5041', '', NULL, '', NULL, 0, 0, ' ', 'online', NULL, 20, '', NULL, NULL, NULL, NULL, NULL, NULL, ' ', 'web', '4DDB33DCBC', 0, 0, 0, 1, 1, 1, 0),
(39, NULL, NULL, NULL, '', NULL, NULL, 'daeng@cenah.co.id', 'daeng@cenah.co.id', '', '', 'e10adc3949ba59abbe56e057f20f883e', 'Daeng Rosanda', ' ', '', '', '', '', '', '', 'Indonesia', '', 1, '-', '1970-01-01', '2021-06-16 17:51:05', NULL, NULL, '6341 5041', '', NULL, '', NULL, 0, 0, ' ', 'online', NULL, 20, '', NULL, NULL, NULL, NULL, NULL, NULL, ' ', 'web', '', 0, 0, 0, 1, 1, 1, 0),
(43, NULL, NULL, NULL, '', NULL, NULL, 'vanny@cenah.co.id', 'vanny@cenah.co.id', '', '', 'e10adc3949ba59abbe56e057f20f883e', 'Vanny Fandhiny', ' ', '', '', '', '', '', '', 'Indonesia', '', 1, '-', '1970-01-01', '2021-06-16 18:01:26', NULL, NULL, '081320012157', '', NULL, '', NULL, 0, 0, ' ', 'online', NULL, 20, '', NULL, NULL, NULL, NULL, NULL, NULL, ' ', 'web', '', 0, 0, 0, 1, 1, 1, 0),
(68, 37, 0, 0, 'google_id', 'kode', 'kode_lama', 'rizki@gmail.com', 'rizki', 'foto', 'welcome_message', '$2y$10$7rS4va1jjO/Xzph2xKjODe1i3wZIHenBvEtvn00aSCOGK7RhbU22u', 'Rizki', 'lnama', 'Jl. Tol', 'alamat2', 'SOREANG', 'SOREANG', 'BANDUNG', 'JAWA BARAT', 'INDONESIA', '40911', 0, 'tlahir', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '0000-00-00', '0918380144', 'fb', 0, 'ig', 0, 0, 0, 'image', 'online', NULL, 0, 'npwp', '0000-00-00', 'api_reg_token', '0000-00-00', 'api_web_token', '0000-00-00', 'api_mobile_token', 'fcm_token', 'device', 'BQ5XBQ3CCQ', 0, 0, 0, 1, 1, 1, 0),
(69, 0, 0, 0, '', '', '', 'rezziqbal@gmail.com', '', '', '', '', 'Rizki', '', 'Jl. kutawaringin', '', 'PALASARI', 'CIBIRU', 'BANDUNG', 'JAWA BARAT', 'INDONESIA', '40615', 0, '', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00', '0000-00-00', '085789701750', '', 0, '', 0, 0, 0, '', 'online', NULL, 0, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', '', '', '2X4332XC22', 0, 0, 0, 1, 1, 1, 0),
(70, NULL, NULL, NULL, '', NULL, NULL, '', '', '', '', NULL, 'MS CHANDRA', ' ', '', NULL, '', '', '', '', 'Indonesia', '', 1, '-', '1970-01-01', '0000-00-00 00:00:00', NULL, NULL, '085721xxxx', '', NULL, '', NULL, 0, 0, ' ', 'online', NULL, 20, '', NULL, NULL, NULL, NULL, NULL, NULL, ' ', 'web', '', 0, 0, 0, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `c_asesmen`
--

CREATE TABLE `c_asesmen` (
  `id` int(5) NOT NULL,
  `a_jpenilaian_id` int(5) NOT NULL,
  `b_user_id` int(5) NOT NULL,
  `value` text NOT NULL,
  `nilai` text NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a_indikator`
--
ALTER TABLE `a_indikator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_jabatan`
--
ALTER TABLE `a_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_jpenilaian`
--
ALTER TABLE `a_jpenilaian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_modules`
--
ALTER TABLE `a_modules`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `children_identifier` (`children_identifier`);

--
-- Indexes for table `a_pengguna`
--
ALTER TABLE `a_pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `a_pengguna_username_unq` (`username`),
  ADD KEY `a_company_id` (`a_company_id`),
  ADD KEY `a_jabatan_id` (`a_jabatan_id`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `a_pengguna_module`
--
ALTER TABLE `a_pengguna_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fka_modules_identifier` (`a_modules_identifier`);

--
-- Indexes for table `a_rs`
--
ALTER TABLE `a_rs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_ruangan`
--
ALTER TABLE `a_ruangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`a_rs_id`) USING BTREE;

--
-- Indexes for table `a_unit`
--
ALTER TABLE `a_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b_user`
--
ALTER TABLE `b_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_api_web_token` (`api_web_token`),
  ADD KEY `kode` (`kode`),
  ADD KEY `a_company_id` (`a_unit_id`),
  ADD KEY `a_departemen_id` (`a_jabatan_id`),
  ADD KEY `a_pengguna_id` (`b_user_id`),
  ADD KEY `idx_is_active` (`google_id`),
  ADD KEY `idx_is_confirmed` (`kode_lama`);

--
-- Indexes for table `c_asesmen`
--
ALTER TABLE `c_asesmen`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a_indikator`
--
ALTER TABLE `a_indikator`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_jabatan`
--
ALTER TABLE `a_jabatan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `a_jpenilaian`
--
ALTER TABLE `a_jpenilaian`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_pengguna`
--
ALTER TABLE `a_pengguna`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `a_pengguna_module`
--
ALTER TABLE `a_pengguna_module`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3195;

--
-- AUTO_INCREMENT for table `a_rs`
--
ALTER TABLE `a_rs`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_ruangan`
--
ALTER TABLE `a_ruangan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `a_unit`
--
ALTER TABLE `a_unit`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `b_user`
--
ALTER TABLE `b_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `c_asesmen`
--
ALTER TABLE `c_asesmen`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `a_modules`
--
ALTER TABLE `a_modules`
  ADD CONSTRAINT `a_modules_ibfk_1` FOREIGN KEY (`children_identifier`) REFERENCES `a_modules` (`identifier`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `a_pengguna_module`
--
ALTER TABLE `a_pengguna_module`
  ADD CONSTRAINT `a_pengguna_module_ibfk_2` FOREIGN KEY (`a_modules_identifier`) REFERENCES `a_modules` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2023 at 06:16 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppisu_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `a_company`
--

CREATE TABLE `a_company` (
  `id` int(4) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `utype` enum('pusat','wilayah','cabang') NOT NULL DEFAULT 'cabang',
  `kode` varchar(24) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kabkota` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `kodepos` varchar(12) NOT NULL,
  `telp` varchar(24) NOT NULL,
  `website` varchar(255) NOT NULL,
  `jenis_apotek` enum('Instalasi Farmasi','Apotek') NOT NULL DEFAULT 'Instalasi Farmasi',
  `header_teks` varchar(255) NOT NULL DEFAULT 'CALYSTA SKINCARE',
  `header_img` varchar(255) NOT NULL,
  `footer_teks` varchar(255) NOT NULL COMMENT 'footer struk',
  `buffer_stok` decimal(10,5) NOT NULL DEFAULT 1.50000 COMMENT 'buffer stok untuk po',
  `pajak_persentase` decimal(4,2) NOT NULL DEFAULT 0.00 COMMENT 'pajak persen',
  `pajak_status` int(1) NOT NULL DEFAULT 0 COMMENT 'pajak on =1 / off=0',
  `latitude` decimal(14,11) NOT NULL DEFAULT -6.91474400000,
  `longitude` decimal(14,11) NOT NULL DEFAULT 107.60981000000,
  `limit_penerimaan` int(11) NOT NULL DEFAULT 5 COMMENT 'PO Penerimaan limit hari',
  `is_terima_retur` int(1) NOT NULL DEFAULT 0,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `a_company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabel untuk pusat dan cabang';

-- --------------------------------------------------------

--
-- Table structure for table `a_config`
--

CREATE TABLE `a_config` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL COMMENT 'nama pengaturan',
  `pilihan` varchar(255) NOT NULL,
  `nilai_default` varchar(255) NOT NULL,
  `nilai` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='untuk menyimpan konfigurasi';

--
-- Dumping data for table `a_config`
--

INSERT INTO `a_config` (`id`, `nama`, `pilihan`, `nilai_default`, `nilai`) VALUES
(1, 'homepage_youtube_id', '', 'HW2WAqcJFiU', ''),
(2, 'homepage_sosmed_fb', '', 'shafiramuslimfashion', 'shafiramuslimfashion'),
(3, 'homepage_sosmed_ig', '', 'shafiramuslimfashion', 'shafiramuslimfashion'),
(4, 'homepage_sosmed_youtube', '', 'channel/UC1RvA9jHwDphXEEctTG4rOw', 'channel/UCkrLFCBthN8kp88v1p3DcVQ'),
(5, 'instagram_clid', '', '', '78e3d24a2d494256ad0dc0a454d0de9f'),
(6, 'instagram_clst', '', '', ' baeb17d0c3534cb19c55b7f1029b8518'),
(7, 'instagram_rdrc', '', '', 'https://shafira.thecloudalert.com/instagram/'),
(8, 'support_email', '', '', 'thecloudalertcom@gmail.com'),
(9, 'homepage_mtitle', '', '', 'Website Resmi Syubbaanul \'uluum'),
(10, 'homepage_mkeyword', '', '', 'Syubbaanululuum'),
(11, 'homepage_mdescription', '', '', 'Syubbaanululuum merupakan situs web yang dikelola oleh Majelis Ta\'lim Syubbaanululuum Kabupaten Bandung, Jawa Barat.'),
(12, 'homepage_slider_enable', '', '', '1'),
(19, 'homepage_slider_list', '', '', ''),
(20, 'homepage_block1_enable', '', '', '1'),
(23, 'homepage_block2_enable', '', '', '1'),
(25, 'homepage_block3_enable', '', '', '1'),
(26, 'homepage_block3_youtube', '', '', ''),
(27, 'homepage_block4_enable', '', '', '1'),
(28, 'homepage_block4_youtube', '', '', ''),
(29, 'homepage_block1_mode', '', '', '3'),
(30, 'homepage_block1_items', '', '', '[{\"url\":\"tag\\/best-deal\",\"image\":\"media\\/upload\\/2018\\/10\\/block-1-1.jpg\",\"caption\":\"Best Deal\"},{\"url\":\"tag\\/outerwear\",\"image\":\"media\\/upload\\/2018\\/10\\/block-1-2.jpg\",\"caption\":\"Outerwear\"},{\"url\":\"tag\\/khimar\\/\",\"image\":\"media\\/upload\\/2018\\/10\\/block-1-3.jpg\",\"caption\":\"Khimar\"}]'),
(32, 'homepage_block2_teks', '', '', '<h2 style=\"text-align:center\">DEDICATED FOR YOUX</h2>\n\n<h4 style=\"text-align:center\">Through elegant and exclusive designs, SHAFIRA always accomodates the needs of fashionable Muslim fashion for any occasions. Thus, our products are made exclusively in limited pieces. Shop sooner, own them faster.</h4>\n'),
(33, 'homepage_block3_items', '', '', '[{\"url\":\"\",\"image\":\"media\\/upload\\/2018\\/10\\/block-3-1.jpg\",\"caption\":\"\"},{\"url\":\"\",\"image\":\"media\\/upload\\/2018\\/10\\/block-3-2.jpg\",\"caption\":\"\"},{\"url\":\"\",\"image\":\"media\\/upload\\/2018\\/10\\/block-3-3.jpg\",\"caption\":\"\"},{\"url\":\"\",\"image\":\"media\\/upload\\/2018\\/10\\/block-3-4.jpg\",\"caption\":\"\"},{\"url\":\"\",\"image\":\"media\\/upload\\/2018\\/10\\/block-3-5.jpg\",\"caption\":\"\"}]'),
(34, 'homepage_block3_teks', '', '', '<p>BRAND NEW</p>\n\n<h2 style=\"text-align:left\">Women&#39;s Collections</h2>\n\n<p>Shop the latest trends in&nbsp;Islamic&nbsp;clothing. Stylish &amp; modest&nbsp;Islamic&nbsp;clothing for&nbsp;Women. Hijabs, dresses, cardigans, modest fashion &amp; more.</p>\n\n<p><a class=\"btn-shop-dress\" href=\"/tag/dress/\">Shop Dress</a> <a class=\"btn-shop-dress\" href=\"/kategori\">Shop All</a></p>\n'),
(35, 'homepage_block5_enable', '', '', '1'),
(36, 'homepage_block5_teks', '', '', '<p>BRAND NEW</p>\n\n<h2 style=\"text-align:left\">Men&#39;s Collections</h2>\n\n<p>Collection for Men. Quality and style are the features of the Menswear Collection of SHAFIRA. This line will be ideal for a modern, dynamic man, who is accustomed to The Best.</p>\n\n<p><a class=\"btn-shop-dress\" href=\"/tag/men\">Shop All Mens</a></p>\n'),
(37, 'homepage_block5_items', '', '', '[{\"url\":\"\",\"image\":\"media\\/upload\\/2018\\/10\\/block-5-1.jpg\",\"caption\":\"\"},{\"url\":\"\",\"image\":\"media\\/upload\\/2018\\/10\\/block-5-2.jpg\",\"caption\":\"\"},{\"url\":\"\",\"image\":\"media\\/upload\\/2018\\/10\\/block-5-3.jpg\",\"caption\":\"\"},{\"url\":\"\",\"image\":\"media\\/upload\\/2018\\/10\\/block-5-4.jpg\",\"caption\":\"\"},{\"url\":\"\",\"image\":\"media\\/upload\\/2018\\/10\\/block-5-5.jpg\",\"caption\":\"\"}]'),
(38, 'homepage_block6_enable', '', '', '1'),
(39, 'homepage_block6_teks', '', '', '<p class=\"subtitle\">Local Event</p>\n          <h2 class=\"custom-font\" style=\"text-align:left;\">Indonesia Fashion Week 2018</h2>\n          <p>Alhamdulillah, thank you so much for the endless support. We made it into one of the big parts of our&nbsp;<a href=\"https://www.instagram.com/explore/tags/shafirajourney/\" class=\"text-link\">#SHAFIRAJourney</a>.</p>\n          <a href=\"#\" class=\"btn-shop-dress\">View Show</a>'),
(40, 'homepage_block6_image', '', '', 'media/upload/2018/10/block-6.jpg'),
(41, 'homepage_block4_teks', '', '', '<h1>Journey to The World Class Fashion</h1>\n								<h3>In Partnership with SWAROVSKI X</h3>\n'),
(42, 'homepage_block4_youtube_id', '', '', 'HW2WAqcJFiU'),
(43, 'homepage_block1_layout', '', '', ''),
(44, 'homepage_block1_list', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `a_grup`
--

CREATE TABLE `a_grup` (
  `id` int(11) NOT NULL,
  `kode` varchar(25) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `hakakses` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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
(1, 'Pembina', 'Pembina Majelis Ta\'lim Syubbaanul \'Uluum', '0000-00-00 00:00:00', 1, 0),
(2, 'Tim 12', 'Tim 12', '0000-00-00 00:00:00', 1, 0),
(3, 'Muttabi', 'Muttabi', '0000-00-00 00:00:00', 1, 0),
(4, 'Tim Pengembangan Santri', 'Tim Pengembangan Santri', '0000-00-00 00:00:00', 1, 0),
(5, 'Tim Tahsin & Tahfidz Al-Qur\'an', 'Tim Tahsin & Tahfidz Al-Qur\'an', '0000-00-00 00:00:00', 1, 0),
(6, 'Tim Kreatifitas', 'Tim Kreatifitas', '0000-00-00 00:00:00', 1, 0),
(7, 'Tim Ta\'lim Wa Ta\'allum', 'Tim Ta\'lim Wa Ta\'allum', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `a_media`
--

CREATE TABLE `a_media` (
  `id` int(11) NOT NULL,
  `b_user_id` int(11) DEFAULT NULL,
  `utype` enum('blog','produk','produk_thumb','galeri') NOT NULL DEFAULT 'blog',
  `nama` varchar(255) NOT NULL,
  `folder` varchar(255) NOT NULL DEFAULT '/',
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a_media`
--

INSERT INTO `a_media` (`id`, `b_user_id`, `utype`, `nama`, `folder`, `cdate`, `is_active`) VALUES
(3, 1, 'blog', 'media/upload/2018/11/burung-1.jpg', '/test', '2018-11-30 18:56:28', 1),
(6, 1, 'blog', 'media/upload/2018/12/tenda-promosi-3x3-besi-pipa-210.png', '/tenda-promosi', '2018-12-19 15:42:54', 1),
(7, 1, 'blog', 'media/upload/2018/12/tenda-promosi-2x2.png', '/tenda-promosi', '2018-12-19 16:28:31', 1),
(8, 1, 'blog', 'media/upload/2018/12/tenda-promosi-4x4.png', '/tenda-promosi', '2018-12-19 16:33:45', 1),
(10, 1, 'blog', 'media/upload/2018/12/velbed-cover.jpg', '/velbed', '2018-12-19 20:00:30', 1),
(13, 1, 'blog', 'media/upload/2018/12/tenda-sarnafil-size-chart.png', '/tenda-sarnafil', '2018-12-19 20:57:17', 1),
(14, 1, 'blog', 'media/upload/2018/12/tenda-kerucut-3x3-ani.gif', '/tenda-kerucut', '2018-12-19 21:06:59', 1),
(21, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-001.jpg', '/glamping garut', '2019-02-02 22:01:57', 1),
(22, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-002.jpg', '/glamping garut', '2019-02-02 22:02:19', 1),
(23, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-003.jpg', '/glamping garut', '2019-02-02 22:02:40', 1),
(24, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-004.jpg', '/glamping garut', '2019-02-02 22:02:56', 1),
(25, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-005.jpg', '/glamping garut', '2019-02-02 22:03:11', 1),
(26, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-006.jpg', '/glamping garut', '2019-02-02 22:29:46', 1),
(27, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-007.jpg', '/glamping garut', '2019-02-02 22:30:06', 1),
(28, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-008.jpg', '/glamping garut', '2019-02-02 22:30:22', 1),
(29, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-009.jpg', '/glamping garut', '2019-02-02 22:30:38', 1),
(30, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-010.jpg', '/glamping garut', '2019-02-02 22:30:52', 1),
(31, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-011.jpg', '/glamping garut', '2019-02-02 22:31:08', 1),
(32, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-011.jpg', '/glamping garut', '2019-02-02 22:31:22', 1),
(33, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-012.jpg', '/glamping garut', '2019-02-02 22:31:41', 1),
(34, 1, 'blog', 'media/upload/2019/02/idjbgr.gc.pndy0001-013.jpg', '/glamping garut', '2019-02-02 22:31:57', 1),
(35, 1, 'blog', 'media/upload/2019/05/ramadhan.jpg', '/', '2019-05-17 15:34:11', 1),
(36, 1, 'blog', 'media/upload/2019/06/buka-bersama-ppisu.jpg', '/', '2019-06-09 23:05:18', 1),
(37, 1, 'blog', 'media/upload/2019/06/buka-bersama-lesehan.jpg', '/', '2019-06-09 23:06:46', 1),
(38, 1, 'blog', 'media/upload/2019/06/sedih-ramadhan.jpg', '/', '2019-06-09 23:10:04', 1),
(39, 1, 'blog', 'media/upload/2019/06/adab-berdoa.jpg', '/', '2019-06-09 23:11:03', 1),
(40, 1, 'blog', 'media/upload/2019/06/ramadhan-berakhir.jpg', '/', '2019-06-09 23:13:27', 1),
(41, 1, 'blog', 'media/upload/2019/06/sujud-doa.jpg', '/', '2019-06-09 23:17:19', 1),
(42, 1, 'blog', 'media/upload/2019/06/doa-solat.jpg', '/', '2019-06-09 23:18:56', 1),
(43, 1, 'blog', 'media/upload/2019/06/alloh_1.jpg', '/', '2019-06-13 21:48:17', 1),
(44, 1, 'blog', 'media/upload/2019/06/sean-patrick-murphy-089q6pmx-ai-unsplash.jpg', '/', '2019-06-30 12:37:27', 1),
(45, 1, 'blog', 'media/upload/2019/06/hannah-rodrigo-bbq9lhb-wpy-unsplash.jpg', '/', '2019-06-30 12:59:56', 1),
(46, 1, 'blog', 'media/upload/2019/06/lachtan.jpg', '/', '2019-06-30 13:34:48', 1),
(47, 1, 'blog', 'media/upload/2019/06/rihlah.jpg', '/', '2019-06-30 13:43:56', 1),
(48, 1, 'blog', 'media/upload/2019/06/verne-ho-8bx2qcayaqe-unsplash.jpg', '/', '2019-06-30 16:32:05', 1),
(49, 1, 'blog', 'media/upload/2019/06/masjid-su.jpg', '/', '2019-06-30 16:47:16', 1),
(50, 1, 'blog', 'media/upload/2019/06/img-20190630-wa0006.jpg', '/', '2019-06-30 21:41:19', 1),
(51, 1, 'blog', 'media/upload/2019/07/luke-stackpoole-zrsjmpt9pni-unsplash.jpg', '/', '2019-07-01 10:15:17', 1),
(52, 1, 'blog', 'media/upload/2019/07/adli-wahid-dc-iljqs6ig-unsplash.jpg', '/', '2019-07-02 22:13:37', 1),
(53, 1, 'blog', 'media/upload/2019/07/eberhard-grossgasteiger-fhdn5qvrbfy-unsplash.jpg', '/', '2019-07-03 12:45:44', 1),
(54, 1, 'blog', 'media/upload/2019/07/tazkiyah.jpg', '/', '2019-07-11 14:38:37', 1),
(55, 1, 'blog', 'media/upload/2020/02/img-20200213-wa0003.jpg', '/', '2020-02-13 11:30:10', 1),
(56, 1, 'blog', 'media/upload/2021/12/773181.jpg', '/', '2021-12-08 12:44:10', 1),
(57, 1, 'blog', 'media/upload/2021/12/instagram-post---4.png', '/', '2021-12-23 13:57:52', 1),
(58, 1, 'blog', 'media/upload/2021/12/ilmu-itu-agama-(2).png', '/', '2021-12-23 14:20:20', 1),
(59, 1, 'blog', 'media/upload/2021/12/keutamaan_beristigfar.jpg', '/', '2021-12-23 14:25:33', 1),
(60, 1, 'blog', 'media/upload/2022/01/the-dancing-rain-tfwqxqvb7r8-unsplash.jpg', '/', '2022-01-10 12:45:22', 1),
(61, 1, 'blog', 'media/upload/2022/01/the-dancing-rain-tfwqxqvb7r8-unsplash-(1).jpg', '/', '2022-01-10 12:48:46', 1),
(62, 1, 'blog', 'media/upload/2022/01/faseeh-fawaz-dt1vfapzmui-unsplash.jpg', '/', '2022-01-15 12:01:27', 1),
(63, 1, 'blog', 'media/upload/2022/01/prison.jpg', '/', '2022-01-21 22:07:06', 1),
(65, 1, 'blog', 'media/upload/2022/11/frame-99-(1).png', '/', '2022-11-02 14:26:50', 1),
(66, 1, 'blog', 'media/upload/2022/11/masjid-maba-qhzqfd0ihni-unsplash-(1).jpg', '/', '2022-11-03 13:08:52', 1),
(67, 1, 'blog', 'media/upload/2022/11/instagram-post---10.png', '/', '2022-11-03 13:37:11', 1),
(68, 1, 'blog', 'media/upload/2022/11/instagram-post---10-(1).png', '/', '2022-11-03 13:37:57', 1),
(69, 1, 'blog', 'media/upload/2022/11/kebersamaan_syudais.png', '/', '2022-11-17 12:22:58', 1),
(70, 1, 'blog', 'media/upload/2022/11/kaya.png', '/', '2022-11-23 10:18:47', 1),
(71, 1, 'blog', 'media/upload/2022/11/sajadah.jpg', '/', '2022-11-23 11:15:43', 1),
(73, 1, 'blog', 'media/upload/2022/11/christopher-sardegna-irygma_no2q-unsplash.jpg', '/', '2022-11-23 18:33:16', 1),
(74, 1, 'blog', 'media/upload/2022/11/madrosah-sunnah.jpg', '/', '2022-11-23 19:16:30', 1),
(75, 1, 'blog', 'media/upload/2022/11/madrosah-sunnah.jpg', '/', '2022-11-23 19:16:30', 1),
(78, 1, 'blog', 'media/upload/2022/11/sukses.jpg', '/', '2022-11-26 05:10:14', 1),
(79, 1, 'blog', 'media/upload/2022/11/ngaji_filtered.jpg', '/', '2022-11-30 14:42:40', 1),
(80, 1, 'blog', 'media/upload/2023/01/alexander-andrews-dr6vbm0knsw-unsplash(compressed).jpg', '/', '2023-01-19 14:32:08', 1),
(81, 1, 'blog', 'media/upload/2023/01/jangan_cabut_kenikmatan.jpg', '/', '2023-01-25 11:20:43', 1);

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
('akun', 'Akun', 'akun', 0, 1, NULL, 1, 'denied', 1, 4, 'fa fa-users', 'internal'),
('akun_grup', 'Grup', 'akun/grup', 1, 0, 'akun', 1, 'denied', 0, 0, 'fa fa-home', 'internal'),
('akun_hak_akses', 'Hak Akses Pengguna', 'akun/hak_akses', 1, 0, 'akun', 1, 'denied', 0, 3, 'fa fa-edit', 'internal'),
('akun_karyawan', 'Karyawan', 'akun/karyawan', 1, 0, 'akun', 1, 'denied', 0, 2, 'fa fa-home', 'internal'),
('akun_pengguna', 'Super Admin', 'akun/pengguna', 1, 0, 'akun', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('akun_santri', 'Santri', 'akun/santri', 1, 0, 'akun', 1, 'denied', 1, 20, 'fa fa-home', 'internal'),
('akun_usergroup', 'Grup Pelanggan', 'akun/usergroup', 1, 0, 'akun', 1, 'denied', 0, 10, 'fa fa-home', 'internal'),
('alamatongkir', 'Alamat &amp; Ongkir', '#', 0, 1, NULL, 1, 'denied', 0, 1, 'fa fa-building', 'internal'),
('alamatongkir_jne', 'JNE', 'alamatongkir/jne', 1, 0, 'alamatongkir', 1, 'denied', 1, 71, 'fa fa-home', 'internal'),
('alamatongkir_jnt', 'JNT', 'alamatongkir/jnt', 1, 0, 'alamatongkir', 1, 'denied', 0, 72, 'fa fa-home', 'internal'),
('alamatongkir_kabkota', 'Kabkota', 'alamatongkir/kabkota', 1, 0, 'alamatongkir', 1, 'denied', 1, 52, 'fa fa-home', 'internal'),
('alamatongkir_kecamatan', 'Kecamatan', 'alamatongkir/kecamatan', 1, 0, 'alamatongkir', 1, 'denied', 1, 53, 'fa fa-home', 'internal'),
('alamatongkir_kelurahan', 'Kelurahan', 'alamatongkir/kelurahan', 1, 0, 'alamatongkir', 1, 'denied', 0, 54, 'fa fa-home', 'internal'),
('alamatongkir_negara', 'Negara', 'alamatongkir/negara', 1, 0, 'alamatongkir', 1, 'denied', 1, 50, 'fa fa-home', 'internal'),
('alamatongkir_posems', 'POS EMS', 'alamatongkir/posems', 1, 0, 'alamatongkir', 1, 'denied', 0, 74, 'fa fa-home', 'internal'),
('alamatongkir_poskilat', 'POS Kilat', 'alamatongkir/poskilat', 1, 0, 'alamatongkir', 1, 'denied', 0, 73, 'fa fa-home', 'internal'),
('alamatongkir_provinsi', 'Provinsi', 'alamatongkir/provinsi', 1, 0, 'alamatongkir', 1, 'denied', 1, 51, 'fa fa-home', 'internal'),
('blog', 'Blog', 'blog', 0, 0, NULL, 1, 'denied', 1, 3, 'fa fa-file-text-o', 'internal'),
('blog_kategori', 'Kategori', 'blog/kategori', 1, 0, 'blog', 1, 'denied', 1, 12, 'fa fa-home', 'internal'),
('blog_post', 'Post', 'blog/post', 1, 0, 'blog', 1, 'denied', 1, 10, 'fa fa-home', 'internal'),
('cabang', 'Cabang', '#', 0, 1, NULL, 1, 'denied', 0, 4, 'fa fa-user-secret', 'internal'),
('cabang_barang', 'Barang per Cabang', 'cabang/barang', 1, 0, 'cabang', 1, 'denied', 1, 20, 'fa fa-home', 'internal'),
('cabang_detail', 'Detail', 'cabang/detail', 1, 0, 'cabang', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('cabang_pengumuman', 'Pengumuman', 'cabang/pengumuman', 1, 0, 'erpmaster', 1, 'denied', 1, 84, 'fa fa-home', 'internal'),
('cms', 'CMS', 'cms', 0, 1, NULL, 1, 'denied', 1, 12, 'fa fa-file-text-o', 'internal'),
('cms_blog', 'Blog', 'cms/blog', 1, 0, 'cms', 1, 'denied', 0, 21, 'fa fa-home', 'internal'),
('cms_homepage', 'Homepage', 'cms/homepage', 1, 0, 'cms', 1, 'denied', 1, 10, 'fa fa-home', 'internal'),
('cms_media', 'Media', 'cms/media', 1, 0, 'cms', 1, 'denied', 1, 20, 'fa fa-home', 'internal'),
('cms_menu', 'Menu', 'cms/menu', 1, 0, 'cms', 1, 'denied', 1, 11, 'fa fa-home', 'internal'),
('cms_portofolio', 'Portofolio', 'cms/portofolio', 1, 0, 'cms', 1, 'denied', 1, 30, 'fa fa-home', 'internal'),
('cms_slider', 'Slider', 'cms/slider', 1, 0, 'cms', 1, 'denied', 1, 12, 'fa fa-home', 'internal'),
('cms_testimonial', 'Testimonial', 'cms/testimonial', 1, 0, 'cms', 1, 'denied', 1, 22, 'fa fa-home', 'internal'),
('crm', 'CRM', 'crm', 0, 1, NULL, 1, 'denied', 1, 7, 'fa fa-heartbeat', 'internal'),
('crm_absen', 'Absensi', 'crm/absen/', 1, 0, 'crm', 1, 'denied', 1, 0, 'fa fa-home', 'internal'),
('crm_booking', 'Booking', 'crm/booking', 1, 0, 'crm', 1, 'denied', 0, 1, 'fa fa-home', 'internal'),
('crm_cs', 'CS', 'crm/cs', 1, 0, 'crm', 1, 'denied', 0, 3, 'fa fa-home', 'internal'),
('crm_guestbook', 'Guest Book', 'crm/guestbook', 1, 0, 'crm', 1, 'denied', 1, 22, 'fa fa-home', 'internal'),
('crm_kategori', 'Kategori', 'crm/kategori', 1, 0, 'crm', 1, 'denied', 0, 1, 'fa fa-home', 'internal'),
('crm_komplain', 'Komplain', 'crm/komplain', 1, 0, 'crm', 1, 'denied', 0, 5, 'fa fa-home', 'internal'),
('crm_konsultasi', 'Konsultasi', 'crm/konsultasi', 1, 0, 'crm', 1, 'denied', 0, 0, 'fa fa-home', 'internal'),
('crm_pemberitahuan', 'Pemberitahuan', 'crm/pemberitahuan', 1, 0, 'crm', 1, 'denied', 0, 3, 'fa fa-home', 'internal'),
('crm_pesan', 'Pesan', 'crm/pesan', 1, 0, 'crm', 1, 'denied', 0, 0, 'fa fa-home', 'internal'),
('crm_retur', 'Retur', 'crm/retur', 1, 0, 'crm', 1, 'denied', 0, 4, 'fa fa-home', 'internal'),
('crm_support', 'Support', 'crm/support', 1, 0, 'crm', 1, 'denied', 0, 2, 'fa fa-home', 'internal'),
('dashboard', 'Dashboard', '', 0, 0, NULL, 1, 'allowed', 1, 0, 'fa fa-home', 'internal'),
('ecommerce', 'Ecommerce', 'ecommerce', 0, 1, NULL, 1, 'denied', 1, 10, 'fa fa-shopping-cart', 'internal'),
('ecommerce_bank', 'Bank', 'ecommerce/bank', 1, 0, 'ecommerce', 1, 'denied', 0, 80, 'fa fa-home', 'internal'),
('ecommerce_bantuan', 'Bantuan (CS)', 'ecommerce/bantuan', 1, 0, 'ecommerce', 1, 'denied', 0, 60, 'fa fa-home', 'internal'),
('ecommerce_custom', 'Custom', 'ecommerce/custom', 1, 0, 'ecommerce', 1, 'denied', 0, 20, 'fa fa-home', 'internal'),
('ecommerce_homepage', 'Homepage', 'ecommerce/homepage', 1, 1, 'ecommerce', 1, 'denied', 0, 50, 'fa fa-home', 'internal'),
('ecommerce_homepage_produk', 'Produk', 'ecommerce/homepage/produk', 2, 0, 'ecommerce_homepage', 1, 'denied', 1, 52, 'fa fa-home', 'internal'),
('ecommerce_homepage_slider', 'Slider', 'ecommerce/homepage/slider', 2, 0, 'ecommerce_homepage', 1, 'denied', 1, 52, 'fa fa-home', 'internal'),
('ecommerce_kategori', 'Kategori', 'ecommerce/kategori', 1, 0, 'ecommerce', 1, 'denied', 1, 20, 'fa fa-home', 'internal'),
('ecommerce_menu', 'Menu', 'ecommerce/menu', 1, 0, 'ecommerce', 1, 'denied', 0, 50, 'fa fa-home', 'internal'),
('ecommerce_order', 'Order', 'ecommerce/order', 1, 0, 'ecommerce', 1, 'denied', 0, 10, 'fa fa-home', 'internal'),
('ecommerce_pelanggan', 'Pelanggan', 'ecommerce/pelanggan', 1, 0, 'ecommerce', 1, 'denied', 1, 60, 'fa fa-home', 'internal'),
('ecommerce_pembayaran', 'Cara Bayar', 'ecommerce/pembayaran', 1, 0, 'ecommerce', 1, 'denied', 0, 81, 'fa fa-home', 'internal'),
('ecommerce_pengaturan', 'Pengaturan', 'ecommerce/pengaturan', 1, 0, 'ecommerce', 1, 'denied', 0, 90, 'fa fa-home', 'internal'),
('ecommerce_pengiriman', 'Pengiriman', 'ecommerce/pengiriman', 1, 0, 'ecommerce', 1, 'denied', 0, 45, 'fa fa-home', 'internal'),
('ecommerce_produk', 'Produk', 'ecommerce/produk', 1, 0, 'ecommerce', 1, 'denied', 1, 25, 'fa fa-home', 'internal'),
('ecommerce_promo', 'Promo', 'ecommerce/promo', 1, 0, 'ecommerce', 1, 'denied', 0, 56, 'fa fa-home', 'internal'),
('ecommerce_slider', 'Slider', 'ecommerce/slider', 1, 0, 'ecommerce', 1, 'denied', 1, 55, 'fa fa-home', 'internal'),
('erpmaster', 'ERP Master', '#', 0, 1, NULL, 1, 'denied', 0, 1, 'fa fa-building', 'internal'),
('erpmaster_bank', 'Bank', 'erpmaster/bank', 1, 0, 'erpmaster', 1, 'denied', 1, 60, 'fa fa-home', 'internal'),
('erpmaster_brand', 'Brand', 'erpmaster/brand', 1, 0, 'erpmaster', 1, 'denied', 0, 41, 'fa fa-home', 'internal'),
('erpmaster_company', 'Cabang', 'erpmaster/company', 1, 0, 'erpmaster', 1, 'denied', 1, 10, 'fa fa-home', 'internal'),
('erpmaster_gudang', 'Gudang', 'erpmaster/gudang', 1, 0, 'erpmaster', 1, 'denied', 1, 12, 'fa fa-home', 'internal'),
('erpmaster_jabatan', 'Jabatan', 'erpmaster/jabatan', 1, 0, 'erpmaster', 1, 'denied', 1, 11, 'fa fa-home', 'internal'),
('erpmaster_pembayaran', 'Cara Bayar', 'erpmaster/pembayaran', 1, 0, 'erpmaster', 1, 'denied', 0, 61, 'fa fa-home', 'internal'),
('erpmaster_toko', 'Toko', 'erpmaster/toko', 1, 0, 'erpmaster', 1, 'denied', 0, 41, 'fa fa-home', 'internal'),
('erpmaster_vendor', 'Supplier', 'erpmaster/vendor', 1, 0, 'erpmaster', 1, 'denied', 1, 40, 'fa fa-home', 'internal'),
('event', 'Event', '#', 0, 0, NULL, 1, 'denied', 1, 4, 'fa fa-calendar', 'internal'),
('event_kajian', 'Kajian', 'event/kajian', 1, 0, 'event', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('event_kegiatan', 'Kegiatan', 'event/kegiatan', 1, 0, 'event', 1, 'denied', 1, 2, 'fa fa-home', 'internal'),
('gudang', 'Gudang', '#', 0, 1, NULL, 1, 'denied', 0, 8, 'fa fa-gift', 'internal'),
('gudang_bahanbaku', 'Bahan Baku', 'gudang/bb', 1, 0, 'gudang', 1, 'denied', 1, 70, 'fa fa-home', 'internal'),
('gudang_pengajuan', 'Pengajuan', 'gudang/pengajuan', 1, 0, 'gudang', 1, 'denied', 1, 60, 'fa fa-home', 'internal'),
('gudang_pengiriman', 'Pengiriman Barang', 'gudang/pengiriman', 1, 0, 'gudang', 1, 'denied', 1, 12, 'fa fa-home', 'internal'),
('gudang_permintaan', 'Permintaan Barang', 'gudang/permintaan', 1, 0, 'gudang', 1, 'denied', 1, 10, 'fa fa-home', 'internal'),
('gudang_persetujuan', 'Persetujuan Permintaan', 'gudang/persetujuan', 1, 0, 'gudang', 1, 'denied', 1, 11, 'fa fa-home', 'internal'),
('gudang_pindah', 'Pindah Barang', 'gudang/pindah', 1, 0, 'gudang', 1, 'denied', 1, 30, 'fa fa-home', 'internal'),
('gudang_produksi', 'Barang Produksi', 'gudang/produksi', 1, 0, 'gudang', 1, 'denied', 1, 31, 'fa fa-home', 'internal'),
('gudang_retur', 'Barang Retur', 'gudang/retur', 1, 0, 'gudang', 1, 'denied', 1, 32, 'fa fa-home', 'internal'),
('gudang_so', 'Stok Opname', 'gudang/so', 1, 0, 'gudang', 1, 'denied', 1, 33, 'fa fa-home', 'internal'),
('gudang_stok', 'Penyimpanan &amp; Stok', 'gudang/stok', 1, 0, 'gudang', 1, 'denied', 1, 34, 'fa fa-home', 'internal'),
('hr', 'HR', '#', 0, 1, NULL, 1, 'denied', 0, 5, 'fa fa-user', 'internal'),
('keuangan', 'Keuangan', 'keuangan', 0, 1, NULL, 1, 'denied', 0, 6, 'fa fa-money', 'internal'),
('keuangan_deposit', 'Deposit', 'keuangan/deposit', 1, 0, 'keuangan', 1, 'denied', 1, 6, 'fa fa-home', 'internal'),
('keuangan_inventaris', 'Inventaris', 'keuangan/inventaris', 1, 0, 'keuangan', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('keuangan_kas', 'Kas', 'keuangan/kas', 1, 0, 'keuangan', 1, 'denied', 1, 2, 'fa fa-home', 'internal'),
('keuangan_laporan', 'Laporan', 'keuangan/laporan', 1, 0, 'keuangan', 1, 'denied', 1, 12, 'fa fa-home', 'internal'),
('keuangan_memo', 'Kredit Memo', 'keuangan/memo', 1, 0, 'keuangan', 1, 'denied', 1, 7, 'fa fa-home', 'internal'),
('keuangan_pengajuan', 'Pengajuan', 'keuangan/pengajuan', 1, 0, 'keuangan', 1, 'denied', 1, 4, 'fa fa-home', 'internal'),
('keuangan_perjalanan', 'Perjalanan', 'keuangan/perjalanan', 1, 0, 'keuangan', 1, 'denied', 1, 3, 'fa fa-home', 'internal'),
('keuangan_rekening', 'Rekening', 'keuangan/rekening', 1, 0, 'keuangan', 1, 'denied', 1, 8, 'fa fa-home', 'internal'),
('klinik', 'Klinik', '#', 0, 1, NULL, 1, 'denied', 0, 5, 'fa fa-asterisk', 'internal'),
('klinik_rekammedis', 'Rekam Medis', 'klinik/rekammedis', 1, 0, 'klinik', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('laporan', 'Laporan', 'laporan', 0, 1, NULL, 1, 'denied', 0, 30, 'fa fa-file-text', 'internal'),
('laporan_asistensi', 'Asistensi', 'laporan/asistensi', 1, 0, 'laporan', 1, 'denied', 1, 11, 'fa fa-home', 'internal'),
('laporan_barang', 'Barang', 'laporan/barang', 1, 0, 'laporan', 1, 'denied', 0, 5, 'fa fa-home', 'internal'),
('laporan_bestseller', 'Best Seller', 'laporan/bestseller', 1, 0, 'laporan', 1, 'denied', 1, 24, 'fa fa-home', 'internal'),
('laporan_booking', 'Booking', 'laporan/booking', 1, 0, 'laporan', 0, 'denied', 0, 3, 'fa fa-home', 'internal'),
('laporan_kasir', 'Kasir', 'laporan/kasir', 1, 0, 'laporan', 1, 'denied', 1, 7, 'fa fa-home', 'internal'),
('laporan_pelanggan', 'Pelanggan', 'laporan/pelanggan', 1, 0, 'laporan', 1, 'denied', 1, 2, 'fa fa-home', 'internal'),
('laporan_penjualan', 'Penjualan', 'laporan/penjualan', 1, 0, 'laporan', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('laporan_terapis', 'Terapis', 'laporan/terapis', 1, 0, 'laporan', 1, 'denied', 1, 10, 'fa fa-home', 'internal'),
('pembelian', 'Pembelian', 'pembelian', 0, 1, NULL, 1, 'denied', 0, 5, 'fa fa-opencart', 'internal'),
('pembelian_barang', 'Pembelian Barang', 'pembelian/barang', 1, 0, 'pembelian', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('pembelian_historystok', 'History Stok', 'pembelian/historystok', 1, 0, 'pembelian', 1, 'denied', 1, 3, 'fa fa-home', 'internal'),
('pembelian_karantina', 'Karantina Batch', 'pembelian/karantina', 1, 0, 'pembelian', 1, 'denied', 1, 5, 'fa fa-home', 'internal'),
('pembelian_mutasi', 'Mutasi', 'pembelian/mutasi', 1, 0, 'pembelian', 1, 'denied', 1, 4, 'fa fa-home', 'internal'),
('pembelian_orderan', 'Orderan', 'pembelian/orderan', 1, 0, 'pembelian', 1, 'denied', 0, 8, 'fa fa-home', 'internal'),
('pembelian_produksi', 'Produksi', 'pembelian/produksi', 1, 0, 'pembelian', 1, 'denied', 0, 9, 'fa fa-home', 'internal'),
('pembelian_racikan', 'Proses Racikan', 'pembelian/racikan', 1, 0, 'pembelian', 1, 'denied', 1, 10, 'fa fa-home', 'internal'),
('pengiriman', 'Pengiriman', 'pengiriman', 0, 1, NULL, 1, 'denied', 0, 5, 'fa fa-truck', 'internal'),
('pengiriman_ekspedisi', 'Ekspedisi', 'pengriman/ekspedisi', 1, 0, 'pengiriman', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('pengiriman_kurir', 'Kurir', 'pengiriman/kurir', 1, 0, 'pengiriman', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('pengiriman_packing', 'Packing', 'pengiriman/packing', 1, 0, 'pengiriman', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('pengiriman_qc', 'QC', 'pengiriman/qc', 1, 0, 'pengiriman', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('penjualan', 'Penjualan', 'penjualan', 0, 1, NULL, 1, 'denied', 0, 9, 'fa fa-book', 'internal'),
('penjualan_bonus', 'Bonus', 'penjualan/bonus', 1, 0, 'penjualan', 1, 'denied', 1, 10, 'fa fa-home', 'internal'),
('penjualan_cabang', 'Cabang', 'penjualan/cabang', 0, 0, 'penjualan', 1, 'denied', 1, 10, 'fa fa-home', 'internal'),
('penjualan_offline', 'Offline', 'penjualan/offline', 1, 0, 'penjualan', 0, 'denied', 0, 20, 'fa fa-home', 'internal'),
('penjualan_online', 'Online', 'penjualan/online', 1, 0, 'penjualan', 1, 'denied', 0, 30, 'fa fa-home', 'internal'),
('penjualan_outlet', 'Outlet (offline)', 'penjualan/outlet', 1, 0, 'penjualan', 1, 'denied', 0, 21, 'fa fa-home', 'internal'),
('penjualan_promosi', 'Promosi', 'penjualan/promosi', 1, 0, 'penjualan', 1, 'denied', 1, 6, 'fa fa-home', 'internal'),
('penjualan_specialprice', 'Special Price', 'penjualan/specialprice', 1, 0, 'penjualan', 1, 'denied', 1, 4, 'fa fa-home', 'internal'),
('penjualan_voucher', 'Voucher', 'penjualan/voucher', 1, 0, 'penjualan', 1, 'denied', 1, 6, 'fa fa-home', 'internal'),
('po', 'P.O.', '#', 0, 1, NULL, 1, 'denied', 0, 16, 'fa fa-dropbox', 'internal'),
('po_faktur', 'Faktur', 'po/faktur', 1, 0, 'po', 1, 'denied', 1, 22, 'fa fa-home', 'internal'),
('po_konfirmasipesanan', 'Konfirmasi Pesanan', 'po/konfirmasipesanan', 1, 0, 'po', 1, 'denied', 1, 2, 'fa fa-home', 'internal'),
('po_outstanding', 'Outstanding', 'po/outstanding', 1, 0, 'po', 1, 'denied', 1, 42, 'fa fa-home', 'internal'),
('po_penerimaan', 'Penerimaan', 'po/penerimaan', 1, 0, 'po', 1, 'denied', 1, 30, 'fa fa-home', 'internal'),
('po_pengiriman', 'Pengiriman', 'po/pengiriman', 1, 0, 'po', 1, 'denied', 1, 20, 'fa fa-home', 'internal'),
('po_permintaan', 'Permintaan', 'po/permintaan', 1, 0, 'po', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('po_persetujuan', 'Persetujuan', 'po/persetujuan', 1, 0, 'po', 0, 'denied', 0, 10, 'fa fa-home', 'internal'),
('po_selisih', 'Selisih', 'po/selisih', 1, 0, 'po', 1, 'denied', 1, 40, 'fa fa-home', 'internal'),
('po_suratjalan', 'Surat Jalan', 'po/suratjalan', 1, 0, 'po', 1, 'denied', 0, 21, 'fa fa-home', 'internal'),
('po_suratpenerimaan', 'Surat Penerimaan', 'po/suratpenerimaan', 1, 0, 'po', 1, 'denied', 1, 32, 'fa fa-home', 'internal'),
('po_suratpesanan', 'Surat Pesanan', 'po/suratpesanan', 1, 0, 'po', 1, 'denied', 1, 3, 'fa fa-home', 'internal'),
('po_transit', 'Transit Pengiriman', 'po/transit', 1, 0, 'po', 1, 'denied', 1, 22, 'fa fa-home', 'internal'),
('po_verifikasipenerimaan', 'Verifikasi Penerimaan', 'po/verifikasipenerimaan', 1, 0, 'po', 1, 'denied', 1, 31, 'fa fa-home', 'internal'),
('produk', 'Produk Master', '#', 0, 1, NULL, 1, 'denied', 0, 3, 'fa fa-building', 'internal'),
('produksi', 'Produksi', 'produksi', 0, 1, NULL, 1, 'denied', 0, 6, 'fa fa-cogs', 'internal'),
('produksi_pekerjaan', 'Pekerjaan', 'produksi/pekerjaan', 1, 0, 'produksi', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('produksi_proses', 'Proses', 'produksi/proses', 1, 0, 'produksi', 1, 'denied', 1, 3, 'fa fa-home', 'internal'),
('produksi_rencana', 'Rencana', 'produksi/rencana', 1, 0, 'produksi', 1, 'denied', 1, 2, 'fa fa-home', 'internal'),
('produk_barang', 'Barang', 'produk/barang', 1, 0, 'produk', 1, 'denied', 1, 15, 'fa fa-home', 'internal'),
('produk_grup', 'Grup Barang', 'produk/grup', 1, 0, 'produk', 1, 'denied', 0, 3, 'fa fa-home', 'internal'),
('produk_jasa', 'Jasa', 'produk/jasa', 1, 0, 'produk', 1, 'denied', 1, 16, 'fa fa-home', 'internal'),
('produk_jenis', 'Grup Jenis', 'produk/jenis', 1, 0, 'produk', 1, 'denied', 1, 5, 'fa fa-home', 'internal'),
('produk_kategori', 'Kategori Produk', 'produk/kategori', 1, 0, 'produk', 1, 'denied', 1, 10, 'fa fa-home', 'internal'),
('produk_meta', 'Meta', 'produk/meta', 1, 0, 'produk', 1, 'denied', 0, 11, 'fa fa-home', 'internal'),
('produk_paket', 'Paket', 'produk/paket', 1, 0, 'produk', 1, 'denied', 1, 20, 'fa fa-home', 'internal'),
('produk_produk', 'Produk', 'produk/produk', 1, 0, 'produk', 1, 'denied', 0, 12, 'fa fa-home', 'internal'),
('produk_racikan', 'Racikan', 'produk/racikan', 1, 0, 'produk', 1, 'denied', 1, 20, 'fa fa-home', 'internal'),
('produk_satuan', 'Satuan/Unit', 'produk/satuan', 1, 0, 'produk', 1, 'denied', 1, 4, 'fa fa-home', 'internal'),
('retur', 'retur', '#', 0, 1, NULL, 1, 'denied', 0, 16, 'fa fa-sign-out', 'internal'),
('retur_barang', 'Barang', 'retur/barang', 1, 0, 'retur', 0, 'denied', 0, 1, 'fa fa-home', 'internal'),
('retur_kirim', 'Pengiriman', 'retur/kirim', 1, 0, 'retur', 1, 'denied', 1, 1, 'fa fa-home', 'internal'),
('retur_mutasi', 'Mutasi', 'retur/mutasi', 1, 0, 'retur', 0, 'denied', 0, 11, 'fa fa-home', 'internal'),
('retur_recycle', 'Daur Ulang', 'retur/recycle', 1, 0, 'retur', 1, 'denied', 1, 20, 'fa fa-home', 'internal'),
('retur_selisih', 'Selisih', 'retur/selisih', 1, 0, 'retur', 1, 'denied', 1, 6, 'fa fa-home', 'internal'),
('retur_terima', 'Penerimaan', 'retur/terima', 1, 0, 'retur', 1, 'denied', 1, 2, 'fa fa-home', 'internal'),
('retur_transit', 'Transit Pengiriman', 'retur/transit', 1, 0, 'retur', 1, 'denied', 1, 3, 'fa fa-home', 'internal');

-- --------------------------------------------------------

--
-- Table structure for table `a_pengguna`
--

CREATE TABLE `a_pengguna` (
  `id` int(4) NOT NULL,
  `a_company_id` int(5) DEFAULT NULL COMMENT 'penempatan',
  `a_company_nama` varchar(255) NOT NULL DEFAULT '-',
  `a_company_kode` varchar(32) NOT NULL DEFAULT '-',
  `a_jabatan_id` int(11) DEFAULT NULL,
  `a_jabatan_nama` varchar(255) NOT NULL DEFAULT 'Staff',
  `username` varchar(24) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `welcome_message` varchar(255) NOT NULL,
  `scope` enum('all','current_below','current_only','none') NOT NULL DEFAULT 'none',
  `nip` varchar(32) DEFAULT '-',
  `alamat` varchar(255) NOT NULL,
  `alamat_kecamatan` varchar(255) NOT NULL,
  `alamat_kabkota` varchar(255) NOT NULL,
  `alamat_provinsi` varchar(255) NOT NULL,
  `alamat_negara` varchar(255) NOT NULL,
  `alamat_kodepos` varchar(12) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` int(1) NOT NULL DEFAULT 1,
  `status_pernikahan` enum('belum menikah','menikah','duda','janda') NOT NULL DEFAULT 'belum menikah',
  `telp_rumah` varchar(25) NOT NULL,
  `telp_hp` varchar(25) NOT NULL,
  `bank_rekening_nomor` varchar(255) NOT NULL,
  `bank_rekening_nama` varchar(255) NOT NULL,
  `bank_nama` varchar(255) NOT NULL,
  `kerja_terakhir` varchar(255) NOT NULL,
  `kerja_terakhir_jabatan` varchar(255) NOT NULL,
  `kerja_terakhir_gaji` float NOT NULL,
  `pendidikan_terakhir` varchar(255) NOT NULL,
  `pendidikan_terakhir_jenjang` enum('SD','SMP','SMA','S1','D3','D2','S2') NOT NULL DEFAULT 'SMA',
  `pendidikan_terakhir_tahun` year(4) NOT NULL DEFAULT 1971,
  `ibu_nama` varchar(255) NOT NULL,
  `ibu_pekerjaan` varchar(255) NOT NULL,
  `tgl_kerja_mulai` date NOT NULL,
  `tgl_kerja_akhir` date NOT NULL,
  `tgl_kontrak_akhir` date DEFAULT NULL,
  `karyawan_status` enum('Kontrak','Magang','Tetap','Harian Lepas') NOT NULL,
  `is_karyawan` int(1) NOT NULL DEFAULT 0,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `a_pengguna_id` int(11) DEFAULT NULL COMMENT 'atasan langsung'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabel pengguna';

--
-- Dumping data for table `a_pengguna`
--

INSERT INTO `a_pengguna` (`id`, `a_company_id`, `a_company_nama`, `a_company_kode`, `a_jabatan_id`, `a_jabatan_nama`, `username`, `password`, `email`, `nama`, `foto`, `welcome_message`, `scope`, `nip`, `alamat`, `alamat_kecamatan`, `alamat_kabkota`, `alamat_provinsi`, `alamat_negara`, `alamat_kodepos`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `status_pernikahan`, `telp_rumah`, `telp_hp`, `bank_rekening_nomor`, `bank_rekening_nama`, `bank_nama`, `kerja_terakhir`, `kerja_terakhir_jabatan`, `kerja_terakhir_gaji`, `pendidikan_terakhir`, `pendidikan_terakhir_jenjang`, `pendidikan_terakhir_tahun`, `ibu_nama`, `ibu_pekerjaan`, `tgl_kerja_mulai`, `tgl_kerja_akhir`, `tgl_kontrak_akhir`, `karyawan_status`, `is_karyawan`, `is_active`, `a_pengguna_id`) VALUES
(1, NULL, '-', '-', NULL, 'Staff', 'syudais', '$2y$10$q9wKaOz4pE6sx5GlnihyO.84Bu4jrVRobnATpbIuRPtBs6Q6l8Atu', 'drosanda@outlook.co.id', 'S-Admin1', 'media/pengguna/2019/06/c4ca4238a0b923820dcc509a6f75849b2222.png', 'Selamat Beraktifitas', 'all', '-', '', '', '', '', '', '', '', NULL, 1, 'belum menikah', '', '', '', '', '', '', '', 0, '', 'SMA', 1971, '', '', '0000-00-00', '0000-00-00', NULL, 'Kontrak', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `a_pengguna_module`
--

CREATE TABLE `a_pengguna_module` (
  `id` int(8) NOT NULL,
  `a_pengguna_id` int(4) NOT NULL,
  `a_modules_identifier` varchar(255) DEFAULT NULL,
  `rule` enum('allowed','disallowed','allowed_except','disallowed_except') NOT NULL,
  `tmp_active` enum('N','Y') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='hak akses pengguna';

--
-- Dumping data for table `a_pengguna_module`
--

INSERT INTO `a_pengguna_module` (`id`, `a_pengguna_id`, `a_modules_identifier`, `rule`, `tmp_active`) VALUES
(1, 1, NULL, 'allowed_except', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `a_program`
--

CREATE TABLE `a_program` (
  `id` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `kategori` varchar(128) NOT NULL,
  `warna` varchar(56) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `type_form` int(1) NOT NULL DEFAULT 1,
  `deskripsi` text NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_program`
--

INSERT INTO `a_program` (`id`, `nama`, `slug`, `kategori`, `warna`, `icon`, `type_form`, `deskripsi`, `cdate`, `is_active`, `is_deleted`) VALUES
(2, 'Kajian Rutin', 'kajian-rutin', '', '#ffbb00', 'ni ni-book-bookmark', 1, 'Kajian Rutin Yang Sering Di lakukan setiap pekan', '2022-12-15 05:22:06', 1, 0),
(6, 'Kajian Akhwat', 'kajian-akhwat', '', '#eb00d7', 'ni ni-book-bookmark', 0, 'Kajian Akhwat Santriah Syubbaanul \'uluum', '2023-07-26 09:38:47', 1, 0),
(7, 'Muthola\'ah Santri', 'mutholaah-santri', '', '#e0b000', 'ni ni-books', 0, 'Muthola\'ah Santri setiap pekan bersama Tim 12', '2023-07-26 09:40:52', 1, 0),
(8, 'Muthola\'ah Muttabi', 'mutholaah-muttabi', '', '#000770', 'ni ni-books', 0, 'Muthola\'ah Muttabi dalam upaya memperkuat dan mengembangkan pemahaman sehingga mampu dan siap berdakwah di masyarakat', '2023-07-26 09:42:33', 1, 0),
(9, 'Progam Binaan', 'progam-binaan', '', '#0095b3', 'ni ni-circle-08', 0, 'Monitoring Program Binaan di luar santri', '2023-07-26 09:45:54', 1, 0),
(10, 'Pemetaan Dakwah', 'pemetaan-dakwah', '', '#098a00', 'ni ni-world', 0, 'Monitoring pemetaan dakwah di setiap kampung, komunitas, maupun masjid.', '2023-07-26 09:46:55', 1, 0),
(11, 'Bahasa Arab', 'bahasa-arab', '', '#cc0000', 'ni ni-books', 0, 'Pembelajaran Bahasa Arab Oleh Pembina', '2023-07-26 10:00:12', 1, 0);

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

-- --------------------------------------------------------

--
-- Table structure for table `a_update`
--

CREATE TABLE `a_update` (
  `id` int(10) NOT NULL,
  `version_name` varchar(10) NOT NULL,
  `store` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a_update`
--

INSERT INTO `a_update` (`id`, `version_name`, `store`, `is_active`) VALUES
(1, '1.2.9', 'com.su.service', 1),
(2, '1.0.0', 'com.cenah.syudaisabsensi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `a_usergroup`
--

CREATE TABLE `a_usergroup` (
  `id` int(11) NOT NULL,
  `kode` varchar(24) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `is_expired` int(1) NOT NULL DEFAULT 0,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='jenis pelanggan, grup pelanggan';

-- --------------------------------------------------------

--
-- Table structure for table `b_jadwal`
--

CREATE TABLE `b_jadwal` (
  `id` int(11) NOT NULL,
  `a_company_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_keluar` time NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `b_jadwal`
--

INSERT INTO `b_jadwal` (`id`, `a_company_id`, `nama`, `jam_masuk`, `jam_keluar`, `is_active`) VALUES
(1, 1, 'pagi', '06:45:00', '13:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `b_jadwal_kegiatan`
--

CREATE TABLE `b_jadwal_kegiatan` (
  `id` int(11) NOT NULL,
  `a_pengguna_id` int(4) DEFAULT NULL,
  `b_user_id` int(4) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `cdate` datetime NOT NULL,
  `sdate` datetime NOT NULL,
  `edate` datetime NOT NULL,
  `stime` time NOT NULL,
  `etime` time NOT NULL,
  `narasumber` varchar(255) NOT NULL,
  `gmaps_link` varchar(255) NOT NULL,
  `gmaps_lat` decimal(14,11) NOT NULL,
  `gmaps_long` decimal(14,11) NOT NULL,
  `negara` varchar(24) NOT NULL,
  `provinsi` varchar(78) NOT NULL,
  `kabkota` varchar(128) NOT NULL,
  `kecamatan` varchar(128) NOT NULL,
  `kelurahan` varchar(78) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kodepos` varchar(8) NOT NULL,
  `telp` varchar(24) NOT NULL,
  `deskripsi` text NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `is_rutin` int(1) NOT NULL DEFAULT 0,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `b_menu`
--

CREATE TABLE `b_menu` (
  `id` int(11) NOT NULL,
  `posisi` enum('main','mobile','footer_1','footer_2') NOT NULL DEFAULT 'main',
  `utype` enum('main_menu','sub_menu','sub_sub_menu','sub_sub_sub_menu') NOT NULL DEFAULT 'main_menu',
  `nama` varchar(255) NOT NULL,
  `icon_class` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '#',
  `url_type` enum('internal','external') NOT NULL DEFAULT 'internal',
  `priority` int(4) NOT NULL DEFAULT 0,
  `is_has_children` int(1) NOT NULL DEFAULT 0,
  `is_opentab` int(1) NOT NULL DEFAULT 0,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `b_menu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `b_menu`
--

INSERT INTO `b_menu` (`id`, `posisi`, `utype`, `nama`, `icon_class`, `url`, `url_type`, `priority`, `is_has_children`, `is_opentab`, `is_active`, `b_menu_id`) VALUES
(22, 'footer_2', 'main_menu', 'FAQ', '', 'bantuan/faq/', 'internal', 1, 0, 0, 1, NULL),
(23, 'footer_2', 'main_menu', 'Size Chart', '', 'bantuan/size_chart', 'internal', 2, 0, 0, 1, NULL),
(24, 'footer_2', 'main_menu', 'Payment Confirmation', '', 'konfirmasi', 'internal', 3, 0, 0, 1, NULL),
(25, 'footer_2', 'main_menu', 'SHAFIRA Store Location', '', 'dukungan/store_location', 'internal', 4, 0, 0, 1, NULL),
(26, 'footer_2', 'main_menu', 'Contact Us', '', 'dukungan/contact', 'internal', 6, 0, 0, 1, NULL),
(32, 'footer_1', 'main_menu', 'Ilmu', '', 'kategori/ilmu', 'internal', 1, 0, 0, 1, NULL),
(33, 'footer_1', 'main_menu', 'Khutbah', '', 'kategori/khutbah/', 'internal', 2, 0, 0, 1, NULL),
(34, 'footer_1', 'main_menu', 'Buku Tamu', '', 'bukutamu/', 'internal', 3, 0, 0, 1, NULL),
(35, 'footer_1', 'main_menu', 'Tanya Jawab', '', 'tanyajawab', 'internal', 4, 0, 0, 1, NULL),
(36, 'footer_1', 'main_menu', 'Tentang Kami', '', 'tentang', 'internal', 5, 0, 0, 1, NULL),
(37, 'footer_1', 'main_menu', 'Doa dan Dzikir', '', 'kategori/doa-dan-dzikir', 'internal', 6, 0, 0, 1, NULL),
(38, 'footer_1', 'main_menu', 'Kajian', '', 'kajian', 'internal', 7, 0, 0, 1, NULL),
(39, 'footer_1', 'main_menu', 'Kegiatan', '', 'kegiatan', 'internal', 8, 0, 0, 1, NULL),
(46, 'main', 'main_menu', 'Tanya Jawab', '', 'tanyajawab', 'internal', 4, 1, 0, 0, NULL),
(47, 'main', 'main_menu', 'Khutbah', '', 'blog/kategori/khutbah-jumat/', 'internal', 2, 0, 0, 0, NULL),
(48, 'main', 'sub_menu', 'Manhaj', '', 'kategori/manhaj', 'internal', 2, 0, 0, 1, 49),
(49, 'main', 'main_menu', 'Ilmu', '', 'blog/kategori/ilmu', 'internal', 1, 1, 0, 1, NULL),
(50, 'main', 'sub_menu', 'Tauhid', '', 'kategori/tauhid', 'internal', 1, 0, 0, 1, 49),
(51, 'main', 'sub_menu', 'Fiqih', '', 'kategori/fiqih', 'internal', 3, 1, 0, 1, 49),
(52, 'main', 'sub_menu', 'Muamalah', '', 'kategori/tenda-ringing', 'internal', 4, 0, 0, 1, 49),
(53, 'main', 'sub_menu', 'Sejarah', '', 'kategori/sejarah', 'internal', 6, 0, 0, 1, 49),
(55, 'main', 'sub_menu', 'Khutbah Jum\'at', '', 'kategori/khutbah-jumat', 'internal', 1, 0, 0, 0, 47),
(56, 'main', 'sub_menu', 'Khutbah hari raya', '', 'kategori/khutbah-hari-raya', 'internal', 2, 0, 0, 0, 47),
(57, 'main', 'sub_menu', 'Khutbah Umum', '', 'kategori/khutbah-umum', 'internal', 3, 0, 0, 0, 47),
(58, 'main', 'main_menu', 'Buku Tamu', '', 'bukutamu', 'internal', 4, 1, 0, 0, NULL),
(63, 'main', 'sub_menu', 'Client Tenda', '', 'http://pabriktendapromosi.blogspot.com/', 'external', 1, 0, 0, 1, 46),
(64, 'main', 'sub_menu', 'Video Tenda', '', 'https://www.youtube.com/channel/UCARBO0IS1Rs8DQjU2IYFhDw/videos', 'external', 2, 0, 0, 1, 46),
(65, 'main', 'main_menu', 'Tentang Kami', '', 'tentangkami', 'internal', 5, 0, 0, 1, NULL),
(66, 'main', 'sub_menu', 'Testimonial', '', 'testimonial/', 'internal', 3, 0, 0, 1, 46),
(67, 'main', 'sub_menu', 'Blog', '', 'blog/', 'internal', 4, 0, 0, 1, 46),
(68, 'main', 'main_menu', 'Kegiatan', '', 'kegiatan', 'internal', 3, 1, 0, 1, NULL),
(69, 'main', 'sub_menu', 'Tazkiyatunnufus', '', 'kategori/tazkiyatunnufus', 'internal', 2, 0, 0, 1, 49),
(70, 'main', 'main_menu', 'Syudais Quiz', '', 'quiz/', 'internal', 6, 0, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `b_user`
--

CREATE TABLE `b_user` (
  `id` int(7) NOT NULL,
  `a_company_id` int(5) DEFAULT NULL,
  `a_jabatan_id` int(5) DEFAULT NULL,
  `a_jamkerja_id` int(3) DEFAULT NULL,
  `fb_id` varchar(128) DEFAULT NULL,
  `google_id` varchar(128) DEFAULT NULL,
  `kode` varchar(24) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(56) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fnama` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'First Name',
  `lnama` varchar(255) NOT NULL COMMENT 'lastname',
  `utype` varchar(56) NOT NULL DEFAULT 'user',
  `latitude` decimal(14,10) NOT NULL,
  `longitude` decimal(14,10) NOT NULL,
  `kelamin` int(1) DEFAULT NULL COMMENT 'gender, 1=male,0=female',
  `bplace` varchar(48) NOT NULL DEFAULT '-',
  `bdate` date DEFAULT NULL COMMENT 'birth dat',
  `cdate` datetime NOT NULL COMMENT 'created date',
  `adate` date DEFAULT NULL COMMENT 'activation date',
  `edate` date DEFAULT NULL COMMENT 'deactivation date',
  `telp` varchar(25) NOT NULL COMMENT 'phone number',
  `image` varchar(255) NOT NULL COMMENT 'internal profile picture url',
  `intro_teks` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Profile welcome text',
  `alamat` varchar(72) NOT NULL DEFAULT '',
  `alamat2` varchar(72) NOT NULL DEFAULT '',
  `kecamatan` varchar(48) NOT NULL DEFAULT '',
  `kabkota` varchar(72) NOT NULL DEFAULT '-',
  `provinsi` varchar(72) NOT NULL DEFAULT '',
  `kodepos` varchar(8) NOT NULL DEFAULT '',
  `pekerjaan` varchar(48) NOT NULL DEFAULT '-',
  `fb` varchar(72) NOT NULL DEFAULT '',
  `ig` varchar(72) NOT NULL DEFAULT '',
  `api_web_token` varchar(48) NOT NULL DEFAULT '' COMMENT 'token for web api req',
  `api_mobile_token` varchar(32) NOT NULL DEFAULT '' COMMENT 'token for mobile api req',
  `api_social_id` varchar(48) NOT NULL DEFAULT '' COMMENT 'Social ID obtained from third party API request result',
  `fcm_token` varchar(255) NOT NULL COMMENT 'firebase content messaging token',
  `device` varchar(16) NOT NULL DEFAULT 'android',
  `poin` int(20) DEFAULT 0,
  `xp` int(11) NOT NULL DEFAULT 0,
  `is_agree` int(1) NOT NULL DEFAULT 0 COMMENT 'accepted aggrement',
  `is_confirmed` int(1) NOT NULL DEFAULT 0 COMMENT 'email confirmation, 1=confirmed, 0=not yet',
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='customer table, for seller and buyer';

--
-- Dumping data for table `b_user`
--

INSERT INTO `b_user` (`id`, `a_company_id`, `a_jabatan_id`, `a_jamkerja_id`, `fb_id`, `google_id`, `kode`, `email`, `username`, `password`, `fnama`, `lnama`, `utype`, `latitude`, `longitude`, `kelamin`, `bplace`, `bdate`, `cdate`, `adate`, `edate`, `telp`, `image`, `intro_teks`, `alamat`, `alamat2`, `kecamatan`, `kabkota`, `provinsi`, `kodepos`, `pekerjaan`, `fb`, `ig`, `api_web_token`, `api_mobile_token`, `api_social_id`, `fcm_token`, `device`, `poin`, `xp`, `is_agree`, `is_confirmed`, `is_active`, `is_deleted`) VALUES
(1, NULL, 1, NULL, NULL, '', '', 'ruslan.gnw@gmail.com', 'ruslan_gnw', '4fdc4267a19395c607558570de9f3a85', 'Ust. Ruslan Gunawan, S. Ag, M. Pd', '', 'Pembina', '0.0000000000', '0.0000000000', 0, '-', '2023-07-26', '2023-07-26 09:30:38', '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', '', '', '-', '', '', '', '', '', '', 'android', 0, 0, 0, 0, 1, 0),
(2, NULL, 4, NULL, NULL, '', '', 'rezziqbal@gmail.com', 'rezziqbal', '$2y$10$Z.V9jaqGU7VcVyPB8gTizeRqn/l7FogHLfIe.ZhAMzBZPAGq11uZq', 'Rezza Muhammad Iqbal', '', 'Tim Pengembangan Santri', '0.0000000000', '0.0000000000', 0, '-', NULL, '2023-07-26 09:51:30', '0000-00-00', '0000-00-00', '', 'media/user/2023/07/62-2-.png', '', '', '', '', '', '', '', '-', '', '', '', '4GCM3NM', '', '', 'web', 100, 100, 0, 1, 1, 0),
(7, NULL, NULL, NULL, NULL, '4lh4lBJk2SR6DKedpqAj5tSUkzw1', '', 'syubbaanululuum@gmail.com', '', '4fdc4267a19395c607558570de9f3a85', 'SYUDAIS TV', '', 'admin', '0.0000000000', '0.0000000000', NULL, '-', NULL, '2020-06-22 20:18:43', NULL, NULL, '', 'https://lh3.googleusercontent.com/a-/AOh14GheyZOIV0M4Dbe4-JFbzUnx7p06cWWaO18rs7MZ=s96-c', '', '', '', '', '-', '', '', '-', '', '', '', '8B79HJB', '', 'cpvStAjsvBU:APA91bGa-PSZqQI4REtfmQWWqOegVuArfm_sBZ5iaGmzcVoXoqWUPEH5Qj1oYDmQ4NaoGIVK9l0ITCMksW2aOeSWtPjzRVaJGrOY4pFTeN3RZ6zlyBB9OvWCIn8uWuMSWxmC95GM7ouO', 'android', 0, 0, 0, 1, 1, 1),
(8, NULL, 2, NULL, NULL, '', '', 'sandi.komarulloh@gmail.com', 'sandikom', '4fdc4267a19395c607558570de9f3a85', 'Sandi Komarulloh', '', 'Tim 12', '0.0000000000', '0.0000000000', 0, '-', NULL, '2023-07-26 09:30:17', '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', '', '', '-', '', '', '', 'M3FQJBQ', '', 'dlkldO9mkpo:APA91bFEEMRySg2mlUj6gaivVXDfoZhvA4NcvkqInUTcUyzynFjoG2anEXWiVzRjt3ZnxDELmU1GUKxCHLJdgmWEM0PshLingJAywImi2hy81OZ03kazamBk4IYxR5ekcezRgSKCnnGr', 'android', 0, 0, 0, 1, 1, 0),
(9, NULL, NULL, NULL, NULL, 'EN33XMq0lpROoAVmYonsh9GYLlp2', '', 'imampenida@gmail.com', '', '4fdc4267a19395c607558570de9f3a85', 'Imam Penida', '', 'user', '0.0000000000', '0.0000000000', NULL, '-', NULL, '2020-07-12 14:48:39', NULL, NULL, '', 'https://lh5.googleusercontent.com/-zZDJ3iL50A0/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmKk6zjvGS8w4mybRdR8FmONJq2ew/s96-c/photo.jpg', '', '', '', '', '-', '', '', '-', '', '', '', 'L0G2JLN', '', 'fu-AWqdNQxc:APA91bFmkMLKLK3J0-XOhO5o0Wawh1vyYT2KlDk3wVogWEt92aD4ZHYKb6GrVRIWIbLA94KY7ScIyInfhzoVt5wkvCpaaAqU_uW3TUMgGD3pSKZM-cUuLGdZNZnMO3GRJ1T9XJPTvAho', 'android', 0, 0, 0, 1, 1, 1),
(10, NULL, 7, NULL, NULL, '', '', 'presidenmihp@gmail.com', '', '4fdc4267a19395c607558570de9f3a85', 'Imam Pramono', '', 'Tim Ta\'lim Wa Ta\'allum', '0.0000000000', '0.0000000000', 0, '-', NULL, '2023-07-26 09:30:04', '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', '', '', '-', '', '', '', 'B5MJ74D', '', 'fu-AWqdNQxc:APA91bFmkMLKLK3J0-XOhO5o0Wawh1vyYT2KlDk3wVogWEt92aD4ZHYKb6GrVRIWIbLA94KY7ScIyInfhzoVt5wkvCpaaAqU_uW3TUMgGD3pSKZM-cUuLGdZNZnMO3GRJ1T9XJPTvAho', 'android', 0, 0, 0, 1, 1, 0),
(11, NULL, NULL, NULL, NULL, 'jbUilM3HUrZa9sSLQJ8s24aynvX2', '', 'rxpluscnx1@gmail.com', '', '4fdc4267a19395c607558570de9f3a85', 'Google CNX', '', 'user', '0.0000000000', '0.0000000000', NULL, '-', NULL, '2021-09-23 17:13:40', NULL, NULL, '', 'https://lh3.googleusercontent.com/a/AATXAJzwVsSLqg84KVSFPSA13Vr9l5jQIFjAJKbIMmM=s96-c', '', '', '', '', '-', '', '', '-', '', '', '', 'MI9I6XD', '', 'f6LTpztSvFw:APA91bEMn1I_cN_FVj66Y3KzaILHZHXN7-h6rB8ATNWdpX0x1bmyAOn7yDGH28zGvtAwqC3j8kkCEZ9bNmf-g40JiZmC7692SffYCAAYMD75_54_wN76M6ERUC9a4A3_EOrsTaKrYP-i', 'android', 0, 0, 0, 0, 1, 1),
(12, NULL, NULL, NULL, NULL, '8sHkj5Vz9feKYt9q19hIrSJVGG23', '', 'sukahijiofficial@gmail.com', '', '4fdc4267a19395c607558570de9f3a85', 'Sukahiji Official', '', 'user', '0.0000000000', '0.0000000000', NULL, '-', NULL, '2021-09-26 16:59:20', NULL, NULL, '', 'https://lh3.googleusercontent.com/a/AATXAJz-RLyY5ukRBCNIjIe4XRKYf-v1ulXUSKJv0rf8=s96-c', '', '', '', '', '-', '', '', '-', '', '', '', '2C3NIGX', '', 'dopLmF9tZOs:APA91bFdykyCc_Elp-SpP7DKBgqQX_HOCCB2QAVKkCzr9y644B9ILua-vgKaI0Uvn2SmYWfsYdIpaisZbA6UwHzKNuDSUsfJp4twMrxVOZPdTqQmaJyw9Dwm9bb4lFYxql4nhhWJ7-h4', 'android', 0, 0, 0, 1, 1, 1),
(13, NULL, NULL, NULL, NULL, 'RGPLHY7wy2fEUlaIxozRUBFq1Pa2', '', 'boracayproject16@gmail.com', '', '4fdc4267a19395c607558570de9f3a85', 'Project Boracay', '', 'user', '0.0000000000', '0.0000000000', NULL, '-', NULL, '2021-09-27 14:57:45', NULL, NULL, '', 'https://lh3.googleusercontent.com/a/AATXAJzcHf7O51qkK8574muAjD31QOwIsAZZVMDpNyJ6=s96-c', '', '', '', '', '-', '', '', '-', '', '', '', 'ECJ707G', '', 'fEi1p_iZaz8:APA91bHojDb_6Fqp_KZF3GHEIEGivBmKhBrB9laiwXg6WnWeon_AxSHArXaKxNFlyyGsN1hrkhFLPl_qs2YCENQBHVA01NCWbXMaWiFKuhyguLfOHPcUoWVae0o26JotUqVhPd2q6q3C', 'android', 0, 0, 0, 1, 1, 1),
(14, NULL, NULL, NULL, NULL, 'fX8cxpZiSvZo5PGsXe9di96VvOT2', '', 'dffitzg@gmail.com', '', '4fdc4267a19395c607558570de9f3a85', 'DFF Test ABC', '', 'user', '0.0000000000', '0.0000000000', NULL, '-', NULL, '2021-09-28 23:21:59', NULL, NULL, '', 'https://lh3.googleusercontent.com/a/AATXAJyZqpMx_Y-qdTjwX9pvYy2G4fjydIf00sABajTx=s96-c', '', '', '', '', '-', '', '', '-', '', '', '', 'HQQ3C7G', '', 'ehLMyGKOcKE:APA91bFHnW1_8l2w0fJY1V5kmH0cUvOyZheACxCyV5rKf6NOQh6GNf4iEtQhScpz8cxWTQbd3U-3K7oNJBf_68GRz8ymuA2-XhgqcyFCIVfKnSxEHxvBKz6SXM2hE6DBe_pyM8iV0kYS', 'android', 0, 0, 0, 1, 1, 1),
(15, NULL, NULL, NULL, NULL, 'o1TRa4AlTvcOkoHc0PeQdbVDfMQ2', '', 'boracay.dffthree2021@gmail.com', '', '4fdc4267a19395c607558570de9f3a85', 'DFF Test3', '', 'user', '0.0000000000', '0.0000000000', NULL, '-', NULL, '2021-09-29 22:43:40', NULL, NULL, '', 'https://lh3.googleusercontent.com/a/AATXAJzLLEjncdOJDNpHYYZ_pykWL_idIHsxMNErGJPz=s96-c', '', '', '', '', '-', '', '', '-', '', '', '', 'EHGHKQQ', '', 'cu8x2l7T4UQ:APA91bEgd4C_2Zkh42DzIvSn3t12Q9rO95Q06y8kpCoEkxqAV_K3ZfmAqzn_ZA1_I5XoGFdJlgRrM0I5AmjAXSZT5nSNmERdJwSIhE8v4lLxyBmPIzakjuSzwHH0mBIecwJfeSio-TyD', 'android', 0, 0, 0, 1, 1, 1),
(16, NULL, NULL, NULL, NULL, 'PeDN49YiO5T7MNKYYmAvIcH44n13', '', 'ballrezz@gmail.com', '', '4fdc4267a19395c607558570de9f3a85', 'Rezza Muhammad Iqbal', '', 'user', '0.0000000000', '0.0000000000', NULL, '-', NULL, '2021-10-07 19:32:25', NULL, NULL, '', 'https://lh6.googleusercontent.com/-B9FJTlPYnLo/AAAAAAAAAAI/AAAAAAAAAAA/AAKWJJPjhDZxXsOFur_aaxBu7fvAL0YYcg/s96-c/photo.jpg', '', '', '', '', '-', '', '', '-', '', '', '', '4H55JQ6', '', 'dopLmF9tZOs:APA91bFdykyCc_Elp-SpP7DKBgqQX_HOCCB2QAVKkCzr9y644B9ILua-vgKaI0Uvn2SmYWfsYdIpaisZbA6UwHzKNuDSUsfJp4twMrxVOZPdTqQmaJyw9Dwm9bb4lFYxql4nhhWJ7-h4', 'android', 0, 0, 0, 0, 1, 1),
(17, NULL, NULL, NULL, NULL, 'QJZxSbha8QSmfRvzoDvY2j2s0UQ2', '', 'testboramnl@gmail.com', '', '4fdc4267a19395c607558570de9f3a85', 'john Doe', '', 'user', '0.0000000000', '0.0000000000', NULL, '-', NULL, '2021-10-08 02:21:27', NULL, NULL, '', 'https://lh3.googleusercontent.com/a/AATXAJw-hDtRv93epttKb3dpQrX1nXIPzvaka_9ix2I5=s96-c', '', '', '', '', '-', '', '', '-', '', '', '', 'H06K4QJ', '', 'cvrFFQNXiW0:APA91bGJAf1YXFtE7AnZf1r06qtV4l7uZ76xGsww3pR9r_jaL9rg5xLQn3RbPxj8cbMDrBMZ_-FrWhX86WA6-Zoi8kJeGwLLedBBUIKRrx1BPf-KKQAHy7bfZyeS74zBiUwO53xYwiA4', 'android', 0, 0, 0, 1, 1, 1),
(18, NULL, NULL, NULL, NULL, 'pTARuTha0KdERg5h75WfoCc8zRR2', '', 'babel3126341@gmail.com', '', '4fdc4267a19395c607558570de9f3a85', 'Babel Kl', '', 'user', '0.0000000000', '0.0000000000', NULL, '-', NULL, '2022-11-07 10:20:47', NULL, NULL, '', 'https://lh3.googleusercontent.com/a/ALm5wu3C5tyWk0dY7ekFym8UWB2yPN-3p4o6mHCh_lUE=s96-c', '', '', '', '', '-', '', '', '-', '', '', '', 'IL9QM77', '', 'dIK3DnK5Nt4:APA91bFuydhPLqpgYsLtu1DGtedlyxUBwuCLP0M_wSZTIKUJ9abXTVJ37tuX6FL_LmVDJiPevPlDAtUkbHte1XXv6vu0RkKK2Sh4-zeHNOk9MbAq9228RKvi3Rgr4hVCj36Yz40eg_eT', 'android', 0, 0, 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `b_user_alamat`
--

CREATE TABLE `b_user_alamat` (
  `id` int(11) NOT NULL,
  `b_user_id` int(11) NOT NULL,
  `nama_alamat` varchar(50) NOT NULL,
  `nama_penerima` varchar(255) NOT NULL,
  `telp` varchar(25) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kelurahan` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kabkota` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `negara` varchar(255) NOT NULL,
  `kodepos` varchar(10) NOT NULL,
  `is_default` int(1) NOT NULL DEFAULT 1,
  `is_active` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='buku alamat untuk user';

-- --------------------------------------------------------

--
-- Table structure for table `b_user_module`
--

CREATE TABLE `b_user_module` (
  `id` int(11) NOT NULL,
  `a_jabatan_id` int(11) NOT NULL,
  `b_user_id` int(11) NOT NULL,
  `a_program_id` int(11) NOT NULL,
  `type` varchar(56) NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_deleted` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `b_user_module`
--

INSERT INTO `b_user_module` (`id`, `a_jabatan_id`, `b_user_id`, `a_program_id`, `type`, `cdate`, `is_active`, `is_deleted`) VALUES
(340, 4, 0, 7, 'melihat_jadwal', '2023-07-26 09:55:23', 1, 0),
(341, 4, 0, 7, 'update_jadwal', '2023-07-26 09:55:23', 1, 0),
(342, 4, 0, 7, 'hapus_jadwal', '2023-07-26 09:55:23', 1, 0),
(343, 4, 0, 7, 'export_jadwal', '2023-07-26 09:55:23', 1, 0),
(344, 4, 0, 7, 'melihat_berita_acara', '2023-07-26 09:55:23', 1, 0),
(345, 4, 0, 7, 'update_berita_acara', '2023-07-26 09:55:23', 1, 0),
(346, 4, 0, 7, 'hapus_berita_acara', '2023-07-26 09:55:23', 1, 0),
(347, 4, 0, 7, 'komentar_berita_acara', '2023-07-26 09:55:23', 1, 0),
(348, 4, 0, 7, 'export_berita_acara', '2023-07-26 09:55:23', 1, 0),
(349, 4, 0, 7, 'melihat_absensi', '2023-07-26 09:55:23', 1, 0),
(350, 4, 0, 7, 'update_absensi', '2023-07-26 09:55:23', 1, 0),
(351, 4, 0, 7, 'hapus_absensi', '2023-07-26 09:55:23', 1, 0),
(352, 4, 0, 7, 'export_absensi', '2023-07-26 09:55:23', 1, 0),
(353, 4, 0, 8, 'melihat_jadwal', '2023-07-26 09:55:23', 1, 0),
(354, 4, 0, 8, 'update_jadwal', '2023-07-26 09:55:23', 1, 0),
(355, 4, 0, 8, 'hapus_jadwal', '2023-07-26 09:55:23', 1, 0),
(356, 4, 0, 8, 'export_jadwal', '2023-07-26 09:55:23', 1, 0),
(357, 4, 0, 8, 'melihat_berita_acara', '2023-07-26 09:55:23', 1, 0),
(358, 4, 0, 8, 'update_berita_acara', '2023-07-26 09:55:23', 1, 0),
(359, 4, 0, 8, 'hapus_berita_acara', '2023-07-26 09:55:23', 1, 0),
(360, 4, 0, 8, 'komentar_berita_acara', '2023-07-26 09:55:23', 1, 0),
(361, 4, 0, 8, 'export_berita_acara', '2023-07-26 09:55:23', 1, 0),
(362, 4, 0, 8, 'melihat_absensi', '2023-07-26 09:55:23', 1, 0),
(363, 4, 0, 8, 'update_absensi', '2023-07-26 09:55:23', 1, 0),
(364, 4, 0, 8, 'hapus_absensi', '2023-07-26 09:55:23', 1, 0),
(365, 4, 0, 8, 'export_absensi', '2023-07-26 09:55:23', 1, 0),
(366, 4, 0, 9, 'melihat_jadwal', '2023-07-26 09:55:23', 1, 0),
(367, 4, 0, 9, 'update_jadwal', '2023-07-26 09:55:23', 1, 0),
(368, 4, 0, 9, 'hapus_jadwal', '2023-07-26 09:55:23', 1, 0),
(369, 4, 0, 9, 'export_jadwal', '2023-07-26 09:55:23', 1, 0),
(370, 4, 0, 9, 'melihat_berita_acara', '2023-07-26 09:55:23', 1, 0),
(371, 4, 0, 9, 'update_berita_acara', '2023-07-26 09:55:23', 1, 0),
(372, 4, 0, 9, 'hapus_berita_acara', '2023-07-26 09:55:23', 1, 0),
(373, 4, 0, 9, 'komentar_berita_acara', '2023-07-26 09:55:23', 1, 0),
(374, 4, 0, 9, 'export_berita_acara', '2023-07-26 09:55:23', 1, 0),
(375, 4, 0, 9, 'melihat_absensi', '2023-07-26 09:55:23', 1, 0),
(376, 4, 0, 9, 'update_absensi', '2023-07-26 09:55:23', 1, 0),
(377, 4, 0, 9, 'hapus_absensi', '2023-07-26 09:55:23', 1, 0),
(378, 4, 0, 9, 'export_absensi', '2023-07-26 09:55:23', 1, 0),
(379, 4, 0, 10, 'melihat_jadwal', '2023-07-26 09:55:23', 1, 0),
(380, 4, 0, 10, 'update_jadwal', '2023-07-26 09:55:23', 1, 0),
(381, 4, 0, 10, 'hapus_jadwal', '2023-07-26 09:55:23', 1, 0),
(382, 4, 0, 10, 'export_jadwal', '2023-07-26 09:55:23', 1, 0),
(383, 4, 0, 10, 'melihat_berita_acara', '2023-07-26 09:55:23', 1, 0),
(384, 4, 0, 10, 'update_berita_acara', '2023-07-26 09:55:23', 1, 0),
(385, 4, 0, 10, 'hapus_berita_acara', '2023-07-26 09:55:23', 1, 0),
(386, 4, 0, 10, 'komentar_berita_acara', '2023-07-26 09:55:23', 1, 0),
(387, 4, 0, 10, 'export_berita_acara', '2023-07-26 09:55:23', 1, 0),
(388, 4, 0, 10, 'melihat_absensi', '2023-07-26 09:55:23', 1, 0),
(389, 4, 0, 10, 'update_absensi', '2023-07-26 09:55:23', 1, 0),
(390, 4, 0, 10, 'hapus_absensi', '2023-07-26 09:55:23', 1, 0),
(391, 4, 0, 10, 'export_absensi', '2023-07-26 09:55:23', 1, 0),
(496, 7, 0, 2, 'melihat_jadwal', '2023-07-26 10:01:34', 1, 0),
(497, 7, 0, 2, 'update_jadwal', '2023-07-26 10:01:34', 1, 0),
(498, 7, 0, 2, 'hapus_jadwal', '2023-07-26 10:01:34', 1, 0),
(499, 7, 0, 2, 'export_jadwal', '2023-07-26 10:01:34', 1, 0),
(500, 7, 0, 2, 'melihat_berita_acara', '2023-07-26 10:01:34', 1, 0),
(501, 7, 0, 2, 'update_berita_acara', '2023-07-26 10:01:34', 1, 0),
(502, 7, 0, 2, 'hapus_berita_acara', '2023-07-26 10:01:34', 1, 0),
(503, 7, 0, 2, 'komentar_berita_acara', '2023-07-26 10:01:34', 1, 0),
(504, 7, 0, 2, 'export_berita_acara', '2023-07-26 10:01:34', 1, 0),
(505, 7, 0, 2, 'melihat_tugas', '2023-07-26 10:01:34', 1, 0),
(506, 7, 0, 2, 'update_tugas', '2023-07-26 10:01:34', 1, 0),
(507, 7, 0, 2, 'hapus_tugas', '2023-07-26 10:01:34', 1, 0),
(508, 7, 0, 2, 'komentar_tugas', '2023-07-26 10:01:34', 1, 0),
(509, 7, 0, 2, 'mengerjakan_tugas', '2023-07-26 10:01:34', 1, 0),
(510, 7, 0, 2, 'rate_tugas', '2023-07-26 10:01:34', 1, 0),
(511, 7, 0, 2, 'export_tugas', '2023-07-26 10:01:34', 1, 0),
(512, 7, 0, 2, 'melihat_absensi', '2023-07-26 10:01:34', 1, 0),
(513, 7, 0, 2, 'update_absensi', '2023-07-26 10:01:34', 1, 0),
(514, 7, 0, 2, 'hapus_absensi', '2023-07-26 10:01:34', 1, 0),
(515, 7, 0, 2, 'export_absensi', '2023-07-26 10:01:34', 1, 0),
(516, 7, 0, 6, 'melihat_jadwal', '2023-07-26 10:01:34', 1, 0),
(517, 7, 0, 6, 'update_jadwal', '2023-07-26 10:01:34', 1, 0),
(518, 7, 0, 6, 'hapus_jadwal', '2023-07-26 10:01:34', 1, 0),
(519, 7, 0, 6, 'export_jadwal', '2023-07-26 10:01:34', 1, 0),
(520, 7, 0, 6, 'melihat_berita_acara', '2023-07-26 10:01:34', 1, 0),
(521, 7, 0, 6, 'update_berita_acara', '2023-07-26 10:01:34', 1, 0),
(522, 7, 0, 6, 'hapus_berita_acara', '2023-07-26 10:01:34', 1, 0),
(523, 7, 0, 6, 'komentar_berita_acara', '2023-07-26 10:01:34', 1, 0),
(524, 7, 0, 6, 'export_berita_acara', '2023-07-26 10:01:34', 1, 0),
(525, 7, 0, 6, 'melihat_tugas', '2023-07-26 10:01:34', 1, 0),
(526, 7, 0, 6, 'update_tugas', '2023-07-26 10:01:34', 1, 0),
(527, 7, 0, 6, 'hapus_tugas', '2023-07-26 10:01:34', 1, 0),
(528, 7, 0, 6, 'komentar_tugas', '2023-07-26 10:01:34', 1, 0),
(529, 7, 0, 6, 'mengerjakan_tugas', '2023-07-26 10:01:34', 1, 0),
(530, 7, 0, 6, 'rate_tugas', '2023-07-26 10:01:34', 1, 0),
(531, 7, 0, 6, 'export_tugas', '2023-07-26 10:01:34', 1, 0),
(532, 7, 0, 6, 'melihat_absensi', '2023-07-26 10:01:34', 1, 0),
(533, 7, 0, 6, 'update_absensi', '2023-07-26 10:01:34', 1, 0),
(534, 7, 0, 6, 'hapus_absensi', '2023-07-26 10:01:34', 1, 0),
(535, 7, 0, 6, 'export_absensi', '2023-07-26 10:01:34', 1, 0),
(536, 7, 0, 11, 'melihat_jadwal', '2023-07-26 10:01:34', 1, 0),
(537, 7, 0, 11, 'update_jadwal', '2023-07-26 10:01:34', 1, 0),
(538, 7, 0, 11, 'hapus_jadwal', '2023-07-26 10:01:34', 1, 0),
(539, 7, 0, 11, 'export_jadwal', '2023-07-26 10:01:34', 1, 0),
(540, 7, 0, 11, 'melihat_berita_acara', '2023-07-26 10:01:34', 1, 0),
(541, 7, 0, 11, 'update_berita_acara', '2023-07-26 10:01:34', 1, 0),
(542, 7, 0, 11, 'hapus_berita_acara', '2023-07-26 10:01:34', 1, 0),
(543, 7, 0, 11, 'komentar_berita_acara', '2023-07-26 10:01:34', 1, 0),
(544, 7, 0, 11, 'export_berita_acara', '2023-07-26 10:01:34', 1, 0),
(545, 7, 0, 11, 'melihat_tugas', '2023-07-26 10:01:34', 1, 0),
(546, 7, 0, 11, 'komentar_tugas', '2023-07-26 10:01:34', 1, 0),
(547, 7, 0, 11, 'mengerjakan_tugas', '2023-07-26 10:01:34', 1, 0),
(548, 7, 0, 11, 'export_tugas', '2023-07-26 10:01:34', 1, 0),
(549, 7, 0, 11, 'melihat_absensi', '2023-07-26 10:01:34', 1, 0),
(550, 7, 0, 11, 'update_absensi', '2023-07-26 10:01:34', 1, 0),
(551, 7, 0, 11, 'hapus_absensi', '2023-07-26 10:01:34', 1, 0),
(552, 7, 0, 11, 'export_absensi', '2023-07-26 10:01:34', 1, 0),
(553, 1, 0, 2, 'melihat_jadwal', '2023-07-26 10:02:07', 1, 0),
(554, 1, 0, 2, 'melihat_berita_acara', '2023-07-26 10:02:07', 1, 0),
(555, 1, 0, 2, 'melihat_absensi', '2023-07-26 10:02:07', 1, 0),
(556, 1, 0, 6, 'melihat_jadwal', '2023-07-26 10:02:07', 1, 0),
(557, 1, 0, 6, 'melihat_berita_acara', '2023-07-26 10:02:07', 1, 0),
(558, 1, 0, 6, 'melihat_absensi', '2023-07-26 10:02:07', 1, 0),
(559, 1, 0, 7, 'melihat_jadwal', '2023-07-26 10:02:07', 1, 0),
(560, 1, 0, 7, 'melihat_berita_acara', '2023-07-26 10:02:07', 1, 0),
(561, 1, 0, 7, 'melihat_absensi', '2023-07-26 10:02:07', 1, 0),
(562, 1, 0, 8, 'melihat_jadwal', '2023-07-26 10:02:07', 1, 0),
(563, 1, 0, 8, 'melihat_berita_acara', '2023-07-26 10:02:07', 1, 0),
(564, 1, 0, 8, 'melihat_absensi', '2023-07-26 10:02:07', 1, 0),
(565, 1, 0, 9, 'melihat_jadwal', '2023-07-26 10:02:07', 1, 0),
(566, 1, 0, 9, 'melihat_berita_acara', '2023-07-26 10:02:07', 1, 0),
(567, 1, 0, 9, 'melihat_absensi', '2023-07-26 10:02:07', 1, 0),
(568, 1, 0, 10, 'melihat_jadwal', '2023-07-26 10:02:07', 1, 0),
(569, 1, 0, 10, 'melihat_berita_acara', '2023-07-26 10:02:07', 1, 0),
(570, 1, 0, 10, 'melihat_absensi', '2023-07-26 10:02:07', 1, 0),
(571, 1, 0, 11, 'melihat_jadwal', '2023-07-26 10:02:07', 1, 0),
(572, 1, 0, 11, 'melihat_berita_acara', '2023-07-26 10:02:07', 1, 0),
(573, 1, 0, 11, 'melihat_tugas', '2023-07-26 10:02:07', 1, 0),
(574, 1, 0, 11, 'update_tugas', '2023-07-26 10:02:07', 1, 0),
(575, 1, 0, 11, 'hapus_tugas', '2023-07-26 10:02:07', 1, 0),
(576, 1, 0, 11, 'komentar_tugas', '2023-07-26 10:02:07', 1, 0),
(577, 1, 0, 11, 'rate_tugas', '2023-07-26 10:02:07', 1, 0),
(578, 1, 0, 11, 'export_tugas', '2023-07-26 10:02:07', 1, 0),
(579, 1, 0, 11, 'melihat_absensi', '2023-07-26 10:02:07', 1, 0),
(580, 2, 0, 2, 'melihat_berita_acara', '2023-07-26 10:02:55', 1, 0),
(581, 2, 0, 2, 'update_berita_acara', '2023-07-26 10:02:55', 1, 0),
(582, 2, 0, 2, 'hapus_berita_acara', '2023-07-26 10:02:55', 1, 0),
(583, 2, 0, 2, 'komentar_berita_acara', '2023-07-26 10:02:55', 1, 0),
(584, 2, 0, 2, 'export_berita_acara', '2023-07-26 10:02:55', 1, 0),
(585, 2, 0, 2, 'melihat_absensi', '2023-07-26 10:02:55', 1, 0),
(586, 2, 0, 2, 'update_absensi', '2023-07-26 10:02:55', 1, 0),
(587, 2, 0, 2, 'hapus_absensi', '2023-07-26 10:02:55', 1, 0),
(588, 2, 0, 2, 'export_absensi', '2023-07-26 10:02:55', 1, 0),
(589, 2, 0, 6, 'melihat_berita_acara', '2023-07-26 10:02:55', 1, 0),
(590, 2, 0, 6, 'update_berita_acara', '2023-07-26 10:02:55', 1, 0),
(591, 2, 0, 6, 'hapus_berita_acara', '2023-07-26 10:02:55', 1, 0),
(592, 2, 0, 6, 'komentar_berita_acara', '2023-07-26 10:02:55', 1, 0),
(593, 2, 0, 6, 'export_berita_acara', '2023-07-26 10:02:55', 1, 0),
(594, 2, 0, 6, 'melihat_absensi', '2023-07-26 10:02:55', 1, 0),
(595, 2, 0, 6, 'update_absensi', '2023-07-26 10:02:55', 1, 0),
(596, 2, 0, 6, 'hapus_absensi', '2023-07-26 10:02:55', 1, 0),
(597, 2, 0, 6, 'export_absensi', '2023-07-26 10:02:55', 1, 0),
(598, 2, 0, 7, 'melihat_berita_acara', '2023-07-26 10:02:55', 1, 0),
(599, 2, 0, 7, 'update_berita_acara', '2023-07-26 10:02:55', 1, 0),
(600, 2, 0, 7, 'hapus_berita_acara', '2023-07-26 10:02:55', 1, 0),
(601, 2, 0, 7, 'komentar_berita_acara', '2023-07-26 10:02:55', 1, 0),
(602, 2, 0, 7, 'export_berita_acara', '2023-07-26 10:02:55', 1, 0),
(603, 2, 0, 7, 'melihat_absensi', '2023-07-26 10:02:55', 1, 0),
(604, 2, 0, 7, 'update_absensi', '2023-07-26 10:02:55', 1, 0),
(605, 2, 0, 7, 'hapus_absensi', '2023-07-26 10:02:55', 1, 0),
(606, 2, 0, 7, 'export_absensi', '2023-07-26 10:02:55', 1, 0),
(607, 2, 0, 8, 'melihat_berita_acara', '2023-07-26 10:02:55', 1, 0),
(608, 2, 0, 8, 'update_berita_acara', '2023-07-26 10:02:55', 1, 0),
(609, 2, 0, 8, 'hapus_berita_acara', '2023-07-26 10:02:55', 1, 0),
(610, 2, 0, 8, 'komentar_berita_acara', '2023-07-26 10:02:55', 1, 0),
(611, 2, 0, 8, 'export_berita_acara', '2023-07-26 10:02:55', 1, 0),
(612, 2, 0, 8, 'melihat_absensi', '2023-07-26 10:02:55', 1, 0),
(613, 2, 0, 8, 'update_absensi', '2023-07-26 10:02:55', 1, 0),
(614, 2, 0, 8, 'hapus_absensi', '2023-07-26 10:02:55', 1, 0),
(615, 2, 0, 8, 'export_absensi', '2023-07-26 10:02:55', 1, 0),
(616, 2, 0, 9, 'melihat_berita_acara', '2023-07-26 10:02:55', 1, 0),
(617, 2, 0, 9, 'update_berita_acara', '2023-07-26 10:02:55', 1, 0),
(618, 2, 0, 9, 'hapus_berita_acara', '2023-07-26 10:02:55', 1, 0),
(619, 2, 0, 9, 'komentar_berita_acara', '2023-07-26 10:02:55', 1, 0),
(620, 2, 0, 9, 'export_berita_acara', '2023-07-26 10:02:55', 1, 0),
(621, 2, 0, 10, 'melihat_berita_acara', '2023-07-26 10:02:55', 1, 0),
(622, 2, 0, 10, 'update_berita_acara', '2023-07-26 10:02:55', 1, 0),
(623, 2, 0, 10, 'hapus_berita_acara', '2023-07-26 10:02:55', 1, 0),
(624, 2, 0, 10, 'komentar_berita_acara', '2023-07-26 10:02:55', 1, 0),
(625, 2, 0, 10, 'export_berita_acara', '2023-07-26 10:02:55', 1, 0),
(626, 2, 0, 11, 'melihat_tugas', '2023-07-26 10:02:55', 1, 0),
(627, 2, 0, 11, 'mengerjakan_tugas', '2023-07-26 10:02:55', 1, 0),
(628, 2, 0, 11, 'melihat_absensi', '2023-07-26 10:02:55', 1, 0),
(629, 2, 0, 11, 'update_absensi', '2023-07-26 10:02:55', 1, 0),
(630, 2, 0, 11, 'hapus_absensi', '2023-07-26 10:02:55', 1, 0),
(631, 2, 0, 11, 'export_absensi', '2023-07-26 10:02:55', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `b_user_test`
--

CREATE TABLE `b_user_test` (
  `id` int(11) NOT NULL,
  `b_user_id` int(11) NOT NULL,
  `d_test_id` int(11) NOT NULL,
  `poin` int(12) DEFAULT 0,
  `persen` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `b_user_test`
--

INSERT INTO `b_user_test` (`id`, `b_user_id`, `d_test_id`, `poin`, `persen`) VALUES
(6, 2, 3, 100, 100);

-- --------------------------------------------------------

--
-- Table structure for table `c_donasi`
--

CREATE TABLE `c_donasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text CHARACTER SET utf8 NOT NULL,
  `dana` varchar(128) NOT NULL,
  `rekening` varchar(128) NOT NULL,
  `bank` varchar(54) NOT NULL,
  `atas_nama` varchar(128) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `nomor` varchar(15) NOT NULL,
  `wa` varchar(15) NOT NULL,
  `latitude` varchar(28) NOT NULL,
  `longitude` varchar(28) NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c_donasi`
--

INSERT INTO `c_donasi` (`id`, `nama`, `deskripsi`, `dana`, `rekening`, `bank`, `atas_nama`, `thumb`, `gambar`, `nomor`, `wa`, `latitude`, `longitude`, `cdate`, `is_active`) VALUES
(7, 'Donasi Mesjid', 'sjkdkfkfkf\nfjfmfmfkfkfkjf\ndjfjfnmfmfmfkd', '', '67686865', '', 'Rezza Muhammad', '', '', '085789701750', '085789701750', '0', '0', '2020-06-10 07:28:14', 1),
(8, 'test testtest', 'sdjgbkdsfgbfsdgpijrsdfgr', '', '0', '', '0', '', '', '0', '085789701750', '0', '0', '2020-06-10 07:33:23', 1),
(9, 'Donasi Mesjid', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '', '64646262', '', 'Rezza Muhammad', '', '', '085789701750', '085789701750', '0', '0', '2020-06-10 07:43:31', 1),
(11, 'Donasi Mesjid syubbaanul Uluum', '?\nalhamdulilah\n', '0', '5768659495', '056', 'Rezza', '', '', '085789701750', '085789701750', '0', '0', '2020-06-11 20:28:25', 1),
(12, 'Ini Donasi', '?\nalhamdulilah', '0', '876461955', 'Bjb Syariah', 'Rezza', '', '', '085789701750', '085789701750', '0', '0', '2020-06-11 20:49:09', 1),
(13, 'Bismillah Terakhir', '?\nalhamdulilah', '500000', '08465929', 'Bjb Syariah', 'Rezza', '', '', '085789701750', '085789701750', '0', '0', '2020-06-11 21:11:39', 1),
(14, 'test testtest', 'sdjgbkdsfgbfsdgpijrsdfgr', '0', '0', '0', '0', '', '', '0', '085789701750', '0', '0', '2020-06-11 21:14:49', 1),
(15, 'test testtest', 'sdjgbkdsfgbfsdgpijrsdfgr', '0', '0', '0', '0', 'media/donasi/2020/06/2-1-thumb.jpg', 'media/donasi/2020/06/2-1.jpg', '0', '085789701750', '0', '0', '2020-06-11 21:15:52', 1),
(16, 'Testestes', 'hhhhhhhhhhh', '2000000000000', '5555863', 'Bjb Syariah', 'Rezza', '', '', '085789701750', '085789701750', '0', '0', '2020-06-11 21:25:42', 1),
(17, 'Tes Donasi', '﷽\nalhamdulilah', '200000000', '0688556', 'Bjb Syariah', 'Rezza', 'media/donasi/2020/06/2-1-943-thumb.jpg', 'media/donasi/2020/06/2-1-943.jpg', '085789701750', '085789701750', '0', '0', '2020-06-11 21:47:38', 1),
(18, 'Tes Donasi', '﷽\nalhamdulilah', '200000000', '0688556', 'Bjb Syariah', 'Rezza', 'media/donasi/2020/06/2-1-thumb.jpg', 'media/donasi/2020/06/2-1.jpg', '085789701750', '085789701750', '0', '0', '2020-06-11 21:47:48', 1),
(19, 'Tes Donasi2', '﷽', '300008800000', '57676464881', 'Bjb Syariah', 'Iqbal', 'media/donasi/2020/06/2-1-717-thumb.jpg', 'media/donasi/2020/06/2-1-717.jpg', '085789701750', '085789701750', '0', '0', '2020-06-12 05:51:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `c_donasi_gambar`
--

CREATE TABLE `c_donasi_gambar` (
  `id` int(10) NOT NULL,
  `c_donasi_Id` int(10) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `gambar` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c_donasi_gambar`
--

INSERT INTO `c_donasi_gambar` (`id`, `c_donasi_Id`, `thumb`, `gambar`) VALUES
(1, 15, 'media/donasi/2020/06/2-1-thumb.jpg', 'media/donasi/2020/06/2-1.jpg'),
(1, 17, 'media/donasi/2020/06/2-1-943-thumb.jpg', 'media/donasi/2020/06/2-1-943.jpg'),
(1, 18, 'media/donasi/2020/06/2-1-thumb.jpg', 'media/donasi/2020/06/2-1.jpg'),
(1, 19, 'media/donasi/2020/06/2-1-717-thumb.jpg', 'media/donasi/2020/06/2-1-717.jpg'),
(2, 14, 'media/donasi/2020/06/2-2-thumb.jpg', 'media/donasi/2020/06/2-2.jpg'),
(3, 14, 'media/donasi/2020/06/2-3-thumb.jpg', 'media/donasi/2020/06/2-3.jpg'),
(3, 15, 'media/donasi/2020/06/2-3-210-thumb.jpg', 'media/donasi/2020/06/2-3-210.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `c_guestbook`
--

CREATE TABLE `c_guestbook` (
  `id` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `is_subscribe` int(1) NOT NULL DEFAULT 1,
  `is_read` int(1) NOT NULL DEFAULT 0,
  `is_approved` int(1) NOT NULL DEFAULT 0,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c_guestbook`
--

INSERT INTO `c_guestbook` (`id`, `cdate`, `nama`, `email`, `telp`, `alamat`, `judul`, `isi`, `is_subscribe`, `is_read`, `is_approved`, `is_active`) VALUES
(1, '0000-00-00 00:00:00', 'test', 'test@test', '123123123', '', 'test', 'testtestset', 1, 1, 0, 1),
(2, '2018-12-02 01:42:06', 'test', 'test@rerasda', '123133331', '', 'Test', 'test', 1, 0, 0, 1),
(3, '2018-12-02 12:58:35', '', 'daengrosanda@gmail.com', '13123123123123', '', '', '', 1, 0, 0, 1),
(4, '2018-12-18 19:21:30', 'test', 'test@asdas', 'test', '', 'test', 'test', 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `c_produk`
--

CREATE TABLE `c_produk` (
  `nation_code` int(5) NOT NULL COMMENT 'Phone Code FK from a_negara.code',
  `id` int(11) NOT NULL,
  `b_user_id` int(11) DEFAULT NULL COMMENT 'seller ID from b_user.id',
  `b_user_alamat_id` int(5) DEFAULT NULL,
  `b_kategori_id` int(6) DEFAULT NULL COMMENT 'FK from b_kategori.id',
  `b_berat_id` int(4) DEFAULT NULL COMMENT 'weight id, FK from b_berat.id',
  `b_kondisi_id` int(4) DEFAULT NULL COMMENT 'condition id, FK from b_kondisi.id',
  `b_lokasi_id` int(15) DEFAULT NULL COMMENT 'location ID, FK from b_lokasi.id',
  `brand` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Product Brand Name',
  `nama` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'name of product',
  `cdate` datetime NOT NULL COMMENT 'created date',
  `ldate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'last update',
  `deskripsi_singkat` text CHARACTER SET utf8 NOT NULL COMMENT 'short description',
  `deskripsi` text CHARACTER SET utf8 NOT NULL COMMENT 'long description',
  `harga_jual` decimal(15,0) NOT NULL COMMENT 'selling price',
  `berat` decimal(6,2) NOT NULL COMMENT 'Product Weight',
  `dimension_long` decimal(6,2) DEFAULT NULL,
  `dimension_width` decimal(6,2) DEFAULT NULL,
  `dimension_height` decimal(6,2) DEFAULT NULL,
  `stok` int(4) DEFAULT NULL COMMENT 'last qty in stock',
  `satuan` varchar(43) NOT NULL DEFAULT 'Pcs' COMMENT 'units,e.g. pcs, pair,set',
  `foto` text NOT NULL COMMENT 'url featured image product',
  `thumb` text NOT NULL COMMENT 'url featured image product thumbnail',
  `vehicle_types` varchar(128) NOT NULL,
  `courier_services` varchar(128) NOT NULL,
  `services_duration` varchar(28) NOT NULL,
  `is_include_delivery_cost` int(1) NOT NULL DEFAULT 0,
  `is_published` int(1) NOT NULL DEFAULT 1,
  `is_featured` int(1) NOT NULL DEFAULT 0 COMMENT 'untuk menampilkan di discovery homepage',
  `is_visible` int(1) NOT NULL DEFAULT 1 COMMENT 'Product visibility, 1 visible, 0 hidden. Transaction allowed by is_active flag',
  `is_active` int(1) NOT NULL DEFAULT 1 COMMENT 'Transaction status, 1 active, 0 inactive - cant transaction.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Products';

-- --------------------------------------------------------

--
-- Table structure for table `c_produk_foto`
--

CREATE TABLE `c_produk_foto` (
  `nation_code` int(5) NOT NULL,
  `c_produk_id` int(11) NOT NULL,
  `id` int(15) NOT NULL,
  `utype` enum('internal','external') NOT NULL DEFAULT 'internal',
  `jenis` enum('foto','video') NOT NULL DEFAULT 'foto' COMMENT 'type',
  `url` varchar(255) NOT NULL,
  `url_thumb` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product Images Table';

-- --------------------------------------------------------

--
-- Table structure for table `d_blog`
--

CREATE TABLE `d_blog` (
  `id` int(11) NOT NULL,
  `a_pengguna_id` int(4) DEFAULT NULL,
  `b_user_id` int(11) NOT NULL,
  `kategori` varchar(255) NOT NULL DEFAULT 'Uncategorized',
  `title` varchar(200) CHARACTER SET utf8 DEFAULT '',
  `slug` varchar(255) NOT NULL,
  `mtitle` varchar(255) NOT NULL,
  `mkeyword` varchar(255) NOT NULL,
  `mdescription` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mauthor` varchar(255) NOT NULL,
  `mimage` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `excerpt` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `featured_thumb` varchar(255) NOT NULL,
  `cdate` datetime NOT NULL,
  `ldate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jml_baca` int(6) NOT NULL DEFAULT 0,
  `status` enum('draft','publish','revisi','reject') NOT NULL DEFAULT 'draft',
  `is_follow_up` int(1) NOT NULL DEFAULT 0,
  `is_read` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `d_blog`
--

INSERT INTO `d_blog` (`id`, `a_pengguna_id`, `b_user_id`, `kategori`, `title`, `slug`, `mtitle`, `mkeyword`, `mdescription`, `mauthor`, `mimage`, `content`, `excerpt`, `tags`, `featured_image`, `featured_thumb`, `cdate`, `ldate`, `jml_baca`, `status`, `is_follow_up`, `is_read`) VALUES
(39, 1, 0, 'ilmu,akhlak,', 'Menjadi Orang Cerdas', 'menjadi-orang-cerdas', 'Menjadi Orang Cerdas', 'cerdas', 'menjadi orang cerdas menurut Rasulullah Shalallahu \'alaihi wasallam', 'S-Admin1', 'media/upload/2019/06/sean-patrick-murphy-089q6pmx-ai-unsplash.jpg', '<p style=\"text-align:justify\">Cerdas itu bukan hanya identik milik mereka yang jago dibidang akademik, bisnis, berprestasi dipekerjaan, kampus, sekolah. Jika kecerdasan itu di ukur dengan kacamata dunia maka orang-orang shalih dengan orang kafir, munafiq ,fasik tidak ada bedanya. Namun ternyata agama islam mengajarkan kita untuk menjadi orang cerdas, orang yang berkualiatas serta memiliki kehidupan yang visioner.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nRasulullah shallallahu&lsquo;alaihi wasallam bersabda,</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nاَلْكَيْسُ مَنْ دَانَ نَفْسَـهُ وَعَمِلَ لِمَا بَعْدَ الْمَوْتِ</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&ldquo;Orang yang cerdas adalah &nbsp;orang yang mampu menyiapkan bekal dirinya dan beramal (mencurahkan semua potensi) untuk kepentingan setelah kematian. Sedangkan orang yang lemah ialah, orang yang mengikuti hawa nafsunya kemudian berangan-angan kosong kepada Allah.&rdquo; (HR.Tirmidzi).</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Ini bukti dalil pembeda antara orang mu&lsquo;min dengan orang-orang kafir,munafiq,fasik. Secara garis besarnya orang cerdas versi Rasulullah adalah mereka yang mempersiapkan diri,mempersiapkan perbekalan untuk datangnya kematian. Artinya Nabi mengajarkan umatnya untuk menjadi pribadi yang visioner mencurahkan potensinya untuk kepentingan negeri akherat. Sehingga pantas jika Allah berfirman :</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nفَمَنْ زُحْزِحَ عَنِ النَّارِ وَأُدْخِلَ الْجَنَّةَ فَقَدْ فَازَ</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&ldquo;Barangsiapa dijauhkan dari neraka dan dimasukkan ke dalam surga, maka sungguh ia telah beruntung. Kehidupan dunia itu tidak lain hanyalah kesenangan yang memperdayakan.&rdquo; (QS. Ali Imran: 185) Silakan tentukan pilihan Anda,apakah Anda ingin mencurahkan potensi Anda untuk kampung akherat atau potensi Anda hanya dikerahkan pada urusan dunia yang akan segera Anda tinggalkan. Sehingga perlu kiranya Anda mengulang-ngulang pendidikan karakter dari Nabi &nbsp;Rasulullah shallallahu &lsquo;alaihi wa sallam bersabda,</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nمَالِي وَلِلدُّنيَا ؟! مَا مَثَلِي وَمَثَلُ الدُّنيَا إِلا كَرَاكِبٍ ظَلَّ تَحتَ شَجَرَةٍ ثُمَّ رَاحَ وَتَرَكَهَا</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&ldquo;Apa urusanku dengan dunia?!!, per-umpamaan-ku dan dunia ini hanyalah seperti seorang pengembara yang berjalan di siang hari yang terik, lalu berteduh dibawah pohon beberapa saat karena panas, kemudian pergi meninggalkan pohon tersebut.&rdquo; (HR. Ahmad)<br />\r\nWallahu a&lsquo;lam.</p>\r\n\r\n<p style=\"text-align:justify\">Materi Kajian Ustadz Ruslan Gunawan</p>\r\n', 'orang cerdas menurut Rasulullah Shalallahu \'alaihi wasallam', '', 'media/upload/2019/06/sean-patrick-murphy-089q6pmx-ai-unsplash.jpg', '', '2019-06-30 13:01:13', '2023-07-08 02:42:42', 162, 'publish', 0, 0),
(40, 1, 0, 'ilmu,akhlak,', 'Faktor Rusaknya Kaula Muda', 'faktor-rusaknya-kaula-muda', 'Faktor Rusaknya Kaula Muda', 'pemuda', 'Pada akhir zaman ini, semakin banyak pemuda yang akhlaknya tidak mencerminkan seorang muslim', 'S-Admin1', 'media/upload/2019/06/hannah-rodrigo-bbq9lhb-wpy-unsplash.jpg', '<p style=\"text-align:justify\">Waktu adalah salah satu nikmat yang agung dari All&acirc;h Subhanahu wa Ta&rsquo;ala kepada manusia. Sudah sepantasnya manusia memanfaatkannya secara baik, efektif dan semaksimal mungkin untuk amal shalih. All&acirc;h Ta&rsquo;ala telah bersumpah dengan menyebut masa dalam firman-Nya:</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nوَالْعَصْرِ ﴿١﴾ إِنَّ الْإِنْسَانَ لَفِي خُسْرٍ ﴿٢﴾ إِلَّا الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ وَتَوَاصَوْا بِالْحَقِّ وَتَوَاصَوْا بِالصَّبْرِ<br />\r\n&ldquo;Demi masa. Sesungguhnya manusia itu benar-benar dalam kerugian, kecuali orang-orang yang beriman dan mengerjakan amal shalih dan nasihat-menasihati supaya mentaati kebenaran dan nasihat-menasihati supaya menetapi kesabaran&rdquo;. [al-&lsquo;Ashr/103:1-3].</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nDi dalam surat yang mulia ini All&acirc;h Subhanahu wa Ta&rsquo;ala bersumpah dengan masa, dan ini menunjukkan pentingnya masa. Sesungguhnya orang yang paling merugi adalah orang yang Allah berikan waktu kemudian ia menyia-nyiakannya, sesungguhnya waktu merupakan anugerah All&acirc;h</p>\r\n\r\n<p style=\"text-align:justify\">Ta&rsquo;ala, tidak ada cela padanya, manusia-lah yang tercela ketika tidak memanfaatkannya.<br />\r\nMaka sudah sepantasnya setiap manusia untuk mempergunakan waktunya untuk sesuatu yang bermanfaat, diantaranya dengan menggunakan waktu untuk mencari ilmu, tidak menghambur-hamburkan dengan melakukan sesuatu yang melalaikan, karena waktu tidak akan kembali datang untuk yang kedua kalinya, untuk itu kita,</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nPembaca sekalian, berbicara kaula muda maka yang terbersit di dalam benak kita adalah kerusakan-kerusakan yang terjadi di kalangan mereka, telah kita saksikan bersama bagaimana keadaan akhlaq mereka sekarang yang jauh dari ilmu dan batasan syariat agama islam, untuk seorang kaula muda banyak yang mereka terlalu sibuk mengurus kehidupan dunianya dibandingkan urusan akhiratnya sampai-sampai kewajiban sholat mereka abaikan, majelis-majelis taklim kosong dari kaula muda yang ada hanyalah para orang dewas yang sudah berusia di atas 50 tahun, perempuan-perempuan banyak yang sudah malu memakai jilbab karena dianggap sudah tidak sesuai dengan fashion di jaman sekarang, na&rsquo;udzubillah.</p>\r\n\r\n<p style=\"text-align:justify\">Maka untuk itu ketahuilah berikut dipaparkan beberapa faktor-faktor perusak Kaula Muda</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n<strong>Faktor-faktor rusaknya Kaula Muda</strong></p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp; &nbsp; 1. Berlebihan di dalam Urusan Dunia dan Mengabaikan Urusan Akhirat<br />\r\nMelihat fenomena di zaman sekarang banyak kaula muda yang mana mereka berlebih-lebihan di dalam urusan dunia, dengan melalaikan urusan akhirat diantaranya dengan melupakan kewajiban mereka terhadap mencari ilmu dan lebih memilih kepada urusan yang sifatnya semu, padahal Rosul ﷺ bersabda:</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nاغْتَنِمْ خَمْساً قَبْلَ خَمْسٍ ......وَشَبَابَكَ قَبْلَ هَرَمِكَ<br />\r\n&quot;Manfaatkan lima perkara sebelum datang lima perkara (lainnya). (Salah satunya)&hellip; (Manfaatkan) masa remajamu sebelum dating masa tua&hellip;&quot;</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nSeperti di singgung di awal bahwasannya sesuatu yang tidak akan pernah kembali kepada seseorang adalah waktu, maka pergunakanlah waktu itu sebaik mungkin dan tidak untuk membuang-buangnya dengan percuma.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nIngatlah wahai para pembaca sekalian, bahwa perjalanan hidup kita ini hanya sebentar jangan sampai kita sombong dengan apa yang Allah titipkan sekarang ini karena segala sesuatu akan kembali kepadanya kita hanya makhluk yang lemah, seperti firman Allah ta&lsquo;la dalam QS Ar-Rum : 54</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nاللَّهُ الَّذِي خَلَقَكُمْ مِنْ ضَعْفٍ ثُمَّ جَعَلَ مِنْ بَعْدِ ضَعْفٍ قُوَّةً ثُمَّ جَعَلَ مِنْ بَعْدِ قُوَّةٍ ضَعْفًا وَشَيْبَةً ۚ يَخْلُقُ مَا يَشَاءُ ۖ وَهُوَ الْعَلِيمُ الْقَدِيرُ<br />\r\nAllah, Dialah yang menciptakan kamu dari keadaan lemah, kemudian Dia menjadikan (kamu) sesudah keadaan lemah itu menjadi kuat, kemudian Dia menjadikan (kamu) sesudah kuat itu lemah (kembali) dan beruban. Dia menciptakan apa yang dikehendaki-Nya dan Dialah Yang Maha Mengetahui lagi Maha Kuasa.</p>\r\n</blockquote>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\n&ldquo; aku mengetahui 1 bab ilmu dan menyampaikan kepada orang lain, lebih aku cintai, dari dunia dan seisinya&rdquo; bahkan beliaupun melanjutkan perkataanny &ldquo;1 bab mengingat-ngingat ilmu disebagian malam, lebih aku cintai daripada beribadah semalam penuh&rdquo;<br />\r\nLalu bagaimana dengan kita ?? - <strong>Ibnu Darda</strong></p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\">Kita lebih mementingkan dengan kekayaan dan besarnya penghasilan sering diidentikkan dengan gaya hidup mewah, glamour, cinta dunia yang berlebihan dan ambisi yang tidak pernah puas untuk terus mengejar harta. Karena itu, ada kesan orang-orang yang berduit sangat disibukkan dengan kekayaan mereka yang menyebabkan mereka lalai dari dzikrull&acirc;h (mengingat All&acirc;h Azza wa Jalla ) dan mempersiapkan diri untuk menghadapi hari kemudian.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nKenyataan ini tentu saja merupakan ancaman fitnah (kerusakan) besar bagi seorang hamba yang tidak memiliki benteng iman yang kokoh untuk menghadapi dan menangkal fitnah harta tersebut. Bahkan Ras&ucirc;lull&acirc;h Shallallahu &lsquo;alaihi wa sallam secara khusus memperingatkan umat dari besarnya bahaya fitnah harta dan kedudukan duniawi dalam merusak agama dan keimanan seseorang dalam sabda beliau Shallallahu &lsquo;alaihi wa sallam.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp; &nbsp; 2. Lemahnya Iman<br />\r\nSesungguhnya kemaksiatan yang banyak dilakukan oleh kaula muda diantaranya lemahnya iman mereka, dapat dipastikan mereka tahu akan ancaman dari kemaksiatan yang mereka lakukan tetapi masih saja mereka lakukan karena disebabkan keimanan mereka yang lemah.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nBisa kita perhatikan ada seseorang (perempuan) muslim, tidak berjilbab, kita pastika bahwa dia pasti tahu akan kewajibannya menutup aurat tapi kenapa masih berani membukanya ?</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nJawabannya karena lemahnya iman kepada Allah ta&lsquo;la, sesungguhnya mereka akan mendatangi azab Allah akibat dari perbuatan mereka, maka janganlah kita memastikan bahwa apa yang kita lakukan besok hari pasti akan terjadi padahal waktu esok (waktu yang akan datang) adalah misteri jangankan besok hari 1 jam, 1 menit atau bahkan 1 detik yang akan datang masih belum tentu kita masih bisa mendatanginya. Sampai-sampai dalam Al-Qur&rsquo;an Allah ta&lsquo;la berfirman :</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nوَلَا تَقُولَنَّ لِشَيْءٍ إِنِّي فَاعِلٌ ذَٰلِكَ غَدًا<br />\r\nDan jangan sekali-kali kamu mengatakan tentang sesuatu: &quot;Sesungguhnya aku akan mengerjakan ini besok pagi&rdquo; (QS : 28)</p>\r\n</blockquote>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\n&ldquo;Pemuda terbagi kedalam 3 jenis&rdquo;</p>\r\n\r\n<p style=\"text-align:justify\">1. Pemuda yang komitmen</p>\r\n\r\n<p style=\"text-align:justify\">2. Pemuda yang rusak, hancur (menghancurkan diri) dan sesat</p>\r\n\r\n<p style=\"text-align:justify\">3. Pemuda yang tidak jelas (tidak memiliki prinsip) Tidak bisa memanfaatkan kesempatan -&nbsp;<strong>Ibnu Al Qoyyim AL-Jauziyah</strong></p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nBerkata Rosulallah ﷺ :<br />\r\nYang menjadi pertanyaan berada dimanakah posisi kita ?<br />\r\n&nbsp;&nbsp; &nbsp;Wahai kaula muda janganlah kalian tertipu terhadap waktu dan kesempatan, Sebagaimana sabda nabi ﷺ :<br />\r\nعَنْ ابْنِ عَبَّاسٍ قَالَ قَالَ النَّبِيُّ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ نِعْمَتَانِ مَغْبُونٌ فِيهِمَا كَثِيرٌ مِنْ النَّاسِ الصِّحَّةُ وَالْفَرَاغُ</p>\r\n\r\n<p style=\"text-align:justify\">Dari Ibnu Abbas Radhiyallahu anhuma, dia berkata: Nabi Shallallahu &lsquo;alaihi wa sallam bersabda: &ldquo;Dua kenikmatan, kebanyakan manusia tertipu pada keduanya, (yaitu) kesehatan dan waktu luang&rdquo;. [HR Bukhari, no. 5933].</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp;&nbsp; &nbsp;Alhamdulillah Kita Bersyukur kepada Allah yang memberi kita nikmat Kehidupan pada sampai har ini. Allah memberi kita nikmat kehidupan pada hari ini bermaksud Allah masih lagi memberi kita peluang untuk bertaubat, Maka gunakanlah Peluang yang Allah beri itu sebaik mungkin.Dalam kehidupan ini Banyak nikmat yang Allah kurniakan...Kadang-kadang Kita salah menggunakan Nikmat yang Allah kurniakan kepada Kita.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp;&nbsp; &nbsp;Adakah musibah yang lebih besar daripada hilangnya keimanan dengan ALLAH TA&rsquo;ALA? Sungguh kita berlindung dengan ALLAH TA&rsquo;ALA dari hal-hal demikian. Oleh karena itu, bila kita ingin meninggalkan dunia ini (mati) dengan membawa iman, maka sudah seharusnyalah kita bersungguh-sungguh dalam hal menuntut ilmu agama, dan bersungguh-sungguh pula dalam hal mengamalkannya dengan niat yang ikhlas karena ALLAH. Semoga ALLAH TA&rsquo;ALA selalu membimbing kita dan merahmati kita semua. Aamiin.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp; &nbsp; 3. Salah Bergaul<br />\r\n&nbsp;&nbsp; &nbsp;Sebenarnya, sangat mudah mengetahui seperti apa cerminan diri Anda. Cukup dengan melihat bersama siapa saja Anda sering bergaul, seperti itulah cerminan diri Anda. Kenyataan ini telah dipaparkan oleh Rasulullah Shallallahu &lsquo;alaihi wa sallam bersabda :</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nالْمُؤْمِنُ مِرْآةُ (أخيه) الْمُؤْمِنِ<br />\r\n&ldquo;Seorang mukmin cerminan dari saudaranya yang mukmin&rdquo;<br />\r\nHR al-Bukh&acirc;ri (al-Adabul -Mufrad no. 239) dan Abu D&acirc;wud no. 4918 (ash-Shah&icirc;hah no. 926)</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nMemilih teman yang baik adalah sesuatu yang tak bisa dianggap remeh. Karena itu, Islam mengajarkan agar kita tak salah dalam memilihnya. Rasulullah Shallallahu &lsquo;alaihi wa sallam bersabda :</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nالرَّجُلُ عَلَى دِينِ خَلِيلِهِ فَلْيَنْظُرْ أَحَدُكُمْ مَنْ يُخَالِلُ<br />\r\n&ldquo;Seseorang itu tergantung pada agama temannya. Oleh karena itu, salah satu di antara kalian hendaknya memperhatikan siapa yang dia jadikan teman&rdquo; HR Abu D&acirc;wud no. 4833 dan at-Tirmidzi no. 2378. (ash-Shah&icirc;hah no. 927)</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Sudah dapat dipastikan, bahwa seorang teman memiliki pengaruh yang sangat besar terhadap temannya. Teman bisa mempengaruhi agama, pandangan hidup, kebiasaan dan sifat-sifat seseorang.Teman bergaul dan lingkungan yang Islami, sungguh sangat mendukung seseorang menjadi lebih baik dan bisa terus istiqomah. Sebelumnya bisa jadi malas-malasan. Namun karena melihat temannya tidak sering tidur pagi, ia pun rajin. Sebelumnya menyentuh al Qur&rsquo;an pun tidak. Namun karena melihat temannya begitu rajin tilawah Al Qur&rsquo;an, ia pun tertular rajinnya.<br />\r\nNabi&nbsp;shallallahu &lsquo;alaihi wa sallam&nbsp;mengajarkan kepada kita agar bersahabat dengan orang yang dapat memberikan kebaikan dan sering menasehati kita.</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nمَثَلُ الْجَلِيسِ الصَّالِحِ وَالْجَلِيسِ السَّوْءِ كَمَثَلِ صَاحِبِ الْمِسْكِ ، وَكِيرِ الْحَدَّادِ ، لاَ يَعْدَمُكَ مِنْ صَاحِبِ الْمِسْكِ إِمَّا تَشْتَرِيهِ ، أَوْ تَجِدُ رِيحَهُ ، وَكِيرُ الْحَدَّادِ يُحْرِقُ بَدَنَكَ أَوْ ثَوْبَكَ أَوْ تَجِدُ مِنْهُ رِيحًا خَبِيثَةً<br />\r\nSeseorang yang duduk (berteman) dengan orang sholih dan orang yang jelek adalah bagaikan berteman dengan pemilik minyak misk dan pandai besi. Jika engkau tidak dihadiahkan minyak misk olehnya, engkau bisa membeli darinya atau minimal dapat baunya. Adapun berteman dengan pandai besi, jika engkau tidak mendapati badan atau pakaianmu hangus terbakar, minimal engkau dapat baunya yang tidak enak.&rdquo; (HR. Bukhari no. 2101, dari Abu Musa)</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp; &nbsp; 4. Jauh dari Ulama<br />\r\nUlama adalah orang yang mengerti dan mengamalkan ajaran Agama Islam, karena ulama merupakan pewaris para Nabi. Ketika seorang ulama berfatwa/ memberikan nasihat kepada kita seyogyanya kita melakukan perbuatan yang dinasihatkan kepada kita.</p>\r\n\r\n<p style=\"text-align:justify\">Kedudukan mereka dalam agama berikut di hadapan umat, merupakan permasalahan yang menjadi bagian dari agama. Mereka adalah orang-orang yang menjadi penyambung umat dengan Rabbnya, agama dan Rasulullah Shallallahu &lsquo;alaihi wa sallam. Mereka adalah sederetan orang yang akan menuntun umat kepada cinta dan ridha Allah, menuju jalan yang dirahmati yaitu jalan yang lurus. Oleh karena itu ketika seseorang melepaskan diri dari mereka berarti dia telah melepaskan dan memutuskan tali yang kokoh dengan Rabbnya, agama dan Rasul-Nya. Ini semua merupakan malapetaka yang dahsyat yang akan menimpa individu ataupun sekelompok orang Islam. Berarti siapapun atau kelompok mapapun yang mengesampingkan ulama pasti akan tersesat jalannya dan akan binasa.<br />\r\nRasulullah Shallallahu &lsquo;alaihi wa sallam bersabda:</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nالْعُلُمَاءُ وَرَثَةُ اْلأَنْبِيَاءِ<br />\r\n&ldquo;Ulama adalah pewaris para nabi.&rdquo; (HR At-Tirmidzi dari Abu Ad-Darda radhiallahu &lsquo;anhu),</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\">&nbsp;Para&nbsp;ulama semakin langka, dan semakin banyaknya orang bodoh yang berambisi untuk menjadi ulama. Simak risalah ini selanjutnya.<br />\r\nDi samping sebagai perantara antara diri-Nya dengan hamba-hamba-Nya, dengan rahmat dan pertolongan-Nya, Allah Subhanahu wa Ta&rsquo;ala juga menjadikan para ulama sebagai pewaris perbendaharaan ilmu agama. Sehingga, ilmu syariat terus terpelihara kemurniannya sebagaimana awalnya. Oleh karena itu, kematian salah seorang dari mereka mengakibatkan terbukanya fitnah besar bagi muslimin.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nRasulullah Shallallahu &lsquo;alaihi wa sallam mengisyaratkan hal ini dalam sabdanya yang diriwayatkan Abdullah bin &lsquo;Amr ibnul &lsquo;Ash, katanya: Aku mendengar Rasulullah Shallallahu &lsquo;alaihi wa sallam bersabda:<br />\r\nإِنَّ اللهَ لاَ يَقْبِضُ الْعِلْمَ انْتِزَاعاً يَنْتَزِعُهُ مِنَ الْعِباَدِ، وَلَكِنْ بِقَبْضِ الْعُلَماَءِ. حَتَّى إِذَا لَمْ يُبْقِ عاَلِماً اتَّخَذَ النَّاسُ رُؤُوْساً جُهَّالاً فَسُأِلُوا فَأَفْتَوْا بِغَيْرِ عِلْمٍ فَضَلُّوا وَأَضَلُّوا</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&ldquo;Sesungguhnya Allah tidak mencabut ilmu dengan mencabutnya dari hamba-hamba. Akan tetapi&nbsp;Dia mencabutnya dengan diwafatkannya para ulama sehingga jika Allah tidak menyisakan seorang alim pun, maka orang-orang mengangkat pemimpin dari kalangan orang-orang bodoh. Kemudian mereka ditanya, mereka pun berfatwa tanpa dasar ilmu. Mereka sesat dan menyesatkan.&rdquo; (HR. Al-Bukhari no. 100 dan Muslim no. 2673)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nMeninggalnya seorang yang alim akan menimbulkan bahaya bagi umat. Keadaan ini menunjukkan keberadaan ulama di tengah kaum muslimin akan mendatangkan rahmat dan barakah dari Allah Subhanahu wa Ta&rsquo;ala. Terlebih Rasulullah Shallallahu &lsquo;alaihi wa sallam mengistilahkan mereka dalam sebuah sabdanya:</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nمَفاَتِيْحُ لِلِخَيْرِ وَمَغاَلِيْقُ لِلشَّرِّ<br />\r\n&ldquo;Sebagai kunci-kunci untuk membuka segala kebaikan dan sebagai penutup segala bentuk kejahatan.&rdquo;<br />\r\nKita telah mengetahui bagaimana kedudukan mereka dalam kehidupan kaum muslimin dan dalam perjalanan kaum muslimin menuju Rabb mereka. Semua ini disebabkan mereka sebagai satu-satunya pewaris para nabi sedangkan para nabi tidak mewariskan sesuatu melainkan ilmu.Maka janganlah kita jauh dari mereka</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nUntuk itu marilah kita tinggalkan untuk ke 4 faktor perusak diri kita, agar kita di selamatkan oleh Allah ta&lsquo;la dunia dan akhirat.</p>\r\n\r\n<p style=\"text-align:justify\">Alhamdulillah<br />\r\nHaadanallah Waiyyakum Wa afwu minkum<br />\r\nWallahu &lsquo;Alam bishawwab.</p>\r\n\r\n<p style=\"text-align:justify\">Intisari Kajian Ustadz Ruslan Gunawan Hafidzahullah</p>\r\n', 'faktor rusaknya karakteristik pemuda', '', 'media/upload/2019/06/hannah-rodrigo-bbq9lhb-wpy-unsplash.jpg', '', '2019-06-30 13:05:25', '2023-07-08 02:42:45', 215, 'publish', 0, 0),
(41, 1, 0, 'ilmu,akhlak,nasihat-ulama,', 'Ibnu Taimiyah : Empat Keadaan Manusia', 'ibnu-taimiyah-empat-keadaan-manusia', 'Empat Keadaan Manusia', 'nasihat ulama', 'Imam Ibnu Taimiyah memberikan penjelasan mengenai empat keadaan manusia', 'S-Admin1', 'media/upload/2019/06/lachtan.jpg', '<p style=\"text-align:justify\">Alhamdulillah, Puji dan syukur kembali kita sampaikan kehadirat Allah ta&lsquo;la yang telah memberikan banyak kenikmatan kepada kita semua kenikmatan yang tidak pernah terputus yang selalu Allah ta&lsquo;la sampaikan kepada kita, untuk itu pantas kiranya seseorang dikatakan sombong apabila dia lalai dalam mengingat kenikmatan yang telah Allah ta&lsquo;la berikan kepadanya, untuk mereka balasannya azab yang pedih, sebagaimana firman Allah ta&lsquo;la :</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nوَلَئِنْ كَفَرْتُمْ إِنَّ عَذَابِي لَشَدِيدٌ<br />\r\n&ldquo;dan jika kamu mengingkari (nikmat-Ku), maka sesungguhnya azab-Ku sangat pedih&quot;. (QS Ibrahim : 7 )</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\">Na&rsquo;udzubillah ..</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp;&nbsp; &nbsp;Maka marilah kita syukuri terhadap beragam kenikmatan yang masih Allah ta&lsquo;la berikan kepada kita diantara mensyukuri terhadap kesempatan umur untuk dipergunakan didalam mencari ilmu, datang ke majelis-majelis ilmu dan mendengarkan Qolallah wa qola rosul sholallahu &lsquo;alaihi wassallam, sehingga sholawat dan salam kita sampaikan kepada nabi besar kita Muhammad ﷺ, kepada keluarga shobat, tabi&rsquo;in tabi&rsquo;ut tabi&rsquo;in dan kepada kita semua yang senantiasa mengikuti langkah jejak beliau sampai akhir zaman.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nPembaca yang berbahagia insyaallah, kita semua tahu bahwasannya kehidupan dunia ini adalah semu dan kita akan kembali kepada alam akhirat yang mana Allah ta&lsquo;la berikan untuk tipikal orang-orang yang tidak sombong dan membuat kerusakan di muka bumi ini yang kedua sifat tersebut ada di dalam diri kita, seperti halnya firman Alah ta&lsquo;la</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\">:<br />\r\nتِلْكَ الدَّارُ الْآخِرَةُ نَجْعَلُهَا لِلَّذِينَ لَا يُرِيدُونَ عُلُوًّا فِي الْأَرْضِ وَلَا فَسَادًا<br />\r\nوَالْعَاقِبَةُ لِلْمُتَّقِينَ<br />\r\n&ldquo;Negeri akhirat itu, Kami jadikan untuk orang-orang yang tidak ingin menyombongkan diri dan berbuat kerusakan di (muka) bumi. Dan kesudahan (yang baik) itu adalah bagi orang-orang yang bertakwa&rdquo; (QS. Al-Qashas :83)</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nDari ayat di atas dapat diambil kesimpulan bahwa Allah ta&lsquo;la menyiapkan akhirat untuk orang-orang yang tidak sombong dan tidak melakukan kemaksiatan (kerusakan) sampai-sampai Imam Atsauri menafsirkan ayat di atas bahwa al fasad di sana adalah au mujrim yang artinya melakukan dosa/kemaksiatan. Di dalam ayat di atas Allah ta&lsquo;la menjadikan Kesombongan dan kemaksiatan terpisah karena salah satu alasannyaadalah karena salah satu yang membuat kerusakan diantaranya adalah kesombongan, maka pertanyaan yang muncul bagaimana kita bisa terhindar dari kesombongan dan melakukan kemaksiatan ?<br />\r\nDari ayat di atas Ibnu Taimiah membagi manusia dalam kehidupan di muka bumi ini menjadi 4 keadaan :<br />\r\n<strong>&nbsp; &nbsp; 1. Alladziina yuriiduuna al ulluwa illal fasad</strong><br />\r\nYaitu orang yang berlaku sombong tapi tidak melakukan kemaksiatan<br />\r\n&nbsp; &nbsp; <strong>2. Alladziina yuriiduunal fasada illal ulluwa</strong><br />\r\nYaitu orang yang melakukan kemaksiatan tanpa adanya &nbsp;kesombongan<br />\r\n&nbsp; &nbsp; <strong>3. Alladziina yuriduuna al ulluwa wal fasada</strong><br />\r\nYaitu orang yang berlaku kesombongan dan melakukan kemaksiatan<br />\r\n<strong>&nbsp; &nbsp; 4. Alladziina laa yuriiduuna al uluwwa wal fasada</strong><br />\r\nYaitu orang yang tidak berlaku sombong dan tidak melakukan kemaksiatan<br />\r\nPenjelasan dari ke empat keadaan manusia di atas adalah :</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp; &nbsp; 1. Orang yang berlaku sombong dan tidak melakukan kemaksiatan<br />\r\nYaitu Ulama Ussu&rsquo; (jelek) mereka para DAI yang mereka itu tidak melakukan kemunkaran-kemunkaran tetapi hatinya dengan menyampaikan din nya itu bukan karena Allah ta&lsquo;la tetapi ingin di puji, mendapatkan posisi dan di nilai oleh orang, dia mencari dunia dengan ilmu yang Allah titipkan, maka jelas untuk dirinya adalah malapetaka karena tidak akan diterima Allah ta&lsquo;la.<br />\r\nMereka adalah para DAI yang nantinya akan menelorkan kesombongannya itu kepada murid-muridnya sehingga terjadilah kefanatikkan mereka setelah DAI itu meninggal maka murid-muridnya akan memasang fhoto-fhoto mereka (DAI/gurunya) dan ini terjadi akibat dari kesombongan dari ulama mereka.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nAyyuhal khadirun yang dimuliakan oleh Allah ta&lsquo;la, maka hati-hatilah di saat kita bermaksud untuk berdakwah mengajak kepada jalan Allah ta&lsquo;la periksalah dan jaga hati kita bisa-bisa sifat yang di sifati DAI di atas ada dalam diri kita.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nDikisahkan ada seorang ulama besar yang diceritakan dalam Muqaddimah Fikhul ad&rsquo;iyati wal Ahkam yang mana ulama tersebut marah apabila di sebut al alamah, bagaimana dengan yang terjadi di jaman sekarang ? mungkin kita pernah mendengar ada orng yang dia tersinggung yang gelar haji nya tidak di sebut dalam satu penyebutan kepada dirinya atau dia tersinggung untuk tidak disebut gelar ustadznya. Padahal kita semua adalah makhluk yang lemah yang seyogyanya tidak ada sesuatu yang musti kita banggakan di muka bumi ini.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nKembali Ada sebuah kisah yang sangat menarik pernah dikisahkan dalam Muqaddimah Fikhul ad&rsquo;iyati wal Ahkam (Syeikh Abdurrojaq) salah satu murid dari syeikh Abdurrojaq adalah seorang syeikh Al-Utsaimin pada waktu itu menjadi seorang moderator kajian gurunya disaat beliau memanggil gurunya dengan sebutan al Alamah maka gurunya berkata &ldquo; Uslub laa ta kakallam (Diamlah)!&rdquo; sungguh luar biasanya tingkat ketawadhuan dari seorang Syeikh Abdurrozaq.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp; &nbsp; 2. Orang yang melakukan kemaksiatan tanpa adanya kesombongan<br />\r\nMereka adalah orang-orang yang bodoh di dalam agamanya, siapa mereka?? diantaranya adalah orang-orang yahudi dan nashrani, mungkin saja ketawadhuan mereka melebihi orang-orang beriman tapi mereka melakukan kemafsadatan dari kejahilan mereka, sehinga mereka mengada-ngada di dalam menjadikan tuhan mereka.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nDidalam Al-Qur&rsquo;an Allah ta&lsquo;la mengabarkan keadaan orang-orang munafiq dan ancamannya :<br />\r\nالْمُنَافِقُونَ وَالْمُنَافِقَاتُ بَعْضُهُمْ مِنْ بَعْضٍ يَأْمُرُونَ بِالْمُنْكَرِ وَيَنْهَوْنَ عَنِ الْمَعْرُوفِ وَيَقْبِضُونَ أَيْدِيَهُمْ نَسُوا اللَّهَ فَنَسِيَهُمْ إِنَّ الْمُنَافِقِينَ هُمُ الْفَاسِقُونَ(67) وَعَدَ اللَّهُ الْمُنَافِقِينَ وَالْمُنَافِقَاتِ وَالْكُفَّارَ نَارَ جَهَنَّمَ خَالِدِينَ فِيهَا هِيَ حَسْبُهُمْ وَلَعَنَهُمُ اللَّهُ وَلَهُمْ عَذَابٌ مُقِيمٌ(68)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&ldquo;Orang-orang munafik laki-laki dan perempuan. sebagian dengan sebagian yang lain adalah sama, mereka menyuruh membuat yang Munkar dan melarang berbuat yang ma&rsquo;ruf dan mereka menggenggamkan tangannya. mereka telah lupa kepada Alloh, Maka Alloh melupakan mereka. Sesungguhnya orang-orang munafik itu adalah orang-orang yang fasik.&nbsp;&nbsp;Alloh mengancam orang-orang munafik laki-laki dan perempuan dan orang-orang kafir dengan neraka Jahannam, mereka kekal di dalamnya. cukuplah neraka itu bagi mereka, dan Allah mela&rsquo;nati mereka, dan bagi mereka azab yang kekal&rdquo;.&nbsp;(At Taubah : 67-68)</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\n&ldquo;Diamnya orang alim dan banyaknya bicara orang jahil maka akan muncul kemafsadatan&rdquo; -&nbsp;<strong>Imam Hasan Al Bashri</strong></p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp; &nbsp; 3. Orang yang berlaku sombong dan melakukan kemaksiatan<br />\r\nMereka adalah orang&ndash;orang fasik dan munafik, orang-orang yang mengatasnamakan islam tetapi dia sombong dan melakukan kemaksiatan-kemaksiatan.<br />\r\nSeperti sombongnya seorang Fir&rsquo;aun yang sombong dengan mengakui dirinya sebagai Tuhan dan berlaku mafsadat dengan inginnya diagungkan oleh kaumnya.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp; &nbsp; 4. Orang yang tidak berlaku sombong dan tidak melakukan kemaksiatan<br />\r\nMereka adlah orang-orang yang Allah ta&lsquo;la sifati &lsquo;Ibadurrohman yaitu orang-orang yang bertaqwa yang &nbsp;tidak berlaku sombong dan tidak melakukan kemaksiatan, bukan berarti tidak melakukan kemaksiatan tetapi acapkali dia melakukan kemaksiatan maka dia bersegera untuk kembali kepada Allah ta&lsquo;la. Sebagaimana sabda Rosulallah ﷺ : Dari sahabat Anas bin Malik r.a,<br />\r\nكُلُّ بَنِي آدَمَ خَطَّاءٌ وَ خَيْرُ الْخَطَّائِيْنَ التَّوَّابُونَ<br />\r\n&ldquo;Setiap anak Adam (manusia) pasti sering berbuat kesalahan &ldquo;Dan sebaik-baik orang yang berbuat kesalahan adalah yang mau bertaubat.&rdquo; (H.R. Ibnu Majah no. 4251 dan lainnya)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nDari hadits di atas Rosul ﷺ tidak mengatakan sebaik-baik manusia adalah yang tidak pernah bersalah, karena memang tidak ada seorang manusia pun yang ma&rsquo;shum (terjaga dari kesalahan) kecuali para Nabi. Tetapi Rasulullah menegaskan bahwa orang-orang yang bertaubat dan mengakui kesalahan, serta kembali kepada kebenaranlah yang terbaik di antara mereka.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Pernah ada yang membunuh pamannya Rosul ﷺ yaitu Hamzah dalam satu riwayat yang menyuruhnya hamzah dan dalam satu riwayat lain ditemukan dalam samil attirmidji yang menyuruhnya adalah Jubair bin Muth&rsquo;im yang balas dendam pamannya tercinta dibunuh oleh pamannya rosul, dan orang suruhan untuk membunuh pamannya Rosul ﷺ yaitu adalah Wahsi yang terus kemudin Wahsi masuk islam</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nMaka dari paparan diatas untuk itu penulis mengingatkan diri sendiri kemudian mengajak kepada para pembaca sekalian seandainya ada diantara kita yang mungkin dengan tidak sadar ada diantara sifat manusia yang ke satu dua dan tiga maka marilah kita untuk bersegera memohon ampunan kepada Allah ta&lsquo;la.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&ldquo;Sesungguhnya Allah sangat gembira terhadap taubat hamba-Nya melebihi kegembiraan salah seorang di antara kalian yang kehilangan untanya di padang pasir kemudian menemukannya kembali.&rdquo; (H.R. Muslim no. 2747)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nMungkin kita juga ingat kisah nabi Adam a.s yang diusir oleh Allah dari surge karena telah melakukan dosa, kemudian keduanya berdo&rsquo;a &nbsp;:&ldquo;Wahai Rabb-kami, kami adalah orang-orang yang berbuat zhalim pada diri-diri kami, kalau sekiranya Engkau tidak mengampuni (dosa-dosa) dan merahmati kami, niscaya kami termasuk orang-orang yang celaka.&rdquo; (QS Al A&rsquo;raf: 23)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nAyyuhal Khadirun tentunya akan sangat buruk kalau saja kita meninggal dalam keadaan berbuat dosa, karena itu mari kita bertobat sekarang juga, jangan sampai kita meninggal dalam keadaan berbuat maksiat/dosa karena itu akan jadi kematian yang buruk untuk kita.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nAyyuhal Khaadirun, lalu dimanakah sekarang posisi kita ?<br />\r\nApakah berada pada posisi yang pertama, kedua, ketiga atau yang keempat ?<br />\r\nyang pertama sampai ketiga tempatnya di neraka dan yang keempat adalah surga.<br />\r\nDan hanya kita yang bisa menjawabnya.<br />\r\nWallahu A&rsquo;lam</p>\r\n\r\n<p style=\"text-align:justify\">Kajian Ustadz Ruslan Gunawan Hafidzahullah</p>\r\n', 'empat keadaan manusia', '', 'media/upload/2019/06/lachtan.jpg', '', '2019-06-30 13:36:02', '2023-07-08 02:42:27', 172, 'publish', 0, 0),
(45, 1, 0, 'ilmu,tazkiyatunnufus,', 'Kembali Menuju Allah', 'kembali-menuju-allah', 'Kembali Menuju Allah', 'taubat', 'Selama kita hidup maka dipastikan kita tidak akan pernah steril dari perbuatan dosa. Sebagai manusia kita tak akan pernah luput dari kesalahan baik kesalahan ke', 'S-Admin1', 'media/upload/2019/06/doa-solat.jpg', '<p style=\"text-align:justify\">Selama kita hidup maka dipastikan kita tidak akan pernah steril dari perbuatan dosa. Sebagai manusia kita tak akan pernah luput dari kesalahan baik kesalahan kecil maupun kesalahan besar yang semuanya mengakibatkan konsekuensi bagi kehidupan kita.<br />\r\nRasulullah shallallahu &lsquo;alaihi wa sallam bersabda :</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nكُلُّ ابْنِ آدَمَ خَطَّاءٌ وَخَيْرُ الْخَطَّائِينَ التَّوَّابُونَ<br />\r\n&quot;Seluruh anak Adam berdosa, dan sebaik-baik orang yang berdosa adalah yang bertaubat&quot; (HR Ibnu Maajah no 4241, dihasankan oleh Syaikh Al-Albani).</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nSehingga munculnya paceklik dalam kehidupan,kekeringan,kelaparan,ditimpa bencana berupa penyakit, banjir bandang, kerusakan-kerusakan di muka bumi , ketidakharmonisan dalam rumah tangga, hilangnya keberkahan serta jauhnya kita dari kebaikan-kebaikan, ini disebabkan oleh kemaksiatan yang kita lakukan.</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nAli bin Abi Tholib &ndash;radhiyallahu &lsquo;anhu&ndash; mengatakan,<br />\r\nمَا نُزِّلَ بَلاَءٌ إِلاَّ بِذَنْبٍ وَلاَ رُفِعَ بَلاَءٌ إِلاَّ بِتَوْبَةٍ<br />\r\n&ldquo;Tidaklah musibah tersebut turun melainkan karena dosa. Oleh karena itu, tidaklah bisa musibah tersebut hilang melainkan dengan taubat.&rdquo; (Al Jawabul Kaafi : 1/49)</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\">Perkataan &lsquo;Ali &ndash;radhiyallahu &lsquo;anhu&ndash; di sini selaras dengan firman Allah Ta&rsquo;ala,<br />\r\nوَمَا أَصَابَكُمْ مِنْ مُصِيبَةٍ فَبِمَا كَسَبَتْ أَيْدِيكُمْ<br />\r\n&ldquo;Dan apa saja musibah yang menimpa kamu maka adalah disebabkan oleh perbuatan tanganmu sendiri, dan Allah memaafkan sebagian besar (dari kesalahan-kesalahanmu).&rdquo; (QS. Asy Syuraa: 30)</p>\r\n\r\n<p style=\"text-align:justify\">Dalam hadits qudsi, Allah berfirman,<br />\r\nيَا عِبَادِى إِنَّكُمْ تُخْطِئُونَ بِاللَّيْلِ وَالنَّهَارِ وَأَنَا أَغْفِرُ الذُّنُوبَ جَمِيعًا فَاسْتَغْفِرُونِى أَغْفِرْ لَكُمْ<br />\r\n&quot;Wahai hamba-hambaKu, sesungguhnya kalian berdosa siang dan malam, dan Aku maha mengampuni dosa, maka mintalah ampunan kepadaKu niscaya Aku akan mengampuni kalian&quot; (HR Muslim)</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nSyaikh Al-Albani rahimahullah berkata :<br />\r\n&quot;Semua manusia bersalah, ia tidak bisa berlepas diri dari kesalahan, karena Allah tatkala menciptakan malaikat dan menciptakan manusia, maka Allah telah menggariskan terhadap manusia bahwasanya mereka bersalah, bagaimanapun juga&hellip;, seorang manusia tidak akan terlepaskan dari dosa, kenapa?, karena ia seorang manusia dan bukan malaikat&quot;&nbsp;</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nRasulullah shallallahu &lsquo;alaihi wa sallam menegaskan bahwa memang diantara tujuan penciptaan manusia adalah Allah menjadikan mereka makhluk yang pasti berdosa agar mereka bertaubat, beliau berkata:<br />\r\nوَالَّذِي نَفْسِي بِيَدِهِ لَوْ لَمْ تُذْنِبُوا لَذَهَبَ اللَّهُ بِكُمْ وَلَجَاءَ بِقَوْمٍ يُذْنِبُونَ فَيَسْتَغْفِرُونَ اللَّهَ فَيَغْفِرُ لَهُمْ<br />\r\n&quot;Demi Dzat yang jiwaku berada di tanganNya, kalau kalian tidak berdosa maka Allah akan menjadikan kalian sirna, lalu Allah akan mendatangkan suatu kaum yg mereka berdosa lalu mereka bertaubat kepada Allah lalu Allah mengampuni mereka&quot; (HR Muslim no 7141)<br />\r\nOleh sebab itu tidak ada jalan yang mesti kita tempuh untuk saat ini agar kita bisa kembali membuka pintu rezeki,pintu kebaikan dan berbagai macam kenikmatan-kenikmatan selain kembali kepada Allah.&nbsp;<br />\r\nAllah&nbsp;Ta&rsquo;ala&nbsp;berfirman,<br />\r\nقُلْ يَا عِبَادِيَ الَّذِينَ أَسْرَفُوا عَلَى أَنْفُسِهِمْ لَا تَقْنَطُوا مِنْ رَحْمَةِ اللَّهِ إِنَّ اللَّهَ يَغْفِرُ الذُّنُوبَ جَمِيعًا إِنَّهُ هُوَ الْغَفُورُ الرَّحِيمُ<br />\r\n&ldquo;Katakanlah: &ldquo;Hai hamba-hamba-Ku yang malampaui batas terhadap diri mereka sendiri, janganlah kamu berputus asa dari rahmat Allah. Sesungguhnya Allah mengampuni dosa-dosa semuanya. Sesungguhnya Dia-lah Yang Maha Pengampun lagi Maha Penyayang.&rdquo; (QS. Az Zumar: 53).<br />\r\nAda sebuah kisah yang sangat menarik bahwasannya ada beberapa orang yang datang kepada ulama untuk menyampaikan keluh kesah kehidupannya, dan yang mesti di catat adalah mereka mendatangi orang yang berilmu untuk meminta solusi dari problematika kehidupannya. Dan yang mesti menjadi prinsip adalah jika kita mendapatkan kesulitan dalam kehidupan maka mintalah nasehat kepada orang berilmu agar masalah yang kita sampaikan kepada orang yang berilmu beujung pada solusi hidup.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nشَكَا رَجُلٌ إِلَى الْحَسَنِ الْجُدُوبَةَ فَقَالَ لَهُ: اسْتَغْفِرِ اللَّهَ. وَشَكَا آخَرُ إِلَيْهِ الْفَقْرَ فَقَالَ لَهُ: اسْتَغْفِرِ اللَّهَ. وَقَالَ لَهُ آخَرُ. ادْعُ اللَّهَ أَنْ يَرْزُقَنِي وَلَدًا، فَقَالَ لَهُ: اسْتَغْفِرِ اللَّهَ. وَشَكَا إِلَيْهِ آخَرُ جَفَافَ بُسْتَانِهِ، فَقَالَ لَهُ: اسْتَغْفِرِ اللَّهَ. فَقُلْنَا لَهُ فِي ذَلِكَ؟ فَقَالَ: مَا قُلْتُ مِنْ عِنْدِي شَيْئًا، إِنَّ اللَّهَ تَعَالَى يَقُولُ فِي سُورَةِ&rdquo; نُوحٍ&rdquo;<br />\r\n&quot;Ada seorang lelaki mengeluhkan kepada Al-Hasan Al-Bashri tentang musim kering, maka Al-Hasan berkata kepadanya, &quot;Beristighfarlah !&quot;. Lalu ada lelaki yang lain mengeluhkan kepadanya tentang kemiskinannya. Maka Al-Hasan berkata, &quot;Beristighfarlah !&quot;. Lalu datang lelaki yang lain seraya berkata, &quot;Doakanlah untukku agar Allah menganugerahkan bagiku anak&quot;. Maka Al-Hasan berkata kepadanya, &quot;Beristighfarlah !&quot;. Lalu datang lelaki yang lain yang mengeluhkan akan kebunnya yang kering. Maka Al-Hasan berkata kepadanya. &quot;Beristighfarlah !&quot;.<br />\r\nKamipun berkata kepadanya tentang jawabannya tersebut, maka Al-Hasan berkata, &quot;Aku sama sekali&nbsp;<br />\r\nAllah&nbsp;Subhanahu wa Ta&rsquo;ala&nbsp;berfirman menjelaskan seruan Nabi Nuh&nbsp;&lsquo;alaihis salamkepada kaumnya,<br />\r\nفَقُلْتُ اسْتَغْفِرُوا رَبَّكُمْ إِنَّهُ كَانَ غَفَّارًا. يُرْسِلِ السَّمَاءَ عَلَيْكُمْ مِدْرَارًا. وَيُمْدِدْكُمْ بِأَمْوَالٍ وَبَنِينَ وَيَجْعَلْ لَكُمْ جَنَّاتٍ وَيَجْعَلْ لَكُمْ أَنْهَارًا.<br />\r\n&ldquo;Maka saya berkata (kepada mereka), &lsquo;Mohonlah ampunan kepada&nbsp;Rabb&nbsp;kalian (karena) sesungguhnya Dia Maha Pengampun. Niscaya Dia akan menurunkan hujan yang lebat dari langit atas kalian. Dan Dia akan melipatkangandakan harta dan anak-anak kalian, mengadakan kebun-kebun atas kalian, serta mengadakan sungai-sungai untuk kalian.&rdquo;&nbsp;[Nuh: 10-12]</p>\r\n\r\n<p style=\"text-align:justify\">Adapun jika kita kembali menuju jalan Allah maka setidaknya akan &nbsp;Menghindarkan Hamba dari Siksa Allah dan Musibah</p>\r\n\r\n<p style=\"text-align:justify\">Allah&nbsp;Subhanahu wa Ta&rsquo;ala&nbsp;berfirman,<br />\r\nوَمَا كَانَ اللَّهُ لِيُعَذِّبَهُمْ وَأَنْتَ فِيهِمْ وَمَا كَانَ اللَّهُ مُعَذِّبَهُمْ وَهُمْ يَسْتَغْفِرُونَ.<br />\r\n&ldquo;Dan Allah tidak akan menyiksa mereka sedang mereka dalam keadaan beristighfar.&rdquo;&nbsp;[Al-Anfal: 33]<br />\r\nMaka harga mati untuk kita kembali kepada Allah dengan taubat dan memperbanyak istighfar adapun keutamaan taubat diantanya :</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n<strong>&nbsp; &nbsp; 1. Orang yg bertaubat meraih kecintaan Allah.</strong><br />\r\nAllah berfirman :<br />\r\n... إِنَّ ٱللَّهَ يُحِبُّ ٱلتَّوَّٰبِينَ وَيُحِبُّ ٱلۡمُتَطَهِّرِينَ ٢٢٢&nbsp;<br />\r\n&quot;Sesungguhnya Allah menyukai orang-orang yang bertaubat dan menyukai orang-orang yang mensucikan diri&quot;&nbsp;(QS Albaqoroh : 222)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp; &nbsp;<strong> 2. Orang yg bertaubat ditambah rizkinya oleh Allah.</strong></p>\r\n\r\n<p style=\"text-align:justify\">Allah berfirman tentang perkataan Nabi Nuuh &lsquo;alaihis salam kepada kaumnya, Demikian juga perkataan Nabi Huud &lsquo;alaihis salam kepada kaumnya:</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nوَيَٰقَوۡمِ ٱسۡتَغۡفِرُواْ رَبَّكُمۡ ثُمَّ تُوبُوٓاْ إِلَيۡهِ يُرۡسِلِ ٱلسَّمَآءَ عَلَيۡكُم مِّدۡرَارٗا وَيَزِدۡكُمۡ قُوَّةً إِلَىٰ قُوَّتِكُمۡ وَلَا تَتَوَلَّوۡاْ مُجۡرِمِينَ ٥٢&nbsp;<br />\r\n&quot;Hai kaumku, mohonlah ampun kepada Tuhanmu lalu bertobatlah kepada-Nya, niscaya Dia menurunkan hujan yang sangat deras atasmu, dan Dia akan menambahkan kekuatan kepada kekuatanmu, dan janganlah kamu berpaling dengan berbuat dosa.&quot;&nbsp;(QS Huud : 52)</p>\r\n\r\n<p style=\"text-align:justify\">demikianlah tulisan ringkas ini semoga bermanfaat. Wallahu a&lsquo;lam</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Kajian Ustadz Ruslan Gunawan Hafidzahullah</p>\r\n', '', '', 'media/upload/2019/06/doa-solat.jpg', '', '2019-06-30 16:05:36', '2023-07-05 02:13:07', 52, 'publish', 0, 0);
INSERT INTO `d_blog` (`id`, `a_pengguna_id`, `b_user_id`, `kategori`, `title`, `slug`, `mtitle`, `mkeyword`, `mdescription`, `mauthor`, `mimage`, `content`, `excerpt`, `tags`, `featured_image`, `featured_thumb`, `cdate`, `ldate`, `jml_baca`, `status`, `is_follow_up`, `is_read`) VALUES
(46, 1, 0, 'tazkiyatunnufus,', 'Istiqomah', 'istiqomah', 'Istiqomah', 'istiqomah', 'Kita semua sepakat bahwa seluruh umat manusia di dunia ini ingin bahagia, orang yang kuliah S1 pasti ingin bahagia, orang yang biasa sholat pasti ingin bahagia ', 'S-Admin1', 'media/upload/2019/06/verne-ho-8bx2qcayaqe-unsplash.jpg', '<p style=\"text-align:justify\">Kita semua sepakat bahwa seluruh umat manusia di dunia ini ingin bahagia, orang yang kuliah S1 pasti ingin bahagia, orang yang biasa sholat pasti ingin bahagia begitupula orang yang biasa meninggalkan sholatpun pasti kalua kita tanya apakah dia ingin bahagia ? pasti dia menjawab ingin bahagia, dank unci dari kebahagiaan itu salah satunya adalah Al Qur&rsquo;an, alquran memberikan petunjuk ke arah pencapaian kebahagiaan yang hakiki, yaitu kebahagiaan di dunia dan di akhirat. Kebahagiaan yang hendak di capai bukanlah kebahagiaan berdasarkan perkiraan pikiran manusia saja, melainkan kebahagiaan yang dirancang oleh pemilik dan pencipta kebahagiaan, yakni kebahagiaan abadi. Alquran memberikan petunjuk yang jelas, yaitu meletakkan seluruh aspek kehidupan kedalam kerangka ibadah kepada Allah ta&lsquo;la. Sebagai kitab petunjuk dan sebagai syariah terakhir, Alquran membawa nilai-nilai yang pernah ada. Nilai-nilai tersebut menyentuh semua potensi manusia dan segala aspek serta bidang kehidupannya. Salah satu nilai yang terdapat atau diajarkan dalam Alquran adalah bersikap istiqomah atau teguh pendirian dalam tauhid dan tetap beramal saleh. Istiqomah berarti berpendirian teguh atas jalan yang lurus, berpegang pada aqidah dan melaksanakan syariat dengan teguh, tidak berubah dan berpaling walau dalam keadaan apapun. Fungsi petunjuk dari Alquran akan bermanfaat sesuai tujuannya apabila manusia menggunakannya sesuai petunjuk.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nSalah satu kenikmatan yang Allah ta&lsquo;la berikan kepada kita adalah al-istiqomah, di dalam kehidupan manusia, Allah telah menetapkan jalan yang harus ditempuh oleh manusia melalui syariat-Nya sehingga seseorang senantiasa Istiqomah dan tegak di atas syariat-Nya, selalu menjalankan perintah-Nya, menjauhi larangan-Nya serta tidak berpaling ke kanan dan ke kiri. Allah ta&rsquo;ala telah memerintahkan orang-orang yang beriman untuk senantiasa istiqomah.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp; &nbsp; <strong>1. Definisi Istiqomah</strong><br />\r\nSecara Bahasa istiqomah adalah menetap dalam satu keadaan, misalkan seseorang yang biasa datang tepat waktu untuk menuju tempat kerjanya maka dia dikatakan istiqomah (didalam kebaikan), adapun orang-orang yang biasa dating ke tempat kajian ilmu dengan selalu terlambat maka dia pun dikatakan istiqomah (dalam kejelekan)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nSecara Istilah istiqomah adalah &nbsp;menempuh jalan (agama) yang lurus (benar) dengan tidak berpaling ke kiri maupun ke kanan dalam melaksanaan semua bentuk ketaatan (kepada Allah) lahir dan batin, dan meninggalkan semua bentuk larangan-Nya. Inilah pengertian istiqomah yang disebutkan oleh Ibnu Rajab Al Hambali (dalam kitab &nbsp;Jaami&rsquo;ul &lsquo;Ulum wal Hikam)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nBahkan banyak ulama yang mendefinisikan al-Istiqomah sebagaimana yang di katakana oleh &nbsp;Imam an-Nawawi rahimahullah mengatakan :&rdquo; al istiqomah adalah menetap dan selalu ada dalam ketaatan kepada Allah Azza wa Jalla.&rdquo;<br />\r\nUmar bin Khattab radhiallahu &rsquo;anhu&nbsp;: &quot;Hendaknya kita bertahan dalam satu perintah atau larangan, tidak berpaling seperti berpalingnya seekor musang&quot;.<br />\r\nBerkata Syeich Abdurrojaq bahwa al-istiqomah akan dirasakan oleh manusia itu berupa kenikmatan kebahagiaan dunia dan akhirat dan ini merupakan keberuntungan seorang hamba dan kebaikan seluruhnya untuk seorang hamba</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp; <strong>&nbsp; 2. Dalil Al-Istiqomah dan Penjelasannya</strong><br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; 2.1 Dalam Al-Qur&rsquo;an<br />\r\nDi antara ayat yang menyebutkan keutamaan istiqomah adalah firman Allah&nbsp;Ta&rsquo;ala,<br />\r\nإِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلائِكَةُ أَلا تَخَافُوا وَلا تَحْزَنُوا وَأَبْشِرُوا بِالْجَنَّةِ الَّتِي كُنْتُمْ تُوعَدُونَ<br />\r\n&ldquo;Sesungguhnya orang-orang yang mengatakan: &ldquo;Rabb kami ialah Allah&rdquo;&nbsp;kemudian mereka istiqomah pada pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): &ldquo;Janganlah kamu merasa takut dan janganlah kamu merasa sedih; dan bergembiralah kamu dengan (memperoleh) surga yang telah dijanjikan Allah kepadamu&rdquo;.<br />\r\n(QS. Fushilat: 30)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nPada potongan ayat Innalladziina qoo luu Robbunallaahu tsummastaqoomu seorang mufassir Imam Ibnu Katsir menafsirkan&rdquo;ayat ini membuktikan adanya pengakuan keimanan dalam diri seseorang kepada Allah ta&lsquo;la, dengan konsekuensi mengucapkan Robbunallah dan ini merupakan 1 isyarat iqror billisan (pengakuan dalam lisan) kaitan denagn tauhid Rububiyah.artinya mengakui bahwa Allah yang menciptakan, mengatur dan mengurus kaitan dengan penciptaan Allah ta&lsquo;la, maka untuk orang-orang seperti itu tatanajjalu &lsquo;alaihimul malaikah maka ketika itu para malaikat akan turun berbondong-bondong ketika kematian akan menjemput tentunya untuk orang-orang yang istiqomah Para malaikat itu memberikan rasa aman dari ketakutan ketika kematian menjemput, menghilangkan kesedihannya dengan sebab berpisah dengan anaknya karena All&acirc;h adalah pengganti dari hal itu, memberikan kabar gembira berupa ampunan dari dosa dan kesalahan, diterimanya amal, dan kabar gembira dengan surga yang&nbsp;telah dijanjikan Allah ta&lsquo;la, sedangkan janji Allah itu adalah benar, seperti halnya dalam firman Allah ta&lsquo;la di dalam QS:Yunus : 55</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nۗ أَلَآ إِنَّ وَعْدَ ٱللَّهِ حَقٌّ وَلَٰكِنَّ أَكْثَرَهُمْ لَا يَعْلَمُونَ</p>\r\n\r\n<p style=\"text-align:justify\">&ldquo;Ingatlah, sesungguhnya janji Allah itu benar, tetapi kebanyakan mereka tidak mengetahui(nya)&rdquo;.<br />\r\nAbdullah ibnu mubarroq pernah ditanya :&rdquo;apa asal dari kebaikan ?&rdquo; beliau menjawab :&rdquo;Al-Istiqomah.&rdquo;<br />\r\nMaka dengan istiqomah walaa takhoofu janganlah seseorang merasa takut terhadap perkara-perkara yang akan dijumpainya setelah kematian, kaitan dengan mahsyar, mizan, al shirot al mustaqiim untuk mereka ada didalam pertolongan Allah ta&lsquo;la.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nLalu kemudian untuk orang-orang yang istiqomah walaa tahjanu jangan merasa bersedih dengan sesuatu yang mereka tinggalkan di dunia karena Allah sebagai penggantinya, seperti anak-anak mereka, pekerjaan, harta dan apapun yang ditinggalkannya didunia maka Allah ta&lsquo;la akan mengurusnya, di dalam terusan ayat-Nya maka Allah ta&lsquo;la mengabarkan Waabsiruu bergembiralah untuk orang-orang yang istiqomah karena Allah ta&lsquo;la menjanjikan surga kepadanya biljannatillatii kuntum tuu&rsquo;aduun yang telah Allah janjikan kepadamu, sungguh kebahagiaan yang sangat agung disaat seseorang Allah ijinkan masuk kedalam surga-Nya, dan tidak hanya itu satu kenikmatan lagi yang begitu sangat dirindukan oleh para penduduk surga yaitu perjumpaan mereka dengan Rabb sesmesta alam yang dulu mereka agungkan dan sucikan yaitu Allah ta&lsquo;la.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nMaka kembali ditegaskan bahwa surgakan Allah ta&lsquo;la berikan diantaranya kepada orang-orang yang istiqomah dengan istiqomahnya itu tidak ditumpangi syaithon, artinya bisa saja seseorang yang biasa melaksanakan sholat 5 waktu tetapi sertai hawa yang ditumpangi syaithon untuk mengakhir-akhirkan dalam melaksanakannya, kemudian mendatangi majelis ilmu tetapi hatinya ditumpangi hawa yang ditumpangi syaithon untuk segera selesai, maka di saat hawa ditumpangi syaithon enyahkanlah dari hatimu, tentunya untuk orang-orang yang beriman musti untuknya menjauhkan dari hawa nafsu yang membinasakannya.</p>\r\n\r\n<p style=\"text-align:justify\">Maka untuk itu dalam terusan ayatnya Allah ta&lsquo;la berfirman :<br />\r\n&nbsp;نَحْنُ أَوْلِيَاؤُكُمْ فِي الْحَيَاةِ الدُّنْيَا وَفِي الْآخِرَةِ ۖ وَلَكُمْ فِيهَا مَا تَشْتَهِي أَنْفُسُكُمْ وَلَكُمْ فِيهَا مَا تَدَّعُونَ</p>\r\n\r\n<p style=\"text-align:justify\">&rdquo;Kami lah Pelindung-pelindungmu dalam kehidupan dunia dan di akhirat; di dalamnya kamu memperoleh apa yang kamu inginkan dan memperoleh (pula) di dalamnya apa yang kamu minta.&rdquo;(QS.Al-Fushilat : 31).</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nArtinya sesungguhnya &nbsp;Allah sajalah yang akan melindungi kita baik dunia dan akhirat, para malaikat berkata kepada orang-orang mukmin ketika kematian, نَحْنُ أَوْلِيَاؤُكُمْ &quot;Kamilah pelindung-pelindungmu&quot;; yakni pendamping-pendamping kalian di dalam kehidupan dunia, kami menunjukkan, mengarahkan, dan melindungi kalian dengan perintah All&acirc;h. Begitu juga kami akan bersama kalian di akhirat, menemani kesendirian kalian di alam kubur, ketika ditiupnya sangkakala, dan mengamankan kalian pada hari kebangkitan dan berkumpulnya manusia, serta membawa kalian melintasi ash-shir&acirc;th al-mustaq&icirc;m, dan menyampaikan kalian ke surga yang penuh nikmat.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nDi saat harta dan anak-anak sudah tidak akan berguna di akhirat kelak, sepeti firman Allah ta&lsquo;la yang artinya :&rdquo;(yaitu) pada hari (ketika) harta dan anak-anak tidak berguna kecuali orang-orang yang menghadap Allah dengan hati yang bersih.&rdquo; (QS. Asyu&rdquo;ara 88-89)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nLantas daripada itu salah satu agar kita senantiasa bisa istiqomah bertemanlah dengan orang-orang sholih karena Allah ta&lsquo;la karena dengan berteman bersama mereka setidaknya kita akan selalu diingatkan di kala kita tersesat dan jauh dari Allah ta&lsquo;la, karena sesungguhnya seseorang yang berteman dengan orang-orang yang tidak jelas dalam keimannannya maka kita akan bersama mereka di neraka begitu pula sebaliknya disaat kita berteman dengan orang-orang yang jelas terhadap keimanannya maka kita pun akan bersamanya di dalam surganya Allah ta&lsquo;la. Maka daripada itu siapakah teman kita ? apakah mereka yang biasa terlena di dalam music, minum-minuman khomr atau mereka yang biasa meninggalkan sholat 5 waktu ? hanya kita yang bisa menjawabnya. Dalam riwayat Tirmidzi disebutkan sabda Nabi shallallahu &lsquo;alaihi wa sallam,<br />\r\nالْمَرْءُ مَعَ مَنْ أَحَبَّ وَأَنْتَ مَعَ مَنْ أَحْبَبْتَ</p>\r\n\r\n<p style=\"text-align:justify\">&ldquo;Seseorang akan bersama dengan orang yang ia cintai. Dan engkau akan bersama orang yang engkau cintai.&rdquo; (HR. Tirmidzi no. 2385. Syaikh Al Albani mengatakan bahwa hadits ini shahih)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nIstiq&acirc;mah adalah meniti ash-shir&acirc;thal mustaq&icirc;m, yaitu agama yang lurus yang tidak melenceng ke kiri dan ke kanan. Istiq&acirc;mah mencakup pengamalan seluruh ketaatan, yang lahir maupun batin serta meninggalkan larangan yang lahir maupun batin, Allah Azza wa Jalla berfirman: &ldquo;Maka tetaplah engkau (Muhammad) (di jalan yang benar), sebagaimana telah diperintahkan kepadamu dan (juga) orang yang bertaubat bersamamu, dan janganlah kamu melampaui batas, Sungguh Dia Maha Melihat apa yang kamu kerjakan.&rdquo; (H&ucirc;d/11:112)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nDasar dari istiq&acirc;mah adalah keistiq&acirc;mah-an hati di atas tauhid mereka adalah orang-orang yang tidak berbuat syirik kepada Allah Azza wa Jalla dan tidak menoleh kepada tuhan selain Allah Azza wa Jalla. Jadi, jika hati telah istiq&acirc;mah di atas ma&rsquo;rifatull&acirc;h, takut kepada-Nya, mengagungkan-Nya, segan kepada-Nya, mencintai-Nya, menginginkan-Nya, berharap kepada-Nya, berdoa kepada-Nya, bertawakkal kepada-Nya dan berpaling dari selain Dia, maka sungguh, seluruh anggota badan akan istiq&acirc;mah dengan taat kepada-Nya. Karena hati adalah raja bagi organ tubuh (lainnya) yang merupakan pasukan hati. Jika raja sudah istiq&acirc;mah, maka pasukan dan rakyatnya akan istiq&acirc;mah pula.<br />\r\nMaka bersungguh-sungguhlah kita didalam berharap perjumpaan dengan Allah ta&lsquo;la, karena nabi bersabda :<br />\r\nمَنْ أَحَبَّ لِقَاءَ اللهِ أَحَبَّ اللهُ لِقَاءَهُ، وَمَنْ كَرِهَ لِقَاءَ اللهِ كَرِهَ اللهُ لِقَاءَهُ ) .قُلْنَا : يَارَسُولَ اللهِ، كُلُّنَا نَكْرَهُ الْمَوْتَ. قَالَ: (لَيْسَ ذَاكَ كَرَاهِيَةَ الْمَوْتِ، وَلَكِنَّ الْمُؤْمِنَ إِذَا حُضِرَ جَاءَهُ الْبَشِيرُ مِنَ اللهِ عَزَّوَجَلَّ بِمَا هُوَ صَائِرٌ إِلَيْهِ، فَلَيْسَ شَيْءٌ أَحَبَّ إِلَيْهِ مِنْ أَنْ يَكُونَ قَدْ لَقِيَ اللهَ عَزَّوَجَلَّ، فَأَحَبَّ اللهُ لِقَاءَهُ. وَإِنَّ الْفَاجِرَ أَوِ الْكَافِرَ إِذَا حُضِرَ جَاءَهُ بِمَا هُوَ صَائِرٌ إِلَيْهِ مِنَ الشَّرِّ أَوْ مَايَلْقَاهُ مِنَ الشَّرِّ، فَكَرِهَ لِقَاءَاللهِ، وَكَرِهَ اللهُ لِقَاءَهُ).</p>\r\n\r\n<p style=\"text-align:justify\">&quot; Barangsiapa menyukai perjumpaan dengan All&acirc;h, niscaya All&acirc;h suka untuk menjumpainya. Dan barangsiapa membenci perjumpaan dengan All&acirc;h, niscaya All&acirc;h benci menjumpainya.&rdquo; Kami bertanya, &rdquo;Ya Ras&ucirc;lull&acirc;h, kami semuanya benci kepada kematian.&rdquo; Ras&ucirc;lull&acirc;h Shallallahu &rsquo;alaihi wa sallam menjawab, &rdquo;Bukan itu yang dimaksud benci kematian. Akan tetapi jika seorang Mukmin berada dalam detik kematiannya, maka datanglah kabar gembira dari All&acirc;h Ta&rsquo;ala tentang tempat kembali yang ditujunya. Maka tidak ada sesuatu pun yang lebih dicintainya daripada menjumpai All&acirc;h Ta&rsquo;ala, maka All&acirc;h pun suka menjumpainya. Dan sesungguhnya orang yang jahat atau kafir jika berada dalam detik kematiannya, maka datanglah berita tentang tempat kembali yang dituju berupa keburukan atau apa yang akan dijumpainya berupa keburukan, lalu dia benci bertemu dengan All&acirc;h, maka All&acirc;h pun benci menemuinya.&rdquo; &nbsp;(HR Ahmad)</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp; &nbsp;<strong> 3. Kiat-Kiat untuk bisa istiqomah</strong>, diantaranya :<br />\r\nDi antara kiat yang dapat mengantarkan kepada istiq&acirc;mah dalam berbagai kondisi, perkataan, dan perbuatan ialah:&nbsp;<br />\r\n&nbsp; &nbsp; 1. Taubat kepada Allah ta&lsquo;la<br />\r\n&nbsp; &nbsp; 2. Meninggalkan kemusyrikan dan berpegang teguh pada tauhid<br />\r\n&nbsp; &nbsp; 3. Muhasabatunnas / Instosfeksi diri<br />\r\n&nbsp; &nbsp; 4. Muroqobbah/ Merasa di awasi oleh Allah ta&lsquo;la<br />\r\n&nbsp; &nbsp; 5. Ikhlas dan selalu Ittiba (Mengikuti Nabi ﷺ)<br />\r\n&nbsp; &nbsp; 6. Mujahadah<br />\r\n&nbsp; &nbsp; 7. Meninggalkan perbuatan bid&rsquo;ah<br />\r\n&nbsp; &nbsp; 8. Konsisten berada dalam kebenaran<br />\r\n&nbsp; &nbsp; 9. Assholaatu &lsquo;alal waktiha / sholat tepat waktu. Secara berjamaah<br />\r\n&nbsp; &nbsp; 10. Mencari ilmu yang bermanfat<br />\r\n&nbsp; &nbsp; 11. Takut kepada Allah ta&lsquo;la<br />\r\n&nbsp; &nbsp; 12. Berteman dengan orang-orang sholih<br />\r\n&nbsp; &nbsp; 13. Berdo&rsquo;a<br />\r\n&nbsp; &nbsp; 14. Menjaga lisan dan hati<br />\r\n&nbsp; &nbsp; 15. Dzikrullah<br />\r\nDiantara do&rsquo;a agar kita tetap istiqomah dalam memegang teguh agama islam yang sesuai dengan syari&rsquo;at yang benar.<br />\r\n&nbsp; &nbsp; 1. يَا مُقَلِّبَ الْقُلُوْبِ ثَبِّتْ قَلْبِيْ عَلَى دِيْنِك<br />\r\nArtinya: &ldquo;Wahai Dzat yang membolak-balikkan hati, teguhkan hati kami di atas agama-Mu.&rdquo;<br />\r\n[HR.Tirmidzi 3522, Ahmad 4/302, al-Hakim 1/525, Lihat Shohih Sunan Tirmidzi III no.2792]</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n&nbsp; &nbsp; 2. رَبَّنَا لا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِنْ لَدُنْكَ رَحْمَةً إِنَّكَ أَنْتَ الْوَهَّابُ<br />\r\nArtinya: &ldquo;Ya Tuhan kami, janganlah Engkau jadikan hati kami condong kepada kesesatan sesudah Engkau beri petunjuk kepada kami, dan karuniakanlah kepada kami rahmat dari sisi Engkau; karena sesungguhnya Engkau-lah Maha Pemberi (karunia).&rdquo;<br />\r\n(QS. Ali Imran: 8)</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp; &nbsp; &nbsp; &nbsp; 2.2 Dalam Hadits :</p>\r\n\r\n<p style=\"text-align:justify\">عَنْ أَبِي عَمْرو، وَقِيْلَ : أَبِي عَمْرَةَ سُفْيَانُ بْنِ عَبْدِ اللهِ الثَّقَفِي رَضِيَ اللهُ عَنْهُ قَالَ : قُلْتُ : يَا رَسُوْلَ اللهِ قُلْ لِي فِي اْلإِسْلاَمِ قَوْلاً لاَ أَسْأَلُ عَنْهُ أَحَداً غَيْرَكَ . قَالَ : قُلْ آمَنْتُ بِاللهِ ثُمَّ اسْتَقِم [رواه مسلم]<br />\r\nDari Abu Amr (ada yang menyebutnya Abu Amrah) Sufyan binn Abdillah ra. berkata kepada Rasulullah ﷺ.: &ldquo;Wahai Rasulallah, katakan kepadaku perkataan tentang Islam yang tidak akan kutanyakan kepada selain engkau.&rdquo; Beliau bersabda: &ldquo;Katakanlah: &lsquo;Aamantu billaahi [aku beriman kepada Allah].&rsquo; Kemudian istiqamahlah.&rdquo; (HR Muslim)<br />\r\nMaka dengan ini penulis mengajak untuk Istiqamah di jalan Allah, yakni senantiasa teguh dan konsisten untuk menjaga keimanan, dan teguh dalam menjalankan semua perintah Allah ta&lsquo;la merupakan kewajiban bagi setiap kaum Muslim. &nbsp;Siapa saja yang istiqamah di jalan Allah, niscaya mereka akan mendapatkan banyak keutamaan, diantaranya adalah; pertama, penjagaan malaikat baik di kehidupan dunia maupun akherat. Kedua, karunia yang melimpah ruah, berujud harta yang banyak, kelapangan usaha, dan kebahagian hidup di dunia dan akherat. Keistiqamahan di jalan Allah direfleksikan dalam bentuk; teguh dalam keimanan, ikhlash dalam perbuatan, dan selalu menunaikan seluruh kewajiban.&nbsp; &nbsp;&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Maka di akhir tulisan ada satu pertanyaan yang ingin penulis tanyakan dan cukup dijawab di dalam hati saja, &ldquo;Sudah siapkah kita di masukkan ke dalam surganya Allah ta&lsquo;la ??&rdquo;<br />\r\nWallahu a&lsquo;lam</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Kajian Ustadz Ruslan Gunawan Hafidzahullah</p>\r\n', 'kiat kiat istiqomah', '', 'media/upload/2019/06/verne-ho-8bx2qcayaqe-unsplash.jpg', '', '2019-06-30 16:32:56', '2023-07-10 01:18:38', 64, 'publish', 0, 0),
(47, 1, 0, 'manhaj,', 'Jalan Mana yang Kau Tempuh', 'jalan-mana-yang-kau-tempuh', 'Jalan Mana yang Kau Tempuh', 'manhaj', 'Menempuh perjalanan akan sulit ditempuh jika tidak tahu alamat. Menempuh perjalanan jika salah alamat akan nyasar. Perjalanan yang salah akan berujung rasa ', 'S-Admin1', 'media/upload/2019/07/luke-stackpoole-zrsjmpt9pni-unsplash.jpg', '<p style=\"text-align:justify\">Menempuh perjalanan akan sulit ditempuh jika tidak tahu alamat. Menempuh perjalanan jika salah alamat akan nyasar. Perjalanan yang salah akan berujung rasa lelah karena tak kan sampai pada tempat yang di tuju.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nMaka apalagi ini urusan akhirat maka mesti jelas kita melangkah agar tak salah tempat singgah nanti, maka tentukan pilihan anda hari ini apakah anda ingin terus salah dalam menempuh jalan atau anda menginginkan keselamatan.</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nAnda mengingat sabda Rasulullah Muhammad&nbsp;shalallahu alaihi wa sallam:<br />\r\nكُلُّ الناسِ يَغْدُو فَبَائِعٌ نَفْسَهُ فَمُعْتِقُهَا أو مُوبِقُهَا<br />\r\n&ldquo;Setiap hari semua orang melakukan perjalanan hidupnya, keluar mempertaruhkan dirinya! Ada yang membebaskan dirinya dan ada pula yang mencelakakannya!&rdquo;&nbsp;(HR. Muslim).</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nAllah ta&rsquo;ala berfirman :<br />\r\nوَأَنَّ هَٰذَا صِرَٰطِي مُسۡتَقِيمٗا فَٱتَّبِعُوهُۖ وَلَا تَتَّبِعُواْ ٱلسُّبُلَ فَتَفَرَّقَ بِكُمۡ عَن سَبِيلِهِۦۚ ذَٰلِكُمۡ وَصَّىٰكُم بِهِۦ لَعَلَّكُمۡ تَتَّقُونَ ١٥٣<br />\r\n&ldquo;Artinya : Dan bahwa (yang Kami perintahkan ini) adalah jalan-Ku yang lurus, maka ikutilah dia; janganlah kalian mengikuti jalan-jalan (yang lain), karena jalan-jalan itu mencerai-beraikan kamu dari jalan-Nya. Yang demikian itu diperintahkan oleh Allah kepadamu agar kamu bertaqwa.&rdquo; [Al-An&rsquo;aam: 153]</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nJalan yang lurus adalah satu-satunya jalan yang di ridhoi Allah Ta&rsquo;ala. Yaitu jalan yang ditempuh oleh Rasulullah shalallahu alaihi wa sallam dan para sahabat beliau. Sedangkan As-Subul adalah jalan-jalan lain yaitu cara beragama yang menyelisihi jalannya Rasulullah shalallahu alaihi wa sallam dan para sahabatnya.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nSuatu saat Abdullah bin Mas&rsquo;ud&nbsp;radhiyallahu &lsquo;anhu&nbsp;berkisah,</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nعَنْ عَبْدِ اللهِ بْنِ مَسْعُودٍ ، قَالَ : خَطَّ لَنَا رَسُولُ اللهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ خَطًّا ، ثُمَّ قَالَ : هَذَا سَبِيلُ اللهِ ، ثُمَّ خَطَّ خُطُوطًا عَنْ يَمِينِهِ وَعَنْ شِمَالِهِ ، ثُمَّ قَالَ : هَذِهِ سُبُلٌ - قَالَ يَزِيدُ : مُتَفَرِّقَةٌ - عَلَى كُلِّ سَبِيلٍ مِنْهَا شَيْطَانٌ يَدْعُو إِلَيْهِ ، ثُمَّ قَرَأَ : {وَإِنَّ هَذَا صِرَاطِي مُسْتَقِيمًا فَاتَّبِعُوهُ وَلاَ تَتَّبِعُوا السُّبُلَ ، فَتَفَرَّقَ بِكُمْ عَنْ سَبِيلِهِ}<br />\r\n&ldquo;Rasulullah Shallallahu &lsquo;alaihi wa sallam membuat sebuah garis lurus bagi kami, lalu bersabda, &lsquo;Ini adalah jalan Allah&rsquo;, kemudian beliau membuat garis lain pada sisi kiri dan kanan garis tersebut, lalu bersabda, &lsquo;Ini adalah jalan-jalan (yang banyak). Pada setiap jalan ada syetan yang mengajak kepada jalan itu,&rsquo; &nbsp;kemudian beliau membaca,</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\n{وَأَنَّ هَذَا صِرَاطِي مُسْتَقِيمًا فَاتَّبِعُوهُ وَلاَتَتَّبِعُوا السُّبُلَ فَتَفَرَّقَ بِكُمْ عَنْ سَبِيلِهِ}<br />\r\n&lsquo;Dan bahwa (yang Kami perintahkan) ini adalah jalan-Ku yang lurus, maka ikutilah dia dan janganlah kamu mengikuti jalan-jalan (yang lain), karena jalan-jalan itu mencerai-beraikan kalian dari jalan-Nya&rsquo;&rdquo;&nbsp;([Al An&rsquo;am: 153] )Hadits shahih diriwayatkan oleh Ahmad dan yang lainnya)<br />\r\nNabi&nbsp;shallallahu &lsquo;alaihi wa sallam&nbsp;telah menjelaskan jalan yang lurus tersebut dalam sabda beliau&nbsp;shallallahu &lsquo;alaihi wa sallam,</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nتَرَكْتُ فِيكُمْ مَا إِنْ تَمَسَّكْتُمْ بِهِ لَنْ تَضِلُّوا بَعْدِي أَبَدًا كِتَابَ اللَّهِ وَسُنَّتِيْ<br />\r\n&ldquo;Aku tinggalkan untuk kalian sesuatu. Jika kalian berpegang teguh kepadanya, kalian tidak akan sesat selama-lamanya, yaitu Kitab Allah dan Sunnahku&rdquo; (Diriwayatkan Imam Malik dan yang lainnya, dihasankan oleh Syaikh Al-Albani).</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nKita wajib berpegang teguh dengan &nbsp;Al-Quran dan As-Sunnah, karena kita diwajibkan mena&rsquo;ati Allah dan Rasul-Nya &nbsp;shallallahu &lsquo;alaihi wa sallam, dalilnya adalah firman Allah Ta&rsquo;ala:</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nيَا أَيُّهَا الَّذِينَ آمَنُوا أَطِيعُوا اللَّهَ وَأَطِيعُوا الرَّسُولَ وَأُولِي الْأَمْرِ مِنْكُمْ<br />\r\n&ldquo;Hai orang-orang yang beriman, taatilah Allah dan taatilah Rasul (-Nya), dan Ulil amri di antara kamu&rdquo;&nbsp;(An-Nisaa&rsquo;: 59).<br />\r\nMenaati Allah adalah dengan berpegang teguh kepada Al-Quran dan taat kepada Rasulullah&nbsp;shallallahu &lsquo;alaihi wa sallam&nbsp;dengan berpegang teguh kepada sunnah beliau&nbsp;shallallahu &lsquo;alaihi wa sallam. Sunnah Rasulullah &nbsp;shallallahu &lsquo;alaihi wa sallam&nbsp;adalah sumber hukum Islam<br />\r\nAl-Hadits adalah hujjah/ dalil, sebagaimana Al-Quran, karena keduanya adalah sama-sama wahyu dari Allah.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nوَمَا يَنطِقُ عَنِ ٱلۡهَوَىٰٓ ٣ &nbsp;إِنۡ هُوَ إِلَّا وَحۡيٞ يُوحَىٰ ٤<br />\r\n&ldquo;dan tiadalah yang diucapkannya itu (Al-Quran) menurut kemauan hawa nafsunya, Ucapannya itu tiada lain hanyalah wahyu yang diwahyukan (kepadanya) [An Najm : 3-4]</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\"><br />\r\nRasulullah&nbsp;shallallahu &lsquo;alaihi wa sallam&nbsp;bersabda:<br />\r\nأَلَا إِنِّي أُوتِيتُ الْقُرْآنَ وَمِثْلَهُ مَعَهُ<br />\r\n&ldquo;Ketahuilah sesungguhnya saya diberi (wahyu) Al-Quran dan (wahyu) yang semisalnya bersamaan dengannya (As-Sunnah)&rdquo;&nbsp;(HR. Abu Dawud dan Ahmad dishahihkan Syaikh Al-Albani).</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nHakikatnya berpegang teguh dengan sunnah bukti ketaatan seorang hamba kepada Allah dan mengamalkan Al-Quran, karena Allah berfirman di dalam Al-Quran:<br />\r\nمَنْ يُطِعِ الرَّسُولَ فَقَدْ أَطَاعَ اللَّهَ<br />\r\n&ldquo;Barangsiapa yang mentaati Rasul itu,sesungguhnya ia telah mentaati Allah&rdquo;&nbsp;[An-Nisaa`:80].</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nSunnah Rasulullah&nbsp;Shallallahu &lsquo;alaihi wa sallam&nbsp;hakikatnya sama dengan Kitab Allah, yaitu sama-sama sebagai wahyu Allah. Fungsi sunnah itu sebagai penjelas bagi Kitab Allah&nbsp;&lsquo;Azza wa Jalla.<br />\r\nBahkan, makhluk terbaik yang menafsirkan Al-Quran adalah Rasulullah&nbsp;Shallallahu &lsquo;alaihi wa sallam, sebagaimana firman Allah&nbsp;Azza wa Jalla.</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nوَأَنزَلْنَآ إِلَيْكَ الذِّكْرَ لِتُبَيِّنَ لِلنَّاسِ مَانُزِّلَ إِلَيْهِمْ<br />\r\n&ldquo;Dan Kami turunkan kepadamu Aquran, agar kamu menerangkan kepada umat manusia apa yang telah diturunkan kepada mereka&rdquo;&nbsp;(An Nahl: 44).</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nKesimpulan :</p>\r\n\r\n<p style=\"text-align:justify\">1. Jalan yang lurus adalah jalan yang di dalamnya tercakup hukum-hukum untuk hambanya yang akan sampai pada jalan yang satu (lurus) yaitu al-quran dan sunnah.<br />\r\n2. Jalan yang lurus merupakan jalannya orang-orang yang akan mendapatkan kesuksesan<br />\r\n3. Sedangkan jalan selain jalan yang satu adalah sesat dan akan mewariskan percerai-beraian umat.<br />\r\n4. Ketaqwaan tidak akan tercapai jika bukan mengikuti jalan yang lurus.<br />\r\nSebagai penutup, kita sebagai orang yang berusaha meniti dan mengikuti jalan yang lurus &nbsp;hendaklah merenungkan apa yang disampaikan oleh Imam al-Auza&rsquo;i rahimahullah &nbsp;mengatakan:</p>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nقَالَ الْأَوْزَاعِيُّ : اصْبِرْ نَفْسَك عَلَى السُّنَّةِ , وَقِفْ حَيْثُ وَقَفَ الْقَوْمُ , وَاسْلُكْ سَبِيلَ سَلَفِك الصَّالِحِ , فَإِنَّهُ يَسَعُك مَا وَسِعَهُمْ , وَقُلْ بِمَا قَالُوا , وَكُفَّ عَمَّا كَفُّوا<br />\r\n&ldquo;Bersabarlah dirimu di atas Sunnah, tetaplah tegak sebagaimana para Shahabat tegak di atasnya. Katakanlah sebagaimana yang mereka katakan, tahanlah dirimu dari apa-apa yang mereka menahan diri darinya. Dan ikutilah jalan Salafush Shalih, karena akan mencukupi kamu apa saja yang mencukupi mereka.&rdquo; (Syarah Ushul I&rsquo;tiqad Ahli Sunnah : 1/154)<br />\r\nWallahu a&lsquo;lam</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Kajian Ustadz Ruslan Gunawan Hafidzahullah</p>\r\n', 'mengambil jalan beribadah', '', 'media/upload/2019/07/luke-stackpoole-zrsjmpt9pni-unsplash.jpg', '', '2019-07-01 10:15:34', '2023-07-05 02:13:23', 58, 'publish', 0, 0),
(48, 1, 0, 'ilmu,', 'Mari Menuntut Ilmu', 'mari-menuntut-ilmu', 'Mari Menuntut Ilmu', 'ilmu', 'Sebagai seorang muslim kita memiliki kewajiban untuk melaksanakan apasaja yang Allah Subhanahu wata', 'S-Admin1', 'media/upload/2019/07/adli-wahid-dc-iljqs6ig-unsplash.jpg', '<p>Sebagai seorang muslim kita memiliki kewajiban untuk melaksanakan apasaja yang Allah Subhanahu wata&rsquo;ala perintahkan termasuk perintah untuk menuntut ilmu.<br />\r\nSebagaimana sabda Rasulullah&nbsp;shallallahu &lsquo;alaihi wa sallam,</p>\r\n\r\n<blockquote>\r\n<p><br />\r\nطَلَبُ الْعِلْمِ فَرِيضَةٌ عَلَى كُلِّ مُسْلِمٍ<br />\r\n&rdquo;Menuntut ilmu itu&nbsp;wajib&nbsp;atas setiap muslim&rdquo;.&nbsp;(HR. Ibnu Majah. Dinilai&nbsp;shahih&nbsp;oleh Syaikh Albani dalam&nbsp;Shahih wa Dha&rsquo;if Sunan Ibnu Majah&nbsp;no. 224)</p>\r\n</blockquote>\r\n\r\n<p><br />\r\nAllah Tabaraka wata&rsquo;ala tidak mewajibkan kita untuk melakukan perintah melainkan menjadi kebaikan dan keutamaan bagi kita sendiri selaku hamba-Nya.<br />\r\nBerikut ini adalah beberapa hadist tentang keutamaan menuntut ilmu agar kita menjadi orang yang semangat dalam mencari ilmu.<br />\r\nDari Mu&rsquo;awiyah bin Abi Sufyan&nbsp;Radhiyallahu &lsquo;Anhu&nbsp;, Nabi&nbsp;shallallahu &lsquo;alaihi wa sallam&nbsp;bersabda,</p>\r\n\r\n<blockquote>\r\n<p><br />\r\nمَنْ يُرِدِ اللَّهُ بِهِ خَيْرًا يُفَقِّهْهُ فِى الدِّينِ<br />\r\n&ldquo;Barangsiapa yang Allah kehendaki mendapatkan seluruh kebaikan, maka Allah akan memahamkan dia tentang agama.&rdquo; (HR. Bukhari no. 71 dan Muslim no. 1037).</p>\r\n</blockquote>\r\n\r\n<p><br />\r\nNabi&nbsp;shallallahu &lsquo;alaihi wa sallam&nbsp;bersabda,</p>\r\n\r\n<p><br />\r\nوَمَا اجْتَمَعَ قَوْمٌ فِي بَيْتٍ مِنْ بُيُوتِ اللَّهِ يَتْلُونَ كِتَابَ اللَّهِ وَيَتَدَارَسُونَهُ بَيْنَهُمْ إِلَّا نَزَلَتْ عَلَيْهِمُ السَّكِينَةُ وَغَشِيَتْهُمُ الرَّحْمَةُ وَحَفَّتْهُمُ الْمَلَائِكَةُ وَذَكَرَهُمُ اللَّهُ فِيمَنْ عِنْدَهُ<br />\r\nDan tidaklah sekelompok orang&nbsp;berkumpul di dalam satu rumah di antara rumah-rumah Allah; mereka membaca Kitab Allah dan saling belajar diantara mereka, kecuali ketenangan turun kepada mereka, rahmat meliputi mereka, malaikat mengelilingi mereka, dan Allah menyebut-nyebut mereka di kalangan (para malaikat) di hadapanNya.&rdquo;&nbsp;[HR Muslim, no. 2699; Abu Dawud, no. 3643; Tirmidzi, no. 2646; Ibnu Majah, no. 225; dan lainnya].</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>عَنْ أَنَسِ بْنِ مَالِكٍ رَضِي اللَّهُ عَنْهُ أَنَّ رَسُولَ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ قَالَ إِذَا مَرَرْتُمْ بِرِيَاضِ الْجَنَّةِ فَارْتَعُوا قَالُوا وَمَا رِيَاضُ الْجَنَّةِ قَالَ حِلَقُ الذِّكْرِ<br />\r\nDari Anas bin Malik Radhiyallahu &lsquo;anhu, bahwa Rasulullah Shallallahu &lsquo;alaihi wa sallam bersabda,&rdquo;Jika kamu melewati taman-taman surga, maka singgahlah dengan senang.&rdquo; Para sahabat bertanya,&rdquo;Apakah taman-taman surga itu?&rdquo; Beliau menjawab,&rdquo;Halaqah-halaqah (kelompok-kelompok) dzikir.&rdquo;&nbsp;[HR Tirmidzi, no. 3510 dan lainnya. Lihat Silsilah Al Ahadits Ash Shahihah, no. 2562.]</p>\r\n\r\n<p><br />\r\nمَنْ سَلَكَ طَرِيقًا يَلْتَمِسُ فِيهِ عِلْمًا سَهَّلَ اللَّهُ لَهُ طَرِيقًا إِلَى الجَنَّةِ<br />\r\n&ldquo;Barangsiapa menempuh suatu jalan untuk menuntut ilmu, maka Allah akan mudahkan jalannya menuju surga.&rdquo;( HR: Muslim)</p>\r\n\r\n<blockquote>\r\n<p><br />\r\nAli bin Abi Thalib&nbsp;Radhiallahu &lsquo;Anhu&nbsp;mengatakan:<br />\r\nالْعِلْمُ خَيْرٌ مِنْ الْمَالِ .الْعِلْمُ يَحْرُسُك ، وَأَنْتَ تَحْرُسُ الْمَالِ .الْعِلْمُ حَاكِمٌ وَالْمَالُ مَحْكُومٌ عَلَيْهِ .مَاتَ خَزَّانُ الْأَمْوَالِ وَبَقِيَ خَزَّانُ الْعِلْمِ أَعْيَانُهُمْ مَفْقُودَةٌ ، وَأَشْخَاصُهُمْ فِي الْقُلُوبِ مَوْجُوْدَةٌ<br />\r\n&ldquo;Ilmu lebih baik dari pada harta. Ilmu yang menjagamu, sedangkan kamu yang menjaga harta. Ilmu itu hakim, sedangkan harta dihakimi. Para penyimpan harta meninggal dunia, namun penyimpan ilmu tetap ada. Sekalipun badan mereka tiada, nama mereka tetap ada dalam hati (Al Madkhal : 1/69)</p>\r\n</blockquote>\r\n\r\n<p>Jelaslah sudah bahwa hidup kita hari ini lebih semangat dan siap bekerja keras untuk sebongkah berlian dari pada duduk mendengar ilmu hanya mendangar saja kita sudah malas apalagi mengkajinya ? padahal kita paham sekarang bahwasannya ilmu lebih baik dibandingkan dengan harta. Orang kini lebih tenang jika punya uang dari pada tenang punya ilmu, orang hari ini lebih risau jika tidak punya harta dari pada tidak punya ilmu,. Maka dari itu keterangan di atas menjadi bukti untuk kita sama-sama pegang bahwa majlis ilmu adalah nutrisi hati.<br />\r\nWallahu a&rsquo;lam</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Kajian Ustadz Ruslan Gunawan Hafidzahullah</p>\r\n', '', '', 'media/upload/2019/07/adli-wahid-dc-iljqs6ig-unsplash.jpg', '', '2019-07-02 22:13:54', '2023-07-10 19:53:18', 314, 'publish', 0, 0),
(49, 1, 0, 'ilmu,nasihat-ulama,taziyah,khutbah,', 'Melangkah Pasti', 'melangkah-pasti', 'Melangkah Pasti', 'manhaj', 'Hidup di dunia, memang penuh halang rintang, cobaan silih berganti, pahit manis sungguh sangat terasa dan inilah ujian didunia. Namun semua itu tidak ada ', 'S-Admin1', 'media/upload/2019/07/eberhard-grossgasteiger-fhdn5qvrbfy-unsplash.jpg', '<p style=\"text-align:justify\">Hidup di dunia, memang penuh halang rintang, cobaan silih berganti, pahit manis sungguh sangat terasa dan inilah ujian didunia. Namun semua itu tidak ada masalah bagi hamba Allah Ta&lsquo;ala yang senantiasa melangkah pasti, Lurus, kuat, tegar dan berjuang tiada henti, demi meraih satu kata, yakni Ridha Ilahi. Dan inilah kehidupan yang hakiki.<br />\r\nSeperti apa yang telah Allah Ta&lsquo;ala jelaskan dalam firman -Nya :</p>\r\n\r\n<p style=\"text-align:right\"><strong>وَمَنْ أَرَادَ الْآخِرَةَ وَسَعَىٰ لَهَا سَعْيَهَا وَهُوَ مُؤْمِنٌ فَأُولَٰئِكَ كَانَ سَعْيُهُم مَّشْكُورًا</strong></p>\r\n\r\n<p>Dan barangsiapa yang menghendaki kehidupan akhirat dan berusaha ke arah itu dengan sungguh-sungguh sedang ia adalah mukmin, maka mereka itu adalah orang-orang yang usahanya dibalasi dengan baik.(QS. Al - Israa : 19)</p>\r\n\r\n<p style=\"text-align:justify\">Ditengah - tengah manusia sibuk berjuang untuk dunianya, tapi Allah Ta&lsquo;ala dengan kasih sayangnya memberi petunjuk bahwa tujuan hidup yang hakiki itu bukan untuk dunia, namun semua itu mesti kita perjuangkan untuk akhirat.</p>\r\n\r\n<p style=\"text-align:justify\">Dalam hal ini para ulama memberikan penjelasan, berkata Syaikh As- Sa&lsquo;di, bahwa yang dimaksud&nbsp;dengan lafadz :</p>\r\n\r\n<p style=\"text-align:right\"><strong>&nbsp;&nbsp;&quot;وَمَنْ أَرَادَ الْآخِرَةَ&quot;</strong></p>\r\n\r\n<p>Artinya : Dan barangsiapa yang menghendaki kehidupan akhirat.<br />\r\nMaksudnya, barangsiapa yang menghendaki alam akhirat dan berbagai kenikmatan, kebahagiaan, keabadian yang ada di sana.</p>\r\n\r\n<p style=\"text-align:right\">&quot;َ وَسَعَىٰ لَهَا سَعْيَهَا&quot;</p>\r\n\r\n<p>Dan berusaha ke arah (akhirat) itu dengan sungguh-sungguh,&rdquo;</p>\r\n\r\n<p style=\"text-align:right\">&quot;وَهُوَ مُؤْمِنٌ&quot;</p>\r\n\r\n<p>Artinya : sedang ia dalam keadaan beriman.</p>\r\n\r\n<p style=\"text-align:justify\">Maksudnya yaitu beriman kepada Allah Ta&lsquo;ala, kepada malaikat, kitab, rasul, hari akhir.</p>\r\n\r\n<p style=\"text-align:justify\">Ada juga ulama yang menafsirkan bahwa yang dimaksud ialah &quot;yakin terhadap apa - apa yang disisi Allah Ta&lsquo;ala berupa pahala, adanya syurga, neraka, dan yang lainnya&quot;.</p>\r\n\r\n<p style=\"text-align:justify\">Dan beliaupun (Syaikh As- Sa&lsquo;di) memberikan penjelasan terhadap ayat di atas, terkait gambaran orang yang tujuan hidupnya untuk kehidupan akhirat. Yaitu, mereka yang ridha terhadap sebab - sebab yang mengantarkan pada kehidupan akhirat (syurga).</p>\r\n\r\n<p style=\"text-align:justify\">Hal ini dipertegas dengan perkataan Allah Ta&lsquo;ala selanjutnya, yaitu :</p>\r\n\r\n<p style=\"text-align:right\">وَسَعَى لَهَا سَعْيَهَا</p>\r\n\r\n<p>berusaha ke arah itu dengan sungguh-sungguh.<br />\r\nMaksudnya, dia mencari hal itu dengan menempuh jalannya dan selalu mengikuti Rasul Shallallaahu &lsquo;alaihi wasallaam.</p>\r\n\r\n<p style=\"text-align:justify\">Sehingga hal ini memberikan ketegasan bagi siapa yang ingin menghuni syurga-Nya Allah Ta&lsquo;ala, maka mesti baginya untuk menempuh jalan - jalan untuk sampai kepadanya dengan berlandasan keimanan/keyakinan yang kuat kepada Allah Ta&lsquo;ala .</p>\r\n\r\n<p style=\"text-align:justify\">Dan semua itu tidak akan tercipta, kecuali dengan ilmu.<br />\r\nSeperti apa yang dikatakan Abu Darda, beliau Rhadiyallaahu anhu berkata ; bahwa &quot;keimanan/ keyakinan itu akan diperoleh dengan jalan ilmu&quot;.</p>\r\n\r\n<p style=\"text-align:justify\">Oleh karena itu, para ulama memberikan bimbingan kepada kita berupa amalan, yang dengan amalan tersebut kita bisa sampai pada kehidupan yang hakiki tersebut, adapun amalan tersebut diantaranya :</p>\r\n\r\n<p style=\"text-align:justify\">A. Ikhlas, melakukan ketaatan hanya kepada Allah Ta&lsquo;ala dan karena Allah Ta&lsquo;ala.<br />\r\nSeperti firman Allah Ta&lsquo;ala :</p>\r\n\r\n<p style=\"text-align:right\">إِنَّا أَنزَلْنَا إِلَيْكَ الْكِتَابَ بِالْحَقِّ فَاعْبُدِ اللَّهَ مُخْلِصًا لَّهُ الدِّينَ</p>\r\n\r\n<p>Sesunguhnya Kami menurunkan kepadamu Kitab (Al Quran) dengan (membawa) kebenaran. Maka sembahlah Allah dengan memurnikan ketaatan kepada-Nya.<br />\r\n(QS. Az-Zumar : 2)</p>\r\n\r\n<p style=\"text-align:justify\">Perkara ikhlas / niat ini sangat penting, sehingga para ulama sangat - sangat memperhatikan hal ini.</p>\r\n\r\n<p style=\"text-align:justify\">Sehingga Yahya bin Abi Katsir rahimahullah pernah mengatakan :</p>\r\n\r\n<p style=\"text-align:right\">تَعَلَّمُوا النِّيَّةَ فَإِنَّهَا أَبلَغُ مِنَ العَمَل</p>\r\n\r\n<p>&ldquo;Pelajarilah niat, karena ia lebih dahulu sampai di sisi Allah daripada amalan&ldquo;</p>\r\n\r\n<p>Lalu berkata juga Sa&lsquo;id bin jubair :</p>\r\n\r\n<p style=\"text-align:right\">&quot;لا يقبل قول إلا بعمل ، ولا يقبل عمل إلا بقول ، ولا يقبل قولوعمل ونية إلا بموافقة السنة&quot;</p>\r\n\r\n<p>Allah tidak akan menerima perkataan, melainkan dengan amal perbuatan, dan tidak akan menerima amal perbuatan melainkan dengan niat, dan tidak akan menerima perkataan, perbuatan, dan niat melainkan dengan apa-apa yang sesuai dengan sunnah.</p>\r\n\r\n<p style=\"text-align:justify\">Lalu Abu Darda berkata:</p>\r\n\r\n<p style=\"text-align:justify\">&rdquo;Saya mengetahui, bahwa Allah telah menerima dariku satu shalat saja lebih aku sukai dari pada bumi dan seluruh isinya, karena Allah berfirman :</p>\r\n\r\n<p style=\"text-align:right\">...َ إِنَّمَا يَتَقَبَّلُ اللَّهُ مِنَ الْمُتَّقِينَ</p>\r\n\r\n<p>Sesungguhnya Allah hanya menerima dari orang-orang yang bertakwa. (Al Maidah : 27).</p>\r\n\r\n<p style=\"text-align:justify\">Dalam hal ini, Allah Ta&lsquo;ala sebutkan orang yang bertaqwa, mengapa ?<br />\r\nKarena para ulama jelaskan bahwa salah satu bentuk ketaqwaan adalah munculnya keikhlasan dalam beramal dan mencontoh Nabi kita Shallallaahu &lsquo;alaihi wasallaam.</p>\r\n\r\n<p style=\"text-align:justify\">Sehingga melihat penjelasan diatas, antara ilmu, iman , ikhlas dan taqwa itu ternyata memiliki kaitan yang sangat erat. Yang satu sama lain saling memperkuat.</p>\r\n\r\n<p style=\"text-align:justify\">Dan terkait pentingnya Taqwa,&nbsp;<br />\r\nSyaikhul Islam Ibnu Taimiyah mengatakan, yang maknanya bahwa :</p>\r\n\r\n<p style=\"text-align:justify\">&ldquo;Menurut ahlussunah wal jama&rsquo;ah amalan akan diterima dari orang yang bertakwa kepada Allah Ta&lsquo;ala , dikerjakan ikhlas karena Allah Ta&lsquo;ala dan sesuai dengan perintah-Nya. Oleh karena itu, barangsiapa bertakwa kepada -Nya ketika beramal maka kemungkinan diterima lebih banyak, walaupun dirinya melakukan perbuatan maksiat pada tempat lain, dan siapa yang tidak menetapi ketakwaan tatkala beramal maka peluang tidak diterimanya lebih besar, walaupun disatu sisi dia mentaati Allah &quot;.</p>\r\n\r\n<p style=\"text-align:justify\">Maka akhirnya taqwa ini menjadi harga mati bagi kita dalam setiap amal yang kita lakukan, karena setiap satuan amal memiliki nilai masing - masing dihadapan Allah Ta&lsquo;ala . Dan hanya amal yang dilandasi dengan taqwa yang akan menyebabkan amal tersebut diterima oleh Allah Ta&lsquo;ala.</p>\r\n\r\n<p style=\"text-align:justify\">Adapun kiat untuk sampai pada keikhlasan/ ketaqwaan diantaranya :<br />\r\nMuncul sifat merasa diawasi oleh Allah Ta&lsquo;ala, yang kita kenal dengan &quot;Muraqabah&quot;. Dimana dalam hal ini Nabi kita memberikan gambaran sikap muraqabah, yaitu seperti dalam sabdanya&nbsp;&nbsp;ketika menjawab pertanyaan seputar ikhsan, beliau mengatakan bahwa ihsan itu:</p>\r\n\r\n<p style=\"text-align:right\">أَنْ تَعْبُدَ اللهَ كَأَنَّكَ تَرَاهُ فَإِنْ لَمْ تَكُنْ تَرَاهُ فَإِنَّهُ يَرَاكَ</p>\r\n\r\n<p>Engkau beribadah kepada Allah seakan - akan engkau melihat Allah, dan jika engkau tidak melihat Allah, maka yakinlah bahwa Allah melihatmu. (HR. Muslim)</p>\r\n\r\n<p style=\"text-align:justify\">Sehingga jelas, hal ini menunjukkan kepastian seseorang dalam beramal, melangkah mengarungi kehidupan dunia ini, yaitu dengan ilmu, iman, ikhlas, taqwa, yang keseluruhannya dibuktikan dengan selalu merasa diawasi oleh Allah Ta&lsquo;ala dalam setiap gerak langkahnya. Sehingga hal tersebut akan sangat mempengaruhi langkahnya secara pasti menuju negeri akhirat yaitu mendapatkan syurga-Nya Allah Ta&lsquo;ala dengan keridhoan-Nya.</p>\r\n\r\n<p style=\"text-align:justify\">Maka dari itu, mari kita melangkah dengan pasti.</p>\r\n\r\n<p style=\"text-align:justify\">Wallahu&lsquo;alam.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Kajian Ustadz Ruslan Gunawan Hafidzahullah</p>\r\n', 'tujuan hidup di dunia', '', 'media/upload/2019/07/eberhard-grossgasteiger-fhdn5qvrbfy-unsplash.jpg', '', '2020-04-04 22:37:32', '2023-07-05 02:12:44', 108, 'publish', 0, 0),
(73, 1, 0, 'ilmu,adab,', 'Mengambil Faidah dari Do&#39;a untuk Para Pencari Ilmu ', 'mengambil-faidah-dari-do-39-a-untuk-para-pencari-ilmu', 'Mengambil Faidah dari Do&#39;a untuk Para Pencari Ilmu ', 'faidah ustadz ruslan gunawan, syudais media, doa, hadits, rasul', 'Diantara Do&#39;a yang pernah dibaca oleh Rasululloh ﷺ.&#13;&#10;Dari Abu Hurairah, beliau bersabda&#13;&#10;&#13;&#10;اللَّهُمَّ انْفَعْنِي بِمَا عَلَّمْتَنِي ، وَعَلِّمْنِي مَا يَنْفَعُنِي ', 'S-Admin1', 'media/upload/2022/11/masjid-maba-qhzqfd0ihni-unsplash-(1).jpg', '<p>بسم الله الرحمن الرحيم</p>\r\n\r\n<p>Diantara Do&#39;a yang pernah dibaca oleh Rasululloh ﷺ.<br />\r\nDari Abu Hurairah, beliau bersabda</p>\r\n\r\n<p>اللَّهُمَّ انْفَعْنِي بِمَا عَلَّمْتَنِي ، وَعَلِّمْنِي مَا يَنْفَعُنِي ، وَزِدْنِي عِلْمًا<br />\r\n(HR. Ibnu Majah)</p>\r\n\r\n<p>Faidah penting yang bisa diambil dari doa Rasulullah ﷺ di atas:</p>\r\n\r\n<p><br />\r\nاللَّهُمَّ انْفَعْنِي بِمَا عَلَّمْتَنِي</p>\r\n\r\n<p>&nbsp;Ya Alloh berilah kemanfaatan atas ilmu yang telah Engkau ajarkan kepadaku,&nbsp;</p>\r\n\r\n<p>1. Pada kalimat di atas, terdapat isyarat bahwa kita harus memohon hanya kepada Allah ta&rsquo;ala terkait ilmu yang kita butuhkan.&nbsp;</p>\r\n\r\n<p>2. Terdapat makna yang tersirat, bahwa seakan-akan seseorang yang membaca do&#39;a ini diajarkan langsung oleh Allah ﷻ terkait ilmu yang ia cari.&nbsp;<br />\r\nSekalipun pada kenyataannya ilmu tersebut didapatkan melalui perantara para ulama dan orang-orang shalih.</p>\r\n\r\n<p>3. Mengandung makna bahwa pencari ilmu itu mesti ikhlas, tujuan nya hanya mencari keridhoan Alloh, bukan keridhoan makhluk.<br />\r\nKarena tidak sedikit para pencari ilmu tujuan mencari ilmu nya ingin mendapat pujian dari guru, ingin disebut santri dan tujuan keduniawian lainnya.</p>\r\n\r\n<p><br />\r\nوَعَلِّمْنِي مَا يَنْفَعُنِي</p>\r\n\r\n<p>&nbsp;Dan ajarkanlah kepadaku ilmu yang bermanfaat bagiku&nbsp;</p>\r\n\r\n<p>Kalimat pada doa di atas merupakan bentuk permintaan seorang hamba agar Allah ajarkan ilmu yang bermanfaat. Maksudnya, ilmu yang disyariatkan oleh Allah ﷻ dalam Al-Qur&rsquo;an dan Al-Hadits yang shahih dan seakan-akan meminta supaya dijauhkan dari ilmu - ilmu yang tidak bermanfaat baik dunia terlebih di akhirat.</p>\r\n\r\n<p>وَزِدْنِي عِلْمًا<br />\r\n&nbsp;Dan tambahkanlah ilmu kepadaku.&nbsp;</p>\r\n\r\n<p>Pada kalimat diatas, terdapat faidah bahwa ;<br />\r\n1. Menuntut ilmu itu tidak ada habisnya, sangat diperlukan kesabaran, mujahadah, dan istiqomah untuk meraihnya.</p>\r\n\r\n<p>2. Membuktikan bahwa ilmu Allah itu sangat luas, sedangkan ilmu yang diberikan kepada hamba-Nya itu sangatlah sedikit.&nbsp;</p>\r\n\r\n<p>Alloh Ta&#39;ala berfirman; &nbsp;</p>\r\n\r\n<p>... وَمَآ أُوتِيتُم مِّنَ ٱلْعِلْمِ إِلَّا قَلِيلًۭا</p>\r\n\r\n<p>&nbsp;.... dan tidaklah kamu diberi pengetahuan melainkan sedikit&quot;.&nbsp;<br />\r\n(QS. Al Isra : 85)</p>\r\n\r\n<p>Demikian diantara faidah singkat terkait do&#39;a yang dipanjatkan Rasululloh ﷺ kepada Alloh, juga yang para ulama baca dan amanatkan kepada murid - muridnya.</p>\r\n\r\n<p>Semoga Alloh Ta&#39;ala memberikan taufiq kepada kita agar mampu selalu mengamalkan do&#39;a ini, sehingga setiap pencari ilmu mendapatkan buah dari apa-apa yang telah mereka perjuangkan.</p>\r\n\r\n<p>Walloohu&#39;alam.</p>\r\n\r\n<p>Faidah Kajian Ustadz Ruslan Gunawan حفظه الله</p>\r\n', 'Mengambil Faidah dari Do&#39;a untuk Para Pencari Ilmu ', '', 'media/upload/2022/11/masjid-maba-qhzqfd0ihni-unsplash-(1).jpg', '', '2022-11-03 13:09:07', '2023-07-08 02:42:46', 150, 'publish', 0, 1),
(65, 1, 0, 'poster,', 'Bersegeralah dalam Beramal', 'bersegeralah-dalam-beramal', 'Bersegeralah dalam beramal', 'poster, poster dakwah, dakwah, design', 'Bersegeralah melakukan amalan saleh sebelum datang fitnah (musibah), seperti potongan malam yang gelap. Yaitu seseorang pada waktu pagi dalam keadaan beriman, d', 'S-Admin1', 'media/upload/2021/12/instagram-post---4.png', '<p>Dari Abu Hurairah radhiyallahu &lsquo;anhu, Rasulullah ﷺ bersabda:</p>\r\n\r\n<blockquote>\r\n<p><br />\r\nبَادِرُوا بِالأَعْمَالِ فِتَنًا كَقِطَعِ اللَّيْلِ الْمُظْلِمِ يُصْبِحُ الرَّجُلُ مُؤْمِنًا وَيُمْسِى كَافِرًا أَوْ يُمْسِى مُؤْمِنًا وَيُصْبِحُ كَافِرًا يَبِيعُ دِينَهُ بِعَرَضٍ مِنَ الدُّنْيَا&nbsp;</p>\r\n</blockquote>\r\n\r\n<blockquote>\r\n<p>&ldquo;Bersegeralah melakukan amalan saleh sebelum datang fitnah (musibah), seperti potongan malam yang gelap. Yaitu seseorang pada waktu pagi dalam keadaan beriman, dan di sore hari dalam keadaan kafir. Ada pula yang sore hari dalam keadaan beriman, dan di pagi hari dalam keadaan kafir. Ia menjual agamanya karena sedikit dari keuntungan dunia.&rdquo; [Hadits Riwayat&nbsp;Muslim no. 118]</p>\r\n</blockquote>\r\n', 'bersegera dalam beramal', '', 'media/upload/2021/12/instagram-post---4.png', '', '2021-12-23 14:16:55', '2023-07-05 02:14:43', 89, 'publish', 0, 1),
(66, 1, 0, 'poster,', 'Selektif dalam Menuntut Ilmu', 'selektif-dalam-menuntut-ilmu', 'Selektif dalam Menuntut Ilmu', 'menuntut ilmu, poster dakwah', '“Sesungguhnya ilmu ini adalah Agama. Maka lihatlah dari siapa kalian mengambil (ilmu) Agama kalian.&#34;', 'S-Admin1', 'media/upload/2021/12/ilmu-itu-agama-(2).png', '<p>Ibnu Sirin Rahimahullah pernah berkata:</p>\r\n\r\n<blockquote>\r\n<p>إنَّ هَذَا العِلمَ دِينٌ فَانظُرُوا عَمَّن تَأخُذُونَ دِينَكُم</p>\r\n</blockquote>\r\n\r\n<blockquote>\r\n<p>&ldquo;Sesungguhnya ilmu ini adalah Agama. Maka lihatlah dari siapa kalian mengambil (ilmu) Agama kalian.&quot;<br />\r\n<br />\r\nDinukil oleh Imam Muslim dalam Muqaddimah Syarhu Shahih Muslim</p>\r\n</blockquote>\r\n', 'selektif menuntut ilmu', '', 'media/upload/2021/12/ilmu-itu-agama-(2).png', '', '2021-12-23 14:20:30', '2023-07-05 11:03:04', 151, 'publish', 0, 1),
(67, 1, 0, 'poster,', 'Solusi untuk Setiap Problematika', 'solusi-untuk-setiap-problematika', 'Solusi untuk Setiap Problematika', 'Istigfar, poster dakwah', 'Barangsiapa yang membiasakan beristighfar, niscaya Allah jadikan jalan keluar untuk setiap kesedihan, solusi untuk setiap kekhawatiran, dan memberikan rezeki da', 'S-Admin1', 'media/upload/2021/12/keutamaan_beristigfar.jpg', '<blockquote>\r\n<p>Dari Ibnu &lsquo;Abbas Radhiallahu &lsquo;anhu, Rasulullah ﷺ ﷺbersabda :<br />\r\nBarangsiapa yang membiasakan beristighfar, niscaya Allah jadikan jalan keluar untuk setiap kesedihan, solusi untuk setiap kekhawatiran, dan memberikan rezeki dari arah yang tidak disangka-sangka<br />\r\n(Hadits Riwayat Abu Dawud)</p>\r\n</blockquote>\r\n', 'Solusi untuk Setiap Problematika', '', 'media/upload/2021/12/keutamaan_beristigfar.jpg', '', '2021-12-23 14:25:42', '2023-07-05 11:03:07', 53, 'publish', 0, 1);
INSERT INTO `d_blog` (`id`, `a_pengguna_id`, `b_user_id`, `kategori`, `title`, `slug`, `mtitle`, `mkeyword`, `mdescription`, `mauthor`, `mimage`, `content`, `excerpt`, `tags`, `featured_image`, `featured_thumb`, `cdate`, `ldate`, `jml_baca`, `status`, `is_follow_up`, `is_read`) VALUES
(68, 1, 0, 'tazkiyatunnufus,', 'Al-Qur\'an Obat Untuk Setiap Problematika', 'al-qur-an-obat-untuk-setiap-problematika', 'Al-Qur\'an Obat Untuk Setiap Problematika', 'AlQur\'an, Alquran, obat, problem, tazkiyatunnufus', 'Dalam kehidupan dunia ini manusia tidak akan lepas dari yang namanya ujian dan cobaan, baik itu berupa masalah yang dihadapi, kekurangan harta, masalah keluarga', 'S-Admin1', 'media/upload/2022/01/the-dancing-rain-tfwqxqvb7r8-unsplash-(1).jpg', '<p style=\"text-align:justify\">Dalam kehidupan dunia ini manusia tidak akan lepas dari yang namanya ujian dan cobaan, baik itu berupa masalah yang dihadapi, kekurangan harta, masalah keluarga, penyakit yang diderita baik itu penyakit jasad atau penyakit hati dan yang lainnya.&nbsp;</p>\r\n\r\n<p>Namun tahukah kita, ternyata solusi dari semua permasalahan yang dihadapi adalah satu yaitu Al-Quran&nbsp;</p>\r\n\r\n<p>Allah Ta&#39;ala berfirman :&nbsp;</p>\r\n\r\n<p>ﻭَﻧُﻨَﺰّﻝُ ﻣِﻦَ ﺍﻟْﻘُﺮْﺁﻥِ ﻣَﺎ ﻫُﻮَ ﺷِﻔَﺂﺀٌ ﻭَﺭَﺣْﻤَﺔٌ ﻟّﻠْﻤُﺆْﻣِﻨِﻴﻦَ ﻭَﻻَ ﻳَﺰِﻳﺪُ ﺍﻟﻈّﺎﻟِﻤِﻴﻦَ ﺇَﻻّ ﺧَﺴَﺎﺭﺍً&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&ldquo;Dan Kami turunkan dari Al-Qur`an suatu yang menjadi penawar dan rahmat bagi orang-orang yang beriman dan Al Quran itu tidaklah menambah kepada orang-orang yang zalim selain kerugian&rdquo; (QS. Al-Israa&rsquo;: 82)&nbsp;</p>\r\n\r\n<p><strong>Faidah Ayat</strong>&nbsp;</p>\r\n\r\n<p>✅ Pertama :&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Huruf <strong>مِن </strong>dalam ayat di atas adalah <em>min libayanil jinsi </em>(<strong>ﻣِﻦَ ﺍﻟْﻘُﺮْﺁﻥِ</strong>) yaitu untuk menejelaskan jenis, bukan <em>min Litab&lsquo;idh </em>yang menunjukan makna sebagian (isi Al-Quran). Oleh karena itu ayat ini menunjukan bahwa Al-Qur`an seluruhnya (bukan sebagian) adalah syifa` (Obat) dan rahmat bagi orang-orang beriman (Zaadul-Ma&#39;ad : 4/163)&nbsp;</p>\r\n\r\n<p>✅ Kedua :&nbsp;</p>\r\n\r\n<p>Kata <strong>ﺷِﻔَﺂﺀٌ </strong>dalam ayat di atas merupakan isim nakirah (kata yang masih umum), sehingga kata <em>Syifa&rsquo;un </em>(Obat) dalam ayat ini bermakna umum, yakni obat apapun baik itu obat jasad atau pun bathin.&nbsp;</p>\r\n\r\n<blockquote>\r\n<p>Imam Ibnu Qayyim berkata :&nbsp;</p>\r\n\r\n<p>فالقرآن هو الشفاء التام من جميع الأدواء القلبية والبدنية وأدواء الدنيا والآخرة،&nbsp;&nbsp;</p>\r\n\r\n<p>&ldquo;Al-Quran adalah obat bagi seluruh penyakit-penyakit hati dan badan, bahkan juga obat untuk penyakit-penyakit dunia dan akhirat. (Zaadul Ma&rsquo;ad 4/520)&nbsp;</p>\r\n</blockquote>\r\n\r\n<blockquote>\r\n<p>Syaikh Muhammad Amin Asy-Syinqithy berkata :&nbsp;</p>\r\n\r\n<p>ﻣَﺎ ﻫُﻮَ ﺷِﻔَﺎﺀٌ ﻳَﺸْﻤَﻞُ ﻛَﻮْﻧَﻪُ ﺷِﻔَﺎﺀً ﻟِﻠْﻘَﻠْﺐِ ﻣِﻦْ ﺃَﻣْﺮَﺍﺿِﻪِ ; ﻛَﺎﻟﺸَّﻚِّ ﻭَﺍﻟﻨِّﻔَﺎﻕِ ﻭَﻏَﻴْﺮِ ﺫَﻟِﻚَ ، ﻭَﻛَﻮْﻧَﻪُ ﺷِﻔَﺎﺀً ﻟِﻠْﺄَﺟْﺴَﺎﻡِ ﺇِﺫَﺍ ﺭُﻗِﻲَ ﻋَﻠَﻴْﻬَﺎ ﺑِﻪِ ، ﻛَﻤَﺎ ﺗَﺪُﻝُّ ﻟَﻪُ ﻗِﺼَّﺔُ ﺍﻟَّﺬِﻱ ﺭَﻗَﻰ ﺍﻟﺮَّﺟُﻞَ ﺍﻟﻠَّﺪِﻳﻎَ ﺑِﺎﻟْﻔَﺎﺗِﺤَﺔِ ، ﻭَﻫِﻲَ ﺻَﺤِﻴﺤَﺔٌ ﻣَﺸْﻬُﻮﺭَﺓٌ&nbsp;</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\">&ldquo;Obat yang mencakup obat bagi penyakit hati/jiwa, seperti keraguan, kemunafikan, dan perkara lainnya. Bisa menjadi obat bagi jasmani jika dilakukan ruqyah kepada orang yang sakit. Sebagaimana kisah seseorang yang terkena sengatan kalajengking diruqyah dengan membacakan Al-Fatihah. Ini adalah kisah yang shahih dan masyhur&rdquo; (Tafsir Adhwaul Bayan : 3/181)&nbsp;</p>\r\n\r\n<p>✅ Ketiga :&nbsp;</p>\r\n\r\n<p>Manfaat Al-Quran akan Allah Ta&#39;ala berikan kepada orang yang beriman,&nbsp;</p>\r\n\r\n<p>Syaikh As&rsquo;sadi berkata :&nbsp;</p>\r\n\r\n<p>فالقرآن مشتمل على الشفاء والرحمة، وليس ذلك لكل أحد، وإنما ذلك للمؤمنين به، المصدقين بآياته، العاملين به&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Maka Al-Quran itu mencakup (obat) untuk segala kesembuhan dan rahmat, dan hal itu semua tidak akan bisa terjadi pada setiap orang melainkan bisa menjadi obat bagi orang yang beriman saja yang membenarkan Al-Quran dan Mengamalkan isi kandungan Al-Quran (Taisir Karim Ar-rahman)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Maka apapun penyakitnya baik itu penyakit jasad, penyakit hati, penyakit dunia seperti masalah harta, keluarga, anak dan apapun juga maka hendaknya kita mengambil obat dengan Al-Quran.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Namun yang jadi pertanyaan bagaimana kemudian Al-Quran bisa menjadi obat bagi segala penyakit yang kita rasakan ?&nbsp;</p>\r\n\r\n<p>Insyaa Allah di artikel selanjutnya akan dishare kiat berinteraksi dengan Al-Quran.&nbsp;</p>\r\n\r\n<p>Wallahu&rsquo;alam bishawwab&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'alquran', '', 'media/upload/2022/01/the-dancing-rain-tfwqxqvb7r8-unsplash-(1).jpg', '', '2022-01-10 12:49:28', '2023-07-10 01:32:11', 129, 'publish', 0, 1),
(69, 1, 0, 'tazkiyatunnufus,nasihat-ulama,', 'AGAR DO\'A DIKABULKAN', 'agar-do-a-dikabulkan', 'Agar Doa - Doa kita bisa terkabul', 'Doa', 'Setiap hamba Allah Ta\'ala tentu berharap kepada Allah Ta\'ala agar do’a yang dimohonkan terkabulkan, baik itu do’a yang berkaitan dengan urusan dunia', 'S-Admin1', 'media/upload/2022/01/faseeh-fawaz-dt1vfapzmui-unsplash.jpg', '<p>Setiap hamba Allah Ta&#39;ala tentu berharap kepada Allah Ta&#39;ala agar do&rsquo;a yang dimohonkan terkabulkan, baik itu do&rsquo;a yang berkaitan dengan urusan dunia yang dibutuhkannya, terlebih do&rsquo;a untuk perkara akhirat.&nbsp;</p>\r\n\r\n<p>Diantara petunjuk Rasulullah Shallallahu &#39;alaihi wa sallam agar kita mendapatkan apa yang kita mohonkan, sebagaimana telah datang satu Riwayat Dari &lsquo;Ubadah bin Shamit Radhiyallahu &lsquo;anhu,&nbsp;</p>\r\n\r\n<p>Rasulullah Shallallahu &#39;alaihi wa sallam bersabda :&nbsp;</p>\r\n\r\n<p>مَنْ تَعَارَّ مِنَ اللَّيْلِ فَقَالَ: لاَ إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لاَ شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ. الْحَمْدُ لِلَّهِ وَسُبْحَانَ اللَّهِ وَلاَ إِلَهَ إِلاَّ اللَّهُ وَاللَّهُ أَكْبَرُ وَلاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللَّهِ. ثُمَّ قَالَ: اللَّهُمَّ اغْفِرْ لِي، أَوْ دَعَا، اسْتُجِيبَ. فَإِنْ تَوَضَّأَ قُبِلَتْ صَلاَتُهُ.&nbsp;</p>\r\n\r\n<p>&ldquo;Barangsiapa yang bangun dari (tidur) malam lalu mengucapkan: (Tiada tuhan -yang berhak disembah- kecuali Allah satu-satu-Nya tiada sekutu bagi-Nya. Hanya milik-Nya segala kerajaan. Hanya milik-Nya segala pujian, dan Dia Mahakuasa atas segala sesuatu. Segala puji hanya milik Allah. Mahasuci Allah,Tiada tuhan -yang berhak disembah- kecuali Allah. Allah Mahabesar. Tidak ada daya dan kekuatan kecuali dengan -pertolongan- Allah). Kemudian dia mengucapkan: (Ya Allah, berikanlah ampunan kepadaku) atau dia berdoa (apa saja), niscaya dia akan dikabulkan. Jika dia berwudhu, maka sholatnya pasti diterima.&rdquo; (Hadits shahih; riwayat Al-Bukhari : Shahih At-Targhib wa At-Tarhib, 1:149)&nbsp;</p>\r\n\r\n<p>Dalam Riwayat lain dari &lsquo;Amr bin &lsquo;Anbasah Radhiyallahu &lsquo;anhu,&nbsp;</p>\r\n\r\n<p>Rasulullah Shallallahu &lsquo;alaihi wasallam bersabda :&nbsp;</p>\r\n\r\n<p>مَا مِنْ عَبْدٍ بَاتَ عَلَى طُهُوْرٍ ثُمَّ تَعَارُ مِنَ اللَّيْلِ فَسَأَلَ اللَّه مِنْ أَمْرِالدُّنْيَا اَوْ مِنْ أَمْرِ اْلآخِرَةِإِلاَّ أَعْطَاهُ&nbsp;</p>\r\n\r\n<p>&ldquo;Tidaklah seorang hamba tidur dalam keadaan suci lalu terbangun padamalam hari kemudian memohon sesuatu tentang urusan dunia atau akhirat melainkan Allah akan mengabulkannya&rdquo;. [HR. Ibnu Majah]&nbsp;</p>\r\n\r\n<p>Para ulama menjelaskan bahwa jika seorang hamba mengamalkan protokol dalam hadits diatas, maka dengan izin Allah Ta&#39;ala apa yang dimohonkannya maka Allah Ta&#39;ala berikan. Yaitu dengan:</p>\r\n\r\n<ol>\r\n	<li>Tidur dalam keadaan suci (berwudhu).</li>\r\n	<li>Berdzikir dan berdo&#39;a ketika terbangun, Niatkan dalam rangka beribadah kepada Allah Ta&#39;ala.</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>&nbsp;Pertama membaca :&nbsp;</li>\r\n</ul>\r\n\r\n<p>لاَ إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لاَ شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ&nbsp;</p>\r\n\r\n<p>&quot;Tiada tuhan -yang berhak disembah- kecuali Allah satu-satu-Nya tiada sekutu bagi-Nya. Hanya milik-Nya segala kerajaan. Hanya milik-Nya segala pujian, dan Dia Mahakuasa atas segala sesuatu.&quot;</p>\r\n\r\n<ul>\r\n	<li>&nbsp;Kedua membaca :&nbsp;</li>\r\n</ul>\r\n\r\n<p>الْحَمْدُ لِلَّهِ وَسُبْحَانَ اللَّهِ وَلاَ إِلَهَ إِلاَّ اللَّهُ وَاللَّهُ أَكْبَرُ وَلاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللهِ&nbsp;</p>\r\n\r\n<p>&quot;Segala puji hanya milik Allah. Mahasuci Allah,Tiada tuhan -yang berhak disembah- kecuali Allah. Allah Mahabesar. Tidak ada daya dan kekuatan kecuali dengan -pertolongan- Allah&quot;</p>\r\n\r\n<ul>\r\n	<li>Ketiga membaca :&nbsp;</li>\r\n</ul>\r\n\r\n<p>اللَّهُمَّ اغْفِرْ لِي&nbsp;</p>\r\n\r\n<p>&quot;Ya Allah, berikanlah ampunan kepadaku &quot;</p>\r\n\r\n<ul>\r\n	<li>Atau berdo&#39;a sesuai kebutuhan kita.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Namun jangan sekali kali menyalahkan Allah Ta&#39;ala ketika apa yang kita mohonkan belum /tidak Allah Ta&#39;ala berikan.&nbsp;</p>\r\n\r\n<p>Hendaknya kita memahami bagaimana rumusan dalam masalah ijabah do&rsquo;a.&nbsp;</p>\r\n\r\n<p>Para ulama menjelaskan bahwa :&nbsp;</p>\r\n\r\n<ol>\r\n	<li>Terkabulnya do&#39;a itu pada waktu yang Allah Ta&#39;ala kehendaki bukan pada waktu yang kita inginkan.&nbsp;</li>\r\n	<li>Terkabulnya do&rsquo;a itu pada sesuatu yang Allah Ta&#39;ala pilih, bukan pada sesuatu yang kita pilih untuk diri kita sendiri.&nbsp;</li>\r\n	<li>Terkabulnya do&rsquo;a itu sesuai dengan cara Allah Ta&#39;ala :&nbsp;</li>\r\n	<li>Bisa jadi Allah Ta&#39;ala berikan sebagaiamana apa yang kita mohonkan&nbsp;</li>\r\n	<li>&nbsp;Bisa jadi Allah Ta&#39;ala ganti dengan menyelamatkan kita dari musibah</li>\r\n	<li>Bisa jadi Allah Ta&#39;ala tangguhkan ijabah do&rsquo;a untuk hari kiamat&nbsp;</li>\r\n</ol>\r\n\r\n<p>Rasulullah Shallallahu &#39;alaihi wa sallam bersabda :&nbsp;</p>\r\n\r\n<p>مَا عَلَى الأرْضِ مُسْلِمٌ يَدْعُو الله تَعَالَى بِدَعْوَةٍ إِلاَّ آتَاهُ اللهُ إيَّاها ، أَوْ صَرفَ عَنْهُ مِنَ السُّوءِ مِثْلَهَا ، مَا لَمْ يَدْعُ بإثْمٍ ، أَوْ قَطِيعَةِ رَحِمٍ، فَقَالَ رَجُلٌ مِنَ القَومِ : إِذاً نُكْثِرُ قَالَ : (( اللهُ أكْثَرُ&nbsp;</p>\r\n\r\n<p>&ldquo;Tidaklah seorang muslim berdoa kepada Allah dengan satu doa, melainkan pasti Allah memberikannya kepadanya, atau Allah menghindarkannya dari kejelekan yang sebanding dengan doanya, selama ia tidak mendoakan dosa atau memutuskan silaturahim.&rdquo; Lalu seseorang berkata, &ldquo;Kalau begitu, kita akan memperbanyak doa.&rdquo; Beliau bersabda, &ldquo;Allah lebih banyak memberi (dari apa yang kalian minta).&rdquo; (HR. Tirmidzi, ia mengatakan bahwa hadits ini hasan sahih)&nbsp;</p>\r\n\r\n<p>Dalam Riwayat lain :&nbsp;</p>\r\n\r\n<p>أَوْ يَدْخِرَ لَهُ مَن الأَجْرِ مِثْلَهَا&nbsp;</p>\r\n\r\n<p>Atau Allah menyimpan untuknya berupa pahala yang sebanding dengan doa tersebut.&rdquo; (HR. Ahmad, 3:18)&nbsp;</p>\r\n\r\n<p><br />\r\nWallahu a&#39;lam</p>\r\n', '', '', 'media/upload/2022/01/faseeh-fawaz-dt1vfapzmui-unsplash.jpg', '', '2022-01-15 12:07:30', '2023-07-05 02:15:26', 54, 'publish', 0, 1),
(70, 1, 0, 'tazkiyatunnufus,nasihat-ulama,', 'Dunia itu Penjara Bagi Orang Beriman, dan Surga bagi orang Kafir ', 'dunia-itu-penjara-bagi-orang-beriman-dan-surga-bagi-orang-kafir', '', '', '', 'S-Admin1', 'media/upload/2022/01/prison.jpg', '<p>Dari Abu Hurairah, ia berkata bahwa Rasulullah&nbsp;shallallahu &lsquo;alaihi wa sallam&nbsp;bersabda :</p>\r\n\r\n<p>&nbsp; الدُّنْيَا سِجْنُ الْمُؤْمِنِ وَجَنَّةُ الْكَافِرِ&nbsp;</p>\r\n\r\n<p>&nbsp;&ldquo;Dunia adalah penjara bagi orang beriman dan surga bagi orang kafir.&rdquo;&nbsp;<br />\r\n(HR. Muslim)</p>\r\n\r\n<p>Imam Ibnul Qayyim Rahimahullah berkata : &nbsp;</p>\r\n\r\n<p>&laquo;الدُنْيَا سِجْنُ المُؤمِنِ&raquo; فِيهِ تَفْسِيْرَانِ صَحِيحَانِ:</p>\r\n\r\n<p>أََحَدُ هُماَ: أَنَّ الْمُؤْمِنَ قَيَّدَهُ إِيمَانُهُ عَنِ الْمَحْظُورَاتِ وَالْكَافِرَ مُطْلَقُ التَّصَرُّفِ.</p>\r\n\r\n<p>الثَانِي: أَنَّ ذَلِكَ بِاعْتِبَارِ العَوَاقِبِ فَالْمُؤمِنُ لَوْ كَانَ أَنْعَمَ النَاسِ، فَذَلِكَ بِالْأِضَافِهِ إِلى مَآلِهِ فِي الْجَنَّةِ كَالسِّجْنِ,<br />\r\nوَالْكُفَّارُ عَكْسُهُ فَإِنَّهُ لَوْ كَانَ أَشَدَّ الَناسِ بَؤُسََا، فَذَلِكَ بِالنِسْبَةِ إِلى النَّارِ جَنَّتُهُ.</p>\r\n\r\n<p style=\"text-align:justify\">Dunia itu penjara bagi orang beriman : dalam hadits ini terdapat dua penjelasan :</p>\r\n\r\n<p style=\"text-align:justify\">1. Sesungguhnya orang beriman terhalang dengan keimanannya untuk melakukan sesuatu yang dilarang. Sedangkan orang kafir, mereka leluasa dalam melakukan segala hal.</p>\r\n\r\n<p style=\"text-align:justify\">2. Sesungguhnya jika dibandingkan dengan keadaan/balasan orang yang beriman (di akhirat nanti), orang beriman itu meskipun hidupnya di dunia paling senang dan bahagia, tetap saja keadaan tersebut seperti penjara, (jika dibandingkan dengan besarnya balasan kebaikan dan kenikmatan yang Allah Ta&rsquo;ala sediakan baginya di akhirat kelak berupa surga)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Sedangkan orang kafir meskipun hidupnya di dunia paling sengsara dan menderita, tetap saja keadaan tersebut seperti surga baginya (jika dibandingkan dengan pedihnya balasan keburukan dan siksaan yang Allah Ta&rsquo;ala akan timpakan kepadanya di neraka).</p>\r\n\r\n<p style=\"text-align:justify\">(Badaai&#39;ul Fawaid : 3/177)<br />\r\n&nbsp;<br />\r\nOleh karena itu orang-orang yang beriman jangan berkecil hati, bagaimanapun keadaan kita di dunia, selama kita memiliki keimanan dan berusaha memperjuangkan keimanan dalam hati untuk tetap ada, maka hal tersebut akan berbuah manis di sisi Allah Ta&#39;ala kelak.&nbsp;<br />\r\nBegitupun sebaliknya, jangan sampai kita tertipu dengan gemerlapnya dunia yang Allah berikan kepada orang-orang kafir, semanis apapun itu, tetap akan berbuah pahit di sisi Allah kelak.&nbsp;</p>\r\n\r\n<p>Wallahu&#39;alam.</p>\r\n\r\n<p>Semoga bermanfaat.</p>\r\n', '', '', 'media/upload/2022/01/prison.jpg', '', '2022-01-21 22:07:20', '2023-07-10 20:28:48', 160, 'publish', 0, 1),
(71, 1, 0, 'ilmu,tazkiyatunnufus,', 'Bersabar dalam Menyeru Kebaikan', 'bersabar-dalam-menyeru-kebaikan', 'Bersabar dalam Menyeru Kebaikan', 'syudais, faidah kajian ustadz ruslan, shabar', 'Allah Ta’ala berfirman :\r\n\r\nوَٱصْبِرْ وَمَا صَبْرُكَ إِلَّا بِٱللَّهِ ۚ وَلَا تَحْزَنْ عَلَيْهِمْ وَلَا تَكُ فِى ضَيْقٍۢ مِّمَّا يَمْكُرُونَ\r\n\r\n_Bersabarlah (hai Mu', 'S-Admin1', 'media/upload/2019/06/sujud-doa.jpg', '<p style=\"text-align:justify\">Seorang hamba ketika mengajak manusia menuju Allah Ta&rsquo;ala, maka tidak akan luput dari musibah yang merintangi perjalanan dakwahnya.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Allah Ta&rsquo;ala berfirman :</p>\r\n\r\n<p style=\"text-align:justify\">وَكَأَيِّن مِّن نَّبِىٍّۢ قَـٰتَلَ مَعَهُۥ رِبِّيُّونَ كَثِيرٌۭ فَمَا وَهَنُوا۟ لِمَآ أَصَابَهُمْ فِى سَبِيلِ ٱللَّهِ وَمَا ضَعُفُوا۟ وَمَا ٱسْتَكَانُوا۟ ۗ وَٱللَّهُ يُحِبُّ ٱلصَّـٰبِرِينَ</p>\r\n\r\n<p style=\"text-align:justify\">Dan berapa banyaknya nabi yang berperang bersama-sama mereka sejumlah besar dari pengikut(nya) yang bertakwa. Mereka tidak menjadi lemah karena bencana yang menimpa mereka di jalan Allah, dan tidak lesu dan tidak (pula) menyerah (kepada musuh). Allah menyukai orang-orang yang sabar (Ali-Imran :146)</p>\r\n\r\n<p style=\"text-align:justify\">Allah Ta&rsquo;ala menggambarkan dalam ayat yang mulia ini keadaan para nabi dan pengikutnya ketika mereka mendapati ujian berupa musibah dan cobaan ketika berdakwah sebagai motivasi bagi orang-orang yang menyeru pada kebaikan agar memiliki sifatan yang Allah gambarkan dalam ayat ini, yaitu :</p>\r\n\r\n<p style=\"text-align:justify\">1. Tidak lemah mental<br />\r\n2. Tidak lemah aktivitas<br />\r\n3. Tidak pesimis</p>\r\n\r\n<p style=\"text-align:justify\">Tiga hal diatas menggambarkan bentuk kesabaran Rasulullah dan Para sahabatnya dalam berdakwah, sehingga mereka mendapatkan kecintaan dari Allah Ta&rsquo;ala.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Syaikh Prof. Dr. Abdurrazzaq bin Abdul Muhsin Al-Badr hafidzhahullah berkata :</p>\r\n\r\n<p style=\"text-align:justify\">Hendaknya kenikmatan dalam dakwah, kemuliaan dakwah, jauh harus lebih kita perhatikan ketimbang sibuk dengan ocehan-ocehan manusia. Hampir saja seekor rusa diterkam harimau karena sering menoleh kebelakang, padahal kecepatan rusa lebih cepat dari pada harimau.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Maka seorang hamba yang mengajak manusia menuju kebaikan pun harus senantiasa mengikhlaskan dakwahnya hanya untuk Allah Ta&rsquo;ala dan memperjuangkan agama Allah, bukan sibuk dengan ocehan yang mencela pribadinya sehingga disibukkan dengan pembelaan pada dirinya sendiri, dan hilanglah keikhlasan dalam dakwah.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Bahkan Allah Ta&#39;ala pun memerintahkan Rasulullah shallallahu alaihi wa sallam untuk bersabar dari musibah yang merintanginya ketika berdakwah.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Allah Ta&rsquo;ala berfirman :</p>\r\n\r\n<p style=\"text-align:justify\">وَٱصْبِرْ وَمَا صَبْرُكَ إِلَّا بِٱللَّهِ ۚ وَلَا تَحْزَنْ عَلَيْهِمْ وَلَا تَكُ فِى ضَيْقٍۢ مِّمَّا يَمْكُرُونَ</p>\r\n\r\n<p style=\"text-align:justify\">_Bersabarlah (hai Muhammad) dan tiadalah kesabaranmu itu melainkan dengan pertolongan Allah dan janganlah kamu bersedih hati terhadap (kekafiran) mereka dan janganlah kamu bersempit dada terhadap apa yang mereka tipu dayakan<br />\r\n(An-Nahl :127)_<br />\r\n&nbsp;<br />\r\nDalam ayat ini Allah memerintahkan kepada orang-orang yang menyeru pada kebaikan untuk bersabar dalam merintangi ujian dalam dakwahnya, yaitu :</p>\r\n\r\n<p style=\"text-align:justify\">1. Jangan bersedih ketika dakwah belum diterima, tetap bersemangat&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">2. Jangan bersempit dada ketika mendapati celaan atau selainnya, tetap optimis&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">3. Selalu menyertakan Allah dalam berdakwah, dan ingat selalu bahwa mampunya seorang dai bersabar dalam berdakwah itu atas pertolongan dari Allah Ta&rsquo;ala.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Maka ingat selalu sabda Rasulullah Shallallahu alaihi wa sallam :</p>\r\n\r\n<p style=\"text-align:justify\">وَاعْلَمْ أنَّ النَّصْرَ مَعَ الصَّبْرِ</p>\r\n\r\n<p style=\"text-align:justify\">Ketahuilah, sesungguhnya pertolongan Allah itu bersamaan dengan kesabaran (HR. Tirmidzi : 2516)</p>\r\n\r\n<p style=\"text-align:justify\">Semoga Allah Ta&rsquo;ala memberikan kekuatan untuk kita selalu bersabar dalam mengajak manusia menuju Allah Ta&rsquo;ala.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">وصلى الله وسلم على نبينا محمد&nbsp;<br />\r\nوعلى آله وصحبه أجمعين<br />\r\nجزاكم الله خيرا و بارك الله فيكم</p>\r\n', '', '', 'media/upload/2019/06/sujud-doa.jpg', '', '2022-11-26 05:14:01', '2023-07-08 02:42:45', 192, 'publish', 0, 1),
(72, 1, 0, 'ilmu,nasihat-ulama,', 'Sabar yang Lebih Utama', 'sabar-yang-lebih-utama', 'Sabar yang Lebih Utama', 'sabar, hadits, quran, an naziat, syudais, faidah ustadz ruslan gunawan', 'Mengenai ayat di atas, Imam Hasan Al Bashri Rahimahullah berkata :\r\n\r\nالصَّبْرُ صَبْرَانِ ؛ أَحَدُهُمَا أَفْضَلُ مِنَ الآخَرِ،\r\nالصَّبْرُ عِنْدَ المُصِيبَةِ حُسْنٌ', 'S-Admin1', 'media/upload/2022/11/frame-99-(1).png', '<p>بسم الله الرّحمن الرّحيم</p>\r\n\r\n<p>Alloh Ta&#39;ala Berfirman,</p>\r\n\r\n<p>وَأَمَّا مَنْ خَافَ مَقَامَ رَبِّهِۦ وَنَهَى ٱلنَّفْسَ عَنِ ٱلْهَوَىٰ&nbsp;<br />\r\nفَإِنَّ ٱلْجَنَّةَ هِىَ ٱلْمَأْوَىٰ&nbsp;</p>\r\n\r\n<p><br />\r\nDan adapun orang-orang yang takut kepada kebesaran Tuhannya dan menahan diri dari keinginan hawa nafsunya, maka sesungguhnya surgalah tempat tinggal(nya).&nbsp;<br />\r\n(QS. An-Nazi&#39;at: 40-41)</p>\r\n\r\n<p>Mengenai ayat di atas, Imam Hasan Al Bashri Rahimahullah berkata :</p>\r\n\r\n<p>الصَّبْرُ صَبْرَانِ ؛ أَحَدُهُمَا أَفْضَلُ مِنَ الآخَرِ،<br />\r\nالصَّبْرُ عِنْدَ المُصِيبَةِ حُسْنٌ، وَأَفْضَلُ مِنْهُ الصَّبْرُ عَمَّا نَهَاكَ اللهُ عَنْهُ.</p>\r\n\r\n<p style=\"text-align:justify\">&quot; Kesabaran itu ada dua ; salah satu dari keduanya lebih utama dari yang lainnya.<br />\r\nYang pertama adalah sabar ketika tertimpa musibah, dan ini merupakan suatu kebaikan.&nbsp;<br />\r\nDan sabar yang lebih utama ialah sabar dalam meninggalkan apa yang Allah larang kepadamu &quot;.<br />\r\n(Tafsir Yahya bin Salam : 2/633)</p>\r\n\r\n<p style=\"text-align:justify\">Sudah menjadi keumuman setiap orang yang mendapatkan musibah, mereka akan bisa untuk bersabar. Namun dalam meninggalkan apa yang Alloh larang untuknya, kebanyakan manusia lupa.<br />\r\nSehingga bersabar dalam meninggalkan larangan Alloh ini lebih utama dari kesabaran pada umumnya.</p>\r\n\r\n<p>Dan diantara kesabaran dalam meninggalkan larangan Alloh ialah sabar untuk menahan agar tidak mengikuti hawa nafsu yang diinginkan.</p>\r\n\r\n<p style=\"text-align:justify\">Karena timbulnya kemaksiatan, kelalaian, kefuturan, hingga penyimpangan dalam agama diakibatkan karena para pelakunya mengikuti hawa nafsunya.<br />\r\nMereka lupa bersabar untuk tidak mengikuti hawa nafsunya.</p>\r\n\r\n<p style=\"text-align:justify\">Dan diantara bentuk mengikuti hawa nafsu ialah berpaling dari majelis ilmu.<br />\r\nBetapa besar keutamaan dan balasan bagi mereka yang istiqomah dalam menghadiri majelis ilmu,&nbsp;<br />\r\nNamun dengan sebab mengikuti hawa nafsunya, seseorang akan mudah berpaling dari seguadang keutamaan tersebut, akibat dari lupa untuk bersabar dalam meninggalkan larangan Alloh.</p>\r\n\r\n<p>Sementara tidaklah sempurna iman seseorang, sampai ia mampu mengendalikan keinginan hawa nafsunya.</p>\r\n\r\n<p>Seperti sabda Nabi Shallallahu&#39;alaihi wasallam ;</p>\r\n\r\n<p>&nbsp;لاَيُؤْمِنُ أَحَدُكُمْ حَتَّى يَكُونَ هَواهُ تَبَعَاً لِمَا جِئْتُ بِهِ&rdquo;&nbsp;</p>\r\n\r\n<p>&ldquo;Tidaklah sempurna keimanan salah seorang di antara kalian hingga hawa nafsunya mau mengikuti apa yang aku<br />\r\nbawa.&rdquo;&nbsp;</p>\r\n\r\n<p>(Hadits hasan shahih, Diriwayatkan oleh Al Baghawi dalam&nbsp;Syarhus Sunnah&nbsp;(1/212) , Ibnu Abi &lsquo;Ashim dalam&nbsp;as Sunnah&nbsp;(1/12), dll)</p>\r\n\r\n<p style=\"text-align:justify\">Maka dalam Firman Alloh Ta&#39;ala (QS. An Nazi&#39;at 40 -41) di atas, sangatlah jelas bahwa tiada balasan terbaik untuk orang yang bersabar dalam meninggalkan larangan Alloh berupa mengikuti hawa nafsunya, kecuali Alloh sediakan surga sebagai tempat kembali yang terbaik untuknya.</p>\r\n\r\n<p>Semoga Alloh Ta&#39;ala berikan taufiq untuk kita mampu bersabar dalam meninggalkan apa -apa yang Alloh larang.<br />\r\nAamiin.</p>\r\n\r\n<p>Walloohu&#39;alam.<br />\r\nSemoga bermanfaat.</p>\r\n\r\n<p>=======================<br />\r\nFaidah kajian : Ust. Ruslan حفظه الله<br />\r\nMalam Sabtu, 28 Okt 2022<br />\r\nPenyusun : Al faqir&nbsp;&nbsp;Sufyan As syuja&#39;i</p>\r\n', 'Sabar yang Lebih Utama', '', 'media/upload/2022/11/frame-99-(1).png', '', '2022-11-02 14:27:27', '2023-07-05 02:11:49', 79, 'publish', 0, 1),
(74, 1, 0, 'ilmu,', 'Meraih Kebahagiaan Dengan Amal Shalih', 'meraih-kebahagiaan-dengan-amal-shalih', 'Meraih Kebahagiaan Dengan Amal Shalih', 'faidah ustadz ruslan gunawan, syudais media, beramal, shalih, bahagia', 'Seorang hamba di dalam kehidupannya tentu menginginkan agar seluruh urusannya di kehidupan dunia dimudahkan oleh Allah Ta&#39;ala bahkan lebih dari itu setiap hamba', 'S-Admin1', 'media/upload/2022/11/instagram-post---10-(1).png', '<p>بسم الله الرحمن الرحيم</p>\r\n\r\n<p>Seorang hamba di dalam kehidupannya tentu menginginkan agar seluruh urusannya di kehidupan dunia dimudahkan oleh Allah Ta&#39;ala bahkan lebih dari itu setiap hamba tentu menginginkan agar kesalahan - kesalahannya diampuni Allah dan mendapat keselamatan di kehidupan akhirat.<br />\r\nMaka diantara jalan untuk meraihnya adalah dengan senantiasa beramal shalih.</p>\r\n\r\n<p>Allah Subhanahu Wa Ta&#39;ala berfirman:</p>\r\n\r\n<p>وَا لَّذِيْنَ اٰمَنُوْا وَعَمِلُوا الصّٰلِحٰتِ وَاٰ مَنُوْا بِمَا نُزِّلَ عَلٰى مُحَمَّدٍ وَّهُوَ الْحَقُّ مِنْ رَّبِّهِمْ ۙ كَفَّرَ عَنْهُمْ سَيِّاٰتِهِمْ وَاَ صْلَحَ بَا لَهُم</p>\r\n\r\n<p>&quot;Dan orang-orang yang beriman (kepada Allah) dan mengerjakan kamal shaleh serta beriman kepada apa yang diturunkan kepada Muhammad, dan itulah kebenaran dari Tuhan mereka maka Allah akan menghapus kesalahan-kesalahan mereka, dan memperbaiki keadaan mereka.&quot;<br />\r\n(QS. Muhammad : 2)</p>\r\n\r\n<p>Iman yang dimaksud pada ayat di atas yaitu seseorang beriman kepada Allah &#39;Azza wa Jalla dengan keimanan yang benar dan beriman kepada Rasulullah shallalahu &#39;alaihi wassalam dengan membenarkan hadits beliau shallalahu &#39;alaihi wassalam.</p>\r\n\r\n<p>Syaikh Abdurrahman bin Nashir As- Sa&#39;di rahimahullah berkata di dalam tafsirnya saat menjelaskan redaksi &#39; وَعَمِلُوا الصّٰلِحٰتِ &#39; (dan melaksanakan amal shalih),</p>\r\n\r\n<p>Yaitu seorang hamba semaksimal mungkin berusaha menunaikan hak Allah dan hak orang sesama manusia.</p>\r\n\r\n<p>Di antara bentuk menunaikan hak Allah sebagaimana yang disampaikan oleh Abdullah bin Mas&#39;ud Radhiyallahu anhu ketika beliau menjelaskan definisi takwa,&nbsp;&nbsp;yaitu :</p>\r\n\r\n<p>أن يُطاع فلا يُعْصَى، وأن يُذْكَر فلا يُنْسَى، وأن يُشْكَر فلا يُكْفَر</p>\r\n\r\n<p>1. Hendaknya seorang hamba berusaha mentaati Allah dan jangan mendurhaki -Nya.</p>\r\n\r\n<p>2. Hendaknya seorang hamba senantiasa mengingat Allah dan jangan melupakan-Nya.</p>\r\n\r\n<p>3. Hendaknya seorang hamba berusaha bersyukur atas nikmat Allah dan jangan kufur terhadap nikmat-Nya.</p>\r\n\r\n<p>Sedangkan di antara bentuk menunaikan hak manusia adalah sabda Rasulullah Shalallahu &#39;alaihi wassalam,</p>\r\n\r\n<p><br />\r\nعَنْ أَبِي هُرَيْرَةَ &ndash; رضي الله عنه &ndash; قَالَ رَسُولُ اَللَّهِ &ndash; صلى الله عليه وسلم &ndash; &ndash; حَقُّ اَلْمُسْلِمِ عَلَى اَلْمُسْلِمِ سِتٌّ: إِذَا لَقِيتَهُ فَسَلِّمْ عَلَيْهِ, وَإِذَا دَعَاكَ فَأَجِبْهُ, وَإِذَا اِسْتَنْصَحَكَ فَانْصَحْهُ, وَإِذَا عَطَسَ فَحَمِدَ اَللَّهَ فَسَمِّتْهُ وَإِذَا مَرِضَ فَعُدْهُ, وَإِذَا مَاتَ فَاتْبَعْهُ &ndash; رَوَاهُ مُسْلِمٌ</p>\r\n\r\n<p>Dari Abu Hurairah radhiyallahu &lsquo;anhu, ia berkata bahwa Rasulullah shallallahu &lsquo;alaihi wa sallam&nbsp;&nbsp;bersabda,&nbsp;</p>\r\n\r\n<p>&ldquo;Hak muslim kepada muslim yang lain ada enam.&rdquo; Beliau shallallahu &rsquo;alaihi wa sallam bersabda,&nbsp;</p>\r\n\r\n<p>&rdquo; Apabila engkau bertemu, ucapkanlah salam kepadanya,&nbsp;<br />\r\nApabila engkau diundang, penuhilah undangannya,&nbsp;<br />\r\nApabila engkau dimintai nasihat, berilah nasihat kepadanya,&nbsp;&nbsp;<br />\r\nApabila dia bersin lalu dia memuji Allah (mengucapkan &rsquo;alhamdulillah&rsquo;), doakanlah dia (dengan mengucapkan yarhamukallah).<br />\r\nApabila dia sakit, jenguklah dia. Dan apabila dia meninggal dunia, iringilah jenazahnya (sampai ke pemakaman).&rdquo;&nbsp;<br />\r\n(HR. Muslim)</p>\r\n\r\n<p>Dan janji Allah bagi orang yang melaksanakan poin - poin di atas :</p>\r\n\r\n<p>1. Ampunan Allah &#39;Azza wa Jalla</p>\r\n\r\n<p>Syaikh As Sa&#39;di saat menjelaskan redaksi &#39; كَفَّرَ عَنْهُمْ سَيِّاٰتِهِمْ &#39; (Allah akan menghapus kesalahan-kesalahan mereka),</p>\r\n\r\n<p>yang dimaksud Allah akan ampuni baik dosa kecil ataupun dosa besar dengan sebab keimanan dan amal shaleh yang dilakukan seorang hamba.</p>\r\n\r\n<p>2. Allah akan perbaiki segala urusan mereka.</p>\r\n\r\n<p>Syaikh As - Sa&#39;di rahimahullahu saat menjelaskan redaksi &#39;وأصلح بالهم&#39;<br />\r\n(dan memperbaiki keadaan mereka)</p>\r\n\r\n<p>yaitu Allah&nbsp;&nbsp;akan perbaiki urusan agama mereka.</p>\r\n\r\n<p>Yakni Allah akan bantu mereka untuk istiqomah di dalam menjalankan syariat-syariat islam, Allah akan bantu mereka mengamalkan petunjuk-petunjuk Allah bahkan Allah bantu segala urusan akhirat seorang hamba.<br />\r\nDan Allah akan bantu dia untuk mudah memahami ilmu, mengamalkan, dan mendakwahkan ilmu tersebut serta Allah mudahkan urusan urusan agama yang lain.</p>\r\n\r\n<p>Juga termasuk Allah perbaiki urusan yaitu Allah perbaiki urusan amal -&nbsp;&nbsp;amal seorang hamba sehingga anggota badannnya dimudahkan untuk senantiasa mentaati Allah Ta&#39;ala dan di mudahkan langkah kakinya menuju tempat yang diridhai Allah.</p>\r\n\r\n<p>Allah mudahkan sehingga seorang hamba mampu menggerakkan langkah kakinya ke majelis ilmu syar&#39;i.</p>\r\n\r\n<p>Allah pun mudahkan dirinya untuk melaksanakna shalat berjamaah, dan Allah mudahkan anggota badannya untuk melaksanakan amal shaleh yang lain.</p>\r\n\r\n<p>Bahkan tidak hanya urusan akhirat,<br />\r\nAllah pun akan perbaiki urusan dunia mereka, berupa rezeki yang cukup, kesehatan, solusi dari berbagai macam persoalan di kehidupan dunia.<br />\r\nMaka saat seorang hamba memperbaiki urusan akhirat mereka Allah akan perbaiki dunia mereka.</p>\r\n\r\n<p>Bahkan beliau pun mengatakan , Allah akan perbaiki urusan hati mereka, sehingga hati seorang hamba akan senantiasa ada dalam bimbingan Allah.<br />\r\nSelalu merasa cukup atas apa yang Allah berikan, hati yang selalu merasa bersyukur dengan nikmat- nikmatNya, hati yang selalu bersabar terhadap sesuatu yang menimpa dirinya berupa kejelekan.</p>\r\n\r\n<p>Dengan demikian betapa penting iman dan amal shalih bagi para pelakunya.<br />\r\nSemoga Alloh berikan kita taufiq untuk selalu bisa menjaga keimanan dan istiqomah melakukan amal shalih.<br />\r\nAamiin.</p>\r\n\r\n<p>Wallahu&#39;alam.</p>\r\n\r\n<p>Faidah kajian Ust. Ruslan حفظه الله</p>\r\n\r\n<p>Penyusun : Ari Lesmana</p>\r\n', 'Meraih Kebahagiaan Dengan Amal Shalih', '', 'media/upload/2022/11/instagram-post---10-(1).png', '', '2022-11-03 13:38:51', '2023-07-08 02:42:39', 100, 'publish', 0, 1),
(76, 1, 0, 'nasihat-ulama,', 'Pentingnya Kebersamaan dalam Berjuang Menuju Allah', 'pentingnya-kebersamaan-dalam-berjuang-menuju-allah', 'Pentingnya Kebersamaan dalam Berjuang Menuju Allah', 'Faidah kajian ustad ruslan, syudais media, ilmu, perkataan ulama, hadits', 'Dalam berjuang di jalan Allah Ta\'ala, seorang hamba tidak bisa berjalan sendiri, karena di perjalanan, akan sangat banyak cobaan dan ujian yang datang melanda b', 'S-Admin1', 'media/upload/2022/11/kebersamaan_syudais.png', '<p style=\"text-align:justify\">بسم الله الرحمن الرحيم</p>\r\n\r\n<p style=\"text-align:justify\">Dalam berjuang di jalan Allah Ta&#39;ala, seorang hamba tidak bisa berjalan sendiri, karena di perjalanan, akan sangat banyak cobaan dan ujian yang datang melanda baik secara dzahir, maupun batin.</p>\r\n\r\n<p style=\"text-align:justify\">Dan diantara sebab yang bisa menepis cobaan dan ujian tersebut ialah kebersamaan dalam jama&#39;ah orang orang yang shalih.</p>\r\n\r\n<p style=\"text-align:justify\">Allah berfirman;</p>\r\n\r\n<p style=\"text-align:justify\">وَٱلَّذِينَ جَـٰهَدُوا۟ فِينَا لَنَهْدِيَنَّهُمْ سُبُلَنَا ۚ وَإِنَّ ٱللَّهَ لَمَعَ ٱلْمُحْسِنِينَ</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;&quot; Dan orang-orang yang berjihad untuk (mencari keridhaan) Kami, benar-benar akan Kami tunjukkan kepada mereka jalan-jalan Kami. Dan sesungguhnya Allah benar-benar beserta orang-orang yang berbuat baik.&quot;&nbsp;<br />\r\n&nbsp;(QS. Al Ankabut : 69)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Lafadz &quot; ٱلَّذِينَ جَـٰهَدُوا۟&quot; yang artinya &quot;orang-orang yang berjuang&quot;&nbsp;<br />\r\nmenunjukan isyarat jamak/banyak.</p>\r\n\r\n<p style=\"text-align:justify\">Oleh karena itu Imam Asy-Syaukani rahimahullah dalam salah satu kitab tafsirnya mengatakan bahwa di dalam redaksi tersebut terdapat isyarat pentingnya persatuan dan kebersamaan dalam berjihad di jalan Allah Ta&#39;ala, dan tidak bisa ditempuh secara individu.</p>\r\n\r\n<p style=\"text-align:justify\">Dengan kebersamaan, satu sama lain akan saling menguatkan, saling mengingatkan untuk selalu ada, istiqomah berjuang di jalan Alloh.</p>\r\n\r\n<p style=\"text-align:justify\">Berbeda dengan orang yang berjuang sendiri, ketika ia mengalami futur, tentu syaitanlah yang akan menjadi penasihatnya.</p>\r\n\r\n<p style=\"text-align:justify\">Rasulullah shallallahu &lsquo;alaihi wa sallam bersabda,</p>\r\n\r\n<p style=\"text-align:justify\">إِنَّ الشَّيْطَانَ ذِئْبُ الْإِنْسَانِ كَذِئْبِ الْغَنَمِ، يَأْخُذُ الشَّاةَ الْقَاصِيَةَ وَالنَّاحِيَةَ، فَإِيَّاكُمْ وَالشِّعَابَ، وَعَلَيْكُمْ بِالْجَمَاعَةِ وَالْعَامَّةِ وَالْمَسْجِدِ</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;&rdquo;Sesungguhnya setan itu serigala bagi manusia seperti serigala pemangsa kambing. Dia akan memangsa kambing yang sendirian dan terpisah (dari kawanannya). Janganlah menyendiri bahkan kalian wajib untuk bergabung bersama jamaah, bersama orang banyak, dan masjid.&rdquo;&nbsp;<br />\r\n&nbsp;(HR. Ahmad)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Dalam ayat yang lain, Alloh berfirman;</p>\r\n\r\n<p style=\"text-align:justify\">وَٱعْتَصِمُوا۟ بِحَبْلِ ٱللَّهِ جَمِيعًۭا وَلَا تَفَرَّقُوا۟ ۚ وَٱذْكُرُوا۟ نِعْمَتَ ٱللَّهِ عَلَيْكُمْ إِذْ كُنتُمْ أَعْدَآءًۭ فَأَلَّفَ بَيْنَ قُلُوبِكُمْ فَأَصْبَحْتُم بِنِعْمَتِهِۦٓ إِخْوَٰنًۭا وَكُنتُمْ عَلَىٰ شَفَا حُفْرَةٍۢ مِّنَ ٱلنَّارِ فَأَنقَذَكُم مِّنْهَا ۗ كَذَٰلِكَ يُبَيِّنُ ٱللَّهُ لَكُمْ ءَايَـٰتِهِۦ لَعَلَّكُمْ تَهْتَدُونَ</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;Dan berpeganglah kamu semuanya kepada tali (agama) Allah, dan janganlah kamu bercerai berai, dan ingatlah akan nikmat Allah kepadamu ketika kamu dahulu (masa Jahiliyah) bermusuh-musuhan, maka Allah mempersatukan hatimu, lalu menjadilah kamu karena nikmat Allah, orang-orang yang bersaudara; dan kamu telah berada di tepi jurang neraka, lalu Allah menyelamatkan kamu daripadanya.Demikianlah Allah menerangkan ayat-ayat-Nya kepadamu, agar kamu mendapat petunjuk.&quot;&nbsp;<br />\r\n&nbsp;(QS. Ali Imran : 103)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">إِنَّ ٱللَّهَ يُحِبُّ ٱلَّذِينَ يُقَـٰتِلُونَ فِى سَبِيلِهِۦ صَفًّۭا كَأَنَّهُم بُنْيَـٰنٌۭ مَّرْصُوصٌۭ</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;Sesungguhnya Allah menyukai orang yang berperang dijalan-Nya dalam barisan yang teratur seakan-akan mereka seperti suatu bangunan yang tersusun kokoh.&nbsp;<br />\r\n&nbsp;(QS. As Shaff : 4)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Bahkan Nabi shallallahu &lsquo;alaihi wa sallam bersabda ;&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">مَثَلُ الْمُؤْمِنِينَ فِي تَوَادِّهِمْ، وَتَرَاحُمِهِمْ، وَتَعَاطُفِهِمْ مَثَلُ الْجَسَدِ إِذَا اشْتَكَى مِنْهُ عُضْوٌ تَدَاعَى لَهُ سَائِرُ الْجَسَدِ بِالسَّهَرِ وَالْحُمَّى</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;&ldquo;Perumpamaan orang-orang yang beriman dalam hal saling mengasihi, mencintai, dan menyayangi bagaikan satu tubuh. Apabila ada salah satu anggota tubuh yang sakit, maka seluruh tubuhnya akan ikut terjaga dan panas (turut merasakan sakitnya).&rdquo;&nbsp;<br />\r\n&nbsp;(HR. Bukhari)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">الْمُؤْمِنُ لِلْمُؤْمِنِ كَالْبُنْيَانِ يَشُدُّ بَعْضُهُ بَعْضًا</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;&ldquo;Permisalan seorang mukmin dengan mukmin yang lain itu seperti bangunan yang menguatkan satu sama lain.&rdquo;&nbsp;<br />\r\n&nbsp;(HR. Bukhari dan Muslim)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Maka melalui dalil-dalil di atas, kita bisa mengambil pelajaran bahwa Alloh dan Rasul-Nya jauh-jauh hari sudah mengisyaratkan bahwa berjuang di jalan Alloh tidak bisa sendiri, sangat butuh kebersamaan, kekompakan.</p>\r\n\r\n<p style=\"text-align:justify\">Sebagaimana para ulama pernah mengatakan;&nbsp;</p>\r\n\r\n<blockquote>\r\n<p style=\"text-align:justify\">&nbsp; &nbsp; القُوَّةُ فِي الْاِتِّحَادِ وَالضَّعِفُ فِي تَفَرُّقِ</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;&quot;Kekuatan itu ada dalam kebersaaan dan kelemahan ada dalam perpecahan.&quot;&nbsp;</p>\r\n</blockquote>\r\n\r\n<p style=\"text-align:justify\"><br />\r\nWallohu&#39;alam<br />\r\nSemoga bermanfaat.</p>\r\n\r\n<p style=\"text-align:justify\">===============================</p>\r\n\r\n<p style=\"text-align:justify\">Faidah Kajian&nbsp;<br />\r\nUst. Ruslan حفظه الله</p>\r\n\r\n<p style=\"text-align:justify\">Malam Senin, 13 Nov 2022</p>\r\n', 'Pentingnya Kebersamaan dalam Berjuang Menuju Allah', '', 'media/upload/2022/11/kebersamaan_syudais.png', '', '2022-11-17 12:50:24', '2023-07-08 02:42:43', 157, 'publish', 0, 1),
(77, 1, 0, 'ilmu,nasihat-ulama,', 'Bolehkah Menjadi Orang Kaya?', 'bolehkah-menjadi-orang-kaya', 'Bolehkah Menjadi Orang Kaya?', 'syudais, faidah kajian ustadz ruslan, hadits, quran', 'Rasulullah shallallaahu\'alaihi wasallam pernah bersabda; \r\n\r\nلَا بَأْسَ بِالْغِنَى لِمَنْ اتَّقَى اللهَ،،،\r\n\r\n Tidak masalah memiliki harta kekayaan bagi orang yang', 'S-Admin1', 'media/upload/2022/11/kaya.png', '<p style=\"text-align:justify\">Hampir setiap manusia yang menjalani hidup ini berharap menjadi orang yang kaya harta, sehingga hari-hari yang dilalui, mereka habiskan untuk memperoleh hal tersebut.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;Maka bolehkan seseorang kaya harta?&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Rasulullah shallallaahu&#39;alaihi wasallam pernah bersabda;&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">لَا بَأْسَ بِالْغِنَى لِمَنْ اتَّقَى اللهَ،،،</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;Tidak masalah memiliki harta kekayaan bagi orang yang bertaqwa kepada Allah...&nbsp;<br />\r\n&nbsp;(HR. Ahmad)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Dalam hadits di atas jelas Rasulullah shallallahu&#39;alaihi wasallam membolehkan seorang hamba menjadi orang yang kaya harta, namun yang perlu di pahami bahwa beliau mempersyaratkan seseorang yang kaya tersebut mesti bertaqwa kepada Alloh.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;Mengapa demikian?&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para ulama menjelaskan bahwa harta itu sifatnya mencenderungkan seseorang terhadapnya.</p>\r\n\r\n<p style=\"text-align:justify\">Karena dari sisi bahasa, harta &quot;المال&quot; berasal dari kata &quot;مَيلٌ&quot;<br />\r\nyang artinya kecenderungan.</p>\r\n\r\n<p style=\"text-align:justify\">Dan ruh dari harta itu mencenderungkan pemiliknya pada kelalaian, berpaling dari jalan Alloh, dan kemunkaran lainnya.</p>\r\n\r\n<p style=\"text-align:justify\">Oleh karenanya Alloh Ta&#39;ala dalam firman-Nya mengingatkan ;</p>\r\n\r\n<p style=\"text-align:justify\">يَـٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا۟ لَا تُلْهِكُمْ أَمْوَٰلُكُمْ وَلَآ أَوْلَـٰدُكُمْ عَن ذِكْرِ ٱللَّهِ ۚ وَمَن يَفْعَلْ ذَٰلِكَ فَأُو۟لَـٰٓئِكَ هُمُ ٱلْخَـٰسِرُونَ</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;Hai orang-orang beriman, janganlah hartamu dan anak-anakmu melalaikan kamu dari mengingat Allah. Barangsiapa yang berbuat demikian maka mereka itulah orang-orang yang merugi.&nbsp;<br />\r\n&nbsp;(QS. Al Munafiqun : 9)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Nabi Shallallahu&#39;alaihi wasallam juga pernah mengingatkan ;</p>\r\n\r\n<p style=\"text-align:justify\">فَوَاللهِ مَا الْفَقْرَ أَخْشَى عَلَيْكُمْ وَلَكِنِّي أَخْشَى أَنْ تُبْسَطَ الدُّنْيَا عَلَيْكُمْ كَمَا بُسِطَتْ عَلَى مَنْ كَانَ قَبْلَكُمْ، فَتَنَافَسُوْهَا كَمَا تَنَافَسُوْهَا، فَتُهْلِكَكُمْ كَمَا أَهْلَكَتْهُمْ.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;Maka demi Allah! Bukan kemiskinan yang aku khawatirkan atas kalian. Akan tetapi aku khawatir akan dibentangkan dunia atas kalian sebagaimana telah dibentangkan atas orang-orang sebelum kalian. Lalu kalian pun berlomba-lomba padanya sebagaimana mereka berlomba-lomba padanya. Kemudian dunia itu akan menghancurkan kalian sebagaimana telah menghancurkan mereka.&rdquo;&nbsp;<br />\r\n&nbsp;(HR. Bukhari dan Muslim)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Sehingga sangatlah jelas, kaya harta tanpa taqwa akan binasa, lain halnya jika kaya harta disertai dengan ketaqwaan kepada Alloh, maka kekayaan yang ia miliki akan menjadikan sarana untuk beribadah dan mendekatkan dirinya kepada Alloh Ta&#39;ala.</p>\r\n\r\n<p style=\"text-align:justify\">Walloohu&#39;alam.<br />\r\nSemoga bermanfaat.</p>\r\n\r\n<p style=\"text-align:justify\">========================================</p>\r\n\r\n<p style=\"text-align:justify\">Faidah Singkat&nbsp;<br />\r\nKajian Ustadz Ruslan Gunawwn حفظه الله</p>\r\n\r\n<p style=\"text-align:justify\">Malam Sabtu, 18 Nov 2022<br />\r\nPenyusun : Al Faqir Sufyan Asy-Syuja&#39;i</p>\r\n', 'Bolehkah Menjadi Orang Kaya?', '', 'media/upload/2022/11/kaya.png', '', '2022-11-23 15:39:02', '2023-07-08 02:42:39', 138, 'publish', 0, 1),
(78, 1, 0, 'ilmu,', 'Ketika Harapan kepada Allah Sirna', 'ketika-harapan-kepada-allah-sirna', 'Ketika Harapan kepada Allah Sirna', 'syudais, faidah kajian ustadz ruslan, hadits, quran', 'Rasa harap kepada Alloh merupakan salah satu diantara tiga pilar pokok dalam ibadah, setelah rasa cinta dan takut.\r\n\r\nKetika rasa harap kepada Alloh tidak diperha', 'S-Admin1', 'media/upload/2022/11/sajadah.jpg', '<p style=\"text-align:justify\">Rasa harap kepada Alloh merupakan salah satu diantara tiga pilar pokok dalam ibadah, setelah rasa cinta dan takut.</p>\r\n\r\n<p style=\"text-align:justify\">Ketika rasa harap kepada Alloh tidak diperhatikan, maka akan timbul penyakit dalam hati, diantaranya bergantung terhadap amalnya.</p>\r\n\r\n<p style=\"text-align:justify\">Ibnu Athailah Rahimahullah pernah berkata ;</p>\r\n\r\n<p style=\"text-align:justify\">مِنْ عَلامَةِ الاعْتِمادِ عَلى العَمَلِ، نُقْصانُ الرَّجاءِ عِنْدَ وُجودِ الزَّللِ.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;Diantara ciri bahwa seseorang itu bergantung terhadap amalnya ialah berkurang harapannya kepada Allah ketika terjadi kesalahan.&nbsp;<br />\r\n&nbsp;(Al Hikam : 9)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Orang yang beriman hendaknya meyakini bahwa tercapainya segala sesuatu baik perkara dunia maupun akhirat secara hakiki merupakan kehendak dan kekuasaan Allah.</p>\r\n\r\n<p style=\"text-align:justify\">Namun, pada kenyataanya kuatnya ketergantungan seseorang terhadap amal dan kemampuannya, membuatnya sibuk dengan segala sesuatu yang ia hadapi.</p>\r\n\r\n<p style=\"text-align:justify\">Dalam bekerja dia akan dicapekkan dengan pekerjaannya, dalam dunia pendidikan ia akan merasa lelah dalam menjalankan program-program kegiatannya, dan dalam berniagapun ia akan amat sibuk dengan perniagaannya.</p>\r\n\r\n<p style=\"text-align:justify\">Semua itu terjadi karena mereka mengandalkan kemampuan yang mereka miliki, mereka bergantung pada kecerdasan, kekuatan yang ada pada diri mereka, sehingga mereka beranggapan dengan apa yang mereka lakukan tersebut akan bisa meraih keberhasilan dan kesuskesan.</p>\r\n\r\n<p style=\"text-align:justify\">Begitu pula dengan pencarian ilmu, seseorang yang bergantung pada apa yang ada pada diri dan keadaannya, ia akan mendapati kejenuhan, rasa malas, bahkan putus asa, sehingga membuatnya berpaling dari keistiqomahan.</p>\r\n\r\n<p style=\"text-align:justify\">Kesibukan, masalah, penyakit yang ia alami seakan-akan menjadi penghalang untuk ia bisa berangkat mencari ilmu, untuk bisa ia ibadah di hadapan Alloh, karena begitu kuatnya harapan pada keadaan yang ia alami.<br />\r\nDan minimnya harapan kepada Alloh Ta&#39;ala.</p>\r\n\r\n<p style=\"text-align:justify\">Alloh Ta&#39;ala berfirman ;</p>\r\n\r\n<p style=\"text-align:justify\">وَاللَّهُ خَلَقَكُمْ وَمَا تَعْمَلُونَ</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;&ldquo;Padahal Allah lah yang menciptakan kamu dan apa yang kamu perbuat itu.&rdquo;&nbsp;<br />\r\n&nbsp;(Qs. Ash Shaffat: 96) .</p>\r\n\r\n<p style=\"text-align:justify\">Padahal apabila seseorang menggantungkan harapannya kepada Alloh, tentu Alloh akan bantu segala aktifitas dan kesibukannya sehingga tidak mengganggu aktifitas ibadahnya.</p>\r\n\r\n<p style=\"text-align:justify\">Alloh Ta&#39;ala berfirman&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">..وَمَن يَتَوَكَّلْ عَلَى ٱللَّهِ فَهُوَ حَسْبُهُۥٓ ۚ&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;Dan barangsiapa yang bertawakkal kepada Allah niscaya Allah akan mencukupkan (keperluan)nya.&nbsp;<br />\r\n( QS. At Thalaq : 3 )</p>\r\n\r\n<p style=\"text-align:justify\">Oleh karena itu, jangan sampai rasa harap dalam hati kita lenyap, ditelan kesombongan, ujub dan penyakit hati lainnya yang mendorong kita untuk jauh dari ketaatan kepada Alloh Ta&#39;ala.</p>\r\n\r\n<p style=\"text-align:justify\">Wallohu&#39;alam.</p>\r\n\r\n<p style=\"text-align:justify\">=================================</p>\r\n\r\n<p style=\"text-align:justify\">Faidah singkat kajian&nbsp;<br />\r\nUst. Ruslan حفظه الله</p>\r\n\r\n<p style=\"text-align:justify\">Malam Sabtu, 11 Nov 2022<br />\r\nPenyusun : Al Fakir Sufyan Asy Syuja&#39;i</p>\r\n', 'Ketika Harapan kepada Allah Sirna', '', 'media/upload/2022/11/sajadah.jpg', '', '2022-11-23 15:38:44', '2023-07-08 02:42:42', 154, 'publish', 0, 1),
(79, 1, 0, 'ilmu,', 'Meraih Hidayah dan Kesuksesan dengan Membenahi Keyakinan', 'meraih-hidayah-dan-kesuksesan-dengan-membenahi-keyakinan', 'Meraih Hidayah dan Kesuksesan dengan Membenahi Keyakinan', 'syudais, faidah kajian ustadz ruslan gunawan, sukses, ibnul qayim', 'Setiap orang sangat menginginkan kehidupannya sukses dan ingin setiap langkahnya diberikan arahan. Banyak orang berlomba untuk menggapai itu semua, namun sediki', 'S-Admin1', 'media/upload/2022/11/sukses.jpg', '<p style=\"text-align:justify\">Setiap orang sangat menginginkan kehidupannya sukses dan ingin setiap langkahnya diberikan arahan. Banyak orang berlomba untuk menggapai itu semua, namun sedikit sekali yang mengetahui bahwa untuk menggapai kesuksesan dan arahan itu membutuhkan keyakinan akan apa yang Allah ta&#39;ala tetapkan baik berupa perintah, keutamaan, ancaman. Padahal dengan meyakini tersebut, Allah akan memberikan arahan dan kesuksesan bagi dirinya.</p>\r\n\r\n<p style=\"text-align:justify\">Imam Ibnul Qayyim rahimahullah berkata :&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">الْيَقِينُ سَبَبٌ فِي الْهُدَى وَالْفَلَاحِ فِي الدُّنْيَا وَالْآخِرَةِ</p>\r\n\r\n<p style=\"text-align:justify\">KEYAKINAN MERUPAKAN SEBAB SESEORANG BERADA DIATAS PETUNJUK DAN KESELAMATAN DI DUNIA DAN DI AKHIRAT</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n', 'Meraih Hidayah dan Kesuksesan dengan Membenahi Keyakinan', '', 'media/upload/2022/11/sukses.jpg', '', '2022-11-26 05:10:35', '2023-07-08 02:42:40', 104, 'publish', 0, 1),
(80, 1, 0, 'akhlak,', 'Istiqamah Buah dari Keyakinan', 'istiqamah-buah-dari-keyakinan', 'Istiqamah Buah dari Keyakinan', 'syudais, faidah kajian ustadz ruslam gunawan, hadits, quran, istiqamah', 'Diantara sebab yang akan menjadikan seseorang istiqomah dalam keta\'atan adalah keyakinan. \r\n\r\nSyaikh \'Abdurrazaq berkata :\r\n\r\nDampak dari ketidakyakinan seorang', 'S-Admin1', 'media/upload/2022/11/christopher-sardegna-irygma_no2q-unsplash.jpg', '<p>Rasulullah Shallallahu &rsquo;alaihi wa sallam bersabda :</p>\r\n\r\n<p>لَا يَأْتِي عَلَيْكُمْ زَمَانٌ إِلَّا الَّذِي بَعْدَهُ شَرٌّ مِنْهُ حَتَّى تَلْقَوْا رَبَّكُمْ&nbsp;</p>\r\n\r\n<p>Tidaklah kalian menjalani suatu zaman, melainkan (zaman) sesudahnya lebih buruk daripadanya (sebelumnya), sampai kalian menjumpai Rabb kalian. &nbsp;</p>\r\n', 'Istiqamah Buah dari Keyakinan', '', 'media/upload/2022/11/christopher-sardegna-irygma_no2q-unsplash.jpg', '', '2022-11-23 18:34:02', '2023-07-08 02:42:35', 165, 'publish', 0, 1);
INSERT INTO `d_blog` (`id`, `a_pengguna_id`, `b_user_id`, `kategori`, `title`, `slug`, `mtitle`, `mkeyword`, `mdescription`, `mauthor`, `mimage`, `content`, `excerpt`, `tags`, `featured_image`, `featured_thumb`, `cdate`, `ldate`, `jml_baca`, `status`, `is_follow_up`, `is_read`) VALUES
(81, 1, 0, 'ilmu,nasihat-ulama,', 'Solusi Untuk Setiap Problematika Kehidupan', 'solusi-untuk-setiap-problematika-kehidupan', 'Solusi Untuk Setiap Problematika Kehidupan', 'syudais, faidah kajian ustadz ruslan gunawan, doa hadits, nashihat ulama, ulama', 'Rasulullah shallallahu ‘alaihi wa sallam bersabda :&#13;&#10;&#13;&#10;ادْعُوا اللَّهَ وَأَنْتُمْ مُوقِنُونَ بِالإِجَابَةِ وَاعْلَمُوا أَنَّ اللَّهَ لاَ يَسْتَجِيبُ دُعَاءً مِنْ ', 'S-Admin1', 'media/upload/2022/11/masjid-maba-qhzqfd0ihni-unsplash-(1).jpg', '<p style=\"text-align:justify\">Setiap manusia pasti diberikan ujian dengan berbagai jenisnya masing-masing!</p>\r\n\r\n<p style=\"text-align:justify\">Ujian berupa kekurangan harta, rumah tangga, karir, kesehatan dan lainnya.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Bentuk kasih sayang Allah yang sangat luas bagi hamba-hamba-Nya adalah Allah jadikan semua persoalan apapun itu bisa selesai dengan satu solusi yaitu Do&#39;a.</p>\r\n\r\n<p style=\"text-align:justify\">Para ulama mengatakan :</p>\r\n\r\n<p style=\"text-align:justify\">DO&#39;A ADALAH SENJATANYA ORANG BERIMAN</p>\r\n\r\n<p style=\"text-align:justify\">Semisal Pisau, Semakin di asah maka akan semakin tajam, begitupun do&#39;a semakin kita asah yaitu dengan memperbaiki cara kita berdoa maka semakin pasti Allah akan ijabah Do&#39;a kita.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Muncul dalam benak seseorang :&nbsp;<br />\r\nSaya Sering berdo&#39;a tapi tak kunjung di kabulkan</p>\r\n\r\n<p style=\"text-align:justify\">BAGAIMANA AGAR DO&#39;A KITA DIKABULKAN ?</p>\r\n\r\n<p style=\"text-align:justify\">1. ALLAH BERJANJI AKAN MENGABULKAN DO&#39;A.</p>\r\n\r\n<p style=\"text-align:justify\">Allah Ta&#39;ala berfirman,</p>\r\n\r\n<p style=\"text-align:justify\">وَقَالَ رَبُّكُمُ ادْعُونِي أَسْتَجِبْ لَكُمْ إِنَّ الَّذِينَ يَسْتَكْبِرُونَ عَنْ عِبَادَتِي سَيَدْخُلُونَ جَهَنَّمَ دَاخِرِينَ</p>\r\n\r\n<p style=\"text-align:justify\">&ldquo;Rabb kalian (Allah) berfirman, &lsquo;Mintalah kepada-Ku, niscaya aku memberi ijabah kepada kalian. Sesungguhnya, orang-orang yang bersikap sombong dalam beribadah (maksudnya: tidak mau berdoa) kepadaku, mereka akan masuk neraka Jahanam dalam keadaan hina.&rdquo; (Q.S. Ghafir:60)</p>\r\n\r\n<p style=\"text-align:justify\">Jadi teruslah memohon kepada Allah Ta&rsquo;ala, jangan pernah berhenti, karena orang yang tidak mau berdoa adalah orang yang sombong.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Ayat diatas pun ditafsirkan dalam hadits berikut,&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Rasulullah Shallallahu &lsquo;alaihi wa sallam bersabda :</p>\r\n\r\n<p style=\"text-align:justify\">مَنْ لَمْ يَسْأَلْ الله غَضَبَ اللهُ عَلَيْهِ</p>\r\n\r\n<p style=\"text-align:justify\">&ldquo;Barangsiapa yang tidak meminta kepada Allah, maka Allah akan memurkainya&ldquo;. (HR. Tirmidzi) .</p>\r\n\r\n<p style=\"text-align:justify\">2. BERDO&#39;A DENGAN PENUH KEYAKINAN.</p>\r\n\r\n<p style=\"text-align:justify\">Yakinlah bahwa Allah akan mengabulkan setiap do&rsquo;a hamba-hambaNya.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Rasulullah shallallahu &lsquo;alaihi wa sallam bersabda :</p>\r\n\r\n<p style=\"text-align:justify\">ادْعُوا اللَّهَ وَأَنْتُمْ مُوقِنُونَ بِالإِجَابَةِ وَاعْلَمُوا أَنَّ اللَّهَ لاَ يَسْتَجِيبُ دُعَاءً مِنْ قَلْبٍ غَافِلٍ لاَهٍ</p>\r\n\r\n<p style=\"text-align:justify\">&ldquo;Berdo&rsquo;alah kepada Allah dalam keadaan yakin akan dikabulkan, dan ketahuilah bahwa Allah tidak mengabulkan do&rsquo;a dari hati yang lalai.&rdquo; (HR. Tirmidzi no. 3479)</p>\r\n\r\n<p style=\"text-align:justify\">✅ YAKIN bahwa Allah mendengar do&#39;a kita</p>\r\n\r\n<p style=\"text-align:justify\">✅ YAKIN bahwa Allah sangat mudah dan mampu memberikan apa yang kita mohonkan</p>\r\n\r\n<p style=\"text-align:justify\">✅ YAKIN bahwa berdo&#39;a itu adalah ibadah</p>\r\n\r\n<p style=\"text-align:justify\">3. PERHATIKAN ADAB DALAM BERDO&#39;A</p>\r\n\r\n<p style=\"text-align:justify\">Diantara adab yang harus kita perhatikan dalam berdo&#39;a :&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">✅ Awali dengan memuji Allah Ta&#39;ala</p>\r\n\r\n<p style=\"text-align:justify\">✅ Bershalawat kepada Rasulullah shallallahu &#39;alaihi wa sallam&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">✅ Dahulukan redaksi/lafadz Do&#39;a yang terdapat dalam Al-Qur&#39;an dan Hadits</p>\r\n\r\n<p style=\"text-align:justify\">4. CARA ALLAH MENGABULKAN DO&#39;A</p>\r\n\r\n<p style=\"text-align:justify\">➡️ Allah Ta&#39;ala berikan sebagaiamana apa yang kita mohonkan</p>\r\n\r\n<p style=\"text-align:justify\">➡️ Allah Ta&#39;ala tangguhkan ijabah do&rsquo;a kita untuk pahala diakhirat</p>\r\n\r\n<p style=\"text-align:justify\">➡️ Allah Ta&#39;ala ganti dengan menyelamatkan kita dari musibah<br />\r\n&nbsp;<br />\r\nRasulullah Shallallahu&#39; alaihi wa sallam bersabda :</p>\r\n\r\n<p style=\"text-align:justify\">مَا مِنْ مُسْلِمٍ يَدْعُو بِدَعْوَةٍ لَيْسَ فِيهَا إِثْمٌ ، وَلاَ قَطِيعَةُ رَحِمٍ ، إِلاَّ أَعْطَاهُ اللَّهُ بِهَا إِحْدَى ثَلاَثٍ : إِمَّا أَنْ تُعَجَّلَ لَهُ دَعْوَتُهُ ، وَإِمَّا أَنْ يَدَّخِرَهَا لَهُ فِي الآخِرَةِ ، وَإِمَّا أَنْ يَصْرِفَ عَنْهُ مِنَ السُّوءِ مِثْلَهَا.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&ldquo;Tidak ada seorangpun yang berdoa dengan sebuah doa yang tidak ada dosa di dalamnya dan memutuskan silaturrahim, melainkan Allah akan mengabulkan salah satu dari tiga perkara: (1) baik dengan disegerakan baginya (pengabulan doanya) di dunia atau, (2) dengan disimpan baginya (pengabulan doanya) di akhirat atau, (3) dengan dijauhkan dari keburukan semisalnya.&rdquo;(HR. Tirmidzi no. 3381)</p>\r\n\r\n<p style=\"text-align:justify\">Ibnu Athailah rahimahullah berkata :</p>\r\n\r\n<p style=\"text-align:justify\">الْإِجَابَةُ فِيمَا يَخْتَارُهُ لَكَ لَا فِيمَا تَخْتَارُهُ لِنَفْسِكَ وَفِي الْوَقْتِ الَّذِي يُرِيدُ لَا فِي الْوَقْتِ الَّذِي تُرِيدُ</p>\r\n\r\n<p style=\"text-align:justify\">✅ Terkabulnya do&rsquo;a itu pada sesuatu yang Allah Ta&#39;ala pilih, bukan pada sesuatu yang engka pilih untuk dirimu sendiri.</p>\r\n\r\n<p style=\"text-align:justify\">✅ Terkabulnya do&#39;a itu pada waktu yang Allah Ta&#39;ala kehendaki bukan pada waktu yang engkau inginkan. (Al-Hikam : 10)</p>\r\n\r\n<p style=\"text-align:justify\">Wallohu &#39;alam</p>\r\n\r\n<p style=\"text-align:justify\">', 'Solusi Untuk Setiap Problematika Kehidupan', '', 'media/upload/2022/11/masjid-maba-qhzqfd0ihni-unsplash-(1).jpg', '', '2022-11-24 15:08:21', '2023-07-08 02:42:38', 122, 'publish', 0, 1),
(82, 1, 0, 'ilmu,', 'Muliakanlah Gurumu', 'muliakanlah-gurumu', 'Muliakanlah Gurumu', 'syudais, faidah kajian ustadz ruslan gunawan, guru, hadits, ilmu, adab', 'Rasulullah Shallallahu’alaihi Wasallam bersabda :\r\n “Tidak termasuk golongan kami orang yang tidak menghormati yang lebih tua dan menyayangi yang lebih muda sert', 'S-Admin1', 'media/upload/2022/11/ngaji_filtered.jpg', '<p>Rasulullah&nbsp;Shallallahu&rsquo;alaihi Wasallam&nbsp;bersabda :</p>\r\n\r\n<p>لَيْسَ مِنَّا مَنْ لَم ْيُجِلَّ كَبِيْرَنَا وَيَرْحَمْ صَغِيْرَنَا وَيَعْرِفْ لِعَالِمِنَا حَقَّهُ</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;&ldquo;Tidak termasuk golongan kami orang yang tidak menghormati yang lebih tua dan menyayangi yang lebih muda serta yang tidak mengerti hak ulama&rdquo;&nbsp;&nbsp;(HR. Ahmad)&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Para sahabat adalah sebaik-baik contoh bagaimana seorang penuntut ilmu beradab memuliakan gurunya, sebagaimana sahabat&nbsp;Abu Sa&rsquo;id Al-Khudri&nbsp;Radhiallahu &lsquo;anhu&nbsp;berkata,</p>\r\n\r\n<p>كُنَّا جُلُوْساً فِيْ المَسْجِدِ إِذْ خَرَجَ رَسُوْلُ اللهِ فَجَلَسَ إِلَيْنَا فَكَأَنَّ عَلَى رُؤُوْسُنِا الطَيْر لَا يَتَكَلَّمُ أَحَدٌ مِنَّا</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;&ldquo;Saat kami sedang duduk-duduk di masjid, maka keluarlah Rasulullah shallallahu &lsquo;alaihi wa sallam kemudian duduk di hadapan kami. Maka seakan-akan di atas kepala kami terdapat burung. Tak satu pun dari kami yang berbicara&rdquo;&nbsp;<br />\r\n&nbsp;(HR. Bukhari) .&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Demikian pula contoh suri teladan dari Ibnu Abbas seorang sahabat yang &lsquo;alim, mufasir Al Qur&#39;an, seorang dari Ahli Bait Nabi pernah menuntun tali kendaraan Zaid bin Tsabit radhiallahu anhu&nbsp;berkata,</p>\r\n\r\n<p>هَكَذَا أُمِرْنَا أَنْ نَفْعَلَ بِعُلَمَائِنَا</p>\r\n\r\n<p>&nbsp;&ldquo;Seperti inilah kami diperintahkan untuk memperlakukan para ulama kami&rdquo;.&nbsp;<br />\r\n(Tadzkiratus sami wal mutakallim : 41).</p>\r\n\r\n<p>Begitu pula para ulama shalih terdahulu, amat sangat memuliakan gurunya.</p>\r\n\r\n<p>Berkata Ahmad Syauqiy :</p>\r\n\r\n<p>قُم لِلمُعَلِّمِ وَفِّهِ التَبْجِيْلًا، كادَ المُعَلِّمُ أَن يَكونَ رَسُوْلًا</p>\r\n\r\n<p style=\"text-align:justify\">&ldquo;Berdirilah untuk Guru, dalam rangka memberikan penghormatan untuknya. Hampir-hampir seorang guru kedudukannya seperti seorang Rasul .&rdquo;</p>\r\n\r\n<p>أَعَلِمْتَ أَشرَفَ أَو أَجَلَّ مِنَ الَّذِيْ، يَبْنِيْ وَيُنشِئُ أَنفُسًا وَعُقُوْلًا</p>\r\n\r\n<p style=\"text-align:justify\">&ldquo;Tahukah engkau apakah ada orang yang lebih mulia dan lebih agung dibandingkan dari orang yang membangun dan mendidik jiwa-jiwa dan akal?&quot;</p>\r\n\r\n<p style=\"text-align:justify\">Maka pantaslah orang-orang shalih terdahulu namanya hingga kini kian harum, dimuliakan, ilmunya bermanfaat, karena dalam pencarian ilmunya mereka amat sangat memuliakan gurunya.</p>\r\n\r\n<p>Wallohu&#39;alam<br />\r\nSemoga bermanfaat.</p>\r\n\r\n<p>===============================</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'Muliakanlah Gurumu', '', 'media/upload/2022/11/ngaji_filtered.jpg', '', '2023-01-25 11:28:15', '2023-07-08 02:42:40', 114, 'publish', 0, 1),
(83, 1, 0, 'ilmu,', 'Jangan Paksa Allah Cabut Kenikmatan Darimu', 'jangan-paksa-allah-cabut-kenikmatan-darimu', 'Jangan Paksa Allah Cabut Kenikmatan Darimu', 'syudais media, kenikmatan, ilmu', '(Siksaan) yang demikian itu adalah karena sesungguhnya Allah sekali-kali tidak akan merubah sesuatu nikmat yang telah dianugerahkan-Nya kepada suatu kaum, hingg', 'S-Admin1', 'media/upload/2023/01/jangan_cabut_kenikmatan.jpg', '<p>Allah Ta&#39;ala befirman :</p>\r\n\r\n<p>ذَٰلِكَ بِأَنَّ ٱللَّهَ لَمْ يَكُ مُغَيِّرًۭا نِّعْمَةً أَنْعَمَهَا عَلَىٰ قَوْمٍ حَتَّىٰ يُغَيِّرُوا۟ مَا بِأَنفُسِهِمْ ۙ وَأَنَّ ٱللَّهَ سَمِيعٌ عَلِيمٌۭ</p>\r\n\r\n<p style=\"text-align:justify\">(Siksaan) yang demikian itu adalah karena sesungguhnya Allah sekali-kali tidak akan merubah sesuatu nikmat yang telah dianugerahkan-Nya kepada suatu kaum, hingga kaum itu merubah apa-apa yang ada pada diri mereka sendiri, dan sesungguhnya Allah Maha Mendengar lagi Maha Mengetahui.&nbsp;<br />\r\n(QS. Al Anfal : 53)</p>\r\n\r\n<p>Imam Ibnu Qayyim rahimahullah berkata :</p>\r\n\r\n<p>فَأخْبَرَ اللَّهُ تَعالى أنَّهُ لَا يُغَيِّرُ نِعَمَهُ الَّتِي أنْعَمَ بِها عَلى أحَدٍ حَتّى يَكُونَ هو الَّذِي يُغَيِّرُ ما بِنَفْسِهِ، فَيُغَيِّرُ طاعَةَ اللَّهِ بِمَعْصِيَتِهِ، وشُكْرَهُ بِكُفْرِهِ، وأسْبابَ رِضاهُ بِأسْبابِ سُخْطِهِ، فَإذا غَيَّرَ غَيَّرَ عَلَيْهِ، جَزاءً وِفاقًا، وما رَبُّكَ بِظَلّامٍ لِلْعَبِيدِ.<br />\r\nفَإنْ غَيَّرَ المَعْصِيَةَ بِالطّاعَةِ، غَيَّرَ اللَّهُ عَلَيْهِ العُقُوبَةَ بِالعافِيَةِ، والذُّلَّ بِالعِزِّ.</p>\r\n\r\n<p style=\"text-align:justify\">Allah mengabarkan bahwa Dia tidak akan mengubah nikmat-Nya yang diberikan kepada seseorang sampai orang itu mengubah apa yang ada &nbsp;pada dirinya sendiri.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Sehingga, hamba tersebut mengubah ketaatan kepada Allah menjadi maksiat kepada-Nya, syukur kepada Allah menjadi kufur kepada-Nya, serta mengubah penyebab keridhaan-Nya menjadi kemurkaan-Nya.</p>\r\n\r\n<p style=\"text-align:justify\">Jika dia mengubah semua itu, maka Allah akan mengubah kondisinya, sebagai balasan yang setimpal. Sesungguhnya Rabbmu tidak pernah menzalimi hamba-hamba-Nya .&nbsp;&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Begitupula sebaliknya, jika seorang hamba mengubah kemaksiatan menjadi ketaatan kepada-Nya, niscaya Allah akan mengubah siksaan menjadi keselamatan, serta kehinaan menjadi kemuliaan .&nbsp;<br />\r\n(Ad-daa&#39; wa Ad-dawa&#39; : 74 - Ibnu Qayyim)</p>\r\n\r\n<p style=\"text-align:justify\">Demikianlah kemurahan dan keadilan Allah Ta&#39;ala dalam mengatur kehidupan kita. Sehingga ketika masalah dalam kehidupan kita silih berganti, rasa futur semakin menggerogoti hati, dan kegelisahan semakin menjadi-jadi, maka jangan salahkan siapapun, boleh jadi itu adalah sebab perbuatan diri kita sendiri yang asalnya ta&#39;at menjadi maksiat.&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">Semoga Allah Ta&#39;ala senantiasa memberikan kita taufiq untuk selalu istiqamah menjaga nikmat yang ada serta berusaha mengembalikan nikmat yang telah hilang dengan kembali berjuang di jalan yang Allah ridhai.</p>\r\n\r\n<p>Semoga bermanfaat.<br />\r\nWallahu&#39;alam bishawwab.&nbsp;<br />\r\nFaidah Kajian : Ustadz &nbsp;Ruslan Gunawan حفظه الله</p>\r\n', 'Jangan Paksa Allah Cabut Kenikmatan Darimu', '', 'media/upload/2023/01/jangan_cabut_kenikmatan.jpg', '', '2023-01-25 11:21:00', '2023-07-08 02:42:31', 166, 'publish', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `d_blogkategori`
--

CREATE TABLE `d_blogkategori` (
  `id` int(5) NOT NULL,
  `utype` enum('kategori','kategori_sub','kategori_sub_sub') NOT NULL DEFAULT 'kategori',
  `nama` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `mtitle` varchar(255) NOT NULL,
  `mkeyword` varchar(255) NOT NULL,
  `mdescription` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_visible` int(1) NOT NULL DEFAULT 1,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `d_blogkategori_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `d_blogkategori`
--

INSERT INTO `d_blogkategori` (`id`, `utype`, `nama`, `slug`, `mtitle`, `mkeyword`, `mdescription`, `deskripsi`, `cdate`, `is_visible`, `is_active`, `d_blogkategori_id`) VALUES
(1, 'kategori', 'Ilmu', 'ilmu', 'Ilmu', 'Artikel tentang ilmu', 'Artikel tentang ilmu', '<p>Artikel tentang ilmu</p>\r\n', '0000-00-00 00:00:00', 1, 1, NULL),
(2, 'kategori_sub', 'Tauhid', 'tauhid', 'Tauhid', 'Tauhid', 'Tauhid', '<p>Tauhid</p>\r\n', '0000-00-00 00:00:00', 1, 1, 1),
(3, 'kategori_sub', 'Manhaj', 'manhaj', 'Manhaj', 'Manhaj', 'Manhaj', '<p>Manhaj</p>\r\n', '0000-00-00 00:00:00', 1, 1, 1),
(4, 'kategori_sub', 'Fiqih', 'fiqih', 'Fiqih', 'Fiqih', 'Fiqih', '<p>Fiqih</p>\r\n', '0000-00-00 00:00:00', 1, 1, NULL),
(5, 'kategori_sub', 'Tazkiyatunnufus', 'tazkiyatunnufus', 'Tazkiyatunnufus', 'tazkiyatunnafs', 'Ilmu mengenai pembersihan hati', '<p>Ilmu mengenai pembersihan hati</p>\r\n', '2019-06-30 05:25:50', 1, 1, 1),
(6, 'kategori', 'Adab', 'adab', 'Adab', '', '', '', '2019-06-30 05:26:40', 1, 1, NULL),
(7, 'kategori_sub', 'Akhlak', 'akhlak', 'Akhlak', 'akhlak', 'Akhlak adalah salah satu ilmu pasti yang menjadi tujuan Rasulullah Shalallahu \'alaihi wasallam diutus.', '<p>Akhlak adalah salah satu ilmu pasti yang menjadi tujuan Rasulullah Shalallahu &#39;alaihi wasallam diutus.</p>\r\n', '2019-06-30 05:48:44', 1, 1, 1),
(8, 'kategori_sub', 'Nasihat Ulama', 'nasihat-ulama', 'Nasihat Ulama', '', '', '', '2019-06-30 06:08:35', 1, 1, 1),
(9, 'kategori', 'Khutbah', 'khutbah', 'Khutbah', '', '', '', '2019-07-01 04:16:10', 1, 1, NULL),
(10, 'kategori_sub', 'Khutbah Jumat', 'khutbah-jumat', 'Khutbah Jumat', '', '', '', '2019-07-01 04:16:37', 1, 1, 9),
(12, 'kategori_sub', 'Ibadah', 'ibadah', 'Ibadah', '', '', '', '2019-07-11 08:22:38', 1, 1, 2),
(13, 'kategori', 'Poster', 'poster', 'Poster', 'poster, poster dakwah, dakwah, design', 'In syaa Allah kami akan sampaikan agama melalui poster pilihan yang akan memunculkan syiar', '<p>Poster</p>\r\n', '2021-12-23 07:36:35', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `d_blog_blogkategori`
--

CREATE TABLE `d_blog_blogkategori` (
  `id` int(12) NOT NULL,
  `d_blogkategori_id` int(11) DEFAULT NULL,
  `d_blog_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `d_blog_diskusi`
--

CREATE TABLE `d_blog_diskusi` (
  `id` int(11) NOT NULL,
  `b_user_admin_id` int(11) NOT NULL,
  `b_user_id` int(11) NOT NULL,
  `d_blog_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cdate` datetime NOT NULL,
  `status` enum('open','close') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `d_blog_diskusi`
--

INSERT INTO `d_blog_diskusi` (`id`, `b_user_admin_id`, `b_user_id`, `d_blog_id`, `title`, `cdate`, `status`) VALUES
(5, 2, 2, 54, 'Penulisan belum bagus', '2020-03-22 15:04:40', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `d_cart`
--

CREATE TABLE `d_cart` (
  `nation_code` int(5) NOT NULL,
  `b_user_id` int(11) NOT NULL,
  `c_produk_id` int(11) NOT NULL,
  `id` int(12) NOT NULL,
  `qty` int(2) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `d_doa`
--

CREATE TABLE `d_doa` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `doa` text CHARACTER SET utf8 NOT NULL,
  `dalil` text CHARACTER SET utf8 NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `d_dzikir`
--

CREATE TABLE `d_dzikir` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `dzikir` text CHARACTER SET utf8 NOT NULL,
  `dalil` text CHARACTER SET utf8 NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `d_kehadiran`
--

CREATE TABLE `d_kehadiran` (
  `tgl` date NOT NULL,
  `b_jadwal_id` int(11) NOT NULL,
  `b_user_pengabsen_id` int(11) NOT NULL,
  `e_kajian_id` int(3) NOT NULL DEFAULT 0,
  `e_kegiatan_id` int(3) NOT NULL DEFAULT 0,
  `b_user_id` int(11) NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_pulang` time NOT NULL,
  `jam_lembur_masuk` time NOT NULL,
  `jam_lembur_pulang` time NOT NULL,
  `is_kesiangan` int(1) NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `sia` enum('sakit','izin','alpa','hadir') NOT NULL DEFAULT 'hadir'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `d_kehadiran`
--

INSERT INTO `d_kehadiran` (`tgl`, `b_jadwal_id`, `b_user_pengabsen_id`, `e_kajian_id`, `e_kegiatan_id`, `b_user_id`, `jam_masuk`, `jam_pulang`, `jam_lembur_masuk`, `jam_lembur_pulang`, `is_kesiangan`, `catatan`, `sia`) VALUES
('2020-06-13', 0, 2, 0, 0, 2, '12:42:32', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-06-14', 0, 2, 0, 0, 2, '12:42:32', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-07-12', 0, 10, 0, 0, 2, '16:19:52', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-07-14', 0, 10, 0, 0, 2, '16:19:52', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-10-16', 0, 2, 0, 0, 2, '13:33:09', '00:00:00', '00:00:00', '00:00:00', 0, '', 'izin'),
('2020-10-16', 0, 2, 0, 0, 3, '13:32:06', '00:00:00', '00:00:00', '00:00:00', 0, '', 'sakit'),
('2020-10-16', 0, 2, 0, 0, 4, '13:32:01', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-10-16', 0, 2, 0, 0, 5, '10:38:10', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-10-16', 0, 2, 0, 0, 6, '10:38:40', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-10-16', 0, 2, 0, 0, 7, '10:38:34', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-10-16', 0, 2, 0, 0, 8, '13:33:29', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-10-16', 0, 2, 0, 0, 9, '13:33:37', '00:00:00', '00:00:00', '00:00:00', 0, '', 'izin'),
('2020-10-16', 0, 2, 0, 0, 10, '10:38:30', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-10-24', 0, 2, 0, 0, 2, '14:21:04', '00:00:00', '00:00:00', '00:00:00', 0, '', 'sakit'),
('2020-11-04', 0, 2, 0, 0, 2, '16:08:00', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-11-04', 0, 2, 0, 0, 3, '16:08:09', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-11-04', 0, 2, 0, 0, 6, '16:17:47', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-11-18', 0, 2, 0, 0, 3, '18:23:39', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-11-18', 0, 2, 0, 0, 4, '18:23:47', '00:00:00', '00:00:00', '00:00:00', 0, '', 'sakit'),
('2020-11-18', 0, 2, 0, 0, 5, '18:25:22', '00:00:00', '00:00:00', '00:00:00', 0, '', 'izin'),
('2020-11-18', 0, 2, 0, 0, 7, '18:24:28', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2020-11-18', 0, 2, 0, 0, 9, '18:23:41', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-16', 0, 2, 12, 0, 2, '18:39:57', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-16', 0, 2, 12, 0, 3, '18:33:28', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-16', 0, 2, 9, 0, 4, '18:40:59', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-16', 0, 2, 9, 0, 5, '21:02:19', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-16', 0, 2, 12, 0, 6, '18:39:49', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-16', 0, 2, 9, 0, 7, '21:02:10', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-16', 0, 2, 12, 0, 8, '18:33:22', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-16', 0, 2, 9, 0, 9, '18:43:12', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-16', 0, 2, 9, 0, 10, '21:02:18', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-17', 0, 2, 12, 0, 2, '13:46:20', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-17', 0, 2, 10, 0, 3, '18:54:16', '00:00:00', '00:00:00', '00:00:00', 0, '', 'alpa'),
('2021-09-17', 0, 2, 0, 2, 4, '17:33:12', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-17', 0, 2, 10, 0, 5, '18:54:47', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-17', 0, 2, 9, 0, 6, '18:25:04', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-17', 0, 2, 12, 0, 7, '17:22:05', '00:00:00', '00:00:00', '00:00:00', 0, '', 'izin'),
('2021-09-17', 0, 2, 12, 0, 8, '20:27:57', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-17', 0, 2, 9, 0, 9, '17:03:05', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-17', 0, 2, 12, 0, 10, '20:29:06', '00:00:00', '00:00:00', '00:00:00', 0, '', 'sakit'),
('2021-09-21', 0, 2, 0, 4, 5, '08:13:19', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-21', 0, 2, 0, 4, 7, '08:11:34', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-22', 0, 2, 0, 3, 2, '22:29:46', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-22', 0, 2, 9, 0, 2, '22:29:24', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-22', 0, 2, 0, 3, 3, '22:29:44', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-22', 0, 2, 9, 0, 3, '22:29:34', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-22', 0, 2, 11, 0, 7, '20:37:59', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-22', 0, 2, 12, 0, 7, '20:37:53', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-23', 0, 2, 10, 0, 2, '12:46:23', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-23', 0, 2, 10, 0, 3, '19:25:14', '00:00:00', '00:00:00', '00:00:00', 0, '', 'izin'),
('2021-09-23', 0, 2, 10, 0, 7, '09:46:04', '00:00:00', '00:00:00', '00:00:00', 0, '', 'izin'),
('2021-09-23', 0, 2, 10, 0, 8, '19:25:50', '00:00:00', '00:00:00', '00:00:00', 0, '', 'izin'),
('2021-09-23', 0, 2, 10, 0, 10, '12:46:18', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-24', 0, 2, 12, 0, 2, '22:58:03', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-24', 0, 2, 12, 0, 11, '22:57:46', '00:00:00', '00:00:00', '00:00:00', 0, '', 'alpa'),
('2021-09-25', 0, 2, 14, 0, 2, '13:31:40', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-25', 0, 2, 14, 0, 3, '13:31:29', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-26', 0, 2, 14, 0, 2, '16:46:23', '00:00:00', '00:00:00', '00:00:00', 0, 'ginjal', 'sakit'),
('2021-09-26', 0, 2, 14, 0, 8, '16:24:19', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-26', 0, 2, 14, 0, 9, '16:43:08', '00:00:00', '00:00:00', '00:00:00', 0, 'membuat proposal.\nuntuk gurunda', 'izin'),
('2021-09-26', 0, 12, 14, 0, 12, '17:07:33', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-27', 0, 2, 15, 0, 2, '19:55:07', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-27', 0, 2, 15, 0, 5, '19:54:06', '00:00:00', '00:00:00', '00:00:00', 0, 'mata', 'sakit'),
('2021-09-27', 0, 2, 15, 0, 8, '19:53:18', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-29', 0, 12, 11, 0, 2, '13:40:04', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-29', 0, 2, 11, 0, 5, '13:19:56', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-29', 0, 12, 11, 0, 7, '14:51:28', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-29', 0, 2, 11, 0, 9, '14:54:26', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-29', 0, 12, 11, 0, 10, '14:51:25', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-29', 0, 15, 11, 0, 11, '22:48:01', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-29', 0, 15, 11, 0, 12, '22:44:34', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-29', 0, 15, 11, 0, 13, '22:44:36', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-30', 0, 12, 10, 0, 2, '15:37:19', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-30', 0, 2, 11, 0, 2, '16:12:39', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-30', 0, 2, 10, 0, 11, '16:12:50', '00:00:00', '00:00:00', '00:00:00', 0, '', 'alpa'),
('2021-09-30', 0, 12, 10, 0, 12, '16:13:52', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-09-30', 0, 2, 10, 0, 13, '16:13:10', '00:00:00', '00:00:00', '00:00:00', 0, 'kerja', 'izin'),
('2021-09-30', 0, 2, 10, 0, 15, '16:13:15', '00:00:00', '00:00:00', '00:00:00', 0, '', 'alpa'),
('2021-10-04', 0, 2, 15, 0, 2, '04:58:11', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-10-04', 0, 2, 15, 0, 7, '04:55:59', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-10-04', 0, 2, 15, 0, 9, '04:56:30', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-10-04', 0, 2, 15, 0, 10, '04:56:46', '00:00:00', '00:00:00', '00:00:00', 0, 'hhg', 'izin'),
('2021-10-04', 0, 2, 15, 0, 11, '06:52:56', '00:00:00', '00:00:00', '00:00:00', 0, '', 'alpa'),
('2021-10-04', 0, 2, 15, 0, 12, '04:56:52', '00:00:00', '00:00:00', '00:00:00', 0, 'hfff', 'sakit'),
('2021-10-04', 0, 2, 15, 0, 14, '04:56:39', '00:00:00', '00:00:00', '00:00:00', 0, '', 'alpa'),
('2021-10-07', 0, 2, 10, 0, 2, '19:30:54', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-10-07', 0, 2, 10, 0, 8, '19:30:51', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir'),
('2021-10-07', 0, 2, 10, 0, 10, '19:30:59', '00:00:00', '00:00:00', '00:00:00', 0, '', 'hadir');

-- --------------------------------------------------------

--
-- Table structure for table `d_order`
--

CREATE TABLE `d_order` (
  `nation_code` int(5) NOT NULL COMMENT 'PK',
  `id` int(13) NOT NULL,
  `b_user_id` int(11) DEFAULT NULL COMMENT 'b_user_id for buyer',
  `invoice_code` varchar(64) NOT NULL COMMENT 'Invoice Code',
  `cdate` datetime NOT NULL,
  `ldate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `item_total` int(4) NOT NULL,
  `sub_total` decimal(18,2) NOT NULL,
  `ongkir_total` decimal(8,2) NOT NULL,
  `grand_total` decimal(20,2) NOT NULL,
  `payment_gateway` varchar(25) NOT NULL DEFAULT 'Unpaid',
  `payment_method` varchar(25) NOT NULL,
  `payment_status` enum('pending','paid','void','failed') NOT NULL DEFAULT 'pending',
  `payment_date` datetime DEFAULT NULL,
  `payment_tranid` varchar(128) NOT NULL,
  `payment_response` text NOT NULL,
  `payment_confirmed` int(1) NOT NULL DEFAULT 0,
  `payment_notif_count` int(1) NOT NULL DEFAULT 0,
  `order_status` enum('waiting_for_payment','payment_verification','forward_to_seller','completed','cancelled','pending') NOT NULL DEFAULT 'pending' COMMENT 'Order status\\n1. Waiting for payment\\nForward to seller\\nSeller Process\\nDelivery Process'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabel cart n order';

-- --------------------------------------------------------

--
-- Table structure for table `d_order_alamat`
--

CREATE TABLE `d_order_alamat` (
  `nation_code` int(5) NOT NULL,
  `d_order_id` int(13) NOT NULL COMMENT 'order ID d_order.id',
  `b_user_id` int(11) NOT NULL COMMENT 'buyer ID from b_user.id',
  `b_user_alamat_id` int(5) NOT NULL,
  `address_status` varchar(2) CHARACTER SET utf8 NOT NULL,
  `judul` varchar(32) CHARACTER SET utf8 NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 NOT NULL,
  `telp` varchar(24) CHARACTER SET utf8 NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8 NOT NULL,
  `alamat2` varchar(255) CHARACTER SET utf8 NOT NULL,
  `kelurahan` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kabkota` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `negara` varchar(78) NOT NULL,
  `kodepos` varchar(8) NOT NULL,
  `latitude` decimal(16,13) DEFAULT NULL,
  `longitude` decimal(16,13) DEFAULT NULL,
  `address_notes` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `d_order_detail`
--

CREATE TABLE `d_order_detail` (
  `nation_code` int(5) NOT NULL,
  `d_order_id` int(13) NOT NULL COMMENT 'ID from d_order table',
  `b_user_id` int(11) NOT NULL COMMENT 'b_user_id for seller',
  `b_user_alamat_id` int(5) NOT NULL COMMENT 'Pickup location from b_user_alamat',
  `shipment_service` varchar(40) NOT NULL,
  `id` int(3) NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 NOT NULL,
  `foto` varchar(255) NOT NULL DEFAULT 'media/produk/default.png',
  `thumb` varchar(255) NOT NULL DEFAULT 'media/produk/default.png',
  `total_item` int(3) NOT NULL DEFAULT 0,
  `total_qty` int(5) NOT NULL,
  `total_berat` decimal(8,2) NOT NULL,
  `total_panjang` decimal(5,2) NOT NULL,
  `total_lebar` decimal(5,2) NOT NULL,
  `total_tinggi` decimal(5,2) NOT NULL,
  `forward_to_seller_date` datetime DEFAULT NULL,
  `seller_status` enum('unconfirmed','confirmed','rejected') NOT NULL DEFAULT 'unconfirmed' COMMENT 'Seller Status',
  `date_begin` datetime DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  `date_duration` int(10) NOT NULL,
  `shipment_type` varchar(24) NOT NULL,
  `shipment_vehicle` varchar(48) NOT NULL,
  `shipment_cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `shipment_cost_add` decimal(8,2) NOT NULL DEFAULT 0.00,
  `shipment_cost_sub` decimal(8,2) NOT NULL COMMENT 'substract shipment cost by free shipping cost',
  `shipment_tranid` varchar(128) NOT NULL,
  `shipment_status` enum('pending','process','delivered','rejected','cancelled','succeed') NOT NULL DEFAULT 'pending',
  `shipment_response` text NOT NULL,
  `shipment_confirmed` int(1) NOT NULL DEFAULT 0,
  `shipment_distance` int(6) NOT NULL,
  `pickup_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `buyer_confirmed` enum('unconfirmed','partially','confirmed') NOT NULL DEFAULT 'unconfirmed',
  `settlement_status` enum('unconfirmed','processing','completed') NOT NULL DEFAULT 'unconfirmed',
  `sub_total` decimal(18,2) NOT NULL COMMENT 'before shipping cost',
  `grand_total` decimal(20,2) NOT NULL COMMENT 'after shipping cost',
  `pg_fee` decimal(10,2) NOT NULL COMMENT 'Payment Gateway Administration Fee',
  `pg_vat` decimal(5,2) NOT NULL,
  `profit_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `cancel_fee` decimal(15,2) NOT NULL COMMENT 'Refund Fee for seller',
  `selling_fee` decimal(15,2) NOT NULL DEFAULT 0.00,
  `selling_fee_percent` decimal(5,2) NOT NULL DEFAULT 10.00,
  `earning_total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `earning_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `refund_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `banktrf_cost` decimal(9,2) NOT NULL DEFAULT 0.00 COMMENT 'bank Transfer Cost',
  `is_wb_download` int(1) NOT NULL DEFAULT 0 COMMENT 'Identifier for waybill has been downloaded or not',
  `is_expired` int(1) NOT NULL DEFAULT 0,
  `is_calculated` int(1) NOT NULL DEFAULT 0,
  `is_rejected_all` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `d_order_detail_item`
--

CREATE TABLE `d_order_detail_item` (
  `nation_code` int(5) NOT NULL,
  `d_order_id` int(13) NOT NULL,
  `d_order_detail_id` int(3) NOT NULL COMMENT 'ID from d_order_detail table',
  `c_produk_id` int(11) NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8 NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8 NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `deskripsi` text CHARACTER SET utf8 NOT NULL,
  `harga_jual` decimal(15,2) NOT NULL,
  `qty` int(3) NOT NULL,
  `satuan` varchar(24) NOT NULL DEFAULT 'Pcs' COMMENT 'Units',
  `berat` decimal(6,2) NOT NULL,
  `panjang` decimal(5,2) NOT NULL,
  `lebar` decimal(5,2) NOT NULL,
  `tinggi` decimal(5,2) NOT NULL,
  `shipment_vehicle` varchar(24) NOT NULL DEFAULT 'Regular',
  `shipment_service` varchar(48) NOT NULL,
  `shipment_type` varchar(48) NOT NULL,
  `buyer_status` enum('wait','accepted','rejected') NOT NULL DEFAULT 'wait',
  `settlement_status` enum('wait','refund_to_buyer','complain','solved_to_buyer','solved_to_seller','paid_to_buyer','paid_to_seller') NOT NULL DEFAULT 'wait',
  `is_fashion` int(1) NOT NULL DEFAULT 0,
  `is_include_delivery_cost` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `d_order_proses`
--

CREATE TABLE `d_order_proses` (
  `nation_code` int(5) NOT NULL,
  `d_order_id` int(13) NOT NULL,
  `c_produk_id` int(11) NOT NULL,
  `id` int(3) NOT NULL,
  `nama` varchar(48) CHARACTER SET utf8 NOT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cdate` datetime DEFAULT NULL,
  `initiator` varchar(24) NOT NULL DEFAULT 'system',
  `is_done` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `d_pemberitahuan`
--

CREATE TABLE `d_pemberitahuan` (
  `nation_code` int(5) NOT NULL,
  `b_user_id` int(11) NOT NULL,
  `id` int(6) NOT NULL,
  `type` varchar(48) NOT NULL DEFAULT 'notification_default',
  `judul` varchar(255) CHARACTER SET utf8 NOT NULL,
  `teks` text CHARACTER SET utf8 NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `cdate` datetime NOT NULL,
  `extras` text DEFAULT NULL,
  `is_read` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='user notification table history';

-- --------------------------------------------------------

--
-- Table structure for table `d_quran_daily`
--

CREATE TABLE `d_quran_daily` (
  `id` int(11) NOT NULL,
  `judul` varchar(256) NOT NULL DEFAULT '',
  `no_surat` int(5) DEFAULT NULL,
  `nama_surat` varchar(56) DEFAULT '',
  `no_ayat` int(5) DEFAULT NULL,
  `is_pick` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `d_quran_daily`
--

INSERT INTO `d_quran_daily` (`id`, `judul`, `no_surat`, `nama_surat`, `no_ayat`, `is_pick`) VALUES
(1, 'Perintah Untuk Produktif', 94, 'Al-Insyirah', 7, 0),
(2, ' Tempat Meminta Sesuatu ', 112, 'Al-Ikhlas', 2, 0),
(4, 'Ingin Dunia? الله Akan Berikan', 11, 'Hud', 15, 0),
(5, 'Memberikan Ilmu Kepada Yang Bertaqwa', 2, 'Al Baqarah', 282, 0),
(6, 'Berpikir Dengan HATI', 7, 'Al-araf', 179, 1);

-- --------------------------------------------------------

--
-- Table structure for table `d_slider`
--

CREATE TABLE `d_slider` (
  `id` int(11) NOT NULL,
  `jenis` enum('web','mobile') NOT NULL DEFAULT 'web',
  `utype` enum('internal','external') NOT NULL DEFAULT 'internal',
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `priority` int(2) NOT NULL DEFAULT 0 COMMENT '0= urutan atas, 99=bawah',
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='slider promo untuk web dan mobile';

--
-- Dumping data for table `d_slider`
--

INSERT INTO `d_slider` (`id`, `jenis`, `utype`, `image`, `title`, `caption`, `url`, `priority`, `is_active`) VALUES
(8, 'web', 'internal', 'media/sliders/2019/06/8.jpg', 'Menjadi Orang Cerdas', 'menjadi orang cerdas ala Rasulullah', 'blog/menjadi-orang-cerdas', 1, 0),
(9, 'web', 'internal', 'media/sliders/2019/07/9.jpg', 'Istiqomah', 'Salah satu kenikmatan yang Allah ta‘la berikan kepada kita adalah al-istiqomah, di dalam kehidupan manusia, Allah telah menetapkan jalan yang harus ditempuh oleh manusia melalui syariat-Nya sehingga seseorang senantiasa Istiqomah dan tegak di atas syariat', 'blog/istiqomah', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `d_test`
--

CREATE TABLE `d_test` (
  `id` int(11) NOT NULL,
  `d_kategori_id` int(11) DEFAULT NULL,
  `b_user_id` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `jumlah_soal` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL DEFAULT '',
  `poin` int(11) NOT NULL DEFAULT 0,
  `is_show_result` int(1) NOT NULL DEFAULT 1,
  `cdate` datetime NOT NULL,
  `count_done` int(11) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `d_test`
--

INSERT INTO `d_test` (`id`, `d_kategori_id`, `b_user_id`, `deskripsi`, `jumlah_soal`, `nama`, `poin`, `is_show_result`, `cdate`, `count_done`, `is_active`) VALUES
(3, 6, 2, '', 2, 'Hadits Arbain Sesi 1', 100, 1, '2023-07-25 12:34:12', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `d_testimonial`
--

CREATE TABLE `d_testimonial` (
  `id` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `perusahaan` varchar(255) NOT NULL,
  `testimonial` varchar(255) NOT NULL,
  `rating` int(1) NOT NULL DEFAULT 5,
  `featured_image` varchar(255) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `d_testimonial`
--

INSERT INTO `d_testimonial` (`id`, `cdate`, `nama`, `jabatan`, `perusahaan`, `testimonial`, `rating`, `featured_image`, `is_active`) VALUES
(1, '0000-00-00 00:00:00', 'Reza Maulana', 'CEO', 'The Cloud Alert', 'I have been using it for a number of years. I use Colorlib for usability testing. It\'s great for taking images and making clickable image prototypes that do the job and save me the coding time and just the general', 3, '', 1),
(2, '0000-00-00 00:00:00', 'Yugie Nugraha', 'Evanglist', 'Microsoft Corp', 'Hello World', 2, '', 1),
(3, '0000-00-00 00:00:00', 'Andi Insanudin', 'CTO', 'Caterpillar Dev', 'Wololo', 4, '', 1),
(4, '0000-00-00 00:00:00', 'Bagja Gumelar', 'Founder', 'Be Hair Cut', 'Hoahoahoahoahoaha', 1, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `d_wishlist`
--

CREATE TABLE `d_wishlist` (
  `nation_code` int(5) NOT NULL,
  `c_produk_id` int(11) NOT NULL,
  `b_user_id` int(11) NOT NULL,
  `id` int(16) NOT NULL,
  `cdate` date DEFAULT NULL COMMENT 'created date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='product wishlisted per user';

-- --------------------------------------------------------

--
-- Table structure for table `e_kajian`
--

CREATE TABLE `e_kajian` (
  `id` int(11) NOT NULL,
  `a_pengguna_id` int(4) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `mauthor` varchar(76) NOT NULL,
  `mtitle` varchar(160) NOT NULL,
  `mkeyword` varchar(78) NOT NULL,
  `mdescription` varchar(255) NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `cdate` datetime NOT NULL,
  `sdate` datetime NOT NULL,
  `edate` datetime NOT NULL,
  `narasumber` varchar(255) NOT NULL,
  `gmaps_link` varchar(255) NOT NULL,
  `gmaps_lat` decimal(14,11) NOT NULL,
  `gmaps_long` decimal(14,11) NOT NULL,
  `negara` varchar(24) NOT NULL,
  `provinsi` varchar(78) NOT NULL,
  `kabkota` varchar(128) NOT NULL,
  `kecamatan` varchar(128) NOT NULL,
  `kelurahan` varchar(78) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kodepos` varchar(8) NOT NULL,
  `telp` varchar(24) NOT NULL,
  `deskripsi` text NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `is_special` int(1) NOT NULL DEFAULT 0,
  `is_expired` int(1) NOT NULL DEFAULT 0,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_kajian`
--

INSERT INTO `e_kajian` (`id`, `a_pengguna_id`, `judul`, `slug`, `mauthor`, `mtitle`, `mkeyword`, `mdescription`, `tempat`, `cdate`, `sdate`, `edate`, `narasumber`, `gmaps_link`, `gmaps_lat`, `gmaps_long`, `negara`, `provinsi`, `kabkota`, `kecamatan`, `kelurahan`, `alamat`, `kodepos`, `telp`, `deskripsi`, `featured_image`, `is_special`, `is_expired`, `is_active`) VALUES
(9, 1, 'Kajian Tauhid - Syarah Kitab Ushul Tsalatsah', 'kajian-tauhid-syarah-kitab-ushul-tsalatsah', 'S-Admin1', 'Kajian Tauhid - Syarah Kitab Ushul Tsalatsah', 'tauhid', 'Kajian Majelis Ta\'lim Syubbaanul \'uluum Bandung Selatan - Kajian Tauhid membahas Kitab Ushul Tsalatsah Syarah Syaikh Muhammad Bin Utsaimin', 'Masjid Mujahidin', '2023-01-25 11:18:12', '2020-08-28 19:30:00', '2020-08-28 21:30:00', 'Ustadz Ruslan Gunawan Hafidzahullah', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d126721.68823002475!2d107.4773939!3d-7.0030704!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e68ec3e3d33e48d%3A0x5f060bede0438bd8!2sMasjid%20Mujahidin!5e0!3m2!1sen!2sid!4v1669212504231!5m2!1sen!2sid', '-7.02147115388', '107.54880503013', 'Indonesia', 'Jawa Barat', 'Kab. Bandung', 'Katapang', 'Desa Gandasari', 'Jl. Gandasari No 143', '40218', '', '<p>Kajian Majelis Ta&#39;lim Syubbaanul &#39;uluum Bandung Selatan - Kajian Tauhid membahas Kitab Ushul Tsalatsah Syarah Syaikh Muhammad Bin Utsaimin</p>\r\n', 'media/upload/2022/11/madrosah-sunnah.jpg', 0, 0, 1),
(11, 1, 'Kajian Hadits - Hadits Arba\'in', 'kajian-hadits-hadits-arba-in', 'S-Admin1', 'Kajian Hadits - Hadits Arba\'in', 'hadits arbain', 'Kajian Majelis Ta\'lim Syubbaanul \'uluum Bandung Selatan - Kajian Hadits membahas Syarah Kitab Arba\'in An-Nawawi', 'Masjid Mujahidin', '2023-01-25 11:19:08', '2022-11-26 18:30:00', '2022-11-26 19:30:00', 'Ustadz Ruslan Gunawan Hafidzahullah', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d126721.68823002475!2d107.4773939!3d-7.0030704!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e68ec3e3d33e48d%3A0x5f060bede0438bd8!2sMasjid%20Mujahidin!5e0!3m2!1sen!2sid!4v1669212504231!5m2!1sen!2sid', '-7.02249339666', '107.55017832109', 'Indonesia', 'Jawa Barat', 'Kab. Bandung', 'Soreang', 'Desa Katapang', 'Jl. Gandasari No 143', '40218', '', '<p>Kajian Majelis Ta&#39;lim Syubbaanul &#39;uluum Bandung Selatan - Kajian Hadits membahas Syarah Kitab Arba&#39;in An-Nawawi</p>\r\n', 'media/upload/2022/11/madrosah-sunnah.jpg', 0, 0, 1),
(12, 1, 'Tahsin', 'tahsin', 'S-Admin1', '', '', '', 'Masjid Mujahidin', '2023-04-03 16:03:20', '2023-03-07 19:00:00', '2023-03-07 20:00:00', 'Kang Fakhri Mochamad Salman', '', '-6.96644430000', '107.55165390000', 'Indonesia', 'Jawa Barat', 'Kab. Bandung', 'Soreang', 'Desa Katapang', 'Jl. Gandasari No 143', '40218', '', '', 'media/upload/2022/01/the-dancing-rain-tfwqxqvb7r8-unsplash-(1).jpg', 0, 0, 1),
(13, 1, 'Kajian Akhwat', 'kajian-akhwat', 'S-Admin1', '', '', '', 'Masjid Al-Ma\'arif', '2023-04-03 16:03:41', '2023-04-02 09:00:00', '2023-04-02 12:00:00', 'Ustadz Ruslan Gunawan Hafidzahullah & Muridnya', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3959.8221157821554!2d107.54219711455964!3d-7.030183994922038!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e68ec39345e83a9%3A0x946152da4c0df601!2sMasjid%20Al-Ma\'arif!5e0!3m2!1sen!2sid!4v', '-6.96644430000', '107.55165390000', 'Indonesia', 'Jawa Barat', 'Kab. Bandung', 'Soreang', 'Desa Cingcin', 'Desa Cingcin, Soreang, Bandung Regency, West Java 40921', '40218', '', '', 'media/upload/2022/11/madrosah-sunnah.jpg', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `e_kegiatan`
--

CREATE TABLE `e_kegiatan` (
  `id` int(11) NOT NULL,
  `a_pengguna_id` int(4) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `mauthor` varchar(76) NOT NULL,
  `mtitle` varchar(160) NOT NULL,
  `mkeyword` varchar(78) NOT NULL,
  `mdescription` varchar(255) NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `cdate` datetime NOT NULL,
  `sdate` datetime NOT NULL,
  `edate` datetime NOT NULL,
  `narasumber` varchar(128) NOT NULL,
  `gmaps_link` varchar(255) NOT NULL,
  `gmaps_lat` decimal(14,11) NOT NULL,
  `gmaps_long` decimal(14,11) NOT NULL,
  `negara` varchar(24) NOT NULL,
  `provinsi` varchar(78) NOT NULL,
  `kabkota` varchar(128) NOT NULL,
  `kecamatan` varchar(128) NOT NULL,
  `kelurahan` varchar(78) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kodepos` varchar(8) NOT NULL,
  `telp` varchar(24) NOT NULL,
  `deskripsi` text NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `is_expired` int(1) NOT NULL DEFAULT 0,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_kegiatan`
--

INSERT INTO `e_kegiatan` (`id`, `a_pengguna_id`, `judul`, `slug`, `mauthor`, `mtitle`, `mkeyword`, `mdescription`, `tempat`, `cdate`, `sdate`, `edate`, `narasumber`, `gmaps_link`, `gmaps_lat`, `gmaps_long`, `negara`, `provinsi`, `kabkota`, `kecamatan`, `kelurahan`, `alamat`, `kodepos`, `telp`, `deskripsi`, `featured_image`, `is_expired`, `is_active`) VALUES
(1, 1, 'MABIT - Malam Bina Iman dan Taqwa', 'mabit-malam-bina-iman-dan-taqwa', 'S-Admin1', 'MABIT - Malam Bina Iman dan Taqwa', 'mabit, taqwa, malam, santri, syudais media', 'Majelis Ta&#39;lim Syubbaanul &#39;Uluum mengadakan Malam Bina Iman Dan Taqwa (MABIT) 1444 H bertepatan dipenghujung Tahun 2022. Mabit ini dilakukan dalam rangka mereka', 'Pasir Karamat', '2023-01-06 13:22:16', '2022-12-31 15:00:30', '2023-01-01 09:00:00', 'Ustadz Ruslan Gunawan Hafidzahullah', '', '-6.96644430000', '107.55165390000', 'Indonesia', 'Jawa Barat', 'Kab. Bandung', 'Soreang', 'Desa', 'Kp. Pasir Karamat', '40218', '', '<p>Majelis Ta&#39;lim Syubbaanul &#39;Uluum mengadakan Malam Bina Iman Dan Taqwa (MABIT) 1444 H bertepatan dipenghujung Tahun 2022. Mabit ini dilakukan dalam rangka merekatkan kembali tali persaudaraan antar santri serta berupaya meningkatkan keimanan dan ketaqwaan dimana orang-orang banyak melakukan kelalaian pada malam tersebut.</p>\r\n', 'media/upload/default.png', 0, 1),
(2, 1, 'Touring Kebersamaan', 'touring-kebersamaan', 'S-Admin1', 'Touring Kebersamaan', 'Touring, rihlah, cipatujah, tasikmalaya, pantai', 'Alhamdulillah,&#13;&#10;&#13;&#10;Allah Subhanahu Wata&#39;ala memberikan kesempatan untuk mengadakan program rutin, yaitu Touring Kebersamaan 15-16 Syawwal 1444H bersama Ustadz Rusl', 'Pantai Cipatujah', '2023-05-09 18:27:34', '2023-05-06 04:30:00', '2023-05-07 12:00:00', 'Ustadz Ruslan Gunawan Hafidzahullah', '', '-6.96644430000', '107.55165390000', 'Indonesia', 'Jawa Barat', 'Tasikmalaya', 'Karangnunggal', 'Cidadap', 'Kp. Citoe ', '40218', '', '<p>Alhamdulillah,</p>\r\n\r\n<p>Allah Subhanahu Wata&#39;ala memberikan kesempatan untuk mengadakan program rutin, yaitu Touring Kebersamaan 15-16 Syawwal 1444H bersama Ustadz Ruslan Gunawan Hafidzahullah dalam rangka melanjutkan kesemangatan Ramadhan dalam menghambakan diri kepada Allah Jalla jalaaluhu</p>\r\n', 'media/upload/default.png', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `e_kegiatan_galeri`
--

CREATE TABLE `e_kegiatan_galeri` (
  `id` int(11) NOT NULL,
  `e_kegiatan_id` int(11) NOT NULL,
  `judul` varchar(56) NOT NULL,
  `sdate` datetime NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `urutan` int(3) NOT NULL DEFAULT 0,
  `is_active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `e_kegiatan_galeri`
--

INSERT INTO `e_kegiatan_galeri` (`id`, `e_kegiatan_id`, `judul`, `sdate`, `isi`, `gambar`, `urutan`, `is_active`) VALUES
(1, 1, 'Sesi Ta\'aruf Para Santri', '2022-12-31 00:00:00', 'Pengenalan antar santri lebih dalam terkait kehidupan dan keseharian masing-masing agar santri lebih memahami satu sama lain dan bisa memunculkan kepedulian ', 'media/galeri/2023/01/62-1-0.jpg', 0, 1),
(2, 1, 'Kajian Santri : Hakikat Ilmu', '2022-12-31 00:00:00', 'Santri mereview dan memutholaah seputar hakikat ilmu dan bagaimana memposisikan ilmu di hati masing-masing santri. Metode yang dilakukan berupa \"al ashilah wal ajwibah\" atau tanya jawab', 'media/galeri/2023/01/62-1-1.jpg', 1, 1),
(3, 1, 'Kajian Santri : Santri yang Ideal', '2022-12-31 00:00:00', 'Sesi ini membahas bagaimana menjadi seorang penuntut ilmu yang baik dengan mengupas tuntas ciri-cirinya', 'media/galeri/2023/01/62-1-2.jpg', 2, 1),
(4, 1, 'Ngaliwet', '2022-12-31 00:00:00', 'Makan bersama dengan penuh kehangatan di malam yang dingin', 'media/galeri/2023/01/62-1-3.jpg', 3, 1),
(5, 1, 'Selayang Pandang', '2022-12-31 00:00:00', 'Para santri melihat kilas balik perjalanan Majelis Syubbaanul \'uluum melalui tayangan slide show yang menyajikan program-program dari tahun ke tahun', 'media/galeri/2023/01/62-5-1.jpg', 4, 1),
(6, 1, 'Kajian Inti : Menjadi Hamba yang Penuh dengan Keyakinan', '2022-12-31 00:00:00', 'Kajian bersama Guru dan Pembina Majelis Syubbaanul \'Uluum terkait para pemuda yang orientasi hidupnya harus diikat dengan ilmu dan dicerminkan oleh keyakinan.', 'media/galeri/2023/01/62-1-5.jpg', 5, 1),
(7, 1, 'Share N Care', '2023-01-01 00:00:00', 'Sesi terakhir, semua berkumpul untuk sharing berbagai kenikmatan yang didapatkan ketika berada di majelis ilmu, sembari memuhasabah diri dengan apa yang telah dilakukan untuk membalas kenikmatan yang Allah Ta\'ala berikan', 'media/galeri/2023/01/62-1-6.jpg', 6, 1),
(8, 2, 'Pemberangkatan', '2023-05-06 00:00:00', '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `e_komen`
--

CREATE TABLE `e_komen` (
  `id` int(11) NOT NULL,
  `d_blog_diskusi_id` int(11) NOT NULL,
  `b_user_pengirim_id` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `komen` varchar(255) NOT NULL,
  `gambar` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_komen`
--

INSERT INTO `e_komen` (`id`, `d_blog_diskusi_id`, `b_user_pengirim_id`, `cdate`, `komen`, `gambar`) VALUES
(5, 5, 1, '2020-03-22 15:04:40', 'Tolong penulisannya dibenerin ya akhi', 'media/blog/2020/03/5-1.jpg'),
(6, 5, 2, '2020-03-22 15:10:58', 'siap akhi', ''),
(7, 5, 2, '2020-03-22 15:11:21', 'siap akhi', ''),
(8, 5, 2, '2020-03-22 15:11:33', 'siap akhi', ''),
(9, 5, 2, '2020-03-22 16:30:30', 'siap akhi', ''),
(10, 5, 2, '2020-05-23 11:18:37', 'siap akhi', 'media/blog/2020/05/5-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `e_soal`
--

CREATE TABLE `e_soal` (
  `id` int(11) NOT NULL,
  `d_test_id` int(11) DEFAULT NULL,
  `pertanyaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pg_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pg_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pg_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pg_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `jawaban_benar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `e_soal`
--

INSERT INTO `e_soal` (`id`, `d_test_id`, `pertanyaan`, `pg_1`, `pg_2`, `pg_3`, `pg_4`, `jawaban_benar`, `gambar`) VALUES
(8, 3, 'Siapa perawi pertama hadits pertama?', 'Abu Bakar Asshiddiq', 'Umar Bin Khattan', 'Utsman Bin Affan', 'Ali Bin Abi Thalib', 'Umar Bin Khattan', ''),
(9, 3, 'Apa yang diajarkan Rasul ? kepada Ibnu Abbas?', 'احْفَظِ اللهَ يَحفَظْكَ، احْفَظِ اللهَ تَجِدْهُ تُجَاهَكَ،', 'إِنَّ اللهَ كَتَبَ الإِحْسَانَ عَلَى كُلِّ شَيءٍ', ' إِذا لَم تَستَحْيِ فاصْنَعْ مَا شِئْتَ', 'الدِّيْنُ النَّصِيْحَةُ', 'احْفَظِ اللهَ يَحفَظْكَ، احْفَظِ اللهَ تَجِدْهُ تُجَاهَكَ،', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a_company`
--
ALTER TABLE `a_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a_company_id` (`a_company_id`),
  ADD KEY `kode` (`kode`);

--
-- Indexes for table `a_config`
--
ALTER TABLE `a_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_grup`
--
ALTER TABLE `a_grup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `a_jabatan`
--
ALTER TABLE `a_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_media`
--
ALTER TABLE `a_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `b_user_id` (`b_user_id`);

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
  ADD KEY `nip` (`nip`),
  ADD KEY `a_pengguna_id` (`a_pengguna_id`);

--
-- Indexes for table `a_pengguna_module`
--
ALTER TABLE `a_pengguna_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fka_pengguna_id` (`a_pengguna_id`),
  ADD KEY `fka_modules_identifier` (`a_modules_identifier`);

--
-- Indexes for table `a_program`
--
ALTER TABLE `a_program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_ruangan`
--
ALTER TABLE `a_ruangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`a_rs_id`) USING BTREE;

--
-- Indexes for table `a_update`
--
ALTER TABLE `a_update`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_usergroup`
--
ALTER TABLE `a_usergroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b_jadwal`
--
ALTER TABLE `b_jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b_jadwal_kegiatan`
--
ALTER TABLE `b_jadwal_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a_pengguna_id` (`a_pengguna_id`);

--
-- Indexes for table `b_menu`
--
ALTER TABLE `b_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `b_menu_id` (`b_menu_id`);

--
-- Indexes for table `b_user`
--
ALTER TABLE `b_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_b_user_unq` (`email`),
  ADD KEY `idx_api_web_token` (`api_web_token`),
  ADD KEY `api_social_id` (`api_social_id`),
  ADD KEY `fb_id` (`fb_id`),
  ADD KEY `google_id` (`google_id`),
  ADD KEY `device` (`device`),
  ADD KEY `a_jabatan_id` (`a_jabatan_id`),
  ADD KEY `a_jamkerja_id` (`a_jamkerja_id`),
  ADD KEY `username` (`kode`),
  ADD KEY `a_company_id` (`a_company_id`);

--
-- Indexes for table `b_user_alamat`
--
ALTER TABLE `b_user_alamat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_b_user_id` (`b_user_id`);

--
-- Indexes for table `b_user_module`
--
ALTER TABLE `b_user_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a_jabatan_id` (`a_jabatan_id`),
  ADD KEY `b_user_id` (`b_user_id`,`a_program_id`);

--
-- Indexes for table `b_user_test`
--
ALTER TABLE `b_user_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `b_user_id` (`b_user_id`),
  ADD KEY `d_test_id` (`d_test_id`);

--
-- Indexes for table `c_donasi`
--
ALTER TABLE `c_donasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c_donasi_gambar`
--
ALTER TABLE `c_donasi_gambar`
  ADD PRIMARY KEY (`id`,`c_donasi_Id`);

--
-- Indexes for table `c_guestbook`
--
ALTER TABLE `c_guestbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `telp` (`telp`);

--
-- Indexes for table `c_produk`
--
ALTER TABLE `c_produk`
  ADD PRIMARY KEY (`nation_code`,`id`),
  ADD KEY `b_kondisi_id` (`b_kondisi_id`),
  ADD KEY `b_lokasi_id` (`b_lokasi_id`),
  ADD KEY `b_user_id` (`b_user_id`),
  ADD KEY `b_user_alamat_id` (`b_user_alamat_id`),
  ADD KEY `b_kategori_id` (`b_kategori_id`),
  ADD KEY `b_berat_id` (`b_berat_id`);

--
-- Indexes for table `c_produk_foto`
--
ALTER TABLE `c_produk_foto`
  ADD PRIMARY KEY (`nation_code`,`c_produk_id`,`id`);

--
-- Indexes for table `d_blog`
--
ALTER TABLE `d_blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`),
  ADD KEY `b_user_id` (`a_pengguna_id`),
  ADD KEY `kategori` (`kategori`,`title`);

--
-- Indexes for table `d_blogkategori`
--
ALTER TABLE `d_blogkategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_blog_blogkategori`
--
ALTER TABLE `d_blog_blogkategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `d_blogkategori_id` (`d_blogkategori_id`),
  ADD KEY `d_blog_id` (`d_blog_id`);

--
-- Indexes for table `d_blog_diskusi`
--
ALTER TABLE `d_blog_diskusi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `b_user_id` (`b_user_id`),
  ADD KEY `d_blog_id` (`d_blog_id`),
  ADD KEY `b_user_admin_id` (`b_user_admin_id`);

--
-- Indexes for table `d_cart`
--
ALTER TABLE `d_cart`
  ADD PRIMARY KEY (`nation_code`,`b_user_id`,`c_produk_id`,`id`);

--
-- Indexes for table `d_doa`
--
ALTER TABLE `d_doa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_dzikir`
--
ALTER TABLE `d_dzikir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_kehadiran`
--
ALTER TABLE `d_kehadiran`
  ADD PRIMARY KEY (`tgl`,`b_user_id`,`e_kajian_id`,`e_kegiatan_id`) USING BTREE;

--
-- Indexes for table `d_order`
--
ALTER TABLE `d_order`
  ADD PRIMARY KEY (`nation_code`,`id`),
  ADD KEY `kode` (`invoice_code`),
  ADD KEY `payment_tranid` (`payment_tranid`),
  ADD KEY `b_user_id` (`b_user_id`);

--
-- Indexes for table `d_order_alamat`
--
ALTER TABLE `d_order_alamat`
  ADD PRIMARY KEY (`nation_code`,`d_order_id`,`b_user_id`,`b_user_alamat_id`,`address_status`);

--
-- Indexes for table `d_order_detail`
--
ALTER TABLE `d_order_detail`
  ADD PRIMARY KEY (`nation_code`,`d_order_id`,`b_user_id`,`b_user_alamat_id`,`id`) USING BTREE,
  ADD KEY `shipment_tranid` (`shipment_service`,`shipment_tranid`) USING BTREE;

--
-- Indexes for table `d_order_detail_item`
--
ALTER TABLE `d_order_detail_item`
  ADD PRIMARY KEY (`nation_code`,`d_order_id`,`d_order_detail_id`,`c_produk_id`) USING BTREE,
  ADD KEY `nama` (`nama`);

--
-- Indexes for table `d_order_proses`
--
ALTER TABLE `d_order_proses`
  ADD PRIMARY KEY (`nation_code`,`d_order_id`,`c_produk_id`,`id`) USING BTREE;

--
-- Indexes for table `d_pemberitahuan`
--
ALTER TABLE `d_pemberitahuan`
  ADD PRIMARY KEY (`nation_code`,`b_user_id`,`id`) USING BTREE;

--
-- Indexes for table `d_quran_daily`
--
ALTER TABLE `d_quran_daily`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_slider`
--
ALTER TABLE `d_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_test`
--
ALTER TABLE `d_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `d_kategori_id` (`d_kategori_id`);

--
-- Indexes for table `d_testimonial`
--
ALTER TABLE `d_testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_wishlist`
--
ALTER TABLE `d_wishlist`
  ADD PRIMARY KEY (`nation_code`,`c_produk_id`,`b_user_id`,`id`);

--
-- Indexes for table `e_kajian`
--
ALTER TABLE `e_kajian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a_pengguna_id` (`a_pengguna_id`);

--
-- Indexes for table `e_kegiatan`
--
ALTER TABLE `e_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a_pengguna_id` (`a_pengguna_id`);

--
-- Indexes for table `e_kegiatan_galeri`
--
ALTER TABLE `e_kegiatan_galeri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_kegiatan_id` (`e_kegiatan_id`);

--
-- Indexes for table `e_komen`
--
ALTER TABLE `e_komen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `e_soal`
--
ALTER TABLE `e_soal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `d_test_id` (`d_test_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a_company`
--
ALTER TABLE `a_company`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_config`
--
ALTER TABLE `a_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `a_grup`
--
ALTER TABLE `a_grup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_jabatan`
--
ALTER TABLE `a_jabatan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `a_media`
--
ALTER TABLE `a_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `a_pengguna`
--
ALTER TABLE `a_pengguna`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `a_pengguna_module`
--
ALTER TABLE `a_pengguna_module`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `a_program`
--
ALTER TABLE `a_program`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `a_ruangan`
--
ALTER TABLE `a_ruangan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `a_update`
--
ALTER TABLE `a_update`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `a_usergroup`
--
ALTER TABLE `a_usergroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b_jadwal`
--
ALTER TABLE `b_jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `b_jadwal_kegiatan`
--
ALTER TABLE `b_jadwal_kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b_menu`
--
ALTER TABLE `b_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `b_user`
--
ALTER TABLE `b_user`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `b_user_alamat`
--
ALTER TABLE `b_user_alamat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `b_user_module`
--
ALTER TABLE `b_user_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=632;

--
-- AUTO_INCREMENT for table `b_user_test`
--
ALTER TABLE `b_user_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `c_guestbook`
--
ALTER TABLE `c_guestbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `d_blog`
--
ALTER TABLE `d_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `d_blogkategori`
--
ALTER TABLE `d_blogkategori`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `d_blog_diskusi`
--
ALTER TABLE `d_blog_diskusi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `d_doa`
--
ALTER TABLE `d_doa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_dzikir`
--
ALTER TABLE `d_dzikir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_quran_daily`
--
ALTER TABLE `d_quran_daily`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `d_slider`
--
ALTER TABLE `d_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `d_test`
--
ALTER TABLE `d_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `d_testimonial`
--
ALTER TABLE `d_testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `e_kajian`
--
ALTER TABLE `e_kajian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `e_kegiatan`
--
ALTER TABLE `e_kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `e_kegiatan_galeri`
--
ALTER TABLE `e_kegiatan_galeri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `e_komen`
--
ALTER TABLE `e_komen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `e_soal`
--
ALTER TABLE `e_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

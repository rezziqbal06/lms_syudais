-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: asesmen_rs_db
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `a_indikator`
--

DROP TABLE IF EXISTS `a_indikator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_indikator` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `a_jpenilaian_id` int(5) NOT NULL,
  `a_ruangan_ids` varchar(128) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `subkategori` varchar(255) NOT NULL,
  `type` varchar(128) NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_indikator`
--

LOCK TABLES `a_indikator` WRITE;
/*!40000 ALTER TABLE `a_indikator` DISABLE KEYS */;
INSERT INTO `a_indikator` VALUES (125,2,'[\"\"]','seb-ps','','','indikator','2022-12-16 05:45:39',1,0),(126,2,'[\"\"]','Seb-asept','','','indikator','2022-12-16 05:45:39',1,0),(127,2,'[\"\"]','Set-drh.c tbh','','','indikator','2022-12-16 05:45:39',1,0),(128,2,'[\"\"]','Set-ps','','','indikator','2022-12-16 05:45:39',1,0),(129,2,'[\"\"]','Set.lkg ps','','','indikator','2022-12-16 05:45:39',1,0),(130,2,'[\"\"]','HW','','','aksi','2022-12-16 05:45:39',1,0),(131,2,'[\"\"]','HR','','','aksi','2022-12-16 05:45:39',1,0),(132,2,'[\"\"]','Tdk HH','','','aksi','2022-12-16 05:45:39',1,0),(133,2,'[\"\"]','Glove','','','aksi','2022-12-16 05:45:39',1,0),(134,3,'[\"\"]','Memandikan Pasien','','','indikator','2022-12-16 05:45:59',1,0),(135,3,'[\"\"]','Vulva/penis Hygiene','','','indikator','2022-12-16 05:45:59',1,0),(136,3,'[\"\"]','Menolong BAB','','','indikator','2022-12-16 05:45:59',1,0),(137,3,'[\"\"]','Menolong BAK','','','indikator','2022-12-16 05:45:59',1,0),(138,3,'[\"\"]','Oral Hygiene','','','indikator','2022-12-16 05:45:59',1,0),(139,3,'[\"\"]','Pengisapan lendir','','','indikator','2022-12-16 05:45:59',1,0),(140,3,'[\"\"]','Pemasangan kateter urine','','','indikator','2022-12-16 05:45:59',1,0),(141,3,'[\"\"]','Pemasangan dan pencabutan infus','','','indikator','2022-12-16 05:45:59',1,0),(142,3,'[\"\"]','Mengambil darah vena','','','indikator','2022-12-16 05:45:59',1,0),(143,3,'[\"\"]','Perawatan luka mayor','','','indikator','2022-12-16 05:45:59',1,0),(144,3,'[\"\"]','Perawatan luka minor','','','indikator','2022-12-16 05:45:59',1,0),(145,3,'[\"\"]','Perawatan luka infeksius','','','indikator','2022-12-16 05:45:59',1,0),(146,3,'[\"\"]','Pengukuran tekanan darah','','','indikator','2022-12-16 05:45:59',1,0),(147,3,'[\"\"]','Pengukuran suhu','','','indikator','2022-12-16 05:45:59',1,0),(148,3,'[\"\"]','Menyuntik','','','indikator','2022-12-16 05:45:59',1,0),(149,3,'[\"\"]','Penanganan dan pembersihan alat-alat instrumen','','','indikator','2022-12-16 05:45:59',1,0),(150,3,'[\"\"]','Penanganan limbah padat','','','indikator','2022-12-16 05:45:59',1,0),(151,3,'[\"\"]','Penanganan darah / cairan tubuh','','','indikator','2022-12-16 05:45:59',1,0),(152,3,'[\"\"]','Sarung Tangan','','','aksi','2022-12-16 05:45:59',1,0),(153,3,'[\"\"]','Masker','','','aksi','2022-12-16 05:45:59',1,0),(154,3,'[\"\"]','Gaun / Apron','','','aksi','2022-12-16 05:45:59',1,0),(155,3,'[\"\"]','Kaca mata / penutup wajah','','','aksi','2022-12-16 05:45:59',1,0),(156,3,'[\"\"]','Topi','','','aksi','2022-12-16 05:45:59',1,0),(157,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Personal hegiene baik','Personal','','indikator','2022-12-16 05:47:33',1,0),(158,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Pakaian rapih','Personal','','indikator','2022-12-16 05:47:33',1,0),(159,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Rambut bersih dan rapih','Personal','','indikator','2022-12-16 05:47:33',1,0),(160,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tidak menggunakan perhiasan tangan','Personal','','indikator','2022-12-16 05:47:33',1,0),(161,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Kuku pendek dan bersih','Personal','','indikator','2022-12-16 05:47:33',1,0),(162,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Kursi, Meja, lemari tampak bersih','Kebersihan Secara Umum','','indikator','2022-12-16 05:47:33',1,0),(163,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Kursi, meja , lemari dalam kondisi baik','Kebersihan Secara Umum','','indikator','2022-12-16 05:47:33',1,0),(164,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Ruang nurse station bersih dan rapih','Kebersihan Secara Umum','','indikator','2022-12-16 05:47:33',1,0),(165,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Troli tindakan tampak bersih','Kebersihan Secara Umum','','','2022-12-16 05:47:33',1,0),(166,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Troli tindakan dibersihkan dengan desinfektan jika terkontaminasi','Kebersihan Secara Umum','','','2022-12-16 05:47:33',1,0),(167,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Lantai bersih  dan dalam kondisi baik','Kebersihan Secara Umum','','','2022-12-16 05:47:33',1,0),(168,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tidak ada debu di permukaan alat','Kebersihan Secara Umum','','','2022-12-16 05:47:33',1,0),(169,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Peralatan bersih, kering, dan disimpan dengan rapih','Kebersihan Secara Umum','','','2022-12-16 05:47:33',1,0),(170,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia washtafel untuk cuci tangan','Fasilitas Hand Hygiene','','','2022-12-16 05:47:33',1,0),(171,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Kran air berfungsi dengan baik','Fasilitas Hand Hygiene','','','2022-12-16 05:47:33',1,0),(172,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia sabun cair di setiap washtafel','Fasilitas Hand Hygiene','','','2022-12-16 05:47:33',1,0),(173,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia tissue towel di setiap washtafel','Fasilitas Hand Hygiene','','','2022-12-16 05:47:33',1,0),(174,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia tempat sampah di setiap washtafel','Fasilitas Hand Hygiene','','','2022-12-16 05:47:33',1,0),(175,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia poster hand hygiene disetiap wastafel','Fasilitas Hand Hygiene','','','2022-12-16 05:47:33',1,0),(176,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia handrub di nurse station','Fasilitas Hand Hygiene','','','2022-12-16 05:47:33',1,0),(177,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia handrub di setiap troli','Fasilitas Hand Hygiene','','','2022-12-16 05:47:33',1,0),(178,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia handrub di setiap ruangan rawat inap','Fasilitas Hand Hygiene','','','2022-12-16 05:47:33',1,0),(179,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Masker','Fasilitas APD','','','2022-12-16 05:47:33',1,0),(180,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Sarung tangan','Fasilitas APD','','','2022-12-16 05:47:33',1,0),(181,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Apron','Fasilitas APD','','','2022-12-16 05:47:33',1,0),(182,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Kacamata','Fasilitas APD','','','2022-12-16 05:47:33',1,0),(183,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tutup kepala','Fasilitas APD','','','2022-12-16 05:47:33',1,0),(184,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia tempat sampah infeksius dengan pedal yang berfungsi dengan baik','Fasilitas tempat sampah','','','2022-12-16 05:47:33',1,0),(185,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia tempat sampah non infeksius dengan pedal yang berfungsi dengan baik','Fasilitas tempat sampah','','','2022-12-16 05:47:33',1,0),(186,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia safety box yang sesuai','Fasilitas tempat sampah','','','2022-12-16 05:47:33',1,0),(187,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Ada label sesuai peruntukannya','Fasilitas tempat sampah','','','2022-12-16 05:47:33',1,0),(188,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tempat limbah dalam keadaan bersih dan tertutup','Tata Kelola Limbah Infeksius, Cairan tubuh, dan limbah domestik','','','2022-12-16 05:47:33',1,0),(189,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Sampah tidak lebih 3/4 Penuh','Tata Kelola Limbah Infeksius, Cairan tubuh, dan limbah domestik','','','2022-12-16 05:47:33',1,0),(190,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Membuang limbah cair infeksius ke dalam spoolhock/wastafel yang mengalir ke IPAL','Tata Kelola Limbah Infeksius, Cairan tubuh, dan limbah domestik','','','2022-12-16 05:47:33',1,0),(191,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Membuang sampah infeksius ke dalam tempat sampah yang dilapisi plastik warna kuning','Tata Kelola Limbah Infeksius, Cairan tubuh, dan limbah domestik','','','2022-12-16 05:47:33',1,0),(192,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Membuang sampah Domestik ke dalam tempat sampah yang dilapisi plastik warna hitam','Tata Kelola Limbah Infeksius, Cairan tubuh, dan limbah domestik','','','2022-12-16 05:47:33',1,0),(193,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Membuang limbah benda tajam ke dalam safety box','Tata Kelola Limbah Infeksius, Cairan tubuh, dan limbah domestik','','','2022-12-16 05:47:33',1,0),(194,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Safety box diletakkan di tempat yang aman, 30 cm dari lantai','Tata kelola benda tajam','','','2022-12-16 05:47:33',1,0),(195,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tempat limbah benda tajam dirakit dengan benar','Tata kelola benda tajam','','','2022-12-16 05:47:33',1,0),(196,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','isi limbah benda tajam tidak lebih dari 3/4 penuh','Tata kelola benda tajam','','','2022-12-16 05:47:33',1,0),(197,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tidak menutup kembali jarum suntik habis pakai (langsung buang)','Tata kelola benda tajam','','','2022-12-16 05:47:33',1,0),(198,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tidak memberikan banda tajam habis pakai ke orang lain','Tata kelola benda tajam','','','2022-12-16 05:47:33',1,0),(199,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Jika harus memberikan benda tajam keorang lain gunakan kontainer','Tata kelola benda tajam','','','2022-12-16 05:47:33',1,0),(200,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','jika sudah 3/4 penuh, tempat limbah tajam ditutup rapat dan disimpan di TPS','Tata kelola benda tajam','','','2022-12-16 05:47:33',1,0),(201,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia alur pasca pajanan benda tajam','Tata kelola benda tajam','','','2022-12-16 05:47:33',1,0),(202,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Area Kamar Mandi / Toilet kondisi baik','Toilet Kamar Mandi','','','2022-12-16 05:47:33',1,0),(203,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Toilet bersih','Toilet Kamar Mandi','','','2022-12-16 05:47:33',1,0),(204,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Kamar mandi terbebas dari benda-benda yang tak perlu','Toilet Kamar Mandi','','','2022-12-16 05:47:33',1,0),(205,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia fasilitas pembuangan sampah','Toilet Kamar Mandi','','','2022-12-16 05:47:33',1,0),(206,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Lemari linen bersih dan tertutup','Pengelolaan Linen','','','2022-12-16 05:47:33',1,0),(207,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Linen bersih tersusun rapih','Pengelolaan Linen','','','2022-12-16 05:47:33',1,0),(208,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tersedia tempat linen kotor yang tertutup dalam kondisi baik dan bersih','Pengelolaan Linen','','','2022-12-16 05:47:33',1,0),(209,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Linen kotor infeksius ditempatkan dalam wadah linen kotor infeksius yang dilapisi kantong plastik warna kuning dan tertutup','Pengelolaan Linen','','','2022-12-16 05:47:33',1,0),(210,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Linen kotor non infeksius ditempatkan dalam wadah linen non infeksius yang dilapisi kantong plastik warna hitam dan tertutup','Pengelolaan Linen','','','2022-12-16 05:47:33',1,0),(211,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Tidak ditemukan linen kotor tergeletak dilantai','Pengelolaan Linen','','','2022-12-16 05:47:33',1,0),(212,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Petugas menggunakan APD dalam menangani linen kotor','Pengelolaan Linen','','','2022-12-16 05:47:33',1,0),(213,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Dressing set dan alat steril lain disimpan dalam lemari tertutup dan terpisah dari alat non steril','Penyimpanan Alat Medis dan obat','','','2022-12-16 05:47:33',1,0),(214,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Alat dan bahan steril belum kadaluarsa ( lihat tanggal dan kondisi)','Penyimpanan Alat Medis dan obat','','','2022-12-16 05:47:33',1,0),(215,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Alat medis bersih disimpan terbungkus atau tertutup, kering dan terbebas dari debu','Penyimpanan Alat Medis dan obat','','','2022-12-16 05:47:33',1,0),(216,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Lemari es penyimpanan obat kondisi bersih dan obat tidak tercampur dengan benda lain','Penyimpanan Alat Medis dan obat','','','2022-12-16 05:47:33',1,0),(217,4,'[\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\"]','Suhu lemari es tempat penyimpanan obat di catat setiap hari suhu 2 s/d 8°c','Penyimpanan Alat Medis dan obat','','','2022-12-16 05:47:33',1,0);
/*!40000 ALTER TABLE `a_indikator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_jabatan`
--

DROP TABLE IF EXISTS `a_jabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_jabatan` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_deleted` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_jabatan`
--

LOCK TABLES `a_jabatan` WRITE;
/*!40000 ALTER TABLE `a_jabatan` DISABLE KEYS */;
INSERT INTO `a_jabatan` VALUES (1,'IPCD','(Infection Prevention Control Docter)','0000-00-00 00:00:00',1,0),(2,'IPCN','(Infection Prevention Control Nurse)','0000-00-00 00:00:00',1,0),(3,'IPCLN','(Infection Prevention Control Link Nurse)','0000-00-00 00:00:00',1,0),(4,'Komite Mutu','Komite Mutu','0000-00-00 00:00:00',1,0),(5,'Nurse','Perawat','0000-00-00 00:00:00',1,0);
/*!40000 ALTER TABLE `a_jabatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_jpenilaian`
--

DROP TABLE IF EXISTS `a_jpenilaian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_jpenilaian` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_jpenilaian`
--

LOCK TABLES `a_jpenilaian` WRITE;
/*!40000 ALTER TABLE `a_jpenilaian` DISABLE KEYS */;
INSERT INTO `a_jpenilaian` VALUES (2,'Audit Hand Hygiene','audit-hand-hygiene','Audit Hand Hygiene','2022-12-15 05:22:06',1,0),(3,'Audit Kepatuhan APD','audit-kepatuhan-apd','Audit Kepatuhan APD','2022-12-15 05:33:15',1,0),(4,'Monitoring Kegiatan Harian Pencegahan Pengendalian Infeksi (PPI)','monitoring-kegiatan-harian-pencegahan-pengendalian-infeksi-ppi','Monitoring Kegiatan Harian Pencegahan Pengendalian Infeksi (PPI)','2022-12-15 07:19:05',1,0);
/*!40000 ALTER TABLE `a_jpenilaian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_modules`
--

DROP TABLE IF EXISTS `a_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `utype` varchar(48) NOT NULL DEFAULT 'internal' COMMENT 'type module : internal, external',
  PRIMARY KEY (`identifier`),
  KEY `children_identifier` (`children_identifier`),
  CONSTRAINT `a_modules_ibfk_1` FOREIGN KEY (`children_identifier`) REFERENCES `a_modules` (`identifier`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='list modul yang ada dimenu atau tidak ada dimenu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_modules`
--

LOCK TABLES `a_modules` WRITE;
/*!40000 ALTER TABLE `a_modules` DISABLE KEYS */;
INSERT INTO `a_modules` VALUES ('admin_akun_user','Kustomer','admin/akun/user',1,0,'akun',1,'denied',1,90,'fa fa-users','internal'),('admin_api_doc','Dokumentasi','admin/api/doc',1,0,'api',1,'denied',1,1,'fa fa-book','internal'),('akun','Akun','#',0,1,NULL,1,'denied',1,20,'fa fa-users','internal'),('akun_pengguna','Administrator','akun/pengguna',1,0,'akun',1,'denied',1,90,'fa fa-users','internal'),('akun_user','Kustomer','akun/user',1,0,'akun',1,'denied',1,90,'fa fa-users','internal'),('api','API','#',0,1,NULL,1,'denied',1,80,'fa fa-cog','internal'),('api_doc','Dokumentasi','api/doc',1,0,'api',1,'denied',1,1,'fa fa-book','internal'),('dashboard','Dashboard','#',0,1,NULL,1,'denied',1,0,'fa fa-home','internal'),('laporan','Laporan','#',0,1,NULL,1,'denied',1,90,'fa fa-book','internal'),('laporan_order','Order','laporan/order',1,0,'laporan',1,'denied',1,1,'fa fa-cogs','internal'),('laporan_pengiriman','Pengiriman','laporan/pengiriman',1,0,'laporan',1,'denied',1,1,'fa fa-cogs','internal'),('order','Kirim Paket','order',0,1,NULL,1,'denied',1,20,'fa fa-exchange','internal'),('partner','Partner','#',0,1,NULL,1,'denied',1,20,'fa fa-handshake-o','internal'),('partner_reseller','Reseller','admin/partner/reseller',1,0,'partner',1,'denied',1,90,'fa fa-users','internal'),('pengaturan','Pengaturan','pengaturan',0,1,NULL,1,'denied',1,90,'fa fa-cogs','internal'),('pengaturan_alamat','Alamat','pengaturan/alamat',1,0,'pengaturan',1,'denied',1,5,'fa fa-home','internal'),('pengaturan_env','Environment','pengaturan/env',1,0,'pengaturan',1,'denied',1,1,'fa fa-cogs','internal'),('pengaturan_perusahaan','Perusahaan','pengaturan/perusahaan',1,0,'pengaturan',1,'denied',1,1,'fa fa-users','internal'),('pengaturan_user','User','pengaturan/user',1,0,'pengaturan',1,'denied',1,1,'fa fa-users','internal'),('tracking','Tracking','tracking',0,1,NULL,1,'denied',1,20,'fa fa-truck','internal');
/*!40000 ALTER TABLE `a_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_pengguna`
--

DROP TABLE IF EXISTS `a_pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_pengguna` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `a_company_id` int(3) unsigned DEFAULT NULL COMMENT 'penempatan',
  `a_company_nama` varchar(78) NOT NULL DEFAULT '-',
  `a_company_kode` varchar(32) NOT NULL DEFAULT '-',
  `a_jabatan_id` int(3) unsigned DEFAULT NULL,
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
  `jenis_kelamin` int(1) unsigned NOT NULL DEFAULT 1,
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
  `is_karyawan` int(1) unsigned NOT NULL DEFAULT 0,
  `is_active` int(1) unsigned NOT NULL DEFAULT 1,
  `a_pengguna_id` int(6) unsigned DEFAULT NULL COMMENT 'atasan langsung',
  `is_admin_master` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `a_pengguna_username_unq` (`username`),
  KEY `a_company_id` (`a_company_id`),
  KEY `a_jabatan_id` (`a_jabatan_id`),
  KEY `nip` (`nip`)
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=latin1 COMMENT='tabel pengguna';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_pengguna`
--

LOCK TABLES `a_pengguna` WRITE;
/*!40000 ALTER TABLE `a_pengguna` DISABLE KEYS */;
INSERT INTO `a_pengguna` VALUES (1,NULL,'-','-',NULL,'Staff','mimind','$2y$10$FudYvQFvkQGm3mMt8fLN2uY.eaW6cLxKJfTnUFTMxfg9srDgki9.a','daeng@thecloudalert.com','Administrator','media/pengguna/2021/05/c4ca4238a0b923820dcc509a6f75849b3151.jpg','Selamat Beraktifitas','all','-','','','','','','','','',NULL,1,'belum menikah','','','','','','','','',0,'','SMA',1971,'','','0000-00-00','0000-00-00',NULL,'Kontrak','',0,1,NULL,1),(402,NULL,'-','-',NULL,'Staff','','$2y$10$P1X2OqhipTMdeGCs8cWqAOck6cw0Kye1zj5W/OeCuQXy5Zs2IS2gO','rezziqbal@gmail.com','Rezza Muhammad Iqbal','','','none','-','Jl. Kutawaringin No 9 Rt 1 Rw 7 Desa/Kec. Kutawaringin Kabupaten Bandung','','','','','',' ','',NULL,1,'belum menikah',NULL,'085789701750','','','','','','',NULL,'','SMA',1971,'','',NULL,NULL,NULL,'Kontrak','Sukahiji',0,1,NULL,0),(403,NULL,'-','-',NULL,'Sales','sehadi','$2y$10$6yakajGNZmqK/VZe9goNkut//aU4/.EWFwx3fKXJFtRv6c3vce3Le','sehadi@gmail.com','SEHADI','media/pengguna/2021/05/c4ca4238a0b923820dcc509a6f75849b3151.jpg','Selamat Beraktifitas','all','-','','','','','','','','',NULL,1,'belum menikah','','','','','','','','',0,'','SMA',1971,'','','0000-00-00','0000-00-00',NULL,'Kontrak','',0,1,NULL,1);
/*!40000 ALTER TABLE `a_pengguna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_pengguna_module`
--

DROP TABLE IF EXISTS `a_pengguna_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_pengguna_module` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `a_pengguna_id` int(6) unsigned DEFAULT NULL,
  `a_modules_identifier` varchar(255) DEFAULT NULL,
  `rule` enum('allowed','disallowed','allowed_except','disallowed_except') NOT NULL DEFAULT 'allowed',
  `tmp_active` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `fka_modules_identifier` (`a_modules_identifier`),
  CONSTRAINT `a_pengguna_module_ibfk_2` FOREIGN KEY (`a_modules_identifier`) REFERENCES `a_modules` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3195 DEFAULT CHARSET=latin1 COMMENT='hak akses pengguna';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_pengguna_module`
--

LOCK TABLES `a_pengguna_module` WRITE;
/*!40000 ALTER TABLE `a_pengguna_module` DISABLE KEYS */;
INSERT INTO `a_pengguna_module` VALUES (1,1,NULL,'allowed_except','N'),(3189,403,'akun','allowed','N'),(3190,403,'admin_akun_user','allowed','N'),(3191,403,'partner','allowed','N'),(3192,403,'partner_reseller','allowed','N'),(3193,403,'api','allowed','N'),(3194,403,'admin_api_doc','allowed','N');
/*!40000 ALTER TABLE `a_pengguna_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_rs`
--

DROP TABLE IF EXISTS `a_rs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_rs` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 0,
  `is_deleted` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_rs`
--

LOCK TABLES `a_rs` WRITE;
/*!40000 ALTER TABLE `a_rs` DISABLE KEYS */;
/*!40000 ALTER TABLE `a_rs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_ruangan`
--

DROP TABLE IF EXISTS `a_ruangan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_ruangan` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `a_rs_id` int(5) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `kd_ruangan` varchar(20) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`a_rs_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_ruangan`
--

LOCK TABLES `a_ruangan` WRITE;
/*!40000 ALTER TABLE `a_ruangan` DISABLE KEYS */;
INSERT INTO `a_ruangan` VALUES (13,1,'Anggrek','','','','0000-00-00 00:00:00',1,0),(14,1,'Perinatologi','','','','0000-00-00 00:00:00',1,0),(15,1,'Melati','','','','0000-00-00 00:00:00',1,0),(16,1,'HCU','','','','0000-00-00 00:00:00',1,0),(17,1,'VK/Kebidanan','','','','0000-00-00 00:00:00',1,0),(18,1,'IGD','','','','0000-00-00 00:00:00',1,0),(19,1,'IRJ','','','','0000-00-00 00:00:00',1,0),(20,1,'Isolasi','','','','0000-00-00 00:00:00',1,0),(21,1,'Gizi','','','','0000-00-00 00:00:00',1,0),(22,1,'Laundry','','','','0000-00-00 00:00:00',1,0),(23,1,'CSSD','','','','0000-00-00 00:00:00',1,0),(24,1,'Farmasi','','','','0000-00-00 00:00:00',1,0),(25,1,'RO','','','','0000-00-00 00:00:00',1,0),(26,1,'LAB','','','','0000-00-00 00:00:00',1,0),(27,1,'Kamar Jenazah','','','','0000-00-00 00:00:00',1,0),(28,1,'IPAL','','','','0000-00-00 00:00:00',1,0),(29,1,'Limbah','','','','0000-00-00 00:00:00',1,0);
/*!40000 ALTER TABLE `a_ruangan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_unit`
--

DROP TABLE IF EXISTS `a_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_unit` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `cdate` datetime NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_unit`
--

LOCK TABLES `a_unit` WRITE;
/*!40000 ALTER TABLE `a_unit` DISABLE KEYS */;
INSERT INTO `a_unit` VALUES (1,'UGD','Tes','2022-12-06 19:04:59',1,0);
/*!40000 ALTER TABLE `a_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user`
--

DROP TABLE IF EXISTS `b_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b_user_id` int(11) DEFAULT NULL COMMENT 'atasan',
  `a_unit_id` int(5) DEFAULT NULL,
  `a_jabatan_id` int(5) unsigned DEFAULT NULL,
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
  `is_agree` int(1) unsigned NOT NULL DEFAULT 0,
  `is_confirmed` int(1) unsigned NOT NULL DEFAULT 0 COMMENT '1 ya, 0 belum konfirmasi, flag setelah konfirmasi',
  `is_premium` int(1) unsigned NOT NULL DEFAULT 0,
  `is_wa_verified` int(1) NOT NULL DEFAULT 1,
  `is_wa_send` int(1) NOT NULL DEFAULT 1,
  `is_active` int(1) unsigned NOT NULL DEFAULT 1,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_api_web_token` (`api_web_token`),
  KEY `kode` (`kode`),
  KEY `a_company_id` (`a_unit_id`),
  KEY `a_departemen_id` (`a_jabatan_id`),
  KEY `a_pengguna_id` (`b_user_id`),
  KEY `idx_is_active` (`google_id`),
  KEY `idx_is_confirmed` (`kode_lama`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 COMMENT='tabel pengguna, bisa member atau user vendor,';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user`
--

LOCK TABLES `b_user` WRITE;
/*!40000 ALTER TABLE `b_user` DISABLE KEYS */;
INSERT INTO `b_user` VALUES (30,402,NULL,NULL,'',NULL,NULL,'','','','','e10adc3949ba59abbe56e057f20f883e','Rezza Muhammad Iqbal',' ','Jl. Kutawaringin No 9 RT 01 RW 07 Desa/Kec. Kutawaringin Kab. Bandung',NULL,'','','','','Indonesia','',1,'-','1970-01-01','0000-00-00 00:00:00',NULL,NULL,'085789701750','',NULL,'',NULL,0,0,' ','online',NULL,20,'',NULL,NULL,NULL,NULL,NULL,NULL,' ','web','',0,0,0,1,1,1,0),(32,31,NULL,NULL,'',NULL,NULL,'rezziqbal@gmail.com','rezziqbal','','','e10adc3949ba59abbe56e057f20f883e','Rezza Muhammad Iqbal',' ','Jl. Kutawaringin Desa KUtawaringin',NULL,'','Kutawaringin','Kabupaten Bandung','Jawa Barat','Indonesia','40911',1,'-','1970-01-01','0000-00-00 00:00:00',NULL,NULL,'08578970175','',NULL,'',NULL,0,0,' ','online',NULL,20,'',NULL,NULL,NULL,NULL,NULL,NULL,' ','web','',0,0,0,1,1,1,0),(37,NULL,NULL,NULL,'',NULL,NULL,'drosanda@outlook.co.id','drosanda','','','$2y$10$YxehvrbD0KguQs12jwFZ4e6CaKpEjlsmOloIISadcO9oeXGHoghDW','Daeng Rosanda',' ','','','','','','','Indonesia','',1,'-','1970-01-01','2021-06-16 16:52:42',NULL,NULL,'6341 5041','',NULL,'',NULL,0,0,' ','online',NULL,20,'',NULL,NULL,NULL,NULL,NULL,NULL,' ','web','4DDB33DCBC',0,0,0,1,1,1,0),(39,NULL,NULL,NULL,'',NULL,NULL,'daeng@cenah.co.id','daeng@cenah.co.id','','','e10adc3949ba59abbe56e057f20f883e','Daeng Rosanda',' ','','','','','','','Indonesia','',1,'-','1970-01-01','2021-06-16 17:51:05',NULL,NULL,'6341 5041','',NULL,'',NULL,0,0,' ','online',NULL,20,'',NULL,NULL,NULL,NULL,NULL,NULL,' ','web','',0,0,0,1,1,1,0),(43,NULL,NULL,NULL,'',NULL,NULL,'vanny@cenah.co.id','vanny@cenah.co.id','','','e10adc3949ba59abbe56e057f20f883e','Vanny Fandhiny',' ','','','','','','','Indonesia','',1,'-','1970-01-01','2021-06-16 18:01:26',NULL,NULL,'081320012157','',NULL,'',NULL,0,0,' ','online',NULL,20,'',NULL,NULL,NULL,NULL,NULL,NULL,' ','web','',0,0,0,1,1,1,0),(68,37,0,0,'google_id','kode','kode_lama','rizki@gmail.com','rizki','foto','welcome_message','$2y$10$7rS4va1jjO/Xzph2xKjODe1i3wZIHenBvEtvn00aSCOGK7RhbU22u','Rizki','lnama','Jl. Tol','alamat2','SOREANG','SOREANG','BANDUNG','JAWA BARAT','INDONESIA','40911',0,'tlahir','0000-00-00','0000-00-00 00:00:00','0000-00-00','0000-00-00','0918380144','fb',0,'ig',0,0,0,'image','online',NULL,0,'npwp','0000-00-00','api_reg_token','0000-00-00','api_web_token','0000-00-00','api_mobile_token','fcm_token','device','BQ5XBQ3CCQ',0,0,0,1,1,1,0),(70,NULL,NULL,NULL,'',NULL,NULL,'','','','',NULL,'MS CHANDRA',' ','',NULL,'','','','','Indonesia','',1,'-','1970-01-01','0000-00-00 00:00:00',NULL,NULL,'085721xxxx','',NULL,'',NULL,0,0,' ','online',NULL,20,'',NULL,NULL,NULL,NULL,NULL,NULL,' ','web','',0,0,0,1,1,1,0),(71,NULL,15,5,'',NULL,NULL,'','','','',NULL,'Dina Ampar',' ','',NULL,'','','','','Indonesia','',1,'-','1970-01-01','2022-12-17 10:09:34',NULL,NULL,'','',NULL,'',NULL,0,0,' ','online',NULL,20,'',NULL,NULL,NULL,NULL,NULL,NULL,' ','web','',0,0,0,1,1,1,0);
/*!40000 ALTER TABLE `b_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_asesmen`
--

DROP TABLE IF EXISTS `c_asesmen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_asesmen` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `a_jpenilaian_id` int(5) NOT NULL,
  `b_user_id_penilai` int(11) NOT NULL,
  `b_user_id` int(5) NOT NULL,
  `a_ruangan_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `nilai` text NOT NULL,
  `ntype` enum('angka','persen') NOT NULL DEFAULT 'angka' COMMENT 'nilai type',
  `cdate` datetime NOT NULL,
  `durasi` decimal(18,2) NOT NULL,
  `stime` time NOT NULL,
  `etime` time NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT 1,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_asesmen`
--

LOCK TABLES `c_asesmen` WRITE;
/*!40000 ALTER TABLE `c_asesmen` DISABLE KEYS */;
INSERT INTO `c_asesmen` VALUES (1,2,0,71,13,'{\"indikator\":\"125\",\"aksi\":\"130\"}','','angka','2022-12-17 10:14:46',0.11,'10:03:27','10:14:46',1,0),(2,2,0,71,15,'{\"indikator\":\"127\",\"aksi\":\"131\"}','','angka','2022-12-17 11:21:25',0.10,'11:20:16','11:21:25',1,0);
/*!40000 ALTER TABLE `c_asesmen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-19 11:48:56

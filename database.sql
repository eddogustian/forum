-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 02, 2012 at 12:43 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) DEFAULT NULL,
  `isi` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `tanggalPost` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `judul`, `isi`, `user_id`, `thread_id`, `tanggalPost`) VALUES
(1, '', 'kabarnya sih itu si tobi gan.', 6, 1, '2011-10-14 21:52:35'),
(2, '', 'ga tau jga tuh gan..', 7, 1, '2011-10-14 22:45:20'),
(3, '', 'reserved', 7, 1, '2011-10-15 01:01:44'),
(4, '', 'klo mau nambahin gambar ada disini gan :&nbsp;\r\n<a href="http://sabitlabscode.wordpress.com/2011/10/06/yii-framework-otak-atik-cgridview-display-image/">http://sabitlabscode.wordpress.com/2011/10/06/yii-framework-otak-atik-cgridview-display-image/</a>,<div>klo mau nambahin link disini :&nbsp;<a href="http://sabitlabscode.wordpress.com/2011/08/23/yii-framework-otak-atik-cgridview-menambahkan-link/">http://sabitlabscode.wordpress.com/2011/08/23/yii-framework-otak-atik-cgridview-menambahkan-link/</a></div>', 7, 3, '2011-10-15 09:52:59'),
(5, '', 'meneketehe<br><br>', 6, 1, '2011-12-06 18:41:29'),
(6, '', 'reserved', 6, 4, '2011-12-07 13:11:08'),
(7, '', 'ga jelas nih maksudnya..<br>', 9, 4, '2011-12-09 16:47:31'),
(8, '', 'niat jualan ga sih gan?<br>', 10, 4, '2011-12-09 18:40:27'),
(9, '', 'preet..', 11, 4, '2011-12-09 18:49:16'),
(10, '', 'iya tuh gan, serem amat yak..<br>', 11, 7, '2011-12-09 18:49:34'),
(11, '', 'capek deh..<br>', 13, 4, '2011-12-10 16:51:25'),
(12, '', 'ada2 aja orang yg pengen jadi bandit..<br>', 13, 5, '2011-12-10 16:59:35'),
(13, '', 'salam kenal juga gan..', 26, 9, '2012-01-01 14:55:46');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`) VALUES
(1, 'Lounge'),
(2, 'Programmer'),
(3, 'Jual Beli'),
(4, 'Disturbing Picture');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `level`) VALUES
(1, 'admin'),
(2, 'moderator'),
(3, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(200) NOT NULL,
  `isi` text NOT NULL,
  `foto` varchar(200) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `judul`, `isi`, `foto`, `user`) VALUES
(1, 'Posting Pertama', 'hai.. ini posting pertama..<br>', '.jpg', 6),
(2, 'Coba coba lagi', 'cuma coba-coba lagi<br>', '.jpg', 6),
(3, 'Bingung mau posting apaan lagi..', 'Bingung mau posting apaan lagi..', '.jpg', 6),
(4, 'Narsis Ah...', 'Narsis Dulu mas..<br>', '.JPG', 6),
(5, 'Hahaha', 'Hhahahhaahahah', '.jpg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `raputation`
--

CREATE TABLE IF NOT EXISTS `raputation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jenis` tinyint(1) NOT NULL,
  `pemberi_id` int(11) NOT NULL,
  `penerima_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pemberi_id` (`pemberi_id`),
  KEY `penerima_id` (`penerima_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `raputation`
--

INSERT INTO `raputation` (`id`, `tanggal`, `jenis`, `pemberi_id`, `penerima_id`) VALUES
(1, '2011-12-07 00:00:00', 1, 6, 6),
(2, '2011-12-07 00:00:00', 1, 6, 6),
(3, '2011-12-07 00:00:00', -1, 6, 6),
(4, '2011-12-07 00:00:00', 1, 6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE IF NOT EXISTS `thread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `tanggalPost` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `kategori_id` (`kategori_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `thread`
--

INSERT INTO `thread` (`id`, `judul`, `isi`, `user_id`, `kategori_id`, `tanggalPost`) VALUES
(1, 'Gan, kira2 siapa yg ada di balik topeng madara?', 'Gan, udah tau kan kalo uchiha madara menampakkan dirinya. Nah, kira-kira siapa ya gan orang yang ada dibalik topeng madara tersebut??', 6, 1, '2011-10-14 17:51:59'),
(2, '[Pool] Pilih Messi apa Ronaldo gan??', 'Gan, kita pooling yuk gan..<div>Menurut agan-agan sekalian, bagusan Ronaldo apa Messi gan??</div>', 7, 1, '2011-10-15 09:37:34'),
(3, 'link/gambar di CGridView pada Yii Framework?', 'Gan, ane mau nambahin link/gambar pada CGridView di Yii Framework.<div>Itu bisa ga ya gan? Kalo bisa, gmana caranya gan?</div><div>Mkasih gan..</div>', 8, 2, '2011-10-15 09:50:04'),
(4, 'Jual Software', 'Gan, bagi yang minat beli software yg bisa ngalakuin apapun silahkan hubungi ane..<br>Harga : nego..<br><br>', 6, 3, '2011-12-07 13:10:58'),
(5, '[ASK]Cara Hack FB?', 'Gan, ada yang tau ga cara hack FB??<br>Klo ada mohon pencerahannya ya gan..<br>', 7, 1, '2011-12-07 14:22:36'),
(6, 'Hello World', 'Hallo semuanya, saya baru gabung nih..<br>MOhon bimbingannya..<br>', 9, 2, '2011-12-09 16:47:06'),
(7, 'Bakar Diri di Depan Istana', 'gan. udah denger berita??<br>Ada orang bakar diri di depan istana tuh gan..<br><br>', 10, 1, '2011-12-09 18:41:12'),
(8, 'Framework PHP yang paling bagus apa ya gan??', 'Gan, framework PHP yang paling bagus apa ya gan??<br>', 11, 2, '2011-12-09 18:50:09'),
(9, 'Izin Gabung', 'Izin gabung gan..<br><br>', 13, 1, '2011-12-10 16:50:10'),
(10, 'Mending ilangin aja nih forum', 'Gan, DP itu mengerikan gan. Kok malah dibuatin sih kategoriny?<br>', 13, 4, '2011-12-10 16:50:58'),
(11, 'Salam Kenal', 'Salam kenal dari ane gan..<div>Semoga bisa ikut meramaikan forum ini..</div>', 26, 1, '2012-01-01 14:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `threadstar`
--

CREATE TABLE IF NOT EXISTS `threadstar` (
  `is` int(11) NOT NULL AUTO_INCREMENT,
  `nilai` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  PRIMARY KEY (`is`),
  KEY `user_id` (`user_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `threadstar`
--

INSERT INTO `threadstar` (`is`, `nilai`, `user_id`, `thread_id`) VALUES
(1, 2, 6, 1),
(2, 4, 6, 2),
(3, 3, 6, 9),
(4, 5, 26, 9);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `saltPassword` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `joinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `level_id` int(11) NOT NULL,
  `avatar` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `level_id` (`level_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `saltPassword`, `email`, `joinDate`, `level_id`, `avatar`) VALUES
(6, 'admin', '46765456e0059ac9b3298faf1ce09218', '4e955eff7e18f2.14452790', 'admin@yahoo.com', '2011-10-12 16:47:38', 1, 'admin.jpg'),
(7, 'sabit', '1cbfe2ed2604fa8dabbdc206caed0033', '4e95788ec67183.88398893', 'sabitzhabit@yahoo.com', '2011-10-12 18:22:54', 3, 'sabit.jpg'),
(8, 'programmer', '2121a8f4f7c5c80af91a5647152c5e5a', '4e98f45c6b8cd3.32940589', 'programmer@haha.com', '2011-10-15 09:47:56', 3, 'programmer.JPG'),
(9, 'sabit2', '8233a9eea9a566614015f23f201f5cd6', '4ee1d8e55a1921.91163983', 'sabit2@sabi.com', '2011-12-09 16:46:13', 3, 'sabit2.jpg'),
(10, 'sabit3', '358b5452e8faa3f5faed03e3297105f9', '4ee1f3842ab998.36650030', 'sabitzhabit@yahoo.com', '2011-12-09 18:39:48', 3, 'sabit3.jpg'),
(11, 'sabit4', 'd9906bed077388a69190c29d7e22501f', '4ee1f595d4fc96.88216981', 'sabitzhabit@yahoo.com', '2011-12-09 18:48:37', 3, 'sabit4.JPG'),
(12, 'sabit5', 'cb6ce50d3c2ff077b740148a2e0a03ad', '4ee32aba333647.86647204', 'sabitzhabit@yahoo.com', '2011-12-10 16:47:38', 3, 'sabit5.jpg'),
(13, 'sabit6', 'fdfdfb58dfb3b11da1dffba8cac7eff1', '4ee32b343edfd9.28548765', 'sabitzhabit@yahoo.com', '2011-12-10 16:49:40', 3, 'sabit6.jpg'),
(26, 'sabit7', '9a8841a065eae200d21a19b739b30b7e', '4f00112c332fb1.55818875', 'sabitzhabit@yahoo.com', '2012-01-01 14:54:20', 3, 'sabit7.png');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `raputation`
--
ALTER TABLE `raputation`
  ADD CONSTRAINT `raputation_ibfk_1` FOREIGN KEY (`pemberi_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `raputation_ibfk_2` FOREIGN KEY (`penerima_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `thread_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `thread_ibfk_4` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `threadstar`
--
ALTER TABLE `threadstar`
  ADD CONSTRAINT `threadstar_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `threadstar_ibfk_4` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`) ON UPDATE CASCADE;

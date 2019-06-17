-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2019 at 09:40 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `locallibrary`
--
CREATE DATABASE IF NOT EXISTS `locallibrary` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `locallibrary`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Library Members');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add author', 7, 'add_author'),
(26, 'Can change author', 7, 'change_author'),
(27, 'Can delete author', 7, 'delete_author'),
(28, 'Can view author', 7, 'view_author'),
(29, 'Can add book', 8, 'add_book'),
(30, 'Can change book', 8, 'change_book'),
(31, 'Can delete book', 8, 'delete_book'),
(32, 'Can view book', 8, 'view_book'),
(33, 'Can add book instance', 9, 'add_bookinstance'),
(34, 'Can change book instance', 9, 'change_bookinstance'),
(35, 'Can delete book instance', 9, 'delete_bookinstance'),
(36, 'Can view book instance', 9, 'view_bookinstance'),
(37, 'Can add genre', 10, 'add_genre'),
(38, 'Can change genre', 10, 'change_genre'),
(39, 'Can delete genre', 10, 'delete_genre'),
(40, 'Can view genre', 10, 'view_genre'),
(41, 'Can add language', 11, 'add_language'),
(42, 'Can change language', 11, 'change_language'),
(43, 'Can delete language', 11, 'delete_language'),
(44, 'Can view language', 11, 'view_language'),
(45, 'Set book as returned', 9, 'can_mark_returned');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$VAqwejKtH8Ua$apH3l2xU9cClD4hNitr6gXKdW0gdDzHW0NhynevJVfQ=', '2019-06-16 03:04:35.504228', 1, 'admin', '', '', 'admin@locallibrary.com', 1, 1, '2019-03-12 05:11:16.115125'),
(2, 'pbkdf2_sha256$120000$OdSjvnnMblOt$+f6qdbGd2/UGvrJyCRjyAC5qTRR40Rj2wEjOyk2Sw2Q=', NULL, 0, 'susan', '', '', '', 0, 1, '2019-03-12 05:22:46.090380'),
(3, 'pbkdf2_sha256$120000$fGwkrr6XoSKG$VQX0dBMogf9C1/uDW/T2amQznqR3apWC9rWwbtSyHVc=', NULL, 0, 'mary', '', '', '', 0, 1, '2019-03-12 05:22:56.725862'),
(4, 'pbkdf2_sha256$150000$9mIHvfMbKhx3$FwybXMkDTWyIQzJw5oSTNue7DJolX5FjuloKvhZAX4I=', '2019-06-16 03:04:02.525314', 0, 'sumaira@gmail.com', '', '', '', 0, 1, '2019-06-15 14:55:34.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_author`
--

DROP TABLE IF EXISTS `catalog_author`;
CREATE TABLE IF NOT EXISTS `catalog_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_death` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_author`
--

INSERT INTO `catalog_author` (`id`, `first_name`, `last_name`, `date_of_birth`, `date_of_death`) VALUES
(1, 'Patrick', 'Rothfuss', '1973-06-06', NULL),
(2, 'Bova', 'Ben', '1932-11-08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_book`
--

DROP TABLE IF EXISTS `catalog_book`;
CREATE TABLE IF NOT EXISTS `catalog_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `summary` longtext NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_book_author_id_b0849980_fk_catalog_author_id` (`author_id`),
  KEY `catalog_book_language_id_447f859e_fk_catalog_language_id` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_book`
--

INSERT INTO `catalog_book` (`id`, `title`, `summary`, `isbn`, `author_id`, `language_id`) VALUES
(1, 'The Name of the Wind', 'Told in Kothe\'s own voice, this is the tale of the magically gifted young man who grows to be the most wizard his world has ever seen.', '9781473211896', 1, 1),
(2, 'The Dueling Machine', 'Dueling as a means of settling disputes has been revived by the invention of the dueling machine, which allows two adversaries to have at each other in the imaginary world of their choosing, with no danger to either other than humiliation and the loss of the point in dispute—until the Kerak Worlds found a way to kill with the machine. Unless a young Star Watchman can solve the mystery, the warlike Kerak Worlds will gobble up the planets of the Acquataine Cluster, murdering its leaders one at a time, and then be ready for the Terrans themselves... \r\n\r\nOriginally a short piece published as \"The Dueling Machine\" [with Myron R. Lewis] Analog May 1963; also as \"The Perfect Warrior\".', '9780425064665', 2, 1),
(3, 'The Name of the Wind (The Kingkiller Chronicle #1)', 'The Kingkiller Chronicle takes place in the fictional world of Temerant, a large continent of which the known part, called the Four Corners of Civilization, is divided into several distinct nations and cultures. Much of the world follows a religion similar, though not identical, to medieval Christianity. Coexisting alongside the mortal world is the realm of The Fae, a parallel universe inhabited by supernatural creatures which can move between the two realms only when the moon is full. Magic exists in Temerant, too, but obeys a well-defined set of rules and principles that can only be exploited by those who have trained in its professional and scientific use.', '9780756404079', 1, 1),
(4, 'The Wise Man\'s Fear (The Kingkiller Chronicle #2)', '“There are three things all wise men fear: the sea in storm, a night with no moon, and the anger of a gentle man.”\r\n\r\nMy name is Kvothe.\r\nI have stolen princesses back from sleeping barrow kings. I burned down the town of Trebon. I have spent the night with Felurian and left with both my sanity and my life. I was expelled from the University at a younger age than most people are allowed in. I tread paths by moonlight that others fear to speak of during day. I have talked to Gods, loved women, and written songs that make the minstrels weep.\r\n\r\nIn The Wise Man\'s Fear, Kvothe takes his first steps on the path of the hero and learns how difficult life can be when a man becomes a legend in his own time.', '9780756404734', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_bookinstance`
--

DROP TABLE IF EXISTS `catalog_bookinstance`;
CREATE TABLE IF NOT EXISTS `catalog_bookinstance` (
  `id` char(32) NOT NULL,
  `imprint` varchar(200) NOT NULL,
  `due_back` date DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_bookinstance_book_id_69f93415_fk_catalog_book_id` (`book_id`),
  KEY `catalog_bookinstance_borrower_id_0d71c37c_fk_auth_user_id` (`borrower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_bookinstance`
--

INSERT INTO `catalog_bookinstance` (`id`, `imprint`, `due_back`, `status`, `book_id`, `borrower_id`) VALUES
('2b66556059644e9e9ff621b5feebcdfa', 'Berkely', NULL, 'a', 2, NULL),
('2f4880c2063646d1aa8d239bd1b415dd', 'Hudson Press', '2019-04-18', 'o', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_book_genre`
--

DROP TABLE IF EXISTS `catalog_book_genre`;
CREATE TABLE IF NOT EXISTS `catalog_book_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalog_book_genre_book_id_genre_id_d15f6922_uniq` (`book_id`,`genre_id`),
  KEY `catalog_book_genre_genre_id_77d7ffde_fk_catalog_genre_id` (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_book_genre`
--

INSERT INTO `catalog_book_genre` (`id`, `book_id`, `genre_id`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 1),
(6, 3, 2),
(4, 4, 1),
(5, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_genre`
--

DROP TABLE IF EXISTS `catalog_genre`;
CREATE TABLE IF NOT EXISTS `catalog_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `sample` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_genre`
--

INSERT INTO `catalog_genre` (`id`, `name`, `sample`) VALUES
(1, 'Science Fiction', 0),
(2, 'Fantasy', 0),
(3, 'Western', 0),
(4, 'French Poetry', 0),
(5, 'Sample Genre', 1),
(6, 'Action and adventure', 0),
(7, 'Alternate history', 0),
(8, 'Anthology', 0),
(9, 'Chick lit', 0),
(10, 'Children\'s', 0),
(11, 'Comic book', 0),
(12, 'Coming-of-age', 0),
(13, 'Crime', 0),
(14, 'Drama', 0),
(15, 'Fairytale', 0),
(16, 'Fantasy', 0),
(17, 'Graphic novel', 0),
(18, 'Historical fiction', 0),
(19, 'Horror', 0),
(20, 'Mystery', 0),
(21, 'Paranormal romance', 0),
(22, 'Picture book', 0),
(23, 'Poetry', 0),
(24, 'Political thriller', 0),
(25, 'Romance', 0),
(26, 'Satire', 0),
(27, 'Science fiction', 0),
(28, 'Short story', 0),
(29, 'Suspense', 0),
(30, 'Thriller', 0),
(31, 'Young adult', 0),
(32, 'Art', 0),
(33, 'Autobiography', 0),
(34, 'Biography', 0),
(35, 'Book review', 0),
(36, 'Cookbook', 0),
(37, 'Diary', 0),
(38, 'Dictionary', 0),
(39, 'Encyclopedia', 0),
(40, 'Guide', 0),
(41, 'Health', 0),
(42, 'History', 0),
(43, 'Journal', 0),
(44, 'Math', 0),
(45, 'Memoir', 0),
(46, 'Prayer', 0),
(47, 'Religion', 0),
(48, 'spirituality', 0),
(49, 'New age', 0),
(50, 'Textbook', 0),
(51, 'Review', 0),
(52, 'Science', 0),
(53, 'Self help', 0),
(54, 'Travel', 0),
(55, 'True crime', 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_language`
--

DROP TABLE IF EXISTS `catalog_language`;
CREATE TABLE IF NOT EXISTS `catalog_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_language`
--

INSERT INTO `catalog_language` (`id`, `name`) VALUES
(1, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-03-12 05:15:58.245708', '1', 'English', 1, '[{\"added\": {}}]', 11, 1),
(2, '2019-03-12 05:16:24.926324', '1', 'Science Fiction', 1, '[{\"added\": {}}]', 10, 1),
(3, '2019-03-12 05:16:36.694383', '2', 'Fantasy', 1, '[{\"added\": {}}]', 10, 1),
(4, '2019-03-12 05:16:51.850483', '3', 'Western', 1, '[{\"added\": {}}]', 10, 1),
(5, '2019-03-12 05:17:02.117369', '4', 'French Poetry', 1, '[{\"added\": {}}]', 10, 1),
(6, '2019-03-12 05:18:47.215890', '1', 'Rothfuss, Patrick', 1, '[{\"added\": {}}]', 7, 1),
(7, '2019-03-12 05:20:21.504235', '1', 'The Name of the Wind', 1, '[{\"added\": {}}]', 8, 1),
(8, '2019-03-12 05:22:46.210280', '2', 'susan', 1, '[{\"added\": {}}]', 4, 1),
(9, '2019-03-12 05:22:56.856273', '3', 'mary', 1, '[{\"added\": {}}]', 4, 1),
(10, '2019-03-12 05:23:47.438431', '2f4880c2-0636-46d1-aa8d-239bd1b415dd', '2f4880c2-0636-46d1-aa8d-239bd1b415dd (The Name of the Wind)', 1, '[{\"added\": {}}]', 9, 1),
(11, '2019-03-12 07:53:44.054333', '2', 'Ben, Bova', 1, '[{\"added\": {}}]', 7, 1),
(12, '2019-03-12 07:55:00.666311', '2', 'Ben, Bova', 2, '[{\"changed\": {\"fields\": [\"date_of_birth\"]}}]', 7, 1),
(13, '2019-03-12 07:56:27.165867', '2', 'The Dueling Machine', 1, '[{\"added\": {}}]', 8, 1),
(14, '2019-03-12 07:57:05.363308', '2b665560-5964-4e9e-9ff6-21b5feebcdfa', '2b665560-5964-4e9e-9ff6-21b5feebcdfa (The Dueling Machine)', 1, '[{\"added\": {}}]', 9, 1),
(15, '2019-03-12 08:00:44.952636', '3', 'The Name of the Wind (The Kingkiller Chronicle #1)', 1, '[{\"added\": {}}]', 8, 1),
(16, '2019-03-12 08:01:42.922530', '1', 'Rothfuss, Patrick', 2, '[{\"changed\": {\"fields\": [\"date_of_birth\", \"date_of_death\"]}}]', 7, 1),
(17, '2019-03-12 08:05:34.505470', '4', 'The Wise Man\'s Fear (The Kingkiller Chronicle #2)', 1, '[{\"added\": {}}]', 8, 1),
(18, '2019-03-12 08:05:44.582788', '3', 'The Name of the Wind (The Kingkiller Chronicle #1)', 2, '[{\"changed\": {\"fields\": [\"genre\"]}}]', 8, 1),
(19, '2019-06-15 14:53:26.267516', '1', 'Library Members', 1, '[{\"added\": {}}]', 3, 1),
(20, '2019-06-15 14:55:34.439391', '4', 'sumaira@gmail.com', 1, '[{\"added\": {}}]', 4, 1),
(21, '2019-06-15 14:57:06.417986', '4', 'sumaira@gmail.com', 2, '[{\"changed\": {\"fields\": [\"groups\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'catalog', 'author'),
(8, 'catalog', 'book'),
(9, 'catalog', 'bookinstance'),
(10, 'catalog', 'genre'),
(11, 'catalog', 'language'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-03-12 04:59:14.457380'),
(2, 'auth', '0001_initial', '2019-03-12 04:59:22.525167'),
(3, 'admin', '0001_initial', '2019-03-12 04:59:24.304293'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-03-12 04:59:24.356220'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-03-12 04:59:24.403638'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-03-12 04:59:25.429271'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-03-12 04:59:26.636068'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-03-12 04:59:27.524104'),
(9, 'auth', '0004_alter_user_username_opts', '2019-03-12 04:59:27.590141'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-03-12 04:59:29.119369'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-03-12 04:59:29.368329'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-03-12 04:59:29.419982'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-03-12 04:59:30.975309'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-03-12 04:59:32.531170'),
(15, 'catalog', '0001_initial', '2019-03-12 04:59:39.792593'),
(16, 'sessions', '0001_initial', '2019-03-12 04:59:40.904088'),
(17, 'catalog', '0002_auto_20190312_1002', '2019-03-12 05:03:08.536137'),
(18, 'auth', '0010_alter_group_name_max_length', '2019-06-15 08:15:50.382285'),
(19, 'auth', '0011_update_proxy_permissions', '2019-06-15 08:15:50.499972'),
(20, 'catalog', '0003_genre_sample', '2019-06-15 08:15:52.313196');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5k9wovtcw1lqv2xlii4g1airqlatiajs', 'YWIxYzlmNjkwNzZkODhlOWIwMzkyMzI5ZjE1OWI2ZTJlYjE1MGZmMDp7Im51bV92aXNpdHMiOjIzfQ==', '2019-07-01 07:39:49.497921'),
('ltwpb1atay1epjykxz3wen4t9y4l0rwp', 'Y2Y2ZGUyYTFjYWY0OWRkZmQzNDRhMDI4Nzk2ZjYxODQyYTM5OGZmNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZDUyNDU1ZTc2YTAzMDkyYmIzYzhiYjM5MWMwYTZmNmJjY2EwOTc1In0=', '2019-03-26 05:11:44.120702');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `catalog_book`
--
ALTER TABLE `catalog_book`
  ADD CONSTRAINT `catalog_book_author_id_b0849980_fk_catalog_author_id` FOREIGN KEY (`author_id`) REFERENCES `catalog_author` (`id`),
  ADD CONSTRAINT `catalog_book_language_id_447f859e_fk_catalog_language_id` FOREIGN KEY (`language_id`) REFERENCES `catalog_language` (`id`);

--
-- Constraints for table `catalog_bookinstance`
--
ALTER TABLE `catalog_bookinstance`
  ADD CONSTRAINT `catalog_bookinstance_book_id_69f93415_fk_catalog_book_id` FOREIGN KEY (`book_id`) REFERENCES `catalog_book` (`id`),
  ADD CONSTRAINT `catalog_bookinstance_borrower_id_0d71c37c_fk_auth_user_id` FOREIGN KEY (`borrower_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `catalog_book_genre`
--
ALTER TABLE `catalog_book_genre`
  ADD CONSTRAINT `catalog_book_genre_book_id_e5a77c43_fk_catalog_book_id` FOREIGN KEY (`book_id`) REFERENCES `catalog_book` (`id`),
  ADD CONSTRAINT `catalog_book_genre_genre_id_77d7ffde_fk_catalog_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `catalog_genre` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

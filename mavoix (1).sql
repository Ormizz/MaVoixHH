-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 20 août 2023 à 00:41
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mavoix`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auth_permission`
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
(25, 'Can add election', 7, 'add_election'),
(26, 'Can change election', 7, 'change_election'),
(27, 'Can delete election', 7, 'delete_election'),
(28, 'Can view election', 7, 'view_election'),
(29, 'Can add question_electoral', 8, 'add_question_electoral'),
(30, 'Can change question_electoral', 8, 'change_question_electoral'),
(31, 'Can delete question_electoral', 8, 'delete_question_electoral'),
(32, 'Can view question_electoral', 8, 'view_question_electoral'),
(33, 'Can add proposition_electoral', 9, 'add_proposition_electoral'),
(34, 'Can change proposition_electoral', 9, 'change_proposition_electoral'),
(35, 'Can delete proposition_electoral', 9, 'delete_proposition_electoral'),
(36, 'Can view proposition_electoral', 9, 'view_proposition_electoral'),
(37, 'Can add candidat', 10, 'add_candidat'),
(38, 'Can change candidat', 10, 'change_candidat'),
(39, 'Can delete candidat', 10, 'delete_candidat'),
(40, 'Can view candidat', 10, 'view_candidat'),
(41, 'Can add article', 11, 'add_article'),
(42, 'Can change article', 11, 'change_article'),
(43, 'Can delete article', 11, 'delete_article'),
(44, 'Can view article', 11, 'view_article'),
(45, 'Can add electeur', 12, 'add_electeur'),
(46, 'Can change electeur', 12, 'change_electeur'),
(47, 'Can delete electeur', 12, 'delete_electeur'),
(48, 'Can view electeur', 12, 'view_electeur'),
(49, 'Can add type_utilisateur', 13, 'add_type_utilisateur'),
(50, 'Can change type_utilisateur', 13, 'change_type_utilisateur'),
(51, 'Can delete type_utilisateur', 13, 'delete_type_utilisateur'),
(52, 'Can view type_utilisateur', 13, 'view_type_utilisateur'),
(53, 'Can add utilisateur', 14, 'add_utilisateur'),
(54, 'Can change utilisateur', 14, 'change_utilisateur'),
(55, 'Can delete utilisateur', 14, 'delete_utilisateur'),
(56, 'Can view utilisateur', 14, 'view_utilisateur'),
(57, 'Can add themes_cles', 15, 'add_themes_cles'),
(58, 'Can change themes_cles', 15, 'change_themes_cles'),
(59, 'Can delete themes_cles', 15, 'delete_themes_cles'),
(60, 'Can view themes_cles', 15, 'view_themes_cles'),
(61, 'Can add proposition', 16, 'add_proposition'),
(62, 'Can change proposition', 16, 'change_proposition'),
(63, 'Can delete proposition', 16, 'delete_proposition'),
(64, 'Can view proposition', 16, 'view_proposition'),
(65, 'Can add vote', 17, 'add_vote'),
(66, 'Can change vote', 17, 'change_vote'),
(67, 'Can delete vote', 17, 'delete_vote'),
(68, 'Can view vote', 17, 'view_vote'),
(69, 'Can add zone', 18, 'add_zone'),
(70, 'Can change zone', 18, 'change_zone'),
(71, 'Can delete zone', 18, 'delete_zone'),
(72, 'Can view zone', 18, 'view_zone'),
(73, 'Can add zone', 19, 'add_zone'),
(74, 'Can change zone', 19, 'change_zone'),
(75, 'Can delete zone', 19, 'delete_zone'),
(76, 'Can view zone', 19, 'view_zone'),
(77, 'Can add proposition', 20, 'add_proposition'),
(78, 'Can change proposition', 20, 'change_proposition'),
(79, 'Can delete proposition', 20, 'delete_proposition'),
(80, 'Can view proposition', 20, 'view_proposition'),
(81, 'Can add vote', 21, 'add_vote'),
(82, 'Can change vote', 21, 'change_vote'),
(83, 'Can delete vote', 21, 'delete_vote'),
(84, 'Can view vote', 21, 'view_vote'),
(85, 'Can add themes_cles', 22, 'add_themes_cles'),
(86, 'Can change themes_cles', 22, 'change_themes_cles'),
(87, 'Can delete themes_cles', 22, 'delete_themes_cles'),
(88, 'Can view themes_cles', 22, 'view_themes_cles'),
(89, 'Can add themes_cles', 23, 'add_themes_cles'),
(90, 'Can change themes_cles', 23, 'change_themes_cles'),
(91, 'Can delete themes_cles', 23, 'delete_themes_cles'),
(92, 'Can view themes_cles', 23, 'view_themes_cles'),
(93, 'Can add vote', 24, 'add_vote'),
(94, 'Can change vote', 24, 'change_vote'),
(95, 'Can delete vote', 24, 'delete_vote'),
(96, 'Can view vote', 24, 'view_vote'),
(97, 'Can add zone', 25, 'add_zone'),
(98, 'Can change zone', 25, 'change_zone'),
(99, 'Can delete zone', 25, 'delete_zone'),
(100, 'Can view zone', 25, 'view_zone'),
(101, 'Can add proposition', 26, 'add_proposition'),
(102, 'Can change proposition', 26, 'change_proposition'),
(103, 'Can delete proposition', 26, 'delete_proposition'),
(104, 'Can view proposition', 26, 'view_proposition'),
(105, 'Can add photo', 27, 'add_photo'),
(106, 'Can change photo', 27, 'change_photo'),
(107, 'Can delete photo', 27, 'delete_photo'),
(108, 'Can view photo', 27, 'view_photo');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$ZL5vytMY9dADmyH6lq8qId$tLA/cdWEtOlfvSd3oDllwVZfl4gCg237b9DLpnxQcAg=', NULL, 0, 'sahire', '', '', 'michelyapi225@gmail.com', 0, 1, '2023-08-19 16:15:43.764472'),
(2, 'pbkdf2_sha256$600000$X0LuWCYawRqiVbj70BUfjs$3L9s+ItTSeA4652WGrx3Ud2okZDEn68PEz4JYkgm7ZQ=', '2023-08-19 20:45:24.558764', 0, 'users', '', '', 'users@gmail.com', 0, 1, '2023-08-19 20:42:54.219348');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `candidat_article`
--

CREATE TABLE `candidat_article` (
  `id_article` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `date_creation` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `candidat_article`
--

INSERT INTO `candidat_article` (`id_article`, `titre`, `candidat_id`, `content`, `date_creation`) VALUES
(1, 'La vie est cher', 1, 'allons voler les blanc ils ont beaucoup d\'argent', '2023-08-19 04:13:02.816660'),
(2, 'Le pain en CI', 1, 'C\'est devenue trop cher et je ne comprend pas', '2023-08-19 04:13:02.816660');

-- --------------------------------------------------------

--
-- Structure de la table `candidat_candidat`
--

CREATE TABLE `candidat_candidat` (
  `id_candidat` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenoms` varchar(70) NOT NULL,
  `surnom` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `lieu_naissance` varchar(100) NOT NULL,
  `localisation` varchar(100) NOT NULL,
  `parti_politique` varchar(100) NOT NULL,
  `biographie` varchar(255) NOT NULL,
  `motivation` varchar(255) NOT NULL,
  `election_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `candidat_candidat`
--

INSERT INTO `candidat_candidat` (`id_candidat`, `nom`, `prenoms`, `surnom`, `date_naissance`, `lieu_naissance`, `localisation`, `parti_politique`, `biographie`, `motivation`, `election_id`, `user_id`) VALUES
(1, 'Soro', 'Uriel', 'Baso', '2023-08-16', 'Plateau', 'Plateau', 'Independant', 'C\'est un joli garçons', 'L\'argent', 1, NULL),
(2, 'Yao', 'Elie-Noel', 'Michel Jacson', '2023-08-01', 'Yapougon', 'Yapougon', 'PPCI', 'Bon codeur', 'S\'améliorer ', 1, NULL),
(3, 'Alagbo', 'Koffi Uriel', 'Psycho-path', '2023-08-01', 'Cocody', 'Yopougn', 'Libre', 'Chouchou des nana', 'Etre libre ', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `candidat_election`
--

CREATE TABLE `candidat_election` (
  `id_election` int(11) NOT NULL,
  `libelle_election` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `candidat_election`
--

INSERT INTO `candidat_election` (`id_election`, `libelle_election`, `description`, `date_debut`, `date_fin`) VALUES
(1, 'Présidentiel', 'Election du président ivoirien', '2023-08-01', '2023-12-22');

-- --------------------------------------------------------

--
-- Structure de la table `candidat_proposition_electoral`
--

CREATE TABLE `candidat_proposition_electoral` (
  `id_proposition_electoral` int(11) NOT NULL,
  `reponse` varchar(100) NOT NULL,
  `question_electoral_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `candidat_question_electoral`
--

CREATE TABLE `candidat_question_electoral` (
  `id_question_electoral` int(11) NOT NULL,
  `intitule_question` varchar(100) NOT NULL,
  `election_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(11, 'candidat', 'article'),
(10, 'candidat', 'candidat'),
(7, 'candidat', 'election'),
(9, 'candidat', 'proposition_electoral'),
(8, 'candidat', 'question_electoral'),
(5, 'contenttypes', 'contenttype'),
(12, 'MainApp', 'electeur'),
(27, 'MainApp', 'photo'),
(13, 'MainApp', 'type_utilisateur'),
(14, 'MainApp', 'utilisateur'),
(6, 'sessions', 'session'),
(16, 'sondages', 'proposition'),
(15, 'sondages', 'themes_cles'),
(17, 'sondages', 'vote'),
(18, 'sondages', 'zone'),
(20, 'vote', 'proposition'),
(22, 'vote', 'themes_cles'),
(21, 'vote', 'vote'),
(19, 'vote', 'zone'),
(26, 'votes', 'proposition'),
(23, 'votes', 'themes_cles'),
(24, 'votes', 'vote'),
(25, 'votes', 'zone');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-08-15 19:59:20.985817'),
(2, 'auth', '0001_initial', '2023-08-15 19:59:53.729165'),
(3, 'admin', '0001_initial', '2023-08-15 19:59:56.196773'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-08-15 19:59:56.328039'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-15 19:59:56.410665'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-08-15 19:59:57.226754'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-08-15 19:59:58.275770'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-08-15 19:59:59.005717'),
(9, 'auth', '0004_alter_user_username_opts', '2023-08-15 19:59:59.139013'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-08-15 19:59:59.870521'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-08-15 19:59:59.898230'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-08-15 19:59:59.957359'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-08-15 20:00:00.987895'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-08-15 20:00:01.370915'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-08-15 20:00:01.586659'),
(16, 'auth', '0011_update_proxy_permissions', '2023-08-15 20:00:01.670116'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-08-15 20:00:01.837245'),
(18, 'candidat', '0001_initial', '2023-08-15 20:00:05.829009'),
(19, 'sessions', '0001_initial', '2023-08-15 20:00:06.935928'),
(20, 'candidat', '0002_article', '2023-08-15 22:07:49.707671'),
(21, 'candidat', '0003_article_content', '2023-08-16 14:53:34.268877'),
(22, 'MainApp', '0001_initial', '2023-08-17 16:17:01.491702'),
(23, 'sondages', '0001_initial', '2023-08-17 17:40:39.798714'),
(24, 'vote', '0001_initial', '2023-08-17 19:02:51.622995'),
(25, 'MainApp', '0002_remove_utilisateur_login_remove_utilisateur_password_and_more', '2023-08-18 03:44:05.176268'),
(26, 'MainApp', '0003_remove_utilisateur_account_and_more', '2023-08-18 13:12:16.557770'),
(27, 'candidat', '0004_candidat_user', '2023-08-18 13:12:17.799345'),
(28, 'candidat', '0005_article_date_creation', '2023-08-19 04:13:03.418433'),
(29, 'vote', '0002_proposition_date_creation', '2023-08-19 04:13:03.853819'),
(30, 'vote', '0003_remove_themes_cles_zone', '2023-08-19 04:13:10.511704'),
(31, 'votes', '0001_initial', '2023-08-19 05:02:27.224858'),
(32, 'votes', '0002_remove_themes_cles_zone_proposition_zone', '2023-08-19 14:27:59.562390'),
(33, 'votes', '0003_alter_proposition_candidat_and_more', '2023-08-19 14:42:22.094407'),
(34, 'MainApp', '0004_photo', '2023-08-19 19:28:17.539653');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('6xkkf3sfjzbxdljng8kdq0tjkz05mjz1', '.eJxVjEsOwjAMBe-SNYpip01rluw5Q2U7CS2gROpnhbg7VOoCtm9m3ssMvK3jsC1pHqZozgbN6XcT1kcqO4h3LrdqtZZ1nsTuij3oYq81puflcP8ORl7Gbw3SA3lQRIqUBRIE59s2klDMnZfUJCUV9tQrA6LPnXOBeyFsgiKb9wfdMTfN:1qXSp3:OptRI45tCGwR4dPxpfcFhlI9wB9i6lL1-EgjX6co2CM', '2023-09-02 20:45:25.082364');

-- --------------------------------------------------------

--
-- Structure de la table `mainapp_electeur`
--

CREATE TABLE `mainapp_electeur` (
  `id_electeur` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenoms` varchar(70) NOT NULL,
  `date_naissance` date NOT NULL,
  `lieu_naissance` varchar(100) DEFAULT NULL,
  `localisation` varchar(100) NOT NULL,
  `sexe` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `mainapp_electeur`
--

INSERT INTO `mainapp_electeur` (`id_electeur`, `nom`, `prenoms`, `date_naissance`, `lieu_naissance`, `localisation`, `sexe`, `user_id`) VALUES
(1, 'Coulibaly', 'Malicl', '2023-08-09', 'Cocody', 'Cocody', 'Homme', NULL),
(2, 'Yapi', 'Sahire Guy-Michel', '2023-08-01', 'Cocody', 'Yopougon', 'Homme', 1),
(3, 'yapi', 'sahire', '2000-01-19', 'cocody', 'Yopougon', 'homme', 2);

-- --------------------------------------------------------

--
-- Structure de la table `mainapp_photo`
--

CREATE TABLE `mainapp_photo` (
  `id` bigint(20) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `mainapp_photo`
--

INSERT INTO `mainapp_photo` (`id`, `titre`, `image`) VALUES
(1, 'img1', 'images/Sassandra-Wharf-1140x713.jpg'),
(2, 'img1', 'images/Sassandra-Wharf-1140x713_bbghkyH.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `votes_proposition`
--

CREATE TABLE `votes_proposition` (
  `id_proposition` int(11) NOT NULL,
  `libelle_proposition` varchar(150) NOT NULL,
  `date_creation` datetime(6) DEFAULT NULL,
  `candidat_id` int(11) DEFAULT NULL,
  `themes_cles_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `votes_proposition`
--

INSERT INTO `votes_proposition` (`id_proposition`, `libelle_proposition`, `date_creation`, `candidat_id`, `themes_cles_id`, `zone_id`) VALUES
(77, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:48:43.058108', 1, 16, 1),
(78, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:48:49.792521', 1, 17, 1),
(79, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:48:51.954357', 1, 17, 1),
(80, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:48:56.330936', 1, 18, 1),
(81, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:48:57.782717', 1, 18, 1),
(82, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:49:02.134623', 1, 19, 1),
(83, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:49:03.794755', 1, 19, 1),
(84, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:49:09.489839', 1, 20, 1),
(85, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:49:14.348667', 1, 16, 1),
(86, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:49:15.882908', 1, 16, 1),
(87, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:50:32.754794', 1, 17, 2),
(88, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:50:39.622809', 1, 18, 2),
(89, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:50:44.318467', 1, 18, 2),
(90, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:50:49.068017', 1, 19, 2),
(91, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:50:50.809938', 1, 19, 2),
(92, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:50:52.916304', 1, 19, 2),
(93, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:04.724564', 3, 16, 3),
(94, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:07.411522', 3, 16, 3),
(95, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:12.231746', 3, 19, 3),
(96, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:14.404894', 3, 19, 3),
(97, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:19.377732', 3, 20, 3),
(98, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:21.337630', 3, 20, 3),
(99, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:31.517866', 2, 17, 3),
(100, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:33.587209', 2, 17, 3),
(101, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:39.471426', 2, 19, 3),
(102, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:41.274877', 2, 19, 3),
(103, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:47.072229', 2, 18, 3),
(104, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:48.791445', 2, 18, 3),
(105, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:56.475377', 2, 19, 2),
(106, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:51:57.968890', 2, 19, 2),
(107, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:52:06.802214', 2, 16, 2),
(108, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:52:08.457645', 2, 16, 2),
(109, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:52:20.281751', 2, 20, 2),
(110, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:52:21.843660', 2, 20, 2),
(111, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:52:23.722699', 2, 20, 2),
(112, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:52:33.252917', 2, 20, 1),
(113, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:52:37.508441', 2, 20, 1),
(114, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:52:44.192880', 2, 18, 1),
(115, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:52:46.953641', 2, 18, 1),
(116, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:52:52.136252', 2, 16, 1),
(117, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:52:54.770442', 2, 16, 1),
(118, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:52:58.007626', 2, 16, 1),
(119, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:07.554788', 2, 18, 1),
(120, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:11.305345', 2, 18, 1),
(121, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:17.464552', 3, 18, 1),
(122, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:19.571426', 3, 18, 1),
(123, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:21.989922', 3, 18, 1),
(124, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:27.136995', 3, 19, 1),
(125, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:29.069019', 3, 19, 1),
(126, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:35.729321', 3, 20, 1),
(127, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:38.102114', 3, 20, 1),
(128, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:40.583474', 3, 20, 1),
(129, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:49.462157', 3, 17, 2),
(130, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:51.192148', 3, 17, 2),
(131, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:57.068494', 3, 20, 2),
(132, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:53:58.652499', 3, 20, 2),
(133, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:54:00.412936', 3, 20, 2),
(134, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:54:18.407748', 3, 16, 2),
(135, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:54:19.933702', 3, 16, 2),
(136, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:54:31.551848', 1, 16, 3),
(137, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:54:33.703289', 1, 16, 3),
(138, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:54:38.053509', 2, 16, 3),
(139, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:54:40.158342', 2, 16, 3),
(140, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:54:45.693369', 3, 16, 3),
(141, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:54:48.968195', 3, 16, 3),
(142, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:54:54.364480', 3, 18, 3),
(143, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:54:56.050029', 3, 18, 3),
(144, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:54:58.516744', 3, 18, 3),
(145, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2023-08-19 14:55:01.523895', 3, 18, 3);

-- --------------------------------------------------------

--
-- Structure de la table `votes_themes_cles`
--

CREATE TABLE `votes_themes_cles` (
  `id_themes_cles` int(11) NOT NULL,
  `libelle_themes_cles` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `votes_themes_cles`
--

INSERT INTO `votes_themes_cles` (`id_themes_cles`, `libelle_themes_cles`) VALUES
(16, 'Sécurité'),
(17, 'Santé'),
(18, 'Education'),
(19, 'Logement'),
(20, 'Rénovation');

-- --------------------------------------------------------

--
-- Structure de la table `votes_vote`
--

CREATE TABLE `votes_vote` (
  `id_Vote` int(11) NOT NULL,
  `nature_vote` varchar(70) NOT NULL,
  `candidat_id` int(11) DEFAULT NULL,
  `electeur_id` int(11) DEFAULT NULL,
  `proposition_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `votes_vote`
--

INSERT INTO `votes_vote` (`id_Vote`, `nature_vote`, `candidat_id`, `electeur_id`, `proposition_id`, `zone_id`) VALUES
(1, 'Pour', 1, 1, 137, NULL),
(2, 'Pour', 3, 1, 97, NULL),
(3, 'contre', 2, 1, 103, NULL),
(4, 'Pour', 2, 1, 102, NULL),
(5, 'Pour', 2, 1, 101, NULL),
(6, 'Pour', 3, 1, 94, NULL),
(7, 'Pour', 2, 1, 139, NULL),
(8, 'Pour', 1, 1, 136, NULL),
(9, 'Pour', 3, 1, 140, NULL),
(10, 'Pour', 3, 1, 144, NULL),
(11, 'Pour', 3, 1, 143, NULL),
(12, 'Pour', 2, 1, 104, NULL),
(13, 'contre', 3, 1, 95, NULL),
(14, 'contre', 3, 1, 98, NULL),
(15, 'contre', 2, 1, 138, NULL),
(16, 'Pour', 2, 1, 99, NULL),
(17, 'Pour', 3, 1, 96, NULL),
(18, 'contre', 3, 1, 142, NULL),
(19, 'Pour', 2, 1, 100, NULL),
(20, 'Pour', 3, 1, 145, NULL),
(21, 'contre', 2, 1, 139, NULL),
(22, 'Pour', 2, 1, 101, NULL),
(23, 'Pour', 2, 1, 102, NULL),
(24, 'contre', 2, 1, 100, NULL),
(25, 'contre', 3, 1, 145, NULL),
(26, 'Pour', 2, 1, 103, NULL),
(27, 'Pour', 2, 1, 104, NULL),
(28, 'contre', 2, 1, 138, NULL),
(29, 'Pour', 3, 1, 94, NULL),
(30, 'Pour', 1, 1, 136, NULL),
(31, 'Pour', 3, 1, 96, NULL),
(32, 'Pour', 2, 1, 99, NULL),
(33, 'Pour', 3, 1, 97, NULL),
(34, 'contre', 1, 1, 137, NULL),
(35, 'contre', 3, 1, 98, NULL),
(36, 'contre', 3, 1, 142, NULL),
(37, 'contre', 3, 1, 144, NULL),
(38, 'contre', 3, 1, 141, NULL),
(39, 'contre', 3, 1, 95, NULL),
(40, 'contre', 3, 1, 140, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `votes_zone`
--

CREATE TABLE `votes_zone` (
  `id_zone` int(11) NOT NULL,
  `nom_zone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `votes_zone`
--

INSERT INTO `votes_zone` (`id_zone`, `nom_zone`) VALUES
(1, 'Yopougon'),
(2, 'Cocody'),
(3, 'Adjame');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `candidat_article`
--
ALTER TABLE `candidat_article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `candidat_article_candidat_id_817568ab_fk_candidat_` (`candidat_id`);

--
-- Index pour la table `candidat_candidat`
--
ALTER TABLE `candidat_candidat`
  ADD PRIMARY KEY (`id_candidat`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `candidat_candidat_election_id_c6b37d5c_fk_candidat_` (`election_id`);

--
-- Index pour la table `candidat_election`
--
ALTER TABLE `candidat_election`
  ADD PRIMARY KEY (`id_election`);

--
-- Index pour la table `candidat_proposition_electoral`
--
ALTER TABLE `candidat_proposition_electoral`
  ADD PRIMARY KEY (`id_proposition_electoral`),
  ADD KEY `candidat_proposition_question_electoral_i_60461728_fk_candidat_` (`question_electoral_id`);

--
-- Index pour la table `candidat_question_electoral`
--
ALTER TABLE `candidat_question_electoral`
  ADD PRIMARY KEY (`id_question_electoral`),
  ADD KEY `candidat_question_el_election_id_4b02e5f4_fk_candidat_` (`election_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `mainapp_electeur`
--
ALTER TABLE `mainapp_electeur`
  ADD PRIMARY KEY (`id_electeur`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Index pour la table `mainapp_photo`
--
ALTER TABLE `mainapp_photo`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `votes_proposition`
--
ALTER TABLE `votes_proposition`
  ADD PRIMARY KEY (`id_proposition`),
  ADD KEY `votes_proposition_zone_id_3a964fb1_fk_votes_zone_id_zone` (`zone_id`),
  ADD KEY `votes_proposition_candidat_id_5b881213_fk_candidat_` (`candidat_id`),
  ADD KEY `votes_proposition_themes_cles_id_92328cfe_fk_votes_the` (`themes_cles_id`);

--
-- Index pour la table `votes_themes_cles`
--
ALTER TABLE `votes_themes_cles`
  ADD PRIMARY KEY (`id_themes_cles`);

--
-- Index pour la table `votes_vote`
--
ALTER TABLE `votes_vote`
  ADD PRIMARY KEY (`id_Vote`),
  ADD KEY `votes_vote_candidat_id_c9d6ba2b_fk_candidat_candidat_id_candidat` (`candidat_id`),
  ADD KEY `votes_vote_electeur_id_057680ce_fk_MainApp_electeur_id_electeur` (`electeur_id`),
  ADD KEY `votes_vote_proposition_id_496eb8ad_fk_votes_pro` (`proposition_id`),
  ADD KEY `votes_vote_zone_id_471ef38f_fk_votes_zone_id_zone` (`zone_id`);

--
-- Index pour la table `votes_zone`
--
ALTER TABLE `votes_zone`
  ADD PRIMARY KEY (`id_zone`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `candidat_article`
--
ALTER TABLE `candidat_article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `candidat_candidat`
--
ALTER TABLE `candidat_candidat`
  MODIFY `id_candidat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `candidat_election`
--
ALTER TABLE `candidat_election`
  MODIFY `id_election` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `candidat_proposition_electoral`
--
ALTER TABLE `candidat_proposition_electoral`
  MODIFY `id_proposition_electoral` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `candidat_question_electoral`
--
ALTER TABLE `candidat_question_electoral`
  MODIFY `id_question_electoral` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `mainapp_electeur`
--
ALTER TABLE `mainapp_electeur`
  MODIFY `id_electeur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `mainapp_photo`
--
ALTER TABLE `mainapp_photo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `votes_proposition`
--
ALTER TABLE `votes_proposition`
  MODIFY `id_proposition` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT pour la table `votes_themes_cles`
--
ALTER TABLE `votes_themes_cles`
  MODIFY `id_themes_cles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `votes_vote`
--
ALTER TABLE `votes_vote`
  MODIFY `id_Vote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `votes_zone`
--
ALTER TABLE `votes_zone`
  MODIFY `id_zone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `candidat_article`
--
ALTER TABLE `candidat_article`
  ADD CONSTRAINT `candidat_article_candidat_id_817568ab_fk_candidat_` FOREIGN KEY (`candidat_id`) REFERENCES `candidat_candidat` (`id_candidat`);

--
-- Contraintes pour la table `candidat_candidat`
--
ALTER TABLE `candidat_candidat`
  ADD CONSTRAINT `candidat_candidat_election_id_c6b37d5c_fk_candidat_` FOREIGN KEY (`election_id`) REFERENCES `candidat_election` (`id_election`),
  ADD CONSTRAINT `candidat_candidat_user_id_918b66e6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `candidat_proposition_electoral`
--
ALTER TABLE `candidat_proposition_electoral`
  ADD CONSTRAINT `candidat_proposition_question_electoral_i_60461728_fk_candidat_` FOREIGN KEY (`question_electoral_id`) REFERENCES `candidat_question_electoral` (`id_question_electoral`);

--
-- Contraintes pour la table `candidat_question_electoral`
--
ALTER TABLE `candidat_question_electoral`
  ADD CONSTRAINT `candidat_question_el_election_id_4b02e5f4_fk_candidat_` FOREIGN KEY (`election_id`) REFERENCES `candidat_election` (`id_election`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `mainapp_electeur`
--
ALTER TABLE `mainapp_electeur`
  ADD CONSTRAINT `MainApp_electeur_user_id_ee2f1628_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `votes_proposition`
--
ALTER TABLE `votes_proposition`
  ADD CONSTRAINT `votes_proposition_candidat_id_5b881213_fk_candidat_` FOREIGN KEY (`candidat_id`) REFERENCES `candidat_candidat` (`id_candidat`),
  ADD CONSTRAINT `votes_proposition_themes_cles_id_92328cfe_fk_votes_the` FOREIGN KEY (`themes_cles_id`) REFERENCES `votes_themes_cles` (`id_themes_cles`),
  ADD CONSTRAINT `votes_proposition_zone_id_3a964fb1_fk_votes_zone_id_zone` FOREIGN KEY (`zone_id`) REFERENCES `votes_zone` (`id_zone`);

--
-- Contraintes pour la table `votes_vote`
--
ALTER TABLE `votes_vote`
  ADD CONSTRAINT `votes_vote_candidat_id_c9d6ba2b_fk_candidat_candidat_id_candidat` FOREIGN KEY (`candidat_id`) REFERENCES `candidat_candidat` (`id_candidat`),
  ADD CONSTRAINT `votes_vote_electeur_id_057680ce_fk_MainApp_electeur_id_electeur` FOREIGN KEY (`electeur_id`) REFERENCES `mainapp_electeur` (`id_electeur`),
  ADD CONSTRAINT `votes_vote_proposition_id_496eb8ad_fk_votes_pro` FOREIGN KEY (`proposition_id`) REFERENCES `votes_proposition` (`id_proposition`),
  ADD CONSTRAINT `votes_vote_zone_id_471ef38f_fk_votes_zone_id_zone` FOREIGN KEY (`zone_id`) REFERENCES `votes_zone` (`id_zone`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

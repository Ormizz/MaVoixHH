-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 20 août 2023 à 00:40
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 7.4.30

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

--
-- Déchargement des données de la table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'Candidat'),
(1, 'Electeur');

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
(57, 'Can add vote', 15, 'add_vote'),
(58, 'Can change vote', 15, 'change_vote'),
(59, 'Can delete vote', 15, 'delete_vote'),
(60, 'Can view vote', 15, 'view_vote'),
(61, 'Can add themes_cles', 16, 'add_themes_cles'),
(62, 'Can change themes_cles', 16, 'change_themes_cles'),
(63, 'Can delete themes_cles', 16, 'delete_themes_cles'),
(64, 'Can view themes_cles', 16, 'view_themes_cles'),
(65, 'Can add proposition', 17, 'add_proposition'),
(66, 'Can change proposition', 17, 'change_proposition'),
(67, 'Can delete proposition', 17, 'delete_proposition'),
(68, 'Can view proposition', 17, 'view_proposition'),
(69, 'Can add zone', 18, 'add_zone'),
(70, 'Can change zone', 18, 'change_zone'),
(71, 'Can delete zone', 18, 'delete_zone'),
(72, 'Can view zone', 18, 'view_zone'),
(73, 'Can add proposition', 19, 'add_proposition'),
(74, 'Can change proposition', 19, 'change_proposition'),
(75, 'Can delete proposition', 19, 'delete_proposition'),
(76, 'Can view proposition', 19, 'view_proposition'),
(77, 'Can add zone', 20, 'add_zone'),
(78, 'Can change zone', 20, 'change_zone'),
(79, 'Can delete zone', 20, 'delete_zone'),
(80, 'Can view zone', 20, 'view_zone'),
(81, 'Can add themes_cles', 21, 'add_themes_cles'),
(82, 'Can change themes_cles', 21, 'change_themes_cles'),
(83, 'Can delete themes_cles', 21, 'delete_themes_cles'),
(84, 'Can view themes_cles', 21, 'view_themes_cles'),
(85, 'Can add vote', 22, 'add_vote'),
(86, 'Can change vote', 22, 'change_vote'),
(87, 'Can delete vote', 22, 'delete_vote'),
(88, 'Can view vote', 22, 'view_vote');

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
(1, 'pbkdf2_sha256$390000$CWaDToQVR41P68cG5YPJMf$XF3RQpD2AUkMYZ5NgRM7OXqyZFwI3gCKCmzXrcxphmg=', '2023-08-19 22:29:15.316679', 1, 'TheDyy', '', '', 'urielsoro@gmail.com', 1, 1, '2023-08-17 19:52:54.000000'),
(2, 'pbkdf2_sha256$390000$J3co9W15EVjcz5vAhbv3pR$mDBFsZZdsNNmtDcN1T32yhWtNUg62afm2ueTI2z2mQE=', NULL, 0, 'Us', '', '', 'Us@gmail.com', 0, 1, '2023-08-18 00:39:10.551465'),
(3, 'pbkdf2_sha256$390000$f3N4ApF2SuemQ8NqP6V7QM$7z1VcAGw6CuPxealnDpmFpHMeP5N5ee/Bq+Whkzu4sE=', '2023-08-18 00:52:24.676628', 0, 'Ahmed', '', '', 'Ahmed@gmail.com', 0, 1, '2023-08-18 00:52:10.965951'),
(4, 'pbkdf2_sha256$390000$kJmq3ZsX42DNmAA19jTvoy$J6xQ6gIZoVktRz1sWU0QeMDnw+5/O8gh3YwOrSx3K1w=', NULL, 0, 'Yapi', '', '', 'Yapi@gmail.com', 0, 1, '2023-08-19 18:59:05.947561'),
(5, 'pbkdf2_sha256$600000$ZL5vytMY9dADmyH6lq8qId$tLA/cdWEtOlfvSd3oDllwVZfl4gCg237b9DLpnxQcAg=', NULL, 0, 'sahire', '', '', 'michelyapi225@gmail.com', 0, 1, '2023-08-19 16:15:43.764472'),
(7, 'pbkdf2_sha256$390000$TuuyA5TB6NOacL3931gpUo$CfEe1D34qpkM3RIPdY5x16xVu3jfoCw1l9FFxi8SX5A=', '2023-08-19 22:36:34.232514', 0, 'bas', '', '', 'bas@gmail.com', 0, 1, '2023-08-19 22:36:24.043958');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 2),
(2, 4, 1),
(3, 7, 1);

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
(1, 'Les pains en Côte D\'Ivoire', 1, 'Hausse des prix de façon de incontrôlées', '2023-08-19 00:04:49.966552'),
(2, 'Second post', 1, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi ', '2023-08-19 00:04:49.966552'),
(3, 'La guerre Ukraine', 1, 'Russie contre le monde', '2023-08-19 00:04:49.966552'),
(4, 'Soumanleh', 3, 'Medho Medho tu connais', '2023-08-19 00:04:49.966552'),
(5, 'Otimounin', 3, 'Suspect Himra Syndicat sans machette', '2023-08-19 00:04:49.966552'),
(8, 'La vie est cher', 3, 'allons voler les blanc ils ont beaucoup d\'argent', '2023-08-19 04:13:02.816660'),
(9, 'Le pain en CI', 3, 'C\'est devenue trop cher et je ne comprend pas', '2023-08-19 04:13:02.816660'),
(10, 'dada', 1, 'dada', '2023-08-19 19:57:08.953059');

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
(1, 'Soro', 'Katchi Dioba Chris Uriel', 'DUCKS', '2023-08-11', 'Bingerville', 'Abidjan', 'Independant', 'SORO Katchi Uriel, souvent désigné sous ses initiales « ADO », né le 1ᵉʳ janvier 1942 à Dimbokro, en Côte d\'Ivoire, est un homme d\'État ivoirien. Il est président de la république de Côte d’Ivoire depuis le 6 mai 2011.', 'President', 1, 1),
(3, 'Silue', 'Ahmed', 'SA', '2023-08-04', 'Bingerville', 'Bingerville', 'Independant', 'C\'est une juste une bio', 'motivateddd', 1, 3);

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
(1, 'Ele', 'Municipale', '2023-08-01', '2023-08-16');

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

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-08-17 19:57:16.357287', '1', 'Utilisateur:1 TheDyy', 1, '[{\"added\": {}}]', 14, 1),
(2, '2023-08-17 20:52:16.429810', '1', 'Electeur', 1, '[{\"added\": {}}]', 3, 1),
(3, '2023-08-17 20:52:48.600378', '2', 'Candiddat', 1, '[{\"added\": {}}]', 3, 1),
(4, '2023-08-19 16:13:08.906931', '1', 'TheDyy', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(5, '2023-08-19 16:32:35.234723', '2', 'Candidat', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1);

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
(13, 'MainApp', 'type_utilisateur'),
(14, 'MainApp', 'utilisateur'),
(6, 'sessions', 'session'),
(17, 'vote', 'proposition'),
(16, 'vote', 'themes_cles'),
(15, 'vote', 'vote'),
(18, 'vote', 'zone'),
(19, 'votes', 'proposition'),
(21, 'votes', 'themes_cles'),
(22, 'votes', 'vote'),
(20, 'votes', 'zone');

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
(1, 'contenttypes', '0001_initial', '2023-08-15 22:27:01.035321'),
(2, 'auth', '0001_initial', '2023-08-15 22:27:01.837601'),
(3, 'admin', '0001_initial', '2023-08-15 22:27:02.001967'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-08-15 22:27:02.027145'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-15 22:27:02.042728'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-08-15 22:27:02.121459'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-08-15 22:27:02.200926'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-08-15 22:27:02.236537'),
(9, 'auth', '0004_alter_user_username_opts', '2023-08-15 22:27:02.247097'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-08-15 22:27:02.310052'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-08-15 22:27:02.325673'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-08-15 22:27:02.345106'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-08-15 22:27:02.385643'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-08-15 22:27:02.420903'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-08-15 22:27:02.452839'),
(16, 'auth', '0011_update_proxy_permissions', '2023-08-15 22:27:02.468813'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-08-15 22:27:02.506479'),
(18, 'candidat', '0001_initial', '2023-08-15 22:27:02.888145'),
(19, 'candidat', '0002_article', '2023-08-15 22:27:03.006702'),
(20, 'sessions', '0001_initial', '2023-08-15 22:27:03.088302'),
(21, 'candidat', '0003_article_content', '2023-08-15 22:35:25.582803'),
(22, 'MainApp', '0001_initial', '2023-08-17 18:04:31.032940'),
(23, 'MainApp', '0002_remove_utilisateur_login_remove_utilisateur_password_and_more', '2023-08-17 18:04:31.174776'),
(24, 'MainApp', '0003_remove_utilisateur_account_and_more', '2023-08-18 00:42:32.975788'),
(25, 'candidat', '0004_candidat_user', '2023-08-18 00:42:33.123213'),
(26, 'vote', '0001_initial', '2023-08-18 13:40:47.502467'),
(27, 'candidat', '0005_article_date_creation', '2023-08-19 00:04:50.028586'),
(28, 'vote', '0002_proposition_date_creation', '2023-08-19 00:04:50.090054'),
(29, 'vote', '0003_remove_themes_cles_zone', '2023-08-19 01:41:17.730831'),
(30, 'votes', '0001_initial', '2023-08-19 13:16:18.280277'),
(31, 'votes', '0002_remove_themes_cles_zone_proposition_zone', '2023-08-19 20:18:24.306726'),
(32, 'votes', '0003_alter_proposition_candidat_and_more', '2023-08-19 20:18:26.645054');

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
('pp3eolw1lpg4v3e17g4q9y5zyxnvbthd', '.eJxVjDsOwjAQBe_iGlne-E9Jzxmsza6DA8iW4qRC3B0ipYD2zcx7iYTbWtLW85JmFmfhxel3G5Eeue6A71hvTVKr6zKPclfkQbu8Ns7Py-H-HRTs5VsTgAlx4mBQGR4HG9iydx5ZoVWotWGPkTIisIaJdRxMth5cyACOSLw_6OM3-w:1qXUYc:a0V-BMD6epIwSxZ6-X0au-BR6tKtmrA6f7oNJVIrwfw', '2023-09-02 22:36:34.232514'),
('qvaqjqv1bbrx8ghx2agvpuz2guu7xmtw', '.eJxVjMsOwiAQRf-FtSFlGGjHpXu_gTA8pGogKe3K-O_apAvd3nPOfQnnt7W4rafFzVGchRKn3419eKS6g3j39dZkaHVdZpa7Ig_a5bXF9Lwc7t9B8b18a2sIxjFaSBqHgDQwTtZbBMwUALSalEbPQBGJlTbZGA4hEVkCsJnF-wOqhjbC:1qXPIo:Vl5xT9zHpv8TEuYv8-VkK9r4GwEBxYUwB56Li8kIe54', '2023-09-02 16:59:54.865144');

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
(1, 'Monkey', 'D Chris', '2023-08-16', 'Cocody', 'Bingerville', 'Masculin', NULL),
(2, 'Silue', 'Ahmed', '2023-08-01', 'Bingerville', 'Bingerville', 'Masculin', 3),
(3, 'Yapi', 'Sahire', '2002-07-12', 'Songon', 'Yopougon', 'Masculin', 4),
(4, 'bas', 'bas', '2023-08-17', 'bas', 'bas', 'Masculin', 7);

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
(1, 'Pain beurre', '2023-08-19 13:20:15.819369', 1, 1, NULL),
(2, 'Pain Pate', '2023-08-19 13:20:48.004669', 1, 1, NULL),
(3, 'pain condiment', '2023-08-19 13:20:58.572230', 1, 1, NULL),
(4, 'a', '2023-08-19 13:21:09.976598', 1, 1, NULL),
(5, 'z', '2023-08-19 13:21:14.569130', 1, 1, NULL),
(6, 'a', '2023-08-19 13:22:03.469385', 1, 2, NULL),
(7, 'q', '2023-08-19 13:22:08.255793', 1, 2, NULL),
(8, 's', '2023-08-19 13:22:14.013100', 1, 2, NULL),
(9, 'd', '2023-08-19 13:22:18.055850', 1, 2, NULL),
(10, 'f', '2023-08-19 13:22:27.860274', 1, 2, NULL),
(11, 'p', '2023-08-19 13:22:35.922429', 1, 3, NULL),
(12, 'o', '2023-08-19 13:22:40.997123', 1, 3, NULL),
(13, 'Je souhaite faire de grandes choses', '2023-08-19 20:24:40.859659', 1, 1, NULL);

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
(1, 'Un thème'),
(2, 'Deux thèmes'),
(3, 'Trois thèmes'),
(4, 'Quatre thèmes'),
(5, 'Cinq thèmes'),
(6, 'Six thèmes');

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
(3, 'Bingerville');

-- --------------------------------------------------------

--
-- Structure de la table `vote_proposition`
--

CREATE TABLE `vote_proposition` (
  `id_proposition` int(11) NOT NULL,
  `libelle_proposition` varchar(150) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `themes_cles_id` int(11) NOT NULL,
  `date_creation` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vote_proposition`
--

INSERT INTO `vote_proposition` (`id_proposition`, `libelle_proposition`, `candidat_id`, `themes_cles_id`, `date_creation`) VALUES
(1, 'Construire 12 écoles dans la region de Djiberoi', 1, 5, '2023-08-19 03:48:04.000000');

-- --------------------------------------------------------

--
-- Structure de la table `vote_themes_cles`
--

CREATE TABLE `vote_themes_cles` (
  `id_themes_cles` int(11) NOT NULL,
  `libelle_themes_cles` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vote_themes_cles`
--

INSERT INTO `vote_themes_cles` (`id_themes_cles`, `libelle_themes_cles`) VALUES
(1, 'Écologie'),
(2, 'Sécurité'),
(3, 'Mobilités'),
(4, 'Urbanisme'),
(5, 'École'),
(6, 'Santé');

-- --------------------------------------------------------

--
-- Structure de la table `vote_vote`
--

CREATE TABLE `vote_vote` (
  `id_Vote` int(11) NOT NULL,
  `nature_vote` varchar(70) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `electeur_id` int(11) NOT NULL,
  `proposition_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vote_zone`
--

CREATE TABLE `vote_zone` (
  `id_zone` int(11) NOT NULL,
  `nom_zone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Index pour la table `vote_proposition`
--
ALTER TABLE `vote_proposition`
  ADD PRIMARY KEY (`id_proposition`),
  ADD KEY `vote_proposition_themes_cles_id_525f1c97_fk_vote_them` (`themes_cles_id`),
  ADD KEY `vote_proposition_candidat_id_308086a6_fk_candidat_` (`candidat_id`);

--
-- Index pour la table `vote_themes_cles`
--
ALTER TABLE `vote_themes_cles`
  ADD PRIMARY KEY (`id_themes_cles`);

--
-- Index pour la table `vote_vote`
--
ALTER TABLE `vote_vote`
  ADD PRIMARY KEY (`id_Vote`),
  ADD KEY `vote_vote_candidat_id_50ace8ba_fk_candidat_candidat_id_candidat` (`candidat_id`),
  ADD KEY `vote_vote_electeur_id_e552bb0d_fk_MainApp_electeur_id_electeur` (`electeur_id`),
  ADD KEY `vote_vote_proposition_id_7fd63f96_fk_vote_prop` (`proposition_id`),
  ADD KEY `vote_vote_zone_id_574c1b7f_fk_vote_zone_id_zone` (`zone_id`);

--
-- Index pour la table `vote_zone`
--
ALTER TABLE `vote_zone`
  ADD PRIMARY KEY (`id_zone`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `candidat_article`
--
ALTER TABLE `candidat_article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `mainapp_electeur`
--
ALTER TABLE `mainapp_electeur`
  MODIFY `id_electeur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `votes_proposition`
--
ALTER TABLE `votes_proposition`
  MODIFY `id_proposition` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `votes_themes_cles`
--
ALTER TABLE `votes_themes_cles`
  MODIFY `id_themes_cles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `votes_vote`
--
ALTER TABLE `votes_vote`
  MODIFY `id_Vote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `votes_zone`
--
ALTER TABLE `votes_zone`
  MODIFY `id_zone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `vote_proposition`
--
ALTER TABLE `vote_proposition`
  MODIFY `id_proposition` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `vote_themes_cles`
--
ALTER TABLE `vote_themes_cles`
  MODIFY `id_themes_cles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `vote_vote`
--
ALTER TABLE `vote_vote`
  MODIFY `id_Vote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vote_zone`
--
ALTER TABLE `vote_zone`
  MODIFY `id_zone` int(11) NOT NULL AUTO_INCREMENT;

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

--
-- Contraintes pour la table `vote_proposition`
--
ALTER TABLE `vote_proposition`
  ADD CONSTRAINT `vote_proposition_candidat_id_308086a6_fk_candidat_` FOREIGN KEY (`candidat_id`) REFERENCES `candidat_candidat` (`id_candidat`),
  ADD CONSTRAINT `vote_proposition_themes_cles_id_525f1c97_fk_vote_them` FOREIGN KEY (`themes_cles_id`) REFERENCES `vote_themes_cles` (`id_themes_cles`);

--
-- Contraintes pour la table `vote_vote`
--
ALTER TABLE `vote_vote`
  ADD CONSTRAINT `vote_vote_candidat_id_50ace8ba_fk_candidat_candidat_id_candidat` FOREIGN KEY (`candidat_id`) REFERENCES `candidat_candidat` (`id_candidat`),
  ADD CONSTRAINT `vote_vote_electeur_id_e552bb0d_fk_MainApp_electeur_id_electeur` FOREIGN KEY (`electeur_id`) REFERENCES `mainapp_electeur` (`id_electeur`),
  ADD CONSTRAINT `vote_vote_proposition_id_7fd63f96_fk_vote_prop` FOREIGN KEY (`proposition_id`) REFERENCES `vote_proposition` (`id_proposition`),
  ADD CONSTRAINT `vote_vote_zone_id_574c1b7f_fk_vote_zone_id_zone` FOREIGN KEY (`zone_id`) REFERENCES `vote_zone` (`id_zone`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

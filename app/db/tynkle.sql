-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 03 mars 2021 à 17:53
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tynkle`
--
CREATE DATABASE IF NOT EXISTS `tynkle` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tynkle`;

-- --------------------------------------------------------

--
-- Structure de la table `asks`
--

CREATE TABLE `asks` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `object` varchar(255) NOT NULL,
  `content` tinytext NOT NULL,
  `amount` double NOT NULL,
  `is_viewed` tinyint(1) NOT NULL DEFAULT 0,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `breakdown_categories`
--

CREATE TABLE `breakdown_categories` (
  `id` int(11) NOT NULL,
  `id_platform` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` tinytext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `breakdown_categories`
--

INSERT INTO `breakdown_categories` (`id`, `id_platform`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dépanner mon PC/ MAC', 'Eum in deserunt nisi aliquid quia. Aliquam autem consequatur cumque aliquid exercitationem atque. Quia sunt ad velit dolorem. Ipsum quae minus quibusdam quia.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(2, 1, 'Faire évoluer mon matériel', 'Quia praesentium ab consequuntur beatae nam architecto accusamus. Natus ut aut et quod nobis facere. Et officiis magni sunt autem iure ipsum qui. Autem possimus non culpa molestias nobis temporibus.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(3, 1, 'Installer un logiciel', 'Voluptas et aut omnis non doloremque. Minima nihil illo ipsa earum reiciendis. Dolores amet eius illo. Enim temporibus qui est unde placeat quidem.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(4, 1, 'Aide à l\'utilisation', 'Dolore enim assumenda velit veniam quam ducimus. Quae dignissimos pariatur error recusandae molestiae iste. Est ipsum occaecati aperiam animi ut blanditiis laborum.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(5, 2, 'Dépanner mon smartphone', 'Expedita excepturi iusto ut recusandae saepe. Vel tempore eius consequatur consequatur nam doloribus. Illum pariatur tempore tempore et. Ut sequi in earum sit ullam molestiae.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(6, 2, 'Depanner ma tablette', 'Ex repellat inventore a voluptatem dolor velit non. Nulla non sint nostrum temporibus ea. Sunt perferendis nostrum aut et. Voluptas sequi aut facere. Autem ducimus reiciendis id et quam ducimus sunt.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(7, 2, 'Changer une pièce', 'Et voluptatem aut fugiat. Officiis ducimus et ratione laudantium eaque eveniet nobis. Tempora in ea sed beatae nostrum eum quas.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(8, 2, 'Aide à l\'utilisation', 'Cumque ipsum sit cumque quibusdam. Corrupti cum quaerat non voluptas. Enim perspiciatis voluptas ea rem.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(9, 3, 'Installation box internet', 'Velit laboriosam voluptates dolor necessitatibus dolorum. Facere est voluptates et doloribus enim numquam. Quidem modi laborum at veritatis blanditiis in consectetur. Sed est quo esse fugiat maxime.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(10, 3, 'Connecter mes appareils', 'Vitae reiciendis quibusdam earum assumenda. In ut et voluptas aliquid sit quisquam et. Labore provident iure autem vel minus nisi ut ut.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(11, 3, 'Dépanner ma connexion internet', 'Sit rem repudiandae repellendus doloribus amet eaque nostrum. Tenetur architecto ut facere eveniet corrupti. Dolorum vitae et omnis.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(12, 3, 'Aide à l\'utilisation', 'Quia non aut cum id suscipit culpa. A rerum ab quidem beatae. Ea animi qui ut animi distinctio accusamus sed. Ut veniam rerum et nam ipsa quo.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(13, 4, 'Installation gros/petit électroménager', 'Est quod aut voluptatum repellat quia deleniti. Error enim quia unde molestiae. Dolore et qui ea sit.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(14, 4, 'Réparation / entretien petit électroménager', 'A recusandae tenetur debitis et. Ut non autem odio alias. Quis rerum placeat sit ducimus deleniti rerum ipsum. A natus iusto temporibus provident vitae.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(15, 4, 'Réparation / entretien gros électroménager', 'Quis mollitia modi adipisci nulla est natus. Explicabo unde voluptas reprehenderit aspernatur consequatur aliquam. Dolore voluptatibus et molestiae est explicabo voluptas praesentium.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(16, 5, 'Réparer / configurer ma playstation', 'Asperiores cum consequuntur praesentium magni eveniet ad maxime adipisci. Consequuntur officiis eum omnis et nisi debitis. Nostrum dolore voluptatem est quis autem aspernatur asperiores.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(17, 5, 'Réparer / configurer ma xBox', 'Qui necessitatibus aut sint et ut. Est et necessitatibus quisquam illo. Rerum commodi nulla autem sit voluptatum et porro quibusdam.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(18, 5, 'Réparer / configurer ma Nintendo Switch', 'Vel inventore consequuntur fugiat aliquid excepturi in ducimus. Nisi ducimus maiores voluptatem consectetur maiores quibusdam et excepturi. Fugiat ullam iusto magnam temporibus aut.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(19, 5, 'Autres consoles', 'Eligendi recusandae sit accusamus ipsam id. Consequatur nemo aliquid odit ut fugiat. Perspiciatis voluptatem ut doloremque hic voluptas aperiam aut. Ipsa placeat occaecati labore placeat.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(20, 6, 'Depanner/installer ma TV', 'Doloribus tenetur ex ut earum. Labore autem repellat aut modi ipsa. Corrupti quis excepturi excepturi ut molestias et. Quis a officia possimus. Eveniet a debitis quasi enim.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(21, 6, 'Depanner/installer mon système audio', 'Impedit rerum exercitationem aperiam odio autem eum voluptate. Eum est porro cum nam et similique. Maxime est molestiae eum ea temporibus.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(22, 6, 'Depanner/installer mon lecteur vidéo', 'Labore ea ipsum aut est dolores est. Vero est laboriosam culpa aliquid. Neque harum possimus aut suscipit atque doloremque deleniti quaerat. Assumenda dolor rerum pariatur deserunt necessitatibus.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(23, 6, 'Aide à l\'utilisation', 'Autem nostrum nostrum a odit voluptate. Facere ut et repellat cum fuga deserunt. Omnis praesentium qui aut incidunt temporibus.', '2021-03-02 09:25:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chats`
--

INSERT INTO `chats` (`id`, `created_at`, `updated_at`) VALUES
(1, '2021-03-03 16:36:48', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `chat_users`
--

CREATE TABLE `chat_users` (
  `id` int(11) NOT NULL,
  `id_chat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chat_users`
--

INSERT INTO `chat_users` (`id`, `id_chat`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 1, 68, '2021-03-03 16:36:48', '0000-00-00 00:00:00'),
(2, 1, 102, '2021-03-03 16:36:48', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_chat` int(11) NOT NULL,
  `content` tinytext NOT NULL,
  `ressource_link` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `id_user`, `id_chat`, `content`, `ressource_link`, `created_at`, `updated_at`) VALUES
(1, 102, 1, 'ouiach gros', NULL, '2021-03-03 16:36:48', '0000-00-00 00:00:00'),
(2, 102, 1, 'ouaich', NULL, '2021-03-03 16:41:08', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `metadatas`
--

CREATE TABLE `metadatas` (
  `id` int(11) NOT NULL,
  `id_page` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `metadatas`
--

INSERT INTO `metadatas` (`id`, `id_page`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 3, 'Tynkle: S\'inscrire', 'Tynkle: rejoindre la communauté Tynkle ?', '2021-02-23 14:43:04', '2021-02-23 16:14:50'),
(2, 2, 'Tynkle: Mon compte', '', '2021-02-23 14:46:37', '2021-02-23 16:33:15'),
(3, 1, 'test', 'test', '2021-02-23 16:45:52', '0000-00-00 00:00:00'),
(4, 8, 'Tynkle c\'est génial', '', '2021-02-23 16:46:18', '0000-00-00 00:00:00'),
(5, 9, '', '', '2021-02-23 17:15:49', '0000-00-00 00:00:00'),
(6, 10, '', '', '2021-02-23 17:15:50', '0000-00-00 00:00:00'),
(7, 4, '', '', '2021-02-23 17:15:52', '0000-00-00 00:00:00'),
(8, 5, '', '', '2021-02-23 17:15:52', '0000-00-00 00:00:00'),
(9, 6, '', '', '2021-02-23 17:15:56', '0000-00-00 00:00:00'),
(10, 7, '', '', '2021-02-23 17:15:57', '0000-00-00 00:00:00'),
(11, 11, '', '', '2021-02-23 17:15:59', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `object` varchar(255) NOT NULL,
  `content` tinytext NOT NULL,
  `amount` double NOT NULL,
  `is_declined` tinyint(1) NOT NULL DEFAULT 0,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `offers`
--

INSERT INTO `offers` (`id`, `id_user`, `id_post`, `object`, `content`, `amount`, `is_declined`, `is_accepted`, `created_at`, `updated_at`) VALUES
(1, 57, 94, 'offfre n° 0', 'Iure et natus ut iure fugit animi vitae. Voluptas odit optio voluptate est dicta non aut. Eos aut minus pariatur vero et.', 133, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(2, 9, 88, 'offfre n° 1', 'Optio facere sequi pariatur voluptas ea. At et qui qui quae fugit neque. Modi rerum voluptatibus quis eveniet dolores et. Est voluptatum eligendi temporibus ut sunt.', 837, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(3, 10, 26, 'offfre n° 2', 'Molestias aut qui reiciendis nisi. Et quae accusamus error ullam et officia rerum. Eius eveniet eligendi voluptatem maiores ratione qui.', 179, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(4, 20, 51, 'offfre n° 3', 'Velit culpa velit est. Sint veritatis et consequuntur blanditiis veritatis sequi voluptatem.', 738, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(5, 67, 31, 'offfre n° 4', 'Tempore vitae sit aspernatur amet laudantium sint dolore. Minus laboriosam impedit hic qui eius corrupti.', 643, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(6, 88, 87, 'offfre n° 5', 'Molestiae sed rerum enim sed blanditiis eos libero. Eos vitae provident in dolorum nostrum qui.', 119, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(7, 86, 55, 'offfre n° 6', 'Consequatur sunt dolores quisquam ullam odio nemo. Cum neque nihil reiciendis aspernatur. Sapiente earum necessitatibus optio quod veniam qui a voluptate.', 844, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(8, 92, 17, 'offfre n° 7', 'Ea aliquid dolor doloremque non similique ea et. Laboriosam sit quia hic commodi neque. Soluta rerum nihil pariatur. Autem minima id nobis repellat odio qui beatae.', 351, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(9, 26, 33, 'offfre n° 8', 'Ducimus facere a tempore necessitatibus incidunt. Enim sapiente nobis rerum totam nesciunt qui. Impedit ullam iusto dicta ab. Iusto iure et expedita aliquid aspernatur.', 626, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(10, 58, 53, 'offfre n° 9', 'Explicabo nihil veniam et. Iste qui excepturi quo aut ipsum. Porro vero porro officiis. Numquam quia aspernatur quo.', 690, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(11, 32, 58, 'offfre n° 10', 'Iusto pariatur facilis voluptas aut est perspiciatis. Mollitia similique velit porro accusantium aut. Rerum deserunt explicabo repudiandae excepturi ut provident.', 879, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(12, 53, 58, 'offfre n° 11', 'Cupiditate laborum quia illum doloribus id deserunt ex. Explicabo quae maiores sunt amet dolor et perferendis. Ratione ab quis neque incidunt ut et.', 111, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(13, 19, 95, 'offfre n° 12', 'Amet natus deserunt accusamus exercitationem ducimus modi alias. Aperiam alias dolores aut nostrum sed commodi dolorum. Eum officia et quis quos. Voluptatem ut amet dignissimos omnis doloribus iste.', 764, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(14, 60, 22, 'offfre n° 13', 'Rerum a quod similique id omnis. Ratione aliquam assumenda ullam voluptas quaerat non. Libero et est magni. Natus officia corporis et dolorem.', 749, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(15, 55, 100, 'offfre n° 14', 'Quibusdam perspiciatis sapiente nihil qui quis omnis iusto. Nam beatae voluptatem accusantium veritatis totam corrupti ad. Et quis ipsam unde quis porro amet minus et.', 558, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(16, 51, 98, 'offfre n° 15', 'Aut quia aut nesciunt eligendi repellat eaque. Iusto et consequatur laboriosam. Aut animi excepturi hic.', 969, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(17, 70, 29, 'offfre n° 16', 'Accusamus excepturi voluptatem maiores velit. Et ut tenetur est dolorem quod iure voluptas. Sed minus facilis minima excepturi vitae. Cumque in sapiente aut non minus dicta ad repellendus.', 113, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(18, 60, 88, 'offfre n° 17', 'Iure ea quos et harum sed. Architecto sed aspernatur veniam mollitia dignissimos molestiae molestiae. Hic in dolorum adipisci vel.', 153, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(19, 18, 39, 'offfre n° 18', 'Ex consequatur et libero. Hic minus aut incidunt mollitia earum. Rerum consequuntur numquam amet numquam illum et. Illo ea adipisci velit voluptatem quis architecto error ut.', 707, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(20, 30, 15, 'offfre n° 19', 'Omnis aperiam sint libero suscipit dolorum expedita. Aut eum voluptas enim itaque. Aut blanditiis at officiis aliquam voluptatum reiciendis esse.', 491, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(21, 53, 75, 'offfre n° 20', 'Nostrum nulla maiores quae. Reiciendis sint ipsa explicabo non sunt est. Quos cum fuga incidunt voluptate quo.', 503, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(22, 73, 70, 'offfre n° 21', 'Aut magni voluptas aut sit ut. Et et maiores repellendus minus aut. Dolorem minima quidem eligendi.', 674, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(23, 39, 62, 'offfre n° 22', 'Corporis officia rerum iusto sequi qui et est occaecati. Possimus fuga accusamus ratione. Quaerat harum est perferendis asperiores.', 299, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(24, 1, 77, 'offfre n° 23', 'Soluta qui sed tenetur ullam quae voluptas maiores. Ullam ut labore non ut quia corrupti dolores. Velit amet ut magnam dolor in rerum qui officiis.', 727, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(25, 76, 94, 'offfre n° 24', 'Ut maxime tempora eligendi est doloribus amet pariatur alias. Necessitatibus omnis dolores perferendis alias dolor. Aut alias quo quam itaque ex. Deleniti consequatur est quibusdam dolore dolor.', 452, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(26, 57, 25, 'offfre n° 25', 'In possimus sit doloribus at. Iusto et qui sed iure. Eius est in id eum quae. Veniam id sit libero ad sunt.', 997, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(27, 77, 23, 'offfre n° 26', 'Et ex est officiis qui eligendi. Distinctio consequatur culpa nam et et enim inventore rerum. Qui repellendus cum odit voluptas iusto alias autem.', 488, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(28, 34, 89, 'offfre n° 27', 'Earum et libero eos velit et. Officiis qui perspiciatis nemo optio sunt maxime voluptatibus. Enim quia nihil nihil. Distinctio et quibusdam architecto aut quaerat.', 757, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(29, 2, 25, 'offfre n° 28', 'Amet voluptas nostrum exercitationem recusandae in iste est. Ex dolorum consequatur qui ut. Ab sit itaque consequuntur ut qui perferendis.', 828, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(30, 61, 88, 'offfre n° 29', 'Consequatur facilis est aut nesciunt labore sit. Ipsam sed reprehenderit magni neque est illo. Dolores eius necessitatibus sed asperiores commodi. Aliquid id et soluta alias officia.', 699, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(31, 79, 89, 'offfre n° 30', 'Aliquam similique tenetur officia beatae mollitia. Harum cum quia iusto aut ullam illo voluptatem. Quis magni ut et nulla laborum facere maiores deserunt. Ad repudiandae voluptatum optio veritatis.', 174, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(32, 79, 67, 'offfre n° 31', 'Ullam quae sed id error. Necessitatibus libero sit aut aperiam iste dolor quidem. Et velit ipsam veniam qui facere sed. Libero dolorem est nesciunt quam inventore.', 350, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(33, 71, 42, 'offfre n° 32', 'Minus quaerat eum ipsam. Quia sed maiores voluptatem praesentium non. Aliquam fugiat modi ducimus quia nobis dignissimos molestiae. Qui ab tempore commodi et. Quidem fuga consectetur saepe suscipit.', 650, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(34, 67, 29, 'offfre n° 33', 'Numquam laudantium placeat et ut aut et saepe. Eaque qui et quo sint eius voluptatem et. Omnis accusamus ratione ratione fugit corporis repudiandae ea.', 559, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(35, 7, 60, 'offfre n° 34', 'Quia minima accusamus optio totam neque ut nulla. Assumenda amet illum nisi a sunt et. Nihil eos minima commodi animi deserunt. Est officia sed tenetur nemo.', 933, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(36, 25, 61, 'offfre n° 35', 'Assumenda aut molestias quod reiciendis labore ea sit. Dicta eveniet assumenda omnis enim. Mollitia ex consequuntur commodi sit occaecati ipsum.', 766, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(37, 97, 49, 'offfre n° 36', 'Consequuntur nobis quaerat impedit totam. Illo commodi quidem magnam voluptas. Nulla suscipit laborum quae optio. Eos et qui corporis et rerum quo quis.', 199, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(38, 22, 89, 'offfre n° 37', 'Modi cumque officia officia repellendus ut quia. Est aut fugiat vero pariatur. Nostrum cupiditate explicabo corporis consequatur. Est est placeat minima et sint nisi cum pariatur.', 387, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(39, 64, 97, 'offfre n° 38', 'Exercitationem esse odio dolores et. Omnis voluptas laborum aut aut. Voluptates reiciendis deleniti voluptatibus consequuntur.', 564, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(40, 63, 25, 'offfre n° 39', 'Quia et sit maiores quo enim. Sapiente laudantium id repudiandae qui reiciendis error. Molestiae dolor distinctio totam occaecati ad dolorem et.', 37, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(41, 46, 63, 'offfre n° 40', 'Vero excepturi voluptas natus quas. Ut hic enim eos quis eum. Esse animi iusto vero laudantium. Fuga beatae voluptas reiciendis aut beatae quis.', 410, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(42, 83, 22, 'offfre n° 41', 'Ex voluptatum et provident quos est quibusdam ut sequi. Qui consectetur ea facilis dignissimos unde. Similique doloribus quis quia asperiores. Praesentium vel dolores corrupti impedit praesentium.', 670, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(43, 80, 74, 'offfre n° 42', 'Hic quia ducimus enim praesentium rem magnam error. Dolores delectus veniam nulla. Dolore praesentium molestias laudantium excepturi molestiae. Dolores sed aut deserunt et.', 314, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(44, 24, 84, 'offfre n° 43', 'Quaerat impedit tenetur aut vel reprehenderit ut asperiores. Dolorem in esse ipsum quia nisi ut. Aut ut animi vel consequatur mollitia quasi.', 667, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(45, 28, 73, 'offfre n° 44', 'In temporibus adipisci sint aut eligendi mollitia. Voluptatem et ea sunt totam. Incidunt deleniti ducimus qui dolores reiciendis. Omnis ea vel culpa maxime et. Aperiam soluta dolore vel iure.', 270, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(46, 50, 88, 'offfre n° 45', 'Inventore maxime doloremque sit quae a maiores. Aspernatur harum corporis distinctio omnis odio. Soluta deleniti veritatis quas id animi adipisci.', 134, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(47, 90, 88, 'offfre n° 46', 'Repudiandae dolor et quis natus est. Nisi tempore dolorum ut ex. Recusandae necessitatibus aliquam voluptas sunt consectetur placeat aperiam voluptatem. Nostrum porro laborum qui quia corporis qui.', 134, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(48, 27, 66, 'offfre n° 47', 'Sint sit harum sunt necessitatibus neque. Quod illum et molestias sunt voluptas hic aspernatur. Dolor consectetur consequatur aut et eum et.', 770, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(49, 7, 9, 'offfre n° 48', 'Molestias ut non nihil sint sed. Corporis optio velit expedita iste voluptas molestias ut. Optio et quis reprehenderit quam.', 521, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(50, 42, 22, 'offfre n° 49', 'Fugit non quae molestiae in nulla. Sit commodi sunt necessitatibus commodi aut qui. Hic impedit nihil debitis delectus sunt voluptas molestiae quae. Quasi error et rerum.', 612, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(51, 5, 96, 'offfre n° 50', 'Ipsa impedit delectus accusantium aliquam. Perferendis rem distinctio at eaque. Quis quo minus sit possimus molestias minus et. Similique similique quod provident provident.', 568, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(52, 15, 95, 'offfre n° 51', 'Non perferendis unde incidunt eius molestias. Aut debitis qui et dolorum. Nisi aut itaque quisquam eveniet.', 279, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(53, 13, 11, 'offfre n° 52', 'Magnam eaque non aliquam optio. Non magni numquam animi necessitatibus et sit illum. Et atque quos quia eum. Minima nulla cum qui in in asperiores. A dolorum illo autem.', 127, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(54, 52, 68, 'offfre n° 53', 'Esse ratione modi voluptas aliquam ducimus porro. Est doloribus ut facere aut eos quis. Dolor et rerum praesentium enim commodi dolor est sequi. Deleniti iusto dolore tenetur aspernatur hic et.', 847, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(55, 60, 29, 'offfre n° 54', 'Cum minus reiciendis dolorem laborum ut omnis optio tempora. Aut accusantium ut repellendus. Totam explicabo est et ipsum.', 640, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(56, 49, 34, 'offfre n° 55', 'Ut molestiae eligendi qui aperiam ut. Natus quisquam et laboriosam ducimus labore quo.', 260, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(57, 63, 7, 'offfre n° 56', 'Est et excepturi impedit eveniet. Ut quia sed veniam commodi assumenda iusto. Quo soluta maxime ut perspiciatis. Recusandae est vel id aut. Porro sed ratione dolorem quis.', 482, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(58, 77, 2, 'offfre n° 57', 'Nihil velit omnis aperiam itaque in. Aut omnis explicabo rerum aut. Assumenda voluptatem est quas reprehenderit totam quam.', 830, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(59, 51, 86, 'offfre n° 58', 'Blanditiis similique ut voluptas et rem. Sunt molestiae nobis quia ut sunt. Laboriosam sit necessitatibus ea reiciendis aut sed qui.', 516, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(60, 33, 64, 'offfre n° 59', 'Sit perspiciatis sequi dicta unde praesentium et repellendus. Optio aut ut inventore quam. Necessitatibus sequi autem voluptatem molestias.', 977, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(61, 11, 97, 'offfre n° 60', 'Quo in eveniet quia. Mollitia quo eveniet iste consequatur et porro expedita. Et omnis et libero nihil magnam laborum.', 303, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(62, 30, 63, 'offfre n° 61', 'Debitis ipsa enim a. Itaque et sit voluptatem sed fugit nobis. Consequatur distinctio et ipsa minus. Quidem magnam in sit. Illo voluptatem ratione aut aliquid tenetur laboriosam.', 128, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(63, 18, 66, 'offfre n° 62', 'Sint voluptatem quia quia reprehenderit non dolorum nihil. Perspiciatis minus at enim. Similique ipsum fugiat vitae provident vero. Numquam natus aliquid aut voluptas placeat quis.', 975, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(64, 40, 89, 'offfre n° 63', 'Voluptatem vitae sit est eum id provident quos. Nam possimus neque qui iste et ab aut.', 838, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(65, 1, 1, 'offfre n° 64', 'Cupiditate molestiae quibusdam placeat est. Ipsa modi et vitae tempore aperiam ad nam. Nobis exercitationem excepturi labore distinctio repellat distinctio.', 891, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(66, 51, 93, 'offfre n° 65', 'Laboriosam enim quaerat debitis. Quia porro debitis similique fugit ipsum. Ut non architecto ducimus accusantium delectus accusantium eos. Quia deserunt voluptatem nihil aliquam eos.', 472, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(67, 69, 46, 'offfre n° 66', 'Dignissimos aperiam corrupti voluptate hic pariatur. Accusamus nesciunt id qui accusamus nulla. Suscipit optio repudiandae repellat eaque dolore incidunt. Repellat cum laboriosam unde.', 547, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(68, 98, 14, 'offfre n° 67', 'Autem aliquam est non quaerat molestiae soluta dolorem. Mollitia dignissimos voluptatem repellendus doloribus eum. Aperiam similique facere voluptatem. Nisi enim ab cum rerum.', 606, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(69, 15, 73, 'offfre n° 68', 'Nam aliquam ut vero autem ab laudantium. Accusantium sint quis deserunt debitis necessitatibus. Quasi beatae cupiditate voluptas voluptatem saepe quasi. Ratione quia ut voluptas ut.', 253, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(70, 76, 20, 'offfre n° 69', 'Dolor ut temporibus error aliquid et. Minus modi magni dolorem cupiditate. Provident quidem adipisci impedit quod debitis iure iure. Et qui culpa eligendi molestias amet sit et.', 716, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(71, 81, 67, 'offfre n° 70', 'Qui ad sint modi eos. Ut commodi eos aliquam tempora et doloribus hic eos. Reprehenderit veniam quod perspiciatis quasi.', 131, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(72, 35, 99, 'offfre n° 71', 'Qui esse id impedit aspernatur iusto sapiente omnis. Et dicta eius et sed excepturi et necessitatibus nobis. Et recusandae quibusdam et enim repellendus.', 525, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(73, 93, 83, 'offfre n° 72', 'Necessitatibus consequuntur illo voluptatum. Id aut id occaecati voluptatibus excepturi animi dicta. Omnis reiciendis velit voluptatem doloremque minima autem.', 130, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(74, 3, 27, 'offfre n° 73', 'Pariatur aliquid sit necessitatibus eveniet alias. Blanditiis rerum dolorem sint ab commodi blanditiis qui. Itaque est dolores et doloribus laborum quia nostrum. Necessitatibus qui numquam et itaque.', 856, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(75, 83, 68, 'offfre n° 74', 'Assumenda aspernatur qui pariatur quibusdam. Voluptas soluta veniam consequuntur ea et corporis odit.', 770, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(76, 23, 71, 'offfre n° 75', 'Nihil modi quis totam. Vitae maxime iusto consequatur soluta nihil molestiae. Veniam illum et dignissimos nam possimus. Et ab et fuga voluptatum id et autem. Eum quasi excepturi qui eum expedita.', 971, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(77, 20, 82, 'offfre n° 76', 'Et expedita doloribus blanditiis ut nam. Et harum perferendis aut fuga soluta velit vero. Ratione ut eos quia id exercitationem voluptatem veritatis. Qui accusamus voluptatem aut rerum earum.', 549, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(78, 58, 87, 'offfre n° 77', 'Quae quos nemo ut repellat. Porro ipsum veniam commodi libero voluptas id. Reiciendis deleniti voluptas totam. Illo ut nostrum unde magnam accusamus similique.', 168, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(79, 78, 65, 'offfre n° 78', 'Id saepe explicabo dolorum. Et eligendi nesciunt quibusdam qui rem. Veniam neque non nesciunt sint recusandae veritatis et.', 275, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(80, 37, 88, 'offfre n° 79', 'Hic qui maxime ea ea. Voluptas quisquam sed alias et. Explicabo ut minima beatae et quaerat odio. Sed voluptatem nulla ut voluptates nobis fugit et. Quod id aut explicabo animi ullam voluptas nam.', 655, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(81, 79, 3, 'offfre n° 80', 'Eos et et beatae qui dolores nihil numquam. Dicta maxime iste id atque beatae. Nemo nulla omnis placeat.', 56, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(82, 23, 36, 'offfre n° 81', 'Voluptas vel dolor dolorem quam. Voluptatum sunt quo voluptatem fugit fugiat. Dolor eaque quis voluptatem rerum voluptatem. Nobis voluptates quae quisquam esse deleniti voluptatum.', 296, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(83, 54, 12, 'offfre n° 82', 'Aliquid harum error corporis sunt non. Voluptatem perspiciatis qui commodi qui. Quia ea quidem delectus tempore ut id.', 992, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(84, 95, 12, 'offfre n° 83', 'Consectetur minus exercitationem minus. Soluta eum dignissimos et eos itaque voluptatibus nemo. Sunt fugit eum porro perspiciatis facilis.', 705, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(85, 58, 47, 'offfre n° 84', 'Doloribus ipsum quia non praesentium aut aliquid laboriosam. Id porro voluptate accusamus qui eaque aliquam.', 681, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(86, 76, 50, 'offfre n° 85', 'Aut est quo ut odit. Omnis est et ea quibusdam ipsam et architecto. Maiores quos consectetur rerum.', 96, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(87, 91, 16, 'offfre n° 86', 'Quam et at animi vero sequi. Et molestiae impedit ut aperiam ut. Velit consectetur et rem et est corporis dolores.', 150, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(88, 90, 46, 'offfre n° 87', 'Deserunt neque commodi cum vitae consequatur. In sunt dolorem distinctio molestiae. Consequatur et explicabo est harum. Sint natus dolor sint deserunt recusandae ab.', 509, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(89, 99, 14, 'offfre n° 88', 'Amet et labore dignissimos iure eveniet aperiam. Odio ducimus nihil non a adipisci veritatis ad. Veniam omnis et nesciunt blanditiis.', 79, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(90, 29, 100, 'offfre n° 89', 'Quisquam molestiae hic et. Voluptatum et sit in eum natus. Ab aut facere labore corporis dignissimos hic quos. Excepturi non voluptatem facilis eum.', 887, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(91, 64, 52, 'offfre n° 90', 'Repudiandae voluptatibus unde dolores nihil accusantium corrupti quasi. Voluptatem ut et quia exercitationem voluptas. Placeat non enim autem maiores. Inventore ea hic ut fugit mollitia qui ullam.', 940, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(92, 30, 91, 'offfre n° 91', 'Est aut consequatur sit quas voluptatibus fugit nemo temporibus. Odit quisquam aut optio voluptatum ipsum. Iusto accusamus facere qui qui.', 371, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(93, 28, 63, 'offfre n° 92', 'Maiores saepe corrupti ipsam sed sed. Qui quidem in maxime doloremque esse eveniet. Harum nam aut modi dicta autem ut.', 184, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(94, 9, 80, 'offfre n° 93', 'Vitae ea explicabo odit quae deleniti iste. Ut provident sapiente qui voluptas. Dolor fugit sequi ea aut aut eos deserunt ad. Autem corporis mollitia ut unde.', 831, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(95, 83, 36, 'offfre n° 94', 'Sed perspiciatis voluptatem ad laborum ipsa. Quibusdam eum consectetur placeat id. Quis voluptatem aut quia enim et velit maiores. Veniam dolorem repellat placeat molestiae architecto eum.', 505, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(96, 98, 75, 'offfre n° 95', 'Id rerum non vel est. Ipsum debitis sint rerum unde aliquam. Rerum possimus neque exercitationem sapiente enim culpa. Minima quod fugit quo nihil.', 614, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(97, 82, 57, 'offfre n° 96', 'Odio quia et reiciendis eos dolorum deserunt iusto. Vel ex et rerum labore voluptas dolore esse. Corrupti corporis sed at nostrum voluptas sit impedit.', 985, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(98, 58, 75, 'offfre n° 97', 'Et labore rerum perspiciatis facilis nihil. Atque ut dolor qui ut nulla modi aut facilis. Eos inventore dolores optio dicta quibusdam. Voluptate velit aliquam quaerat magni.', 536, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(99, 35, 39, 'offfre n° 98', 'Veritatis voluptatibus vero unde iste omnis commodi nihil. Quis pariatur molestiae iure assumenda sed quas repellat.', 579, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(100, 90, 2, 'offfre n° 99', 'Neque unde repellat similique libero impedit. Distinctio sed dolorum minima laborum. Et ex ipsum quis quisquam cum nesciunt perferendis voluptates. Eaque voluptates et qui debitis impedit et.', 949, 0, 0, '2021-03-02 09:25:29', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `id_page_group` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `id_page_group`, `name`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'users#show', NULL, '2021-02-23 13:51:12', '2021-02-26 08:58:10'),
(2, 1, 'users#edit', NULL, '2021-02-23 13:51:20', '2021-02-26 08:58:10'),
(3, 1, 'users#new', NULL, '2021-02-23 13:51:57', '2021-02-26 08:58:10'),
(4, 4, 'posts#new', NULL, '2021-02-23 13:53:10', '2021-02-26 08:58:10'),
(5, 4, 'posts#edit', NULL, '2021-02-23 13:53:19', '2021-02-26 08:58:10'),
(6, 4, 'posts#show', NULL, '2021-02-23 13:53:26', '2021-02-26 08:58:10'),
(7, 4, 'posts#index', NULL, '2021-02-23 13:53:34', '2021-02-26 08:58:10'),
(8, 5, 'home#index', NULL, '2021-02-23 14:53:47', '0000-00-00 00:00:00'),
(9, 3, 'chat#index', NULL, '2021-02-23 14:55:13', '2021-02-26 08:58:10'),
(10, 3, 'chat#show', NULL, '2021-02-23 14:55:25', '2021-02-26 08:58:10'),
(11, 6, 'activity#index', NULL, '2021-02-23 14:58:37', '0000-00-00 00:00:00'),
(12, 2, 'admin#platform', NULL, '2021-02-24 07:59:42', '0000-00-00 00:00:00'),
(13, 2, 'admin#insights', NULL, '2021-02-24 07:59:55', '0000-00-00 00:00:00'),
(14, 2, 'admin#users', NULL, '2021-02-25 11:37:51', '0000-00-00 00:00:00'),
(15, 7, 'sessions#new', NULL, '2021-02-25 14:52:21', '0000-00-00 00:00:00'),
(16, 8, 'warnings#index', NULL, '2021-02-26 13:47:32', '0000-00-00 00:00:00'),
(17, 1, 'users#reset_password', NULL, '2021-03-02 11:11:01', '0000-00-00 00:00:00'),
(18, 1, 'users#ask_new_password', NULL, '2021-03-02 11:36:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `page_group`
--

CREATE TABLE `page_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `page_group`
--

INSERT INTO `page_group` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'utilisateur', '2021-02-23 13:49:37', '0000-00-00 00:00:00'),
(2, 'administrateur', '2021-02-23 13:49:52', '0000-00-00 00:00:00'),
(3, 'chat', '2021-02-23 13:50:08', '0000-00-00 00:00:00'),
(4, 'publications', '2021-02-23 13:50:27', '0000-00-00 00:00:00'),
(5, 'accueil', '2021-02-23 14:53:31', '2021-02-23 14:57:43'),
(6, 'activité', '2021-02-23 14:57:55', '0000-00-00 00:00:00'),
(7, 'sessions', '2021-02-25 14:51:50', '0000-00-00 00:00:00'),
(8, 'warnings', '2021-02-26 13:47:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `platforms`
--

CREATE TABLE `platforms` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` tinytext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `platforms`
--

INSERT INTO `platforms` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Informatique', 'Nihil alias harum non reiciendis exercitationem natus eum. Laboriosam quis reprehenderit nam impedit dolore laudantium. Rerum quo vel numquam voluptatem modi.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(2, 'Smartphone/tablette', 'Et numquam hic ut et. Velit dicta excepturi unde et. Soluta ipsum recusandae nostrum consectetur. Est in culpa laboriosam repellat consequatur ipsam similique.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(3, 'Reseau', 'Quae ut ea et eligendi sequi. Aut vero temporibus consequatur qui. Praesentium et perspiciatis vero voluptatem laborum libero dicta.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(4, 'Electroménager', 'Qui fuga et aut non id incidunt sit autem. Ut eos repellat eos necessitatibus aut aspernatur. Autem hic aut et id. Reiciendis rerum vel qui dignissimos reprehenderit.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(5, 'Console de jeux', 'Voluptas nobis alias accusantium omnis delectus. Veritatis ut alias aperiam facilis officiis.', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(6, 'Tv/multimédia', 'Officia nobis quia numquam odit sit eum hic. Et eos id aperiam est vel facilis. Consequatur laudantium natus quas qui sed ut minima.', '2021-03-02 09:25:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_breakdown_category` int(11) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '"[]"' CHECK (json_valid(`images`)),
  `cover_image` varchar(255) DEFAULT NULL,
  `is_solved` tinyint(1) NOT NULL DEFAULT 0,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `budget` double NOT NULL DEFAULT 10.5,
  `city` varchar(55) NOT NULL,
  `postal_code` varchar(25) NOT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `id_user`, `id_breakdown_category`, `images`, `cover_image`, `is_solved`, `title`, `content`, `budget`, `city`, `postal_code`, `lat`, `lng`, `created_at`, `updated_at`) VALUES
(1, 12, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 0', 'Id tempore autem sit beatae hic excepturi et. Modi qui quisquam id vitae debitis qui. Fuga nesciunt recusandae consequatur adipisci temporibus. Ut eos quasi numquam et incidunt.', 443, 'Port Archibald', '32480-6658', -73.538603, 130.593452, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(2, 36, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 1', 'Impedit ex tenetur voluptas impedit. Molestiae est voluptatum suscipit nam. Ipsa error reiciendis sit a. Id deserunt autem ex molestiae ut voluptatem cum.', 384, 'North Tristian', '92229', -9.187383, 52.275885, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(3, 34, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 2', 'Id cum doloribus molestiae sed. Veniam quae repellat deserunt eos. Et et quod et maiores qui reiciendis.', 751, 'Lake Scotty', '55638-2226', 21.927447, -101.349093, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(4, 5, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 3', 'At impedit magni quam officiis porro est. Possimus consequatur sapiente omnis cumque omnis et. Iste quaerat nesciunt impedit iusto incidunt.', 962, 'East Cynthiaborough', '16761-4061', -45.004011, 143.674311, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(5, 25, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 4', 'Ab officiis error odit impedit nostrum. Maxime et consequatur officiis voluptatibus minus non. Voluptates tempora dicta odio unde nam maiores aut.', 279, 'Olaberg', '67368', 45.893241, -82.216754, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(6, 100, 21, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 5', 'Sit expedita id optio id alias ut id. Aut excepturi voluptate dolor voluptas autem inventore optio. Inventore porro quasi dolorem. Sint perspiciatis numquam atque voluptas ut.', 928, 'Margaritahaven', '37258', 50.217997, 83.022855, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(7, 30, 13, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 6', 'Voluptatem quia eos sit rerum. Voluptates quo consequatur dolorem esse nobis. Omnis earum rerum aspernatur officiis est consequuntur.', 771, 'Blickview', '08213', 58.913497, -0.196344, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(8, 92, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 7', 'Rerum veritatis libero consequatur velit. Architecto amet rerum et beatae tenetur asperiores. Similique quis nemo assumenda. Consequatur et quia iusto suscipit non natus.', 88, 'Lake Keven', '90068', 83.566566, 166.527796, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(9, 80, 20, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 8', 'Rerum et adipisci aut. Consequatur modi est dolores. Eveniet nisi quas eum omnis repudiandae sunt. Facilis veniam quia totam autem cupiditate adipisci. Totam vero saepe qui blanditiis quam qui nihil.', 737, 'Herzogburgh', '75996-6173', -51.31886, 112.716706, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(10, 87, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 9', 'Eaque odio quam repellendus accusantium rerum aut. Voluptatibus officiis ut id ab voluptas et facilis reprehenderit. Magnam blanditiis dolore laboriosam ut magnam.', 954, 'Osinskiside', '07476-5852', -0.587633, -63.224728, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(11, 80, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 10', 'Eveniet quaerat asperiores alias rerum in illo suscipit eveniet. Fuga in adipisci id tempora. Totam molestiae ullam rerum perspiciatis nulla.', 563, 'Port Josiahberg', '74658-2583', 43.598175, 49.197497, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(12, 66, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 11', 'Hic ut incidunt porro et occaecati quia. Temporibus pariatur quia placeat sunt. Et minima distinctio error aliquam. Ullam veritatis cumque est sed autem accusamus quas praesentium.', 861, 'Conroystad', '13967', -57.191206, 173.916026, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(13, 95, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 12', 'Et qui quo enim. Dicta suscipit iste aut ut rerum. Quas aut est dicta recusandae voluptatem ducimus.', 579, 'South Kacie', '31156-8125', -69.438255, -89.908353, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(14, 95, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 13', 'Vel eum fugit quia sint debitis. Voluptatem neque exercitationem aut repellendus consequatur consequatur quis. Consectetur quasi in nihil harum in id. Autem eum cum et sapiente et et sed magni.', 704, 'New Norris', '90723', 49.106347, -43.023077, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(15, 91, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 14', 'Quibusdam aut nesciunt sunt laudantium. Aut nemo eum aut et sit assumenda. Fugit possimus numquam iusto qui.', 693, 'Durwardfort', '14358', 30.851432, -41.801688, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(16, 90, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 15', 'Veritatis cupiditate atque sint ea at nisi accusamus. Et ut ratione dolorum nemo quo. Voluptatem enim esse ipsum est.', 39, 'Daughertystad', '90952-2464', 52.112787, 121.563167, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(17, 88, 17, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 16', 'Cum dolor nihil eligendi veritatis et dignissimos. Ea numquam eum doloremque alias ipsum sed dolorem aut. Dolores suscipit dolorem ea voluptas in veniam.', 565, 'New Maryjaneland', '34649', -58.641259, 54.300734, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(18, 34, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 17', 'Occaecati beatae recusandae quasi sequi velit dolores qui. Aut quos harum aut tempora assumenda magni ea. Alias nostrum ab dolor consequuntur.', 903, 'Rethashire', '72284-5690', 51.598207, 17.035004, '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(19, 52, 17, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 18', 'Esse sed et quaerat quia et voluptatum. Iure enim sint qui temporibus quis. Reiciendis voluptatum et enim occaecati. Quis impedit sed nulla cupiditate.', 969, 'Lake Darien', '47245', 83.980765, -143.577198, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(20, 4, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 19', 'Et alias debitis facilis corrupti et ut. Itaque cupiditate porro adipisci mollitia cumque sequi.', 370, 'West Benfort', '74992-9374', 31.439682, 102.787304, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(21, 45, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 20', 'Consequatur in nostrum vero. Et ex reiciendis sed. Sint repellat sit distinctio quidem ut reprehenderit. Fugiat atque deserunt fugit. Et quia ut perferendis laudantium.', 11, 'Port Lenora', '46508-6243', 64.667056, 156.357431, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(22, 77, 19, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 21', 'Officia nulla voluptates blanditiis fugit sed doloribus autem. Illum nihil id laboriosam. Culpa neque ipsa suscipit dolorem. Sit assumenda iste laborum dicta. Tempora quod explicabo nemo velit.', 375, 'Port Tommie', '73417', -8.488499, -158.97205, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(23, 32, 9, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 22', 'Voluptas omnis amet voluptates laudantium temporibus est. Eligendi dolor velit rerum quis enim repudiandae non. Rerum voluptatem consequatur eligendi dicta laudantium et et.', 320, 'Odafurt', '13675-6770', 14.588039, 100.677944, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(24, 89, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 23', 'Quasi minima quasi sint magnam quia. Voluptas veniam a quasi dolores. Asperiores quod qui id molestiae est cum dolorem. Sed ad dolor eum ut nam.', 694, 'Madisonshire', '90606-4522', 42.676896, 19.901584, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(25, 67, 13, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 24', 'Dolorum veniam dolorem eum et eos nulla. Aut et omnis sed provident assumenda iure quia. Nesciunt ab animi sequi aliquid id. Ratione perferendis est non impedit ut vel.', 932, 'Port Stacyside', '48534-7530', 2.49855, 25.814972, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(26, 91, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 25', 'Sit sapiente dolorem saepe in repellendus accusamus. Similique sed eius dolores. Aperiam harum odio sed ea harum nemo officiis.', 300, 'Cummeratahaven', '13814-9786', 86.103498, -64.287562, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(27, 52, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 26', 'Praesentium aut dicta ipsum in mollitia. Dignissimos tempora fuga earum et cum laudantium pariatur. Distinctio quos modi possimus quidem odit voluptatibus. Porro quibusdam incidunt qui nihil.', 575, 'Lake Celia', '14609-0075', -45.037942, -124.058409, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(28, 68, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 27', 'Odio ut quasi est aut sapiente et. Ut animi corrupti minus velit odio ut enim. Aut expedita repellendus aspernatur.', 378, 'Alessialand', '78509-2113', 42.606239, -171.470704, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(29, 76, 6, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 28', 'Et est reiciendis sequi aut ut modi eos quod. Voluptates quos consequatur excepturi maiores veritatis et qui vitae. Architecto rem nobis quasi distinctio ea est. Numquam occaecati sed odio sed dicta.', 106, 'Adriannaburgh', '16708-1472', -79.388196, 174.825345, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(30, 60, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 29', 'Soluta qui provident est ut repellat. Quidem rerum eum sit dolor. Ipsam nisi nemo sint enim. Dolores dolorem vitae ex perferendis quia.', 245, 'Dustinside', '67544-2636', 61.311747, 104.030059, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(31, 62, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 30', 'Maiores ratione amet sunt eius qui. Maxime deserunt voluptatum ut aliquam qui omnis totam. Suscipit aliquam ab iste quia fuga unde illo.', 221, 'Murazikfort', '09360-4686', -48.372988, 70.539309, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(32, 84, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 31', 'Aperiam fugiat ipsam eius adipisci earum nesciunt labore recusandae. Aut incidunt velit dolorum repudiandae corrupti. Aut voluptate beatae ut dolorem tempora.', 224, 'South Luz', '39841-2457', -11.991742, 13.689434, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(33, 55, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 32', 'Impedit expedita modi dolor voluptatem. Necessitatibus enim distinctio aliquid et. Illum est autem fuga non.', 459, 'South Brooke', '53800-4131', 29.960812, -160.776156, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(34, 82, 19, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 33', 'Minus aut rerum qui molestias expedita. Totam consequatur impedit enim qui dolorem. Qui praesentium quaerat delectus voluptatibus ducimus.', 98, 'Arvelside', '29448', 7.408953, 90.73223, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(35, 100, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 34', 'Tempore debitis illo inventore sit quisquam. Qui suscipit autem quas eos esse. Aliquam similique omnis magnam delectus tempora fuga.', 388, 'Abshirebury', '15484', 7.52727, 82.425469, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(36, 35, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 35', 'Cum quae veritatis ducimus non. Quia non ab ea doloribus. Natus qui officia quam ipsa.', 790, 'Bellestad', '34387-1623', 42.695696, 174.02613, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(37, 38, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 36', 'Consectetur quidem fuga nam adipisci nisi id. Consequatur atque voluptates unde eius. Pariatur itaque mollitia occaecati molestiae. Fugiat excepturi quam laudantium recusandae sed modi dolore.', 305, 'Kossside', '97560', -26.68578, 137.268357, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(38, 68, 6, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 37', 'Totam dolores odio rerum dolorem quia ratione cupiditate. Id blanditiis exercitationem dolores sunt unde placeat. Vitae beatae eum quo nihil.', 690, 'Lake Elwinside', '86031-1844', 12.889402, 108.160027, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(39, 84, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 38', 'Voluptas deleniti et voluptatum. Recusandae et placeat voluptatem explicabo similique cumque. Quidem et id magnam occaecati. Dolorum reprehenderit et voluptatum voluptatum non voluptate.', 600, 'Port Martaton', '48608', -6.714365, 133.134856, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(40, 79, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 39', 'Mollitia qui odio maiores qui itaque. Sequi explicabo laborum est voluptate atque provident. Sapiente eligendi fugiat quas sit voluptatem magnam nobis. Non ut odit quis repellat alias.', 46, 'East Kristy', '26186-6583', -35.882151, 176.325505, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(41, 47, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 40', 'Quos explicabo aliquid eos placeat voluptatibus natus dolor. Explicabo corporis minima sequi minima dolores harum.', 212, 'East Kamronhaven', '27263-0224', -9.744647, -1.462382, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(42, 37, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 41', 'Nam sit atque facere magnam. Est dolore nesciunt eaque esse. Nam itaque laborum qui voluptatem. Quia quas tempora quia tempore atque quo.', 424, 'East Patienceburgh', '01962-8620', 81.13138, 127.771101, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(43, 63, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 42', 'Sunt cupiditate voluptates dolore blanditiis magnam voluptas sed. Fugiat aut voluptate culpa cupiditate. Ut quis veniam ad assumenda quos autem saepe tempora.', 388, 'Adeliafurt', '81716-8196', -43.494085, 127.586806, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(44, 91, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 43', 'Nemo magni aut qui perspiciatis. Ut placeat quia qui rerum maiores dolore sit. Modi in hic quia provident et sunt.', 297, 'Walterport', '63462', 36.065813, -57.153633, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(45, 68, 20, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 44', 'Et quos dolorum libero laboriosam. Sint ut ullam facere deserunt beatae aut itaque delectus. Voluptas praesentium voluptatibus occaecati assumenda dolores a. Quod beatae enim odit.', 9, 'Elmorehaven', '84540-8843', -75.608528, 122.929845, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(46, 55, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 45', 'Sunt deleniti nobis iste. Et at animi amet sit. Est expedita repudiandae repudiandae provident.', 8, 'Calebmouth', '65073', 44.19052, 177.818519, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(47, 78, 6, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 46', 'Totam itaque veniam et saepe officia sed modi sunt. Est rerum deserunt blanditiis pariatur rerum sint omnis. Nihil aspernatur non fugiat sint modi.', 489, 'Jonesville', '62186', -17.05082, 126.209777, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(48, 22, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 47', 'Sit ex harum soluta et quia aspernatur ut. Iure tempore perferendis eius doloremque ex. Aut architecto beatae quod sit doloribus nulla deleniti.', 991, 'West Sheilamouth', '54620', -21.92474, -104.809495, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(49, 38, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 48', 'Voluptatem libero quia dolorem est. Consectetur consequatur quia consectetur aliquam voluptatum. Vel et recusandae nesciunt ut ipsam deleniti.', 720, 'Marcellustown', '65282', -57.101841, -10.402418, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(50, 75, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 49', 'Voluptate eligendi repellendus non modi et. Eligendi delectus sed labore aliquam alias.', 208, 'South Marcelina', '21376', -37.147785, 52.177578, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(51, 79, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 50', 'Eaque corrupti ea modi non. Deleniti cum reiciendis laudantium sint.', 819, 'New Domenick', '75024', 77.356739, 179.559939, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(52, 17, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 51', 'Ratione necessitatibus commodi laudantium qui eveniet ratione cumque consequatur. Inventore neque facere et laudantium inventore eos soluta. Earum consequatur voluptatum illo architecto dicta et.', 469, 'North Ansleyview', '26962-3143', 67.01247, -94.409944, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(53, 66, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 52', 'Et reprehenderit qui iste. Nihil sunt magnam et voluptas. Aliquam dolorem nobis sed quibusdam molestias eaque. Quam suscipit ut minima ea expedita.', 956, 'Durganfort', '54787-9523', 88.197869, -163.926754, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(54, 22, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 53', 'Dolorem ut illo iure culpa. Et assumenda aut nesciunt beatae numquam. Voluptas eaque in ratione esse inventore error suscipit.', 599, 'New Cortez', '40991', 82.057883, -19.377853, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(55, 72, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 54', 'Autem eaque eveniet aut qui corporis enim minus. Praesentium impedit autem et eos sunt sint aut. Quo omnis qui non beatae fugit.', 873, 'West Jessica', '65573-8305', 24.042457, 169.664164, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(56, 33, 2, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 55', 'Veritatis eveniet ut et. Quas aut et id minima quis. Molestias et esse molestiae sint sit voluptatum nulla odit.', 91, 'Port Narcisomouth', '81026-1992', -86.212433, 143.87239, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(57, 44, 13, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 56', 'Ad porro voluptatem id aut corrupti qui. Magni labore ut ipsa incidunt est ut sint. Hic omnis occaecati ab iure dolor sequi. Corrupti commodi quia facilis repudiandae praesentium nisi est.', 186, 'New Golden', '99905', -75.579389, -10.034077, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(58, 14, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 57', 'Aut voluptas suscipit possimus quis repellat. Nam molestiae a ipsam magni voluptatem. Eos ipsa vitae atque. Sequi quibusdam nostrum quo eaque cumque id. Aut natus vel minima id.', 568, 'Ellaton', '93513-9626', 82.225338, 82.514835, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(59, 40, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 58', 'At esse rem eum exercitationem. Autem et magnam mollitia aut eveniet a dolor dolores.', 435, 'Dickenschester', '57422-5311', -34.912206, 144.113946, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(60, 35, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 59', 'Et nam nesciunt animi nihil. Voluptatem deserunt impedit molestiae alias temporibus. Eum maxime perferendis adipisci soluta culpa repudiandae at enim.', 246, 'Johnsonshire', '52213-5048', 15.813202, -124.355667, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(61, 33, 19, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 60', 'Maxime molestiae quam veniam fugit corrupti sunt omnis et. Itaque quos quas eveniet corporis et. Doloremque quis sed et. Et tempore dolorum dolores qui quia.', 862, 'West Raoul', '15078', -16.042107, 42.569714, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(62, 25, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 61', 'Officiis vel rerum temporibus repellat adipisci. Cum aliquid officiis et. Corrupti veritatis laborum at sit amet fuga earum.', 860, 'Jakubowskihaven', '24051-1244', -49.890718, -24.780802, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(63, 91, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 62', 'Et voluptates autem excepturi. Ex sed deleniti eius magni consequuntur. Quis animi corporis quam veniam rerum. Qui tenetur cupiditate ut mollitia quia.', 279, 'Hermistontown', '34966', -44.551855, -141.816533, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(64, 66, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 63', 'Occaecati laudantium rerum minima facere facere quibusdam. Fugit consequatur nihil nihil error. Illo autem quam facilis rem magnam.', 663, 'North Ivahmouth', '66061', -31.739171, 77.52405, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(65, 36, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 64', 'Et expedita minus molestias aut recusandae. Quidem quam rerum explicabo laborum. Ipsa itaque esse molestiae aut. Necessitatibus iste natus autem totam quis.', 605, 'Stantonbury', '02777', 79.107909, 1.512943, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(66, 96, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 65', 'Nostrum rem est natus rerum commodi. Facilis ut non perferendis et qui non laborum vel. Qui earum quaerat eos necessitatibus. Ut atque neque fugit iusto voluptates non.', 563, 'Reaganberg', '18615-2763', 47.723066, -6.540783, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(67, 63, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 66', 'Blanditiis explicabo aut quisquam velit quis veritatis dicta. Qui hic perspiciatis dicta quia magni quae aut dolorum. Impedit qui atque ratione voluptas architecto.', 207, 'Lake Wilberfort', '87732-0240', 62.928575, 43.179182, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(68, 7, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 67', 'Deserunt est nam asperiores perspiciatis quia. Ut voluptate deleniti est delectus. Quod dolores repellat alias tempora et quas repellendus amet. Iusto sit possimus sint veritatis ad.', 385, 'New Flavio', '08445', -85.294486, 72.07981, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(69, 86, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 68', 'Odit quia magnam ut impedit officia eaque. Id quo iste id quia.', 4, 'Schaeferberg', '68443', 48.899652, 113.498578, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(70, 80, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 69', 'Qui molestiae quibusdam ut sint fugiat et aut. Sint quia aut fuga nisi qui enim.', 840, 'Schaefertown', '13331', -77.621757, 52.814075, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(71, 38, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 70', 'Veritatis atque distinctio quae et beatae sit maiores. Accusantium rerum laudantium explicabo labore dicta. Repellat ut culpa omnis alias distinctio reprehenderit nihil.', 142, 'North Araceli', '77065-6637', -26.076696, -158.770426, '2021-03-02 09:25:28', '0000-00-00 00:00:00');
INSERT INTO `posts` (`id`, `id_user`, `id_breakdown_category`, `images`, `cover_image`, `is_solved`, `title`, `content`, `budget`, `city`, `postal_code`, `lat`, `lng`, `created_at`, `updated_at`) VALUES
(72, 53, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 71', 'Nisi perspiciatis est quia. Ducimus illo veniam aut. Magnam id repudiandae a pariatur.', 709, 'O\'Haraberg', '69005-7763', -13.921639, -99.651763, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(73, 64, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 72', 'Quia corporis laboriosam dolore similique. Sunt deleniti quia exercitationem molestiae et rem aut. Ad porro repudiandae autem hic.', 496, 'Lake Felicita', '42040-5489', 37.546988, -106.477284, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(74, 88, 6, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 73', 'Enim aliquid dolores rerum adipisci. Doloremque beatae in doloremque est iste fugit a. Quibusdam a laborum ad sed. Harum inventore voluptatem nostrum voluptatum possimus.', 471, 'New Rebekahland', '18701-8600', 38.145707, 2.713349, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(75, 52, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 74', 'Quod voluptas quisquam labore qui dolorum optio autem harum. Quo et tempore soluta sint.', 943, 'Morissettehaven', '83450', -76.978875, 175.348011, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(76, 62, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 75', 'Et officiis iste numquam quas. Facere et tenetur quod eligendi. Est repudiandae qui et qui. Iure ipsa sed ullam ducimus provident similique laudantium quia.', 960, 'Lake Jordynchester', '29318', 10.395602, -50.419045, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(77, 67, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 76', 'Inventore autem corporis officia harum exercitationem in provident. Et totam aut nobis qui. Tenetur corrupti magni exercitationem omnis magnam. In molestias repudiandae veritatis ea.', 78, 'East Vedamouth', '65646-3239', 17.109205, -21.762403, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(78, 68, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 77', 'Magni aspernatur eveniet labore ut unde tempora. Iure autem laboriosam numquam eum eos nostrum. Consequuntur quae ipsam amet dolor. Et in impedit voluptas.', 405, 'Altenwerthmouth', '58557', 89.499972, 17.747176, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(79, 63, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 78', 'Sed optio numquam commodi. Sit a harum qui. Voluptas quisquam voluptatibus in odit debitis. Ut eos eum rerum dolorum illum.', 965, 'Brakusshire', '78121-8998', -35.959272, -126.35052, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(80, 72, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 79', 'Et ut ut dolor et sequi totam. Dolor provident exercitationem voluptas cum quia. Voluptatibus aut et ut porro animi.', 649, 'Rosalindashire', '12409-7086', -44.575094, -62.538339, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(81, 66, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 80', 'Voluptate ipsum adipisci quia repellendus optio. Error alias ipsa a. Aliquam velit consequatur eaque dolore illo rerum. Soluta dolor necessitatibus dolores placeat.', 541, 'Murielshire', '24352', -66.724879, 23.705258, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(82, 56, 2, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 81', 'Sed eum pariatur facilis qui nulla. Voluptate ipsam suscipit neque corrupti dolor quasi laudantium quos.', 550, 'Millsfurt', '95200-3994', 72.360159, 111.416242, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(83, 19, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 82', 'Sit neque sunt blanditiis natus aut dolorum provident cumque. Et expedita quia dolorum deserunt voluptatem. Voluptatem autem quos iusto omnis.', 366, 'New Paxton', '96743-7166', 75.437377, 97.879659, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(84, 32, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 83', 'Minima et similique fugiat qui vitae ea neque reprehenderit. Iste impedit expedita ab ea quaerat nisi possimus. Id suscipit totam id inventore reiciendis necessitatibus dolor temporibus.', 866, 'Corwinfort', '19704', 12.994947, 38.656277, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(85, 42, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 84', 'Temporibus necessitatibus non beatae illum et. Iusto praesentium ex odit harum autem. Autem assumenda nisi ea consequatur sit. Voluptatum ducimus unde quidem tempore voluptatem inventore.', 570, 'Aliaton', '88686', -35.772517, 116.726582, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(86, 13, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 85', 'Repellat est itaque facere nobis. Voluptates rerum animi mollitia hic. Quasi quo veritatis aut. Porro rerum quas repudiandae porro iusto totam nisi quis.', 243, 'East Cecelia', '92989', -73.78063, 142.099534, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(87, 83, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 86', 'Occaecati et et sint quia perspiciatis. Molestias est magni consequatur eum rerum nemo quasi omnis. Facilis commodi sed laboriosam laborum labore suscipit voluptas.', 166, 'McLaughlinmouth', '90939', -54.907127, -83.193482, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(88, 69, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 87', 'Rerum accusamus dolorem aperiam et repudiandae. Rerum omnis recusandae in aut harum sed excepturi vel. Itaque voluptatem sit suscipit qui nemo aut voluptas.', 810, 'West Brittany', '73951-4433', -30.451601, 58.173627, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(89, 31, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 88', 'Quas facilis consectetur sed omnis incidunt. Id vero accusantium assumenda aperiam perspiciatis recusandae quae. Et alias ut nihil similique.', 851, 'South Ressie', '32397', 13.881221, 29.325595, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(90, 58, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 89', 'Fugit labore est quia et magnam sit sequi id. Ipsa voluptas aut ut rerum earum est. Ut tempora quos eveniet nobis porro et repellat ipsa. Fuga illo aspernatur et illo ut.', 841, 'South Chaddtown', '99615-7231', 38.579949, 166.37461, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(91, 24, 17, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 90', 'Voluptatem nostrum eos et non. Eos maiores laborum in enim sapiente quis voluptates. Sed ut illo velit nostrum. Eum explicabo minus minus cupiditate sed et.', 863, 'Schuppeland', '70657', -76.085672, -68.27001, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(92, 85, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 91', 'Omnis consequatur praesentium ut expedita. Ullam ipsam suscipit aut voluptates nobis nam earum. Aut ad ab hic aut sit.', 103, 'Lake Reta', '75406-6919', -36.885814, 94.742194, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(93, 87, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 92', 'Possimus consequatur repudiandae est cupiditate cum quia qui quod. Modi placeat et ipsum porro. Dolore aut est voluptatum.', 84, 'Odieville', '89917', 4.47516, -163.254999, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(94, 90, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 93', 'Odio assumenda et expedita quo unde libero eos ut. Repudiandae quo non qui fugit a et. Nihil exercitationem cumque ullam error. Est enim consequuntur repellendus totam.', 805, 'Jonathanland', '17539-8905', -23.688485, -133.576695, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(95, 98, 13, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 94', 'Doloribus numquam et veritatis. Ducimus molestiae molestiae et accusamus. Tenetur enim dolorem ut sapiente ipsum. Optio dignissimos ut pariatur dolor consequatur natus consequatur.', 181, 'North Elmer', '00025-3256', 33.14244, 22.087782, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(96, 50, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 95', 'Quibusdam mollitia et non numquam voluptatem. Non soluta omnis quia et.', 379, 'Nienowville', '20892', 12.396308, 73.346521, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(97, 2, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 96', 'Dolorem omnis error eaque eaque qui. Itaque dicta eius suscipit consequatur facere ea voluptates. Reiciendis nihil qui dolore rerum qui. Dolorum esse consequatur qui consectetur quibusdam rerum.', 389, 'East Arnaldoshire', '23952-2331', 14.982893, 147.795766, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(98, 56, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 97', 'Magni modi qui error et. Asperiores accusamus error odit amet. Ex qui incidunt ab exercitationem culpa placeat sed architecto. Enim eos culpa aut autem. A quia distinctio ullam rerum error eius.', 911, 'Tedmouth', '33738-6532', -64.456531, 73.753977, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(99, 63, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 98', 'Aliquid provident molestiae maiores blanditiis earum similique. Sit eveniet consequuntur velit iusto. Et dolor voluptatem quod rerum cum. Ad quis nemo rerum.', 432, 'South Rosieside', '96521-2257', -81.776639, -141.32918, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(100, 13, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 99', 'Accusamus perferendis sed et ut aut magni error adipisci. Dolorem quia excepturi laudantium voluptas ea. Consectetur alias omnis perferendis eaque deleniti architecto.', 613, 'Lempibury', '00044', 29.919042, 147.389721, '2021-03-02 09:25:28', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `post_warnings`
--

CREATE TABLE `post_warnings` (
  `id` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `message` tinytext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `id_reviewed` int(11) NOT NULL,
  `id_reviewer` int(11) NOT NULL,
  `score` double NOT NULL,
  `comment` tinytext DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reviews`
--

INSERT INTO `reviews` (`id`, `id_reviewed`, `id_reviewer`, `score`, `comment`, `created_at`, `updated_at`) VALUES
(1, 66, 101, 3.5, 'Travil très moyen mais ersonne disponible et sourainate', '2021-02-16 14:00:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_breakdown_category` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `skills`
--

INSERT INTO `skills` (`id`, `name`, `id_breakdown_category`, `created_at`, `updated_at`) VALUES
(1, 'Formattage/redémarrage', 1, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(2, 'Installation Système exploitation', 1, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(3, 'Changement de pièce', 1, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(4, 'Changement de pièce', 2, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(5, 'Installation périphérique', 2, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(6, 'Assemblage ordinateur', 2, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(7, 'Installation Système exploitation', 3, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(8, 'Installation logiciel', 3, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(9, 'Cours/Aide à l\'utilisation', 4, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(10, 'Apple iOS', 5, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(11, 'Android', 5, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(12, 'Windows Phone', 5, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(13, 'Apple iOS', 6, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(14, 'Android', 6, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(15, 'Windows Phone', 6, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(16, 'Apple iOS', 7, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(17, 'Android', 7, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(18, 'Windows Phone', 7, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(19, 'Installation box', 9, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(20, 'Configuration réseau', 10, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(21, 'Configuration réseau', 11, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(22, 'Installation (gros/petit)', 13, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(23, 'Réparation/Entretien petit', 14, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(24, 'Réparation/Entretien gros', 15, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(25, 'Réparation', 16, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(26, 'Changer le stockage', 16, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(27, 'Réparation', 17, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(28, 'Changer le stockage', 17, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(29, 'Réparation', 18, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(30, 'Changer le stockage', 18, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(31, 'Réparation', 19, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(32, 'Changer le stockage', 19, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(33, 'Installation/Configuration TV', 20, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(34, 'Réparation TV', 20, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(35, 'Installation audio/vidéo', 21, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(36, 'Configuration audio/vidéo', 21, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(37, 'Réparation', 21, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(38, 'Installation audio/vidéo', 22, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(39, 'Configuration audio/vidéo', 22, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(40, 'Réparation', 22, '2021-03-02 09:25:28', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `postal_code` varchar(15) DEFAULT NULL,
  `phone_number` varchar(25) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL,
  `is_helper` tinyint(1) NOT NULL DEFAULT 0,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_google` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `verify_token` varchar(255) NOT NULL,
  `reset_password_token` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `avatar`, `username`, `firstname`, `lastname`, `birthdate`, `email`, `adress`, `city`, `postal_code`, `phone_number`, `password`, `lat`, `lon`, `is_helper`, `is_admin`, `is_google`, `is_verified`, `verify_token`, `reset_password_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 'eino48', 'Carroll', 'Lance', '2002-12-11', 'abbey18@yahoo.com', '33651 Katlyn Extensions Apt. 030\nPort Robertchester, SD 88966', NULL, NULL, '1-816-409-5276 x9887', '$2y$10$SLsrOXGhnpuVB6FFP2mlSu.w9q0BREr7uso/4I6FHQrM9GJGU7y8G', NULL, NULL, 0, 0, 0, 0, '75b79c30f472202e6cbb0c66b15c27eb6ec5b9f34d35efbc158628a10e5180adb6f638ae30e394f12d7b02ac9f2b12d515b9', '2fe8b896eb0f96d539183b32f839b843faa7946b27a9ab19527d7dd7ffa07cf7ce5d05f57c232853659abf069cda9a859654', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(2, NULL, 'favian.herzog', 'Tillman', 'Magdalena', '2017-10-11', 'waelchi.megane@hotmail.com', '736 Jesus Row\nWest Johnathan, MI 55441-9033', NULL, NULL, '+1-507-755-2398', '$2y$10$c/HcXTiNkNRpTzW.YhSlBuaxAcUtZi4YIChbHjFjkQVqWv8QQQKGS', NULL, NULL, 0, 0, 0, 0, '14f2aa8e4cf0a6c158544f651f5bf661923246ec92f9373cf7dea4f35e4412b563ae01ebc27300987adf98923c8275c7d94a', '18786d4eaefcc3acf9d47723fd39cc2393fca05004c6d5236047e5994026c47bae5893fcd8115bc4809f78f318e102d2859d', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(3, NULL, 'keven.wintheiser', 'Jaskolski', 'Chester', '2012-04-21', 'eliezer.kertzmann@lang.biz', '99834 Gutkowski Pine\nOberbrunnerborough, MS 76422', NULL, NULL, '+1.320.223.0237', '$2y$10$NIUO9AUkbFF8Kbld8K6rw.9wvFKgmYkzxQiKeZYbnQ6WpKN26qlCK', NULL, NULL, 0, 0, 0, 0, '03609bf8f7ac7fdd68d314b5c8129cf0f62344f600521f000fcf680778c78a42690bc294a9c911242704f0687edf5ad03906', '145eae91a60b9d44d34464293cc6fdeebe6f4ee518a5b4f904b0de399e20afd7db02d7d70f59737fff4b8f5df31002e21987', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(4, NULL, 'block.annette', 'Toy', 'Aida', '2006-06-02', 'charlotte75@gmail.com', '106 Purdy Brook Apt. 846\nBatzfurt, MS 98517', NULL, NULL, '218.937.3019 x5833', '$2y$10$3JTj75/MH39xhJSdWJXnauvkAh7jqW2FHSTtNDC/imqgw1sDxP54u', NULL, NULL, 0, 0, 0, 0, 'ee5c9c9f8eca977af71cd63da9b57106f10f309173533fd64397c94ed3fe9c56275723700619e886a6472c27322f235e1353', 'a67177c18a95fdc826cf34b6dad88656001ed0b74de9c93a98042ce9a407025664a6cc7109de5cdc8b70ef3248dd7dd0da58', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(5, NULL, 'cielo25', 'Stiedemann', 'Karen', '1986-04-24', 'graham.paul@yahoo.com', '48216 Mitchell Brooks Apt. 413\nSerenahaven, IL 92111', NULL, NULL, '+1 (914) 681-2638', '$2y$10$t/ekulHbcMANbq86d7Uk6OI50Ny968Pl1l6dGEZ86N0i4a/.cjCBm', NULL, NULL, 0, 0, 0, 0, '5ef0622a2dc5bd824d2f155aa67ee66b19fff57f1d39a7d4a3eaa51834ebbc074d7a70bd05049eef40ec3375b2b101d5dd9e', '1fbe80262a05be2c76a86962e7d35ddb76f7bdacb0efab3651659a3bf01cd87745a86408d00b54fb5afbb331d0112b6379b6', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(6, NULL, 'nicolas.emilio', 'Legros', 'Joanny', '1980-11-29', 'wallace.hoppe@hotmail.com', '4708 Judd Canyon Apt. 627\nNannieburgh, RI 67666', NULL, NULL, '1-424-632-1643', '$2y$10$ExG9OCBfq3g/17sBNlX.p.hMppfZk/zKFJs.CbT1NB4ar7hnw3Hhy', NULL, NULL, 0, 0, 0, 0, '17c8b1f4d585e42e56b4bdcbf8007a997dabba0743dcf7311db441bdd380c2efa3272922a7c1a15c865fbac648c67dbd51bd', '00bdee24e63519cc162fcda02107ebd4d217ca78e79a64ce3fdaddcb0a3b0b941d514212ff13237d6e4010416fa9b7eb0c51', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(7, NULL, 'tromp.alanis', 'Ernser', 'Alia', '1983-01-04', 'clementina39@greenfelder.com', '11462 Anderson Center Suite 300\nAlfonzoburgh, CA 07024', NULL, NULL, '1-668-843-6918', '$2y$10$s.BROzFaVRePWhNqETSBdOUXsJJxzY9IDIeLVW7sHCYBxDacUaePO', NULL, NULL, 0, 0, 0, 0, '9619c641af4fc7d1858753a15e2da0b2e6db52bacb089db6c19f02e2a997700279a1d7fcdb7dd493824ba1bbcc5f4622f4f3', 'f86827b5f54a8111dfe6e58b11a8a5f62d9fb714bd2fca516ebd84f7b45ce1b0b14d1e7d4b292c01f6ab89101034517c1b31', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(8, NULL, 'jkuhic', 'Hane', 'Nathanael', '2011-05-29', 'rippin.jacey@boyer.info', '772 Schmeler Causeway\nNew Laronmouth, SD 61912', NULL, NULL, '+1-914-484-2501', '$2y$10$VUCpHE8iIrjdceTi6rBNt.kNVnyZDE7J4FcFcAQQI80xpGnNYMqyy', NULL, NULL, 0, 0, 0, 0, '4c214dd0a2bfa77c85c70ad9882df11f66451907c04baa42bf7c60b26fb02b1187eb0120adc458e69375994d8fbdddf6810e', 'df2d1ce036d7c7544ab846e68b40995b6fb7004125ec1e458e4bba50ce2916fb08fa50391472378b36482dcc0e7089c1bf7f', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(9, NULL, 'sbalistreri', 'Ruecker', 'Golda', '1987-05-27', 'qschneider@gmail.com', '8970 Ibrahim Ferry\nNew Destany, MI 92641-3192', NULL, NULL, '+12316564424', '$2y$10$cFm5pR3W/3MfSNFiNJIkU.iX4oiou8V5eaoGCQD798FFJRoC6ZQHS', NULL, NULL, 0, 0, 0, 0, '3511f4e8376b3587bd02b1965e8a6f5d49ddb6dac92fff7244b37ffa11ab9a17d4c38094f4d5d97c2c8953098ec22ae6752e', 'ee70c899f849ec01627b0ead477f0c51e946ddccf57039d464ea1c306640d042b1be75ec655749c97716c8ba5b45ea0df906', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(10, NULL, 'westley84', 'Borer', 'Rylee', '2008-03-17', 'augustus.schaden@fay.net', '1859 Kozey Glen\nPort Conorbury, AZ 46326-4619', NULL, NULL, '847-864-8111 x289', '$2y$10$foxinapXliPdz.W6CdIxhO2myL3Vs48nAoj5Y1SQdrUmcgF7GavfK', NULL, NULL, 0, 0, 0, 0, '21397cf3056843f3d198bb0de2c8d402cedaf4b7fbf2b0ba794a3276f3b45ec27745cbcb9b4ac3c1d4a6363e823d89064bcb', '11f0bdd8618a3719c2c22dac13dfdcc730b39f1f38a8b1b62f516e92d2ef796870110afe079828d5968806358c40a5d1a460', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(11, NULL, 'otilia54', 'Cruickshank', 'Elenor', '2005-12-02', 'lela05@gmail.com', '29167 Franecki Common\nAgnesberg, VA 28548-6792', NULL, NULL, '+18123590655', '$2y$10$D5GfhYTaHngVTHSPEe7OQus9ZI46MybQ6b/Cc3uI1e7mZJet0ybTS', NULL, NULL, 0, 0, 0, 0, 'a2ddb3c164775b408cb4c43dd4c9d2faec7238f9b5a7045cce78fb198f54536fae19ec51b94f4042bceb8628d3104f1f7604', '3b7cd8a1ac54bb1e21fb4bb1720d34794e40e175615f9ccae3a0535ff72a4d484bc0a0f5128b47a1576b1004b47c0c211071', '2021-03-02 09:25:21', '0000-00-00 00:00:00'),
(12, NULL, 'jjones', 'Daugherty', 'Elliott', '1978-02-10', 'bert.mueller@gusikowski.net', '9953 Jessika Estates\nRyanview, MT 43874', NULL, NULL, '(735) 323-3160 x4678', '$2y$10$kJsFa36GS9H1Kc9qwXyFSuQ.HLdJbwgVDSP1t9c/VmYPJ0vqSvaZu', NULL, NULL, 0, 0, 0, 0, '9e2eb470917b1c4a366e7176d90ccb25015cde951eb6acd6bac1b827f362b3798ae9e54d4c532302cb95e8a5762501471309', '88922078db3c2e852a8bc0b025737aa903ceb1e088b53f5674bb88ba866098e97a25b8f82584766d309b003888ebf8544025', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(13, NULL, 'keyon.gerhold', 'Simonis', 'Rosa', '2009-12-02', 'jcartwright@yahoo.com', '24669 Parker Alley Apt. 613\nLuettgenfort, KY 52053', NULL, NULL, '558-653-6111', '$2y$10$k5SWNoX3tmAdEyMhbbG1pe722BnXDvQlBoJPhQDcVWC6cWdmD/pjy', NULL, NULL, 0, 0, 0, 0, 'cac3a35b30daa4960f6ea1ed4c7882b1e041638c60279adb013b86dcec16f52741ee133390d2176fa75bb282c49de1c730cc', 'bc9e65f79c176f79c1952ad56f3b0947311544e27c8f7c17c700db26e7ab42886b617ddbc2155621ab16f1b5b47dd716c1f6', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(14, NULL, 'green.gabe', 'Yundt', 'Granville', '1985-02-23', 'balistreri.cristal@gmail.com', '115 Amely Garden\nUlicesfort, IA 80543', NULL, NULL, '(409) 633-2116 x06950', '$2y$10$g.Mir0F/2V61VvIdyzkVZuZZdIj29Ku6FA6LO4O1ia9knlJXDoA1W', NULL, NULL, 0, 0, 0, 0, '62e29c732ef30a6bd71977e390c6548dd5f3f38a781df727245fd685e60071a2a1bf84bbfdb41d909a537ec29cf9f606eb9f', '21611dd7d8241efb7a874d3cabb1d50ea92a09d32f0255354560409772bbb6349d9549d26b34f2dd63d0564f53c1515e68b9', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(15, NULL, 'erin.quigley', 'Durgan', 'Amina', '2004-07-05', 'urodriguez@hotmail.com', '109 Littel Fields Suite 369\nFatimaton, OR 08514-5482', NULL, NULL, '546-847-6405', '$2y$10$fQI8AlKQJ1Ba3n4g9JGT5OP.bawS1iFDKG7hPBkJaN45nQHWM.Zk2', NULL, NULL, 0, 0, 0, 0, '3c3d8e2ce2d5eea5b15e9722d41bcca0d1d81901cf0b50720e44806d7997d6c3a1a6d4ba44e0915a60fa85b3b8f6c880a356', '436dd717db229e80be8384cd7f5348088e1b3d9b72271a8f949d6dc171ba632773b84c6b979e73324032923d81f826f7fc51', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(16, NULL, 'arlene71', 'Jast', 'Annabelle', '1993-04-27', 'yost.anna@hotmail.com', '73933 Vincenza Lodge Suite 179\nBreitenbergmouth, VA 24325', NULL, NULL, '(427) 866-2755 x85677', '$2y$10$DBZvyvLwJW/UAw.Wwd7KCeuT/r/kBOK1lhE1abM3qPDXpy70QZoJy', NULL, NULL, 0, 0, 0, 0, 'e86f799a3eebaeac7424a5d5d4b44d954aae442f2eaefb3f730b91237d1c6d7d9d55d4f630f3bfb4bb38ab0f4af79de0480e', 'fe0b1e19343aba3a5dcdcc3c0cf18ca68f2cb2bcb4c36323134964f8d78fbaec8f9998dbcfee9268f6efe7aa916e6c3d4769', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(17, NULL, 'effertz.madaline', 'Stroman', 'Dock', '2011-08-04', 'rowan67@green.com', '286 Juston Light Apt. 655\nFrancisshire, WY 65184-1994', NULL, NULL, '+1-423-771-0912', '$2y$10$btadsYg4qPZEpgv9oiyypePYA9FZvO/Ri1bIt7ws4OIq3TGgzjYS.', NULL, NULL, 0, 0, 0, 0, 'ede9fd40cc68db67e1e3bc35c5d7062799fff9093e7f3e2fa9d7d7fcad01edc26e27bf1ae961179ee5aa6bba4ed740ea0743', '02ca2b4ec4f0832219f80a843d22156e78e2ff08cf97b8a3f2b8bf8b9be8c28010ebe30abc071bc01e97d9a1150ba7863277', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(18, NULL, 'sophie91', 'Kohler', 'Dedric', '1990-06-25', 'kautzer.geovanni@hotmail.com', '7371 Ledner Plains\nStromanburgh, VA 19586', NULL, NULL, '(236) 899-8354 x1795', '$2y$10$wn7w8rL15cs5ZggMRiylyeN2OH8TPgUidOpB6NX3Aeq.YGAYu2ZVO', NULL, NULL, 0, 0, 0, 0, 'ae373612beeb532445994e6cff752bba4e5969ac90f62e1eecca71604c4c96968a3b5c14ac2a3d880127a511d292e6cee582', 'f839c0688059923a65f2c99d8b11bc7dc94ee3350e3d2ee7487d05399dbbbcf85d9695139a4bb36c8b29f581ee79727c5d14', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(19, NULL, 'waters.beryl', 'Anderson', 'Shaniya', '2008-07-04', 'mann.jimmy@yahoo.com', '58475 Luettgen Lights\nLake Stewart, OH 00721', NULL, NULL, '969-737-6845', '$2y$10$yf9KE8FvVSa7YAdbgru6.ePFcesbQwotZQqkZIW1Vr9Dingo5fwB.', NULL, NULL, 0, 0, 0, 0, 'b03891452cf2088c29ff521777850d3d1e018582d5873b67cf4cb8bfed36f664b2d37de99865aa336bfad05b5c9fbb97c0a0', 'f5b835547a0e9ca8e014c8c145683bc8e7e2e05236d3c0ecd65fd968a27951d8ffbac7b818b2a29c9ffe9eca82ca5c9732b4', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(20, NULL, 'bergnaum.frederique', 'Skiles', 'Winfield', '2016-08-24', 'chase.yost@johnston.com', '50691 Steuber Neck\nNew Elimouth, OK 56408-4848', NULL, NULL, '1-752-843-4468', '$2y$10$S35Wop2Tpg9vGPOGHxTLGuDa1YHT9fpHJujBk53h08V4HHpqLGPkW', NULL, NULL, 0, 0, 0, 0, 'c78e841726d238a1f0483bade171efe60aea90a7a0b50a9d6dd5b26fae8030e9b53d735af4b7c0197031859ce03ccde1037c', 'ad89394c2f1aa612b20426d43b07411587de8d087dfb0ecbc69ab1a069e938e2a53fe1e21d2ccbc0db4a790ddf8170efcfcc', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(21, NULL, 'clint88', 'Nolan', 'Verner', '2016-12-19', 'terrance.ruecker@gerlach.com', '85669 Robbie Mountains\nGroverfurt, VT 99655', NULL, NULL, '(747) 629-2489', '$2y$10$/qFIewmaNnZ7HU.JTKJxV.9YtYU0Zoto9j4M.mxBrwypFZ4eyKNku', NULL, NULL, 0, 0, 0, 0, '32d4ab184ecb6a6fd992a741ef3930086fd64228e92f60242bbdf9144d27f732e461865ec8e05b4b8090c381c8ad22cf0ba7', '244609d99f1315c3e17d7299557f551a739b8b57615aaf6362e3805c0ff2d2ef39e1b40da5ab96706e1438ff201758faeaa3', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(22, NULL, 'elise90', 'Toy', 'Fiona', '1998-05-16', 'bill.wisozk@gmail.com', '597 Heidenreich Shores\nSouth Nicolas, NE 51468', NULL, NULL, '1-464-931-6260 x275', '$2y$10$UrYlq34fyrF48Ip86n7/be4tNygFuBip8fIjzw0MvyY07cOYx86pS', NULL, NULL, 0, 0, 0, 0, '9ecded667ab8101f3ea808161d73a246ffccece4a425b48b976908df4b54c547e9e3d2e5128c74bed5af519fd8d39ee76552', 'bbcaa23b36dfbf9d0439bdd845e0a2abc6ac42a4d3dbe18c1bd19a0d4ad348c4be606425e799fbedbe6a202ef682a844cecc', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(23, NULL, 'omer07', 'Wilkinson', 'Marquis', '1981-05-09', 'tianna.gulgowski@purdy.com', '91406 Marks Park Suite 852\nWest Stefan, OK 07195-8607', NULL, NULL, '+1.763.796.0014', '$2y$10$lMUC05WYWywKoGTmEyZyIue72U5HCbvzcu7VA4/UeCWO8vlqUUdta', NULL, NULL, 0, 0, 0, 0, '84b6b45201f8479486a1e1bb8dd87945f3dd131db01de1596996ecfede8b20434c477c3f013b49209688197806865bd75b94', '3df5ed6c050a8222ddd76604ce4c0a952b5d054cf1862826d0d300d9bb897a3baa166933ad04b25edf6440906e23fa4706f3', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(24, NULL, 'itrantow', 'Osinski', 'Bernadette', '1980-11-21', 'bechtelar.ardith@yahoo.com', '9860 Brenna Springs\nSchillerburgh, WI 43030', NULL, NULL, '696.741.7374', '$2y$10$4YZTvDn7jRHjh60NdhD5euyzRkJpI4Gb9XPKHvP5t1UsjY6xwcVBi', NULL, NULL, 0, 0, 0, 0, 'fbd498e8d1b07882d75b1618e0401d423d3edd56182c9519019f0f7d4d23e126561984deef6e69397e851f839bf50e45aa7c', '1734c1ddd6083762c6a26c0b5f5e1a02f99a836ae299800ba688504cafcc17e645afea911f8d2395291a646bb40124353bfa', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(25, NULL, 'abe57', 'Hermiston', 'Kaleigh', '2005-02-05', 'reinhold.oconner@berge.com', '28378 Nienow Camp\nWiegandmouth, VA 89138-7764', NULL, NULL, '346.820.0482 x56891', '$2y$10$Z00Ej2lsQkLla2sjy92wP.jq0OBdBle688cx.uWOr7UbpmPWKUw7e', NULL, NULL, 0, 0, 0, 0, 'b5627fd84f3fe40c71160856d47bdb86d68afe07c3281c7d8856c2e283d89de8bce8cb1a2d7b5ea654465d01b459d4d0c28e', 'c10c6634f38bf7a220d2abf5d0c32e1cca5ae53c071aac04fb0fa594c3ecdfc85d45a988770db4d3454e650a2568943a7208', '2021-03-02 09:25:22', '0000-00-00 00:00:00'),
(26, NULL, 'rosenbaum.dallas', 'Buckridge', 'Verdie', '1987-07-23', 'milford16@langworth.info', '714 Feest Lane\nPort Verniemouth, TN 79284', NULL, NULL, '391.676.7571 x59118', '$2y$10$AzbyyCJekntYwTgqNvOEEecsRn4f.2FZVX9z3RbuXCbxm5fXDfXJS', NULL, NULL, 0, 0, 0, 0, 'b970033c788b5c63acfb427dac3d1bca594413753fc742e76111f66ba8e90ad0b2ece23d6d52365406ed8bcd34d131bec858', 'ba5b6bf5cef4791f4658b2529fd6a13ebcd668a3b499832079a5200ed8d58fb98441432e4186fd9dd86b512acef004f838d6', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(27, NULL, 'sandra03', 'Skiles', 'Clara', '1991-05-31', 'qlueilwitz@kuhn.com', '60159 Hickle Haven Suite 087\nTillmanhaven, NJ 29296', NULL, NULL, '874-319-2329 x885', '$2y$10$m7R.fm6btbgUSaC6VpgFx.JgDHcwDOdtmmrImdproaZk/0eS/L0ja', NULL, NULL, 0, 0, 0, 0, '9679b08e75cc19f874a9c706d8e6fe17ea1ee650fe4c883867b4190579bdbdb1dd8f2a4f844fa9bbc70f8a6997c3f0098eab', '150b80891fb1d7164818be20070d809ce157a98791ed534083c0de18ec1aad722f4320b0deb6f3e12ad55601b8e3c42db24c', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(28, NULL, 'auer.jefferey', 'Howell', 'Delmer', '1972-10-20', 'dcrist@gmail.com', '41911 Aaliyah Green\nWeimannhaven, PA 43088', NULL, NULL, '+1-387-850-6714', '$2y$10$VO2mILG5lJQ/jJEEd3wSbO8spyMOSSjIq9kySqcNv3WrQompbu1vq', NULL, NULL, 0, 0, 0, 0, '9e9b5b3d544a14dbaea2760ed7d578fc9a832fe7c2a1963a67ba42cbfeac1d139c82f8450283fbffc848d79802d0441a63d2', 'fe6d5ccc6653ff268ace238c881e1b2847b19a74556f27433786ce07cdaa7d0688f21b510cfef1436b5d6990d6a2ae242bbb', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(29, NULL, 'fletcher65', 'Hoppe', 'Samanta', '1972-01-20', 'joana73@yahoo.com', '5471 Jaime Parkway\nNew Libbyhaven, WY 12503-2048', NULL, NULL, '(537) 216-0436', '$2y$10$KffLYQqYADOqDkjHmA5SXOnfmvXaGXUAvuxz5r76JiR1EuHLRD7BS', NULL, NULL, 0, 0, 0, 0, '93d35caae9ef04046b791a7e1d3281e1ee4597671cd6a39a6e4da73bf3c814e247919f65aaeca773a8cc8fe10777019f89bc', '179970885b92c5e3248da87eecb9ff804b58a47af4eb04faa488bae485caba9fc67ed272bb015bf2ebec63d72332a699d66e', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(30, NULL, 'bryon40', 'Flatley', 'Melvina', '1989-09-09', 'pfeffer.helga@gmail.com', '3596 Abby Fords Apt. 815\nKendrickville, MI 47836-6215', NULL, NULL, '+1-831-533-7505', '$2y$10$9ET9Dvsspa.q35o.9NMvseoxFp7DUc3qm1oV02SeIaLW.i7P2opF2', NULL, NULL, 0, 0, 0, 0, '834b40c907d557ad16594fab2e61d5f5d0088fa6e8a041b91392b8a039ccbe572f5b726eba4db51e2d27a4c9b50e6c5701b3', '6e7ae9e5f8266f6717cf971dc707a6aea423eaf1dd6869c1cf90d684a6e410ecbe21cb6e92f57292cddf0c6a22a404d7b8ba', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(31, NULL, 'edgar09', 'Braun', 'Aisha', '2010-05-18', 'hkihn@schamberger.net', '13760 Okuneva Mills Apt. 107\nFaheyhaven, RI 39950-2735', NULL, NULL, '437.616.8162 x88845', '$2y$10$w5RevREjXXiopear5j16LuEGZAPH3ThT0IotMAsAQFFUEK7MY/hSO', NULL, NULL, 0, 0, 0, 0, '508acb64a331c5abd8284ed2f2f402b35fd23ea0ee2f1f5c9d4d577e16956924abd3020e317aac118dc1e42479c8eaded4d7', 'ad36f042119f5efd43492a2e2225657929691c976c6f9c5e905583dd077cb90004af752e3dd56a9fa7c9645dc40cc25824c6', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(32, NULL, 'justyn.dibbert', 'Zieme', 'Talon', '2006-12-31', 'ohara.vernon@heidenreich.org', '682 King Club Suite 302\nHomenickfort, MS 67456', NULL, NULL, '(582) 838-1484 x448', '$2y$10$lHPE6gfAwzHV/AF8Z0IZDOEVfMCSyKxk7EkYxJoWX8leYaSpEyIHS', NULL, NULL, 0, 0, 0, 0, 'ae58206447db53fce2853090e40e8bd1bd72e19416e7299c50af188cec3d7d7abb792b30dda3a07094e5acb0bfacea98273b', '40bbc71665e6191e4cf131fe3cdd9cd0f941060e2b7669fd54a7bed0d82756234d1ae39f89792ae9e77630d1f3b139f3f6f1', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(33, NULL, 'evelyn.wehner', 'Hansen', 'Freddy', '1994-07-04', 'muller.alva@yahoo.com', '821 Mafalda Run Apt. 385\nSchambergershire, NH 05054', NULL, NULL, '1-605-786-8732 x438', '$2y$10$yGeTK8xlFY2NRUpJCWUkcunlxGN4jyL9.DhfKIlxqV76ZGmY.WT86', NULL, NULL, 0, 0, 0, 0, 'b8608e992da23dac6dabbfbae9c4ce0d81a815b629dac650adb9b420b0f8ac2e779d7ddfe8a19109f773a799e0a1f7306288', '1c4615a71d337cd7f0749a4dafce4e4045aa6186a2e451100c51ef5a6db95f3716e0d55db575dac5cb7087f5db469ba205b4', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(34, NULL, 'king.winnifred', 'Wisozk', 'Khalil', '1993-12-22', 'rosemary09@carter.com', '814 Pearline Street Suite 149\nWeissnathaven, NM 28098', NULL, NULL, '865-956-4093', '$2y$10$v4y7Pf7ksdj9dbqXs62K4eQCoHijHDQ3t2HfhpYfcuXa82BjQsNbi', NULL, NULL, 0, 0, 0, 0, '7fdb5e8dfa7a814f4e12d5497b7c31f6f660c5500ed0f0009ece27940d77a5bfa56ca714501df5eda280bf6e67b9669f534d', '463d9f91cf4c7f8561dfac1d84044d4aeb51bff98194494ca54d1813f0a895c9332f4f7b3b5be37ec746494ae3f37b4a6467', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(35, NULL, 'krystina.nolan', 'Lakin', 'Susan', '2017-05-13', 'zbreitenberg@gmail.com', '2494 Batz Alley Suite 026\nNew Glenna, SD 17320', NULL, NULL, '1-787-359-9456 x346', '$2y$10$/fvmvKgwLTqXyk9xHAxEVuxmHXk4eEyDXsMdu204HNsFSv9HWpygy', NULL, NULL, 0, 0, 0, 0, '7e250598d3cdec315119a1646d31ed14779c80b85026430a10ca4c8f64b267a1d5b1001274b329c61720e9d2ea873370a978', '9cc7e6d574de9a780ba9c9f81235f1cf6840f5a27dbd7b9b8c63f0a3b2d4f41327d4f5fca6bd23df9f6414be73a493f5f97c', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(36, NULL, 'kihn.shanny', 'Spinka', 'Golda', '2010-05-25', 'dicki.kenneth@gmail.com', '415 Nya Ranch Apt. 008\nFelipamouth, CA 08134', NULL, NULL, '1-853-367-5822', '$2y$10$yyDU5Y4nWbhCGxavRHhP1O9xlala8CHSb7j.9YJrxdRxkYKu/mZQG', NULL, NULL, 0, 0, 0, 0, '7f09bd1d5db04fc29160c7ab12b4b5b6707b3122193cc15a3d626cbe22835c34e01be8f5d9f2da10a2e959362ec33684e834', 'd6f0df463b5a3850b355a200d33976830fe8678eccfc8d0a7e3c8788b9e50c109a7e4e1db834112d43c6890ec923bfe5cf8e', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(37, NULL, 'patricia.cremin', 'Dickinson', 'Will', '2013-07-20', 'ruecker.catherine@krajcik.com', '229 Stiedemann Shoals\nEast Keven, WA 74516-0324', NULL, NULL, '(490) 512-1017', '$2y$10$154qqSVFJd/bBD.dfj0f..yZHYqDzapIyuGEV7N3pKD4NUhOnt3Ga', NULL, NULL, 0, 0, 0, 0, '8b233b1baa6706a3f488eabb76ad607f0e9edf182ca74c1026aec7ce7f3d19fa59460e27936465ae80e50f1b7c4f15db0605', 'a99d704d554b5ee711af0e8bf424c803982400dcc14c402fa9055a0169ee1291a8f3b9a91bc132ea0a4b4c95572128b26eba', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(38, NULL, 'liam.farrell', 'Berge', 'Jeff', '1989-09-20', 'kenneth97@davis.org', '63374 German Parks\nNew Jewel, IL 28947-8156', NULL, NULL, '321.273.7491', '$2y$10$8tT5mRtWYJ2vr5ADWP.7lOe5bIqEpPIj5FEoUfoRpcluub960rEyC', NULL, NULL, 0, 0, 0, 0, 'ac438de9f4a75548506b74999c22f8f6e096ae607c0516e68f0a793637cc0bab535f95dc37d6f00577aa2e0ef9300477791b', 'e9a01f3f3dbf6fbc05ed766617842cdbe2ee833c4c8b9d4d85491ac4200717c197966833f5bf97a663c0350fe50fe270a7ff', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(39, NULL, 'erick.marks', 'Schulist', 'Floyd', '2014-06-11', 'alessia56@satterfield.com', '19201 Johnston Corners\nStromanbury, AK 55431', NULL, NULL, '317-929-5801 x672', '$2y$10$XEaP8UsdQXiYqWqTIfbUg.SLrxOFBcBlv76DyO6FJoNp3yQn4J8pa', NULL, NULL, 0, 0, 0, 0, '67eb24c5f71e521b17eda76ffddde4c42aaa53ab0efae708e1a92c59ae492d93e856e30f93e36893f0155d181b50c44be8b6', '7943edb57c522d9a6cca367fe23935a4b565fbbb4a4c0e22fea62533cab2c746c95fb5702aebdd1ab1879faba7693b050e9a', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(40, NULL, 'yasmeen74', 'Gleichner', 'Shyanne', '2001-02-25', 'xjohnson@marvin.net', '6870 Huels Lodge Apt. 580\nNew Jonathonstad, MN 94946', NULL, NULL, '1-219-257-2806', '$2y$10$jRRLB5n4ue8k66pwN13hwuBQngRc7oTAu8Nd/PgjBa6kmfWil8sIy', NULL, NULL, 0, 0, 0, 0, '7addf550007719f909ea413698787f32168264e4c1be594cd20c39357d49beafc43d73cafe5389657a59c2bd2fcf242ad1fe', '8ffb2a3d8c76a1105f3daf9fe0f2c90510205db68a240a6cc67537ad895e78f2050267f34357416bdbf5724ecf0c3442c5c0', '2021-03-02 09:25:23', '0000-00-00 00:00:00'),
(41, NULL, 'terrence.maggio', 'Buckridge', 'Corine', '2008-01-19', 'olaf.jerde@hotmail.com', '88975 Haley Mountains\nEast Earlene, MS 41560-4216', NULL, NULL, '904.756.5007 x0171', '$2y$10$jxef/N8J6Mc9AMxpd1dBUeIqxJvUSIrXwcilbuHRPwkmh8Qyy98/G', NULL, NULL, 0, 0, 0, 0, '419f9cf6cd51219f8b6df8d24e8afd76d8f58dd92bb082f04d68fb9685af28a0bd7539114bc330004c0651bf1d38649358dd', 'b7d6cfcb7d93e534cb33bea06309c8fcaaea9b64e016ca67492c6dde8ccdeabfc61a2548ba48d8b5d8bb32d269572ae80ac9', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(42, NULL, 'mleuschke', 'Hagenes', 'Tanner', '1971-02-06', 'yhirthe@hotmail.com', '64497 Dickens Plains\nLake Leone, TN 31049-9425', NULL, NULL, '+1.494.221.7774', '$2y$10$MPf9fte4G/Bqi9r9T8awsu1UDe5JWLv0ROoBJlcB8BPuTFw4AQo1.', NULL, NULL, 0, 0, 0, 0, 'ec5bcf7d545fd63f967c16db3dbd9edd707c6396fc49e3f09a7950055229f8cb6854c7cb8631dc3763200532257aea0f814c', '271aae6cc8383ce6aeec2cb5334d81c1d37d548de905d284e20ee61e1135674545440f8010375656db68b93fb1b281b6a187', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(43, NULL, 'modesta.veum', 'Moen', 'Darien', '1991-04-04', 'jasper.shields@yahoo.com', '62483 Kariane Ports\nNorth Leonor, WY 36405-8355', NULL, NULL, '(791) 238-1732', '$2y$10$2zfpV9Ftsl/qRCfos0y4NOYPgHEUb7BQIMkokMH5DeaN9g72yjVYe', NULL, NULL, 0, 0, 0, 0, 'dddc42f9196fa42ca1d2dd9d0b091f16e8247979cf4b2f88a5399649fb914affcfb2eb204321ad865f5bba005bfd622881b7', '70f80ab977822d4837d71026e7ca31fcc9ba3132d441f7d177a7f6f35529f8dc1853d5ee440a1af77900542f4e51fe2314e6', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(44, NULL, 'kertzmann.brenda', 'Schaefer', 'Kale', '1988-05-25', 'carolyne.goldner@hotmail.com', '25357 Johns Throughway Suite 149\nNew Asia, WV 30176', NULL, NULL, '759.685.5499 x499', '$2y$10$ldRc3sfsJw1gOkzzyVE4VeJJWHQA9RRP6vhbjETSBeNkZH/Y8FO8i', NULL, NULL, 0, 0, 0, 0, '515ac0915a5356a825ec26b05409936335a6ec2c16cbe080c9175494f6ff46af3f411f0f222c07a7ed4332d8ec25c25d97b9', 'be24daffa4212ba3b1837d6a4f5942eee8f061f7d7d11ce5737a7f5fe169b1d5c371fc526a390653354048da788333abaf97', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(45, NULL, 'olson.destany', 'Powlowski', 'Bernie', '2012-12-10', 'maximillian89@breitenberg.org', '748 Tromp Corners\nZemlakfort, NE 70554-8460', NULL, NULL, '(783) 417-4642 x7807', '$2y$10$LUzS/NbC8rml7UQN1Ado7.Z3Fl179kF6wfB0rVKj8n/XS4L/CW7hS', NULL, NULL, 0, 0, 0, 0, 'f20a69da2da42240ae2df83cfce63c356c6e9924b10c7613842d69aee78ea8bbd2f22579e21fcaa417e3705aceece68b71ba', '721fd185609ca5e40e031c1521f557d84912177d83003702ff3c5e56ba721d4021235e7ed2bddda314f81bc4d32d96103649', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(46, NULL, 'awilderman', 'Nolan', 'Alejandrin', '2018-11-09', 'doug.hayes@hotmail.com', '566 Cara Viaduct Apt. 562\nBergnaumfurt, DC 92264-3652', NULL, NULL, '1-769-317-9442 x249', '$2y$10$gj/D/f/ENDYxRw7kcSC95eR5ZyRGoiiP.KtbflWQLJW6UZV.CLaym', NULL, NULL, 0, 0, 0, 0, 'bf3ea6531a3db52619bf33fa34f76bc9cbeae2bd44e4589c50e8a6e28d11b543d7b387b462dda85f4600122cf2319a1a9be0', 'c92f6e37696a681620839ffd47908979174f82fdff6335aa04400e1501b04033e95435d7c1ff764f3830b71844b9600945b7', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(47, NULL, 'rmcdermott', 'Trantow', 'Ashley', '1975-12-21', 'wunsch.rachelle@romaguera.net', '5477 Skyla Fork Apt. 522\nNorafort, MN 49978', NULL, NULL, '+1.831.948.2488', '$2y$10$/1fH1iAc8zymPJrQtVWuVu5iNOV2bUQgkirh/8cUfMlXGFlx6.Tgq', NULL, NULL, 0, 0, 0, 0, '1de9ece71c0f561909cf639c239b0bb067552d786c05fc26797710bbafb2ec5388323ab570b622a1372b74e183823e96be5f', '37ddc78b1ecc2dc69fe94a1ba54335df48a4d50b2fd87712db42c3efe95a5d3bb685688d4d15b018751b5bb448f543b83a0f', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(48, NULL, 'bwaelchi', 'Windler', 'Gretchen', '2010-01-07', 'dibbert.jamie@tromp.info', '822 Rickie Trail Apt. 947\nSouth Milford, IA 88376-6520', NULL, NULL, '971.327.3267', '$2y$10$J//iAfx.lCWFBvraNF91reYTKsCIxowNW5v4lPvHFaYdu3D9CR9NS', NULL, NULL, 0, 0, 0, 0, '817271d87c703c70e820c72a92ca9fd3cfa1951a6740a6d2fec6145aff115e85c8bba8d96cda41ad98f51497afac0ead7ad8', 'fdce3933a3d4cfb98071f63e35bb5ca98cb0d3e0823bca3aa2484a017364cd7886578997ca0f386065866c3378110220ddba', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(49, NULL, 'corkery.matteo', 'Barrows', 'Amari', '1974-12-25', 'nleffler@hotmail.com', '593 Raynor Valleys Suite 764\nNorth Orinbury, NC 55025-0451', NULL, NULL, '874-922-3527', '$2y$10$gGZGlZooW.B2iTWbt9XDGuQxCSpTJp6INJgtTvF8E3WdOSPx7j6Ja', NULL, NULL, 0, 0, 0, 0, 'edfab20a5dc337ee240422b3495d983698572c5d40e0d5e9764268cb13d674b026c552c68bebba6f58633638139e555d90ea', 'e25a673b240cd2ac0cc56c41b796c0a79a8df70976832f01c5bb19c93dc7eca68ce5a8b5d3b1041bd95549b1bbf562db0024', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(50, NULL, 'autumn79', 'Osinski', 'Dangelo', '2014-01-18', 'mglover@white.org', '149 Elinor Street\nSouth Landen, KY 83654-1093', NULL, NULL, '781-979-1032 x9679', '$2y$10$o/xhJrYqud7gsPMkjdHfuOoqmPnZD/CW3qrKv2DPJLpdYlrNh6f4q', NULL, NULL, 0, 0, 0, 0, '8e89c18cc5ee2b256479c69735cef1d5813d86e9a5b775d1ab7b05a83bb945e865dcac2d98768dcd2655a8f2a97fbc3d51e4', 'f652dbdf17d922694b03d61e660160093d3be3c6fc4741fff3072f846168d6bd99e7b0577fea98f2b18f62b3b5be7e94a2a1', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(51, NULL, 'jayden.hauck', 'Bashirian', 'Terry', '1992-01-23', 'eileen21@mckenzie.org', '749 Klocko Spurs Suite 104\nKrajcikchester, MO 42495-4731', NULL, NULL, '986.722.8629 x37865', '$2y$10$qDd8qddUi35YfDJEEhRtRub2kaddDpS3e5n9qUfxxpfC61UxvcKxe', NULL, NULL, 0, 0, 0, 0, 'acce7b0ce0d4ac6644a50599bf8003d948fa18b8b3a658d766ee1e015769b54d999d680f90f227034093db9969e09a3986f3', '7fe3988dd6dda8b8b6daa2a0d70b16c30971305915a95006d19d94cad34301ef4f5344d3b7d09671c80c97269fde84c15b3f', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(52, NULL, 'bernier.samir', 'Breitenberg', 'Catherine', '2020-07-09', 'wunsch.hulda@hotmail.com', '26303 Wilderman Hills Apt. 273\nWest Felix, CO 84548-6773', NULL, NULL, '+1-720-844-8412', '$2y$10$nCFHc7tyBbdD7Y3fzDtS0u98Ssy/Us4Vd7qkFM6GxZb80X9/4DlNO', NULL, NULL, 0, 0, 0, 0, '6d3aeff95784245a022191ab3893cce0f6290d89b9a58c5c34e5fe7e729a4a33cd53f5b42f10b18dd9c49c34bf29fd133794', '7bbede29df7eb897d740495ff6f336ac785f5f9b36c39ab5e3883239d323c293cb3f0832b1a8911dc415b7f779859e081078', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(53, NULL, 'gleichner.magdalena', 'Schaefer', 'Nayeli', '1980-06-20', 'ffeest@hotmail.com', '259 Kiel Circle\nPort Rowan, GA 46984-3348', NULL, NULL, '919.601.1261 x158', '$2y$10$YT/tS7.pdQPhTP.NvaWfd.dDFAzsk89LjJpjGRe0rqBFfeZ/shy9q', NULL, NULL, 0, 0, 0, 0, '04732e86e8483a938417f4eac99af1fe144b47441e7174f2f26548700a5825ab0ce0ef48f887410d2299dc39816dd9438e18', 'b00749b933a88146fd90107120fd7b5687a1c5abb2c3c05f1a2a409e78a2574bb9809edfc726b0db8eb17269a494cf2e9fe3', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(54, NULL, 'wiegand.mariano', 'Auer', 'Helmer', '1986-08-19', 'dare.schuyler@kozey.com', '933 Schmeler Coves\nNew Damonside, AZ 55192-2270', NULL, NULL, '416.416.0691 x6235', '$2y$10$zHRoY3ZUG9LCXGOiJ3/LHe/nzqyM3jlQeY/zDmtdDRnTNOVAiaWGq', NULL, NULL, 0, 0, 0, 0, '34573b017140ef9eeb7e079caaee20af40fff65757e21bb295c46d5e74db6143a1607bd17763120ac0f3738b9b2f3e50ede3', 'b914c2bb1bc32531d23e1ef5d540f9fc6704722f874b2403660b8cbfedd2c0568c7fd1ad2157d728dfd77acc4def9fe6cb4b', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(55, NULL, 'joshuah17', 'Hamill', 'Estefania', '2004-01-14', 'fwuckert@sipes.biz', '36033 Jordyn Mews\nSouth Sabinahaven, DE 02454', NULL, NULL, '684.404.2205 x893', '$2y$10$E0sgK4ThOzPG392g0LO2QuGHRQw8tZGsYg54OWtayGJaOHGbblCe6', NULL, NULL, 0, 0, 0, 0, '4634d6857fd35a2738625547c0f9e55c41efbd242a178712e759b763fb079adb52e2aa9ab50401d2642f8ca7055aeca826ec', 'd6e4ff7e5777f03e1945f791d42078a3602e0d08f5294b3e028424a6071c8b28a72c4954e2b7b8009ed9d7a79818e80ea586', '2021-03-02 09:25:24', '0000-00-00 00:00:00'),
(56, NULL, 'jettie.daniel', 'Dietrich', 'Willis', '2008-03-28', 'lmayer@yahoo.com', '7966 Mayer Cape\nEast Laurie, TN 41557-3911', NULL, NULL, '1-725-353-6491 x0881', '$2y$10$FJQpkGmB7VKadvcTvk4Cy.p6cFmTSZ1HzO45wn5l9uhgRd7ChoT7O', NULL, NULL, 0, 0, 0, 0, '2c13a3b9472228a855e69406f1044b24000955f3ae765159b36652db650121a59923a4c436fa2f87859b6371c63f5c699b2f', '18c0e394b0991a59bc95e42a7adcc75af76fc7f83412e0290f7e9d51a0a61a55786128823149b89d25404ddbad4f3e6c0d04', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(57, NULL, 'rernser', 'Braun', 'Lisa', '1994-01-30', 'carmella.flatley@hotmail.com', '9440 Gerhold Summit Apt. 224\nWest Gabrielle, NE 69174-2721', NULL, NULL, '+1 (290) 682-0667', '$2y$10$l9Nu9s0AgBT0TpvvFZqwvO2Z59xqsgzhyqr0lKPwNMtotbTtKzgEG', NULL, NULL, 0, 0, 0, 0, 'e71aed7aae812e0a3bc5573a14c2b6df2a3fad50a41aa4ed41229527b89e29a2b85f984d1b182453213e7ba94fbb42618e39', 'f7d2a97d8ea231654062b2af202871ada70048b8f1f71de478425c4b70fd057f100ad9e19c18379498d7a5be467ef07dd3b1', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(58, NULL, 'schmitt.sofia', 'Keebler', 'Antwon', '1999-08-27', 'virgie96@gmail.com', '1353 Ledner Hollow Suite 862\nBernadineshire, ID 11128', NULL, NULL, '360-451-4624 x38498', '$2y$10$9KBqS24bsBNI1fF7nqrYlOMFHDuaQbv4IFoWgOKcKHXFTH9tJj5/e', NULL, NULL, 0, 0, 0, 0, '027bcab9f0399e8fa35abdbe5923217fe3cec059f0747d2afea19e36292743e8e09020e81f3f9251d5f5f4646e0ab01d799c', '0b175b7ee9c62919a1987a0d2481e96940b02dcd8cc30417e81bfbcc2ddef5e40374d2752bb27f2b13215a5b0573b62dc7a8', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(59, NULL, 'jratke', 'Ziemann', 'Johnson', '2000-05-19', 'dawn14@yahoo.com', '531 Macejkovic Squares Apt. 337\nEbonyhaven, IN 75863', NULL, NULL, '1-910-965-0192', '$2y$10$vlcnm25G.6LACJItqN0K8eIYRtkka7QJrqt6yxzd2pl5sS8bVk49.', NULL, NULL, 0, 0, 0, 0, '939903a35753a0c021247bc5eeaab8a5fddc2d647d238085bf9dbb3c52e6d399352608cb8703c604545b5a42ce2ed2817758', '14ca940fd2a2a58fac18077b802fc6c695eea9037bab2b0d778848d17fe68fdd3fb796a6b7809dad0b93dd892b9b048c1c50', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(60, NULL, 'jthiel', 'Zulauf', 'Magnus', '1977-11-22', 'qhodkiewicz@hotmail.com', '323 Moore Squares\nSouth Hillary, MS 28520', NULL, NULL, '(283) 218-0230 x631', '$2y$10$3.cG3guCgpZhlaUtNXlUH.52MSx1VBWZEk4jSyxUhQsXqe2kxia36', NULL, NULL, 0, 0, 0, 0, '08297fcf323d81757217512d9098d5dcf4e29d393dfed9e2ecf6a454b49f2cc3b563a57005f75a4845e72bd022deb9ce9839', 'e34a7d5626a2ec83601cb4e4d93f29cbf00671a3bfd15a9ece70faed61c5369908f4d86c57814ee28f984b0e86cba68eea45', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(61, NULL, 'cummerata.bennett', 'Greenholt', 'Carlie', '1994-06-25', 'torey01@hotmail.com', '1816 Xavier Locks Apt. 161\nNorth Elna, VT 97366', NULL, NULL, '808-857-0006 x9156', '$2y$10$WboFoMDlETKwQpxWrKvanOw3ywfMywVmYqsgXMEjycst3yEbgYhrm', NULL, NULL, 0, 0, 0, 0, '63eabab6b1b7e88fb329c0fa3eb232f46aa224e8a8ffb8d5abd56c83ebdfba3c5a9eff9a877b7e1b1aee13fa597cc48a6b5a', 'f358adb3579a598815a3efdcea5ce67eb766a5228eb10c04d864da37aa2c355bc426e07730ed0f1266c6a7008496f6ab3650', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(62, NULL, 'frami.kirsten', 'Rosenbaum', 'Carlo', '2014-02-22', 'ethel.adams@gmail.com', '8039 Littel Courts\nDenashire, MN 96270', NULL, NULL, '750-857-4710 x75449', '$2y$10$muL7yHpcMaXwTpn3eugojuNZKj0wGq8N8ejZTNjLWbOAqf7s2S3Um', NULL, NULL, 0, 0, 0, 0, 'c2dec9501283e91164c52020a20fdded4e716cd3432faa981cfc0ffc9d5a11d16b72a2c2e9490680bd4d8de131b8258ed868', '2f752c2b5fc3f844ae9c9944152513fa047c4819698144f9c534b5bd15f61db57bd5ce55a08f1e2b84a198df019c8fa32bf6', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(63, NULL, 'rbarrows', 'Collier', 'Meggie', '1975-09-09', 'ferry.thurman@hotmail.com', '7181 Dayana Loaf\nKrajcikburgh, MD 81913-5599', NULL, NULL, '+1 (619) 494-6048', '$2y$10$gYFqAHTF05yKGAHnfKT4z.4T5lTASsheplocbmfKB3zTo4/sfuKJe', NULL, NULL, 0, 0, 0, 0, '69891c5cf7e5159fd478d0c08a48e9f819692b9d3f7989df60a1c3c392ef55315141359ca7acaa5447b4c853f9e8d7824237', 'a8ffd8ebcbc9abeba654ae084e85bbb62c086738ddb29ac5d1fcb9b26befa892c4ecc1bb8802a84d6423f174abc8e1dd0ffa', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(64, NULL, 'rebeka.runte', 'Becker', 'Brisa', '2012-01-16', 'ellsworth.kreiger@fisher.info', '67459 Ivory Drive Apt. 845\nNorth Nash, WY 68024', NULL, NULL, '251-374-0104 x76587', '$2y$10$hUKhkUEDPfEPgGjWVREj3.wSzoSYHnBOVVmL51I2ACYmJ./JYgO.y', NULL, NULL, 0, 0, 0, 0, 'd1a144fe0316b55034a2dc91e63edbe104f36324bc400de2bc1f131ba64d1cc7f4739009f8b75920b0a4ec8ff421c5e7c2de', '82b060fbd3484689a07c79784ddbb5bc943f5403b357446bed2f157681d34cd030026cffd7eacc92aebb7434ae64a94f9a4a', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(65, NULL, 'wintheiser.jamarcus', 'Franecki', 'Wyatt', '1990-02-05', 'gstokes@lehner.info', '3273 Schmeler Ports\nLake Kathryn, NM 22193', NULL, NULL, '(285) 945-2540 x05749', '$2y$10$yq5tTpECZ7US5o6.12751uLrP6h61nw9EL1j/BiXKSlBXHCC4An4.', NULL, NULL, 0, 0, 0, 0, '44bb95fe2d5a2ab183b61eb7e7ead32b06c7a7055fdba9bd0cd0157c462e486bf43467beda5150e876eaf4451dccf80b64c4', 'ed62495f709a79ee3429ff1acf0041ff224324c584e37491eccb18ab065ec8baaf33d78004d8e19fff7ecef807e35860a0d0', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(66, NULL, 'matilde20', 'Collier', 'Marley', '2017-11-04', 'rbraun@yahoo.com', '56344 Burdette Harbor\nKellifurt, DC 07336', NULL, NULL, '+1-357-409-5213', '$2y$10$QoAqU8Sg1qkGqymGc6sYTOO9XhnzFaJg7rIif35rjYS8dHnZDm0Iu', NULL, NULL, 0, 0, 0, 0, '76aca09f338225cb33f744c7cb14b5d6dc50c418b7db3a2d96a82ebaa8397bff5ab9468867ef3b2c92a2cf027b291a48ef2c', '12bd3c0415060c66b8d99a8766cc1207c393a0d98a8b49fec163f711fac32b880abdaf251632c6754fcf22a9bf5bac111630', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(67, NULL, 'raynor.clement', 'Reichert', 'Arden', '2008-10-09', 'aletha.stokes@oreilly.com', '56845 Zola Loop Apt. 917\nDorothyland, MA 63738-7584', NULL, NULL, '(891) 760-8064 x019', '$2y$10$dvy6Q6XcjY453ve2XURR3eEm4KMljBWpIfMdmqx4aMQ6I6DA3AC0a', NULL, NULL, 0, 0, 0, 0, '3f1ea650981d5eab9d75de682679241478c8dcf1bd6a6c98f680582bef7fa3ec52c3b284835717ff035d21c7a3d6ec42ef3f', '7ad3943073c8a1afac5326d0e887a98d256d61787abc5ac36e7dfb5e885a79ef1206a62e62a0fffcf86285981e08e5eac526', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(68, NULL, 'mortimer.vonrueden', 'Hane', 'Noelia', '1999-09-04', 'fkirlin@smitham.com', '376 Keely Burgs\nMoorehaven, NC 52379-3438', NULL, NULL, '772.961.8375 x694', '$2y$10$gn4k86UY6d4BwkxB7z6dYuMsDc6dYv3uPbUUfN7GxS.4aIrYiyrwK', NULL, NULL, 0, 0, 0, 0, '24efaf32eafb816ccf3b2979d08572109ba16cfcf82d4188283637b3564dfc3a3e475a6763f867c1bfe1dc0a67804980d738', '1cc3a6c2fe197d7052fec733f4c2802b2c3398590b9f949cf79c570d5268fbbdd787decd33e9588f70a003f92bb00448ec7f', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(69, NULL, 'cassin.olaf', 'Grimes', 'Lia', '1991-02-10', 'jamar.schoen@quigley.com', '61214 Goldner Bridge\nNew Ellie, HI 88613-0760', NULL, NULL, '1-436-565-6454', '$2y$10$ija6XCO0VrRwIXk.40x6C.G.kmH60BZAFdFBZMXAMI6cnmLkGRhm.', NULL, NULL, 0, 0, 0, 0, '02f745d405bd2a89116fbcfaaf8472530b8c79c1fe7abb6ef54d7599754fe3be2a77268e8cf007d36069450323a139e8e709', 'b14e42d84ed778eb8eac778c82a0092fa27e34027a1428dded4c35a7bab9b72a5c546dbc84abf1c5f35a3f93f4e947fca2ed', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(70, NULL, 'miller.keanu', 'Gislason', 'Dorian', '1977-09-16', 'kara.swift@mueller.org', '207 D\'Amore Springs\nGutkowskitown, TN 02689-0485', NULL, NULL, '(997) 765-0777 x825', '$2y$10$9fJw5/.NT4XjHT4ZKmqFYedH3ErxeKo2uAdrCG6c0o9ClCbM1sTqy', NULL, NULL, 0, 0, 0, 0, '61e8d72d27112b60cec333ad837c3431df8ca9cbbd56dcc2094ed70c6dde40639027467fce24090cf4863237b27b5548ed7d', '812cceb34b9bf77769fdf71f2b74196102a66e8db7029e94d4f4114d9db82fdb43b7a96fd281eaa03e10c2d8ff2283343324', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(71, NULL, 'kristy.boyer', 'Bradtke', 'Loyal', '1977-02-12', 'kevin.grimes@price.com', '73673 Toy Expressway Suite 322\nWest Guyton, NC 34522', NULL, NULL, '686-305-1248', '$2y$10$MFALFfPKqm7SJqKayTHZyuFFU38CTqvPzcP5MuOCL19QbmixN7Ity', NULL, NULL, 0, 0, 0, 0, '3368703c8d1b5683d113ab7466d24dac108e913fe071dd0495ab3d9dea4d8fd64de7ef3298d2bedd9cbb3ba4591c1fca4094', '760d85c5bedaf0d822dd7fdfa0c8709deb1094261bbfb2fc1b9fc71c8af2dede0ddd2eb49d8a607c0e7f147562701445ca2d', '2021-03-02 09:25:25', '0000-00-00 00:00:00'),
(72, NULL, 'addison32', 'Johnson', 'Emmitt', '2012-12-12', 'pkassulke@gmail.com', '539 Mazie Rue\nEast Celine, ID 02111', NULL, NULL, '620-549-7215', '$2y$10$SCVTQBjW74QPCapMDiTy/ub92jcarTeBnZiIc03o9RGTkm3Gv5HiS', NULL, NULL, 0, 0, 0, 0, 'a4430f08449afe33838c6ef1da1bdf00c887f2f8475f572b4a350d4d870abb6e4dc2ec2f450efc43fad6851e895a3e29dd8c', 'd88cbb084a765072ccfa0694fcd2d95c1ff6f0a1c1e2573cd9b3b9781eca87719d0dadebd4ecdf2d6f1907ee7ac4e0c03141', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(73, NULL, 'gottlieb.lyric', 'Champlin', 'Lisa', '1980-08-26', 'qquigley@jakubowski.com', '8355 Joanie Plains\nAlfmouth, MN 92381', NULL, NULL, '925.363.2503 x9372', '$2y$10$ofHzRO4t0raTckJek5gSR.36EI35ZKlowFC7od6TgNRT45Ncl3Vz6', NULL, NULL, 0, 0, 0, 0, 'e1780a31b59d2061a5f15304ffdffeb291aef53e5d71d4230c3b7d6c45e09322bfc4a564a51e1f84d63d248f10cf2801a15f', 'aaea1fb3a21de6677e7b1c99f8dd4e83dbfa7b345dc3633720892e473c12d644212ad5f7602e24e42b5548c09a0f5b06dda8', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(74, NULL, 'samanta27', 'Streich', 'Kayla', '1976-12-01', 'xcassin@kertzmann.com', '7135 Magnolia Roads\nSchuppebury, WI 45546', NULL, NULL, '550-712-4476', '$2y$10$QAIHOz0YwUtK49iKHGra2.EzlUuOzu/brl6Vc/XGEhdM/BvuTMAra', NULL, NULL, 0, 0, 0, 0, '21b999754b30ffa12fbc9dc23f5e8e69c16c2a928d29a8d164ab306db17ae40e9fd6e1f44b3d86e7a0e60c2f4a62f26db556', 'a934f90e45b1fab7e1d0691bb53f132595c1d6aaf5956ca5d2876d4d3bdf3c922c73a5dad828a614d7fc3e235b0a6fa5e970', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(75, NULL, 'iondricka', 'Stamm', 'Elroy', '1981-01-09', 'schulist.general@gmail.com', '215 Ahmed Crossroad Apt. 120\nHiramland, ME 21520-8721', NULL, NULL, '532.267.6690', '$2y$10$12cAkUXMArGRk.XYUyuOTuvatf969XdSk9VMuXHmLw.9IGTjYh.zu', NULL, NULL, 0, 0, 0, 0, '2c9e8c305a62b6fa6a9297b56958213a54de11e7001309146f61358abe9127490f5eea4f2ac71a73324ce8de6480845582a5', '4a6bcd330c9ddee0f2556f9151ef5ab6582fca4c745be6a2566550da70de356dcc0834e9fd1efad908e6208a1dc65a1529fb', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(76, NULL, 'kozey.priscilla', 'Anderson', 'Cassandre', '2000-12-07', 'fschamberger@kohler.net', '829 Wisoky Valleys\nNorth Vivianebury, ME 02786-9566', NULL, NULL, '(643) 536-8471 x9516', '$2y$10$k8LiAi3iQJwgIWw7YFrFz.zRMTr3vcEjz6EBHgXwcy27e9BghMkpa', NULL, NULL, 0, 0, 0, 0, '782491b9c361070f3374cc24381211d04ab973fb7a10de6e80826142850163e268c52ad03ecd8579fa6b03f6cf8ec60f6da4', '459a2d819097f138f66b12e01c2ed1f5c81afd7605ecd8aad5f643047aedf64c1a9e48036c8d552b21f61dc51c867e68519f', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(77, NULL, 'bednar.raul', 'Price', 'Queenie', '1986-02-20', 'beer.bethel@konopelski.info', '91864 Chet River Apt. 985\nPort Verner, CT 45906-3060', NULL, NULL, '(764) 608-5195 x1611', '$2y$10$s25.xhq6yHo8jQfOt8/xEeShCng8FPYOtESdBTE0v42OCi1jruI6C', NULL, NULL, 0, 0, 0, 0, 'b22cfe5edb4ae0065b486385d5f329b282fd32847e524cf2a27a4fe34d288ee0e27357d775b40e8810ffa4ef7a69d5221796', '8d91b0e2306f97c1411da5a8c2a69d84c74d917a30964b23a2f4fd62d8fd4dcf37123b69a9caade58b162248270cac1af146', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(78, NULL, 'skye30', 'Volkman', 'Edyth', '1996-07-01', 'nconn@gmail.com', '3774 Goldner Spring\nIanside, SC 44657', NULL, NULL, '1-434-642-3674 x282', '$2y$10$bYkGYfWHUIxEdYZvBz.YlORIZlQShgP4lM8Taor/PyB8toAeVTcXC', NULL, NULL, 0, 0, 0, 0, 'ef3f3b83b040383e388850b8407910919a2f51ac0045e99fe87662b1865ec3ed47b0f3db35309f5ddf98b1ae18bda5ece2a7', '47c8e7478f31616839476cd80d12dee3cd68e0f861585737b92e16d857672bc152870a5b53adc999621591de87ad47ac02a6', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(79, NULL, 'alphonso48', 'Rogahn', 'Mikayla', '1993-09-28', 'lila13@gmail.com', '4867 Lourdes Trace\nPort Tobinview, FL 04632', NULL, NULL, '1-721-979-0934', '$2y$10$bKq.xhGuX8E9uOJYGAc/nuwRFtg1XXO5Ih2L5Gzcvr3ZYxeh2FZ1C', NULL, NULL, 0, 0, 0, 0, '25c592e84ee1168357249f70ec6d39fba02c83ca33505157c235565acb6915b5dafefb0d8602bcf98af53d5f68d6124ce6d4', '480d5e53a4e62d538063becc4f50ce54e20d9d864a52d409232827c967881a88c777b0cba1028d2257cd448077ea35c21ef2', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(80, NULL, 'reilly80', 'Walker', 'Madison', '1977-11-11', 'lang.guadalupe@christiansen.com', '706 Angus Hill\nSouth Osbaldoborough, MT 97785', NULL, NULL, '(631) 770-5790 x8166', '$2y$10$0egwHivoNX5NLxW10Nmf7ujWUI6fH1z124fEX6hNL.igzME1aZ8tG', NULL, NULL, 0, 0, 0, 0, 'ddad9535cd246c86a1734fb234fc9843dda49e0fc24fc0f5979b8bb0308ac86abe109c81740fd5f6975f9fa65df657457679', '377d2c4d2a438829d29b74a69be639ba1eafc53a3798e7430e38a5cb9c93debc7c696df271e852f91d3b8819e4399d7bed3d', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(81, NULL, 'kristopher.grimes', 'Schaefer', 'Jeremie', '1998-12-15', 'adrien74@anderson.com', '2513 Flatley Lodge\nSouth Sigurdstad, MA 44369-3271', NULL, NULL, '236-224-0435', '$2y$10$k4Fbb/jkrs1Duj0T6rsqY.DzJBOWKu6Nh8DrHjrsoLHzBU8Ivjanu', NULL, NULL, 0, 0, 0, 0, '0c25e09711053ad5d58bdbf8ff04ca91d94f4111309aa1444c05536ed3e3bbad722519f993216a2dbc01b1921761a27a7d77', '4e9986fed3a7a3570b0a331e32a00e5cc542e4848cc77e55862a846ea9c87ec6b61e481e4c2ed4b7ec036b102b8b79de72ea', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(82, NULL, 'smitham.austyn', 'Blick', 'Modesto', '1971-01-05', 'wolff.gilberto@yahoo.com', '71601 Mathilde Garden Apt. 608\nNorth Mellieville, KY 02840-9670', NULL, NULL, '(836) 576-2020 x8793', '$2y$10$C0cBkoXW.bXEl7BzZ7j1aOPwvy0bRBY9Lz8LxHPCcvVJNYXOCqzHu', NULL, NULL, 0, 0, 0, 0, '1136e03bb0d1319b8b2b6a271ce87bff7a7962c43b4ce400b6c36a64cda1e0f75f4a1a4956b4449725bacf3f40c23fe17198', '2feb89e00c68d61cb217aebac86df3852c07be6e50981042442d15007d843657c2890172ce6860752db211f8a9c562a62720', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(83, NULL, 'wkeebler', 'Gaylord', 'Rosamond', '2019-10-31', 'dillon.langworth@swift.com', '93249 Sandrine Prairie Suite 821\nYostside, ID 53863', NULL, NULL, '462.336.0737 x3696', '$2y$10$kIxwTOtqn1RPjwwGy6qgI.k9lugNwLsLu7LiUBg.ES27Cgm5erwzq', NULL, NULL, 0, 0, 0, 0, '20daa2df284f4fa89d132dd4a2efb318e1878b4e3150b35639039f2b849a585bb153e340294379983dc2e9c5496c01d22f4e', '594e9282f41f6442cbf894f3293592ba2b163d585d1014af804f1f5e0f11500717472598c073c1848d5b504e3d96e574d798', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(84, NULL, 'jhettinger', 'Goldner', 'Emery', '2004-08-19', 'brandi88@hahn.com', '2503 Electa Ways Suite 597\nSouth Rachel, PA 00072', NULL, NULL, '+1-437-584-3684', '$2y$10$Y1cFIfA1Fd6O7zwz.c4N1evnTZL0nElYmJl9SbQUW10/K4qfJXcdW', NULL, NULL, 0, 0, 0, 0, '003546ac7bb6b12b462d096e1322001f1322f3694cb9f4218f49da218b2f9061b18a5889299195a2d9e2f1be1ab100c4ae77', 'e19beede3faf4c34d7f1c66a4cab4099f585d58d3711553b85b55add144ff82cb6929cba3ea9f4844ed9e3e6bec2dbed291b', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(85, NULL, 'rrenner', 'Berge', 'Dayton', '2009-11-17', 'raven81@yahoo.com', '5101 Considine Crossing\nLake Felipe, AL 51928', NULL, NULL, '821.373.9518 x502', '$2y$10$6wVXKPwsSIp9gWlfD6ZI1.3a2a2XZRjO/fusWr8auzp9EQIOXxtsi', NULL, NULL, 0, 0, 0, 0, '134dd3a26927b5fc4581b25d4b470650e893de5ea914e3d4f2f133017d098646b270938b6bde4f9092cc8970b4fb3d1c1c54', '54139aeaefd90b81a120d57e0d8b09414551fb5be4b2b593bec023e0445a2710eaf902a34d97f33a625d9fa2be2f4a9dfdc7', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(86, NULL, 'cbergnaum', 'Bartoletti', 'Brigitte', '1991-03-31', 'flatley.lavina@yahoo.com', '4381 Percy Prairie\nJoshuahmouth, ID 70162-4076', NULL, NULL, '(941) 862-3175 x91443', '$2y$10$naX.XuoHT9S9uxCLnT7qLeda2T.UM30EDf0Rw4S8sBYllfXYVHegS', NULL, NULL, 0, 0, 0, 0, '0c5ddfce95277eee0e3805c85cccbef79f4a9134e01ed564f3c15d032dfe4fd86cb885d6df4b547f4d18a40cac9e28cec982', 'efdb80091718afc8d9dd006dbbb68e3e321c87e4393bf5a9c4109cc30ca86b07b80553ee9fbd9fe6035687193a4e6b2f0051', '2021-03-02 09:25:26', '0000-00-00 00:00:00'),
(87, NULL, 'egraham', 'Trantow', 'Lamar', '2019-09-01', 'kkuhlman@gmail.com', '7611 Austyn Circle Suite 444\nSouth Tamaraport, UT 13714', NULL, NULL, '+1-979-361-6032', '$2y$10$vw82Fx3qMczf.XozFRlieu9UCsvFabHflnHGosbppUt9ukuHuRMAm', NULL, NULL, 0, 0, 0, 0, '60478245b515067d9296c0cde441ba2c41af801b100b1d6479c9bf8b1ee3c30af93f94a3fb27537a1f416ef717eaff6530dc', '0dc42f737286f76e8b45f45902c22ecd6cd870bef00901e1abe1b1a004e00a34263eca322be14c7662ac0c091a4f6e0581da', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(88, NULL, 'sister.goyette', 'Mann', 'Eryn', '2018-11-30', 'watsica.samanta@ledner.com', '1641 Stracke Cove Suite 410\nNorth Rachelle, FL 42286', NULL, NULL, '960-965-8209 x546', '$2y$10$u4nvmUjBgGXizDHKsfpq7eaUWEdsIn3aIIIy6gu43tT8HhlgvxAJq', NULL, NULL, 0, 0, 0, 0, 'afdd890d6afd256981bd799d45d0fa8cf1ec273033231f5b701d08c0590d9351c030957e0518e73c0ea6682a1063ed2be0ad', 'ca815fcf9a166b9befe153479346e54bf72f10dcb8c765763d00870fd3a02cf1b7697b6e604bf2b3db0bf6532c02e9df86e4', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(89, NULL, 'ccollins', 'Feest', 'Meta', '2006-06-18', 'gmonahan@rutherford.org', '5122 Bruen Village\nHermannburgh, TN 33624-5415', NULL, NULL, '914-697-6585 x685', '$2y$10$yoOz6hyQP.zJVYNJR4h0YuiePCivktnFaZmD.iKIrgIpRcdQKCtgy', NULL, NULL, 0, 0, 0, 0, 'a6ed31133b849a56799655dbbd01a854a01831f69c91fc5e53ac7224fbe678a7d9745489b9a7efca0b471727fecd613e7616', '76d7189fed5fdc570e42a7fea25bb8a70789cc9f21076bb99871c141743cf2903eb36cf2161207b91d29cbbbfad6be57159b', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(90, NULL, 'awiegand', 'Volkman', 'Clyde', '1987-11-03', 'lockman.asa@dicki.biz', '93894 Hermiston Keys\nStrosinbury, AK 44061', NULL, NULL, '+1-531-371-7009', '$2y$10$A6tAiElqE1buMmQ0iTd51e7lYClZiGS4ZpPwoNGQmxF9HcUiDfsqK', NULL, NULL, 0, 0, 0, 0, 'fd03b56ecc528ff1c259c6ff1bd6cbd871358c7d621313554be1d07f7953e3768aac784574a2d71bf49aa6396b52210799aa', '52be679013522935b20f72183466a8ffdb05e944677b614d63f930f6f7b33c586cca9eb36297ac7e1c2ddadd540d93000ba8', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(91, NULL, 'lorena47', 'O\'Conner', 'Emelie', '1993-11-16', 'kblock@hotmail.com', '983 Barrows Villages\nPort Kenyattaville, WI 68040', NULL, NULL, '552.230.5356', '$2y$10$RhnJ8VE4on8gcIS5Jk3od.i9zc5IDWUeRTH1CHYE1Yu7ICDvPtNBK', NULL, NULL, 0, 0, 0, 0, '9bf8cc4f2e15941266426931d6b9798698784f48389ec22b920522301fdd47583f106ce74278cc6a0d649e48b479eeb07285', '21b8af07c970958f27dfbe1948bae24d0a83cabadb4ce5fe71addf31e5b4f800035a5d26a6518e6095fb4919c06df6dbb8e5', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(92, NULL, 'clinton.ferry', 'Sipes', 'Gerhard', '2002-09-08', 'wisozk.anastacio@yahoo.com', '44348 Santiago Rapid\nPort Ismael, AL 52948-0979', NULL, NULL, '(373) 627-9342 x8707', '$2y$10$uYLkDk2jaXlwsk2.9PyYSuguDoK.H50osgyDzlYD0u2dyMmA9jFI6', NULL, NULL, 0, 0, 0, 0, 'e20bfe8dad4b9a77603249645ef5a81185b43f1c703c31176055ca70fbf3b0f6a55a6ab94b15f07e41867752677ac2401ebd', '9d9cafb334a5b7bea9aee34456ad453a120ac9aec1b62e3e7c533c04611a9a832674f0f4bd01535e7fd440b1614bf0e16b71', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(93, NULL, 'legros.lelia', 'Wintheiser', 'Thaddeus', '1994-02-06', 'twilderman@hotmail.com', '2034 Moses Square\nSouth Ima, NJ 41901', NULL, NULL, '+12753838037', '$2y$10$Ovp4X90LWxsjamuKZPv/k.OyyFckPbKNhqP6/Ne4W7RHyLUan9PxC', NULL, NULL, 0, 0, 0, 0, 'af06b0f827680d3393c09bb72404382e43ad99cc8215c782d02fa4573af33a3ac9e8e5eca8640231aa801ee9365b3476905a', '708b504a162539882556591676ee5c1e03c8630fc7c6efd0fe0a29a7f5ba68eca5662f3b8bc9ede59e3614e097c49dbf3136', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(94, NULL, 'alexandro98', 'Hudson', 'Gracie', '1976-01-23', 'ischuppe@carroll.com', '29222 Bechtelar Square\nBaileyland, NH 78213', NULL, NULL, '+17605031284', '$2y$10$9gw4bIAT3Gztwgc1mTUpuepSNUXzXgW99ghgcb7aa4dUz0wB1vDHC', NULL, NULL, 0, 0, 0, 0, 'ce78a97ea3164f7ac717673b05601da39c134b4aa017602bd498854112b5fe0f6f05f2aff4b722bf846710c6184b43957569', '4b7c83d3509ffd67a1268119ab8fa103f5161abf4ca6dca2833a4c9d4ffcf32e5ca5648241cae55d0b9374ac73d6ce06c567', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(95, NULL, 'coby33', 'Green', 'Joseph', '1984-05-19', 'bo.welch@yahoo.com', '63372 Gay Walk\nRaeganburgh, NY 23988', NULL, NULL, '1-913-242-1698 x196', '$2y$10$.UdQePljSAL4feOhD5j/reZ0qridVW1..ftNeMyksU.rEaiSQ6uqm', NULL, NULL, 0, 0, 0, 0, '75baaa2ac2e09156f3761acfc858409066993dcbfaf6b14a4b47c5e2733e120bd2efe98254ce1719e544489fe529ecbdd95b', 'c672fd8f2e2fdb5a93a3558b2a5af50593bf27f16c91c1ec580128da2731a0c8094afdb3fbb04d30dd4e607cc907cb38d8c1', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(96, NULL, 'csatterfield', 'Kohler', 'Arlie', '2006-01-16', 'bbogan@zulauf.com', '69958 Heller Inlet\nMiamouth, AZ 52609-4693', NULL, NULL, '715.515.5009 x6077', '$2y$10$qqdD72BjpFPM3kaA2NCSQeIH6VgroE6wFzNFSSfEpNX.cH2K30RJy', NULL, NULL, 0, 0, 0, 0, '97a64b8c60c3cd47d14c519727525c01fafcc9ce92b30d7a769e2c76f4d12d040fb5130377c1f8ce0489eb588d5a907cad60', 'ea2594cb323accea0e50e3eaa63452ab85fb16264625b772a0800ba603919462d5c78cc9ea006d92e5b84993597fdc89a09f', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(97, NULL, 'mercedes.skiles', 'Kuhn', 'Johnpaul', '2017-10-31', 'ola.glover@bechtelar.net', '241 Pollich Camp\nMooreshire, MN 36977', NULL, NULL, '969.283.3796', '$2y$10$XqLI5.FjTY49BCcNvrws5eUcRPY9jIOEnbBk7V/8f/WdSn14sa93q', NULL, NULL, 0, 0, 0, 0, 'd344a03e60645634ee38300ce57e67e4df6ee5e986d2c0b546fe835d8e0bbc88c36937a5d3bfd75322965fcfd60d22c441db', 'c7cf63d3e7476ba9fb6187264ad706144936fc43b81dde962bd89ca0e528faf50b55bb4045c284b06726df03deb8846f9f72', '2021-03-02 09:25:27', '0000-00-00 00:00:00');
INSERT INTO `users` (`id`, `avatar`, `username`, `firstname`, `lastname`, `birthdate`, `email`, `adress`, `city`, `postal_code`, `phone_number`, `password`, `lat`, `lon`, `is_helper`, `is_admin`, `is_google`, `is_verified`, `verify_token`, `reset_password_token`, `created_at`, `updated_at`) VALUES
(98, NULL, 'alta.kerluke', 'Wyman', 'Katherine', '2020-10-09', 'luz.cormier@breitenberg.com', '9817 Batz Cliffs Apt. 958\nCorwinfort, NH 75853-4398', NULL, NULL, '331-421-2342', '$2y$10$wQepJUCDoJbR4m48up65y.B5odG3rZsgLdh4Rhs8hBpRebPq1x6gi', NULL, NULL, 0, 0, 0, 0, 'd441a2957f68b752367d85e364ba6ff2f8c935c372f4a389ce91b1db1a440181a5d1c09578bd7c77e6ad7d1e844ff826db60', 'cdf85d8002c3342a221366b18ddfaf338a6f3dec1dcc5b5cac5fcd31c4cdeee04f5fd6ca877ec7a5e420b011cc809da49ccc', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(99, NULL, 'mackenzie.streich', 'Wilkinson', 'Chelsea', '1982-08-26', 'mkassulke@yahoo.com', '629 Bayer Stravenue Suite 176\nMistyberg, TN 10049', NULL, NULL, '1-357-405-7817 x24374', '$2y$10$Sx3mX0jjPzu/JkxTN/AVZeoye95iaIFWUfbwXxocecdKSAcUJQrsi', NULL, NULL, 0, 0, 0, 0, '3be92bc37c8d876cf9c4949e409055b03ae3809258bc28ff20cf5d04d7a90e548f1a23a9cde87b0479634c08fb02a41f7f04', '6c83f5188dcd024189e1971a0c2f0abb6ae1e98ce51145941e575671e3be81f542614f68792365c2ab2710c63807cae3ec21', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(100, NULL, 'fbatz', 'Braun', 'Kian', '2019-12-03', 'colby.crona@stroman.com', '574 Lindgren Shoal\nPort Desiree, WY 55291-7794', NULL, NULL, '512.828.9472 x16108', '$2y$10$Bi.JPkGj5xXf8Z/iqY0KwOhGO8gNS/0EbUaacPGc18fupiqvtqHD6', NULL, NULL, 0, 0, 0, 0, '8bdc4ef0810cd9492eefed3e5e87a31c2201b9d5344e0e84c098eea7b11367d7633cf9236f4d201fb4e8794e0e0c732bde0d', '13c2882772349274ddb3960f85845dde50a61fefb00797aa098f8b0df3ad6896676903d456f4e5a6e6d2ad00ab020231e38e', '2021-03-02 09:25:27', '0000-00-00 00:00:00'),
(101, NULL, 'zoltan777', NULL, NULL, NULL, 'zoltan777@yopmail.com', NULL, NULL, NULL, NULL, '$2y$10$qT28iwJ8UFeBwAEMhDYtJu811/hOINdpix3DdPo1Kggqla4gsmjLq', NULL, NULL, 0, 0, 0, 0, 'a664e6dba3f2ce73edc2f4f0d9f5b65df8ecaa6d9c080467309087b6681a6eb46dab1c49b998886c5fcd6b67ab208fa2966f', '6e319acf0a7ff3b4e7e1c40daab9c27db65c587bf78a151c261f71a65eda5bc9b2fa4e4cdadcae82632751e4dd162a2318d2', '2021-03-02 10:34:29', '0000-00-00 00:00:00'),
(102, NULL, 'zoltan666', NULL, NULL, NULL, 'zoltan666@yopmail.com', NULL, NULL, NULL, NULL, '$2y$10$w02dTfNftRxIV276rChVAeCislsoJAlfuerw2REvW/ybuCxvi7zka', NULL, NULL, 0, 1, 0, 1, '79380ac5dafc5134b42b47620cb8277e1930ca7f11067caee317e3949e408f7b06e34bfb5b929871617202a8097b24abb215', '126433fd99b279c54990efa53af25590cc71e17bbd47e06614bcdec6b2f25945dce165a5308e8921a5c96f9ea3f98fcea7a2', '2021-03-02 10:38:17', '2021-03-03 09:42:32'),
(103, NULL, 'zoltan444', NULL, NULL, NULL, 'zoltan444@yopmail.com', NULL, NULL, NULL, NULL, '$2y$10$Xwn.ZMQlrlp6QxDlXLxFxO5IPD/wF0RVSMJwYSUceBADDBDjA/Doe', NULL, NULL, 0, 0, 0, 1, '3baebb58904f1e1bb2094c368e8be6b075d363e845d5b715d3058c3306f928d231a5ccadcdf6390f514b095fcb61ad7baa1d', '14ac62dc1cb9bfb2a239fe00d213cd85c82b3b0c62660ffda828fed4fc40ebd7b4ecea14e9230007ab88c1e47d45a785e023', '2021-03-02 10:39:30', '2021-03-02 10:56:38'),
(104, NULL, 'zoltan333', NULL, NULL, NULL, 'zoltan333@yopmail.com', NULL, NULL, NULL, NULL, '$2y$10$XjIuwq819kqiEgJ45iH47uyuI1ndLNslYL0rmcJqJj2ZfM.LjKtcq', NULL, NULL, 0, 0, 0, 1, 'f351d327f6710a53fafb29ec0e2872b832ec391dba6e8d23b15ee1a954da18ca3888c24cb3843ca5913efa9724271727cc4b', '3fd5441bef415d577b358e528912a492e6c286760a69ac287aa0b01cdccbafaf5cf683bf84d9ca09d5ef41224dfcae580bf9', '2021-03-02 10:40:41', '2021-03-02 10:40:53'),
(105, NULL, 'zoltan222', NULL, NULL, NULL, 'zoltan222@yopmail.com', NULL, NULL, NULL, NULL, '$2y$10$Kb1O9MJPvdUSh7NBWMhUoe5vHYwQtiPI/oSsaPJ5u5EbOkPZ7Qene', NULL, NULL, 0, 0, 0, 1, 'f8e413201479a2e83fa00fcbc47b9f459cc297d0b70fee904764bb673ce49207fab4026ffe62d28a4e09cb694bb7d9e1b291', '21d872444475abc01ff92dc106bf9f9a2913b2b687c04c59a4dfb4444957a448c68ac27c7f0f4f5c64ea5315cbef972794c6', '2021-03-02 10:43:58', '2021-03-02 10:44:51'),
(106, NULL, 'antoinehadrien', NULL, NULL, NULL, 'antoinehadrienleguillou@outlook.com', NULL, NULL, NULL, NULL, '$2y$10$Uwn2BKa/JwWaVaRHDz/E5Oq6xJu8PMnacJhmfGgcX4M2EJ3elFWNi', NULL, NULL, 0, 0, 0, 0, '2b73df36dde58d5e75b1fd8e0c98a45ec909b9f549aa02bafe2fd6be3690cdffabef7066f62d9f54513d4e6581ae768d70f5', '0138aa7751427cbabda0ba27e62aab3c0f10f0e301142c460e4e76b83bc7b06cb9e1f36aa235c0d4d628354746d61f895cd0', '2021-03-02 10:58:08', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `user_skills`
--

CREATE TABLE `user_skills` (
  `id` int(11) NOT NULL,
  `id_skill` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_skills`
--

INSERT INTO `user_skills` (`id`, `id_skill`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 29, 68, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(2, 10, 53, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(3, 29, 17, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(4, 32, 76, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(5, 10, 10, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(6, 25, 86, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(7, 21, 20, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(8, 2, 60, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(9, 38, 18, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(10, 25, 71, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(11, 22, 34, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(12, 9, 46, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(13, 33, 59, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(14, 40, 15, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(15, 36, 56, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(16, 34, 34, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(17, 28, 55, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(18, 23, 70, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(19, 23, 12, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(20, 11, 30, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(21, 22, 10, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(22, 36, 51, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(23, 32, 62, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(24, 23, 61, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(25, 12, 52, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(26, 34, 22, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(27, 10, 37, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(28, 8, 98, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(29, 23, 51, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(30, 36, 61, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(31, 39, 27, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(32, 15, 75, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(33, 19, 57, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(34, 22, 24, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(35, 22, 83, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(36, 10, 43, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(37, 2, 49, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(38, 4, 23, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(39, 28, 100, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(40, 23, 56, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(41, 40, 6, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(42, 7, 36, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(43, 20, 1, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(44, 4, 14, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(45, 21, 1, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(46, 6, 47, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(47, 13, 65, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(48, 37, 31, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(49, 34, 28, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(50, 34, 31, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(51, 12, 34, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(52, 12, 84, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(53, 24, 62, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(54, 15, 3, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(55, 35, 48, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(56, 26, 53, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(57, 39, 80, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(58, 38, 35, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(59, 34, 50, '2021-03-02 09:25:28', '0000-00-00 00:00:00'),
(60, 2, 66, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(61, 31, 29, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(62, 15, 63, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(63, 15, 73, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(64, 20, 54, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(65, 22, 74, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(66, 28, 16, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(67, 23, 26, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(68, 19, 98, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(69, 20, 86, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(70, 14, 60, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(71, 12, 73, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(72, 21, 16, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(73, 13, 50, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(74, 35, 79, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(75, 33, 59, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(76, 1, 92, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(77, 6, 37, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(78, 12, 88, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(79, 39, 21, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(80, 9, 78, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(81, 13, 24, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(82, 27, 72, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(83, 2, 65, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(84, 35, 75, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(85, 39, 34, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(86, 18, 15, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(87, 29, 8, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(88, 38, 17, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(89, 23, 5, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(90, 2, 11, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(91, 29, 15, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(92, 34, 36, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(93, 35, 46, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(94, 37, 12, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(95, 20, 2, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(96, 8, 15, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(97, 35, 68, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(98, 20, 99, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(99, 36, 53, '2021-03-02 09:25:29', '0000-00-00 00:00:00'),
(100, 29, 70, '2021-03-02 09:25:29', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `user_warnings`
--

CREATE TABLE `user_warnings` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `message` tinytext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `warnings`
--

CREATE TABLE `warnings` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `message` tinytext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `asks`
--
ALTER TABLE `asks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`,`id_post`),
  ADD KEY `id_post` (`id_post`);

--
-- Index pour la table `breakdown_categories`
--
ALTER TABLE `breakdown_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `platform_id` (`id_platform`);

--
-- Index pour la table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chat_users`
--
ALTER TABLE `chat_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_chat` (`id_chat`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_chat` (`id_chat`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_chat_2` (`id_chat`);

--
-- Index pour la table `metadatas`
--
ALTER TABLE `metadatas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_page` (`id_page`),
  ADD KEY `id_page_2` (`id_page`);

--
-- Index pour la table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`,`id_post`),
  ADD KEY `id_post` (`id_post`);

--
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_page_group` (`id_page_group`);

--
-- Index pour la table `page_group`
--
ALTER TABLE `page_group`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_breakdown_type` (`id_breakdown_category`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `post_warnings`
--
ALTER TABLE `post_warnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_post` (`id_post`);

--
-- Index pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_reviewed` (`id_reviewed`),
  ADD KEY `id_reviewer` (`id_reviewer`);

--
-- Index pour la table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_platform` (`id_breakdown_category`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Index pour la table `user_skills`
--
ALTER TABLE `user_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_skill` (`id_skill`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `user_warnings`
--
ALTER TABLE `user_warnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `warnings`
--
ALTER TABLE `warnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`,`id_post`),
  ADD KEY `id_post` (`id_post`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asks`
--
ALTER TABLE `asks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `breakdown_categories`
--
ALTER TABLE `breakdown_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `chat_users`
--
ALTER TABLE `chat_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `metadatas`
--
ALTER TABLE `metadatas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `page_group`
--
ALTER TABLE `page_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pour la table `post_warnings`
--
ALTER TABLE `post_warnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT pour la table `user_skills`
--
ALTER TABLE `user_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pour la table `user_warnings`
--
ALTER TABLE `user_warnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `warnings`
--
ALTER TABLE `warnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chat_users`
--
ALTER TABLE `chat_users`
  ADD CONSTRAINT `chat_users_ibfk_1` FOREIGN KEY (`id_chat`) REFERENCES `chats` (`id`),
  ADD CONSTRAINT `chat_users_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`id_chat`) REFERENCES `chats` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

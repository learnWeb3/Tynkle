-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 25 fév. 2021 à 14:20
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
(1, 1, 'Dépanner mon PC/ MAC', 'Aut vero ab porro laborum. Officiis pariatur quis non facilis aliquid explicabo molestiae. Saepe quam non molestiae excepturi qui repellat iste consequuntur.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(2, 1, 'Faire évoluer mon matériel', 'A dolorum itaque et occaecati molestias. Minus porro nihil ratione magnam est tenetur minus praesentium. Fugit ducimus dicta sunt consequatur reprehenderit incidunt non.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(3, 1, 'Installer un logiciel', 'Ut cum enim sequi. Eius voluptas magni voluptate porro accusantium nulla. Rerum velit molestiae quia dignissimos.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(4, 1, 'Aide à l\'utilisation', 'Qui odit doloremque corporis. Odio molestias non dolor sunt asperiores odio. Labore tempore vel sint. Officia minima enim est in sunt. Quos voluptate sed quia est eaque qui nesciunt.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(5, 2, 'Dépanner mon smartphone', 'Nostrum quam ea quia saepe enim et. Voluptatem aut nam ut aut deserunt molestias consequatur voluptatem. Quae fugit et numquam facilis earum hic.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(6, 2, 'Depanner ma tablette', 'Adipisci accusantium quasi velit eos voluptates. Dolorem sit officia expedita qui. Eius dolore molestiae odio porro labore illum quasi. Et eum eum culpa sit officia quo.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(7, 2, 'Changer une pièce', 'Commodi sint aliquid saepe ullam qui officiis unde. Debitis ratione tenetur quaerat quia voluptatum.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(8, 2, 'Aide à l\'utilisation', 'Necessitatibus quod soluta eaque nihil. Placeat excepturi quod animi aut similique. Illo eius sed impedit earum corrupti iusto ratione.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(9, 3, 'Installation box internet', 'Suscipit voluptatibus quasi odio dolor illo. Sint quam ipsum iure veritatis ab quidem. Vel et voluptatem eos voluptatem ducimus magnam asperiores. Aut est amet tenetur rerum voluptas soluta.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(10, 3, 'Connecter mes appareils', 'Quis harum quae doloribus ipsam cumque. Incidunt itaque velit rem. Non nesciunt possimus dolore quo temporibus dicta et. Et velit doloremque sit sint voluptatem.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(11, 3, 'Dépanner ma connexion internet', 'Deleniti nemo iure nihil natus temporibus nihil est. Ut ea similique consequatur voluptatem qui. Occaecati consequatur soluta culpa hic qui.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(12, 3, 'Aide à l\'utilisation', 'Sed enim quis magnam pariatur voluptatem facilis accusamus voluptatem. Et consequatur rerum officiis repellat repellendus.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(13, 4, 'Installation gros/petit électroménager', 'Quis sequi doloribus facilis est in enim. Ea sapiente aperiam aut. Nesciunt quisquam repellat corrupti eos est corrupti. Aut esse nihil impedit commodi nihil voluptas.', '2021-02-25 14:07:54', '0000-00-00 00:00:00'),
(14, 4, 'Réparation / entretien petit électroménager', 'Ipsum quia qui qui qui sed. In reiciendis officiis culpa beatae autem. Dolor sapiente est deserunt velit eos quae. Quia aperiam numquam fugit hic aut.', '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(15, 4, 'Réparation / entretien gros électroménager', 'Provident et et corrupti quos suscipit deserunt. Voluptas aliquam odio dolorum accusantium ut. Veritatis suscipit eos esse quisquam enim.', '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(16, 5, 'Réparer / configurer ma playstation', 'Sequi aut qui reprehenderit suscipit recusandae. Et quae nemo sint sapiente culpa tempora ut quis.', '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(17, 5, 'Réparer / configurer ma xBox', 'Et aliquid voluptatum corporis velit cupiditate eum accusamus. Cumque quia quidem facere. Delectus quis molestias debitis animi id. Ut asperiores placeat nihil veniam.', '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(18, 5, 'Réparer / configurer ma Nintendo Switch', 'Nisi quod fugit voluptatem eaque ut saepe mollitia. Neque voluptas possimus deleniti. Ipsum aspernatur ut enim aut consequatur labore animi.', '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(19, 5, 'Autres consoles', 'Velit in voluptas quis ipsa et voluptatum et. Temporibus architecto quia deserunt qui. Neque rerum unde voluptas aut porro rerum illum tenetur. Ea dolor corporis quia non natus debitis.', '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(20, 6, 'Depanner/installer ma TV', 'Asperiores repellat harum placeat libero illum ipsa quo. Autem quo mollitia iste perferendis corrupti est. In autem harum quo itaque quasi est qui.', '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(21, 6, 'Depanner/installer mon système audio', 'Non nulla numquam atque consequuntur. Sint impedit omnis cupiditate aliquid rerum occaecati quidem cupiditate. Dolores dolor quo porro. Repellendus quos provident ut voluptatem repellat fugiat.', '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(22, 6, 'Depanner/installer mon lecteur vidéo', 'Cum quidem vero officia qui non nihil vel. Molestias omnis fuga et ab voluptates maiores laborum est.', '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(23, 6, 'Aide à l\'utilisation', 'Est quam amet itaque laudantium sed qui accusamus. Repudiandae beatae nam et rerum explicabo. Reprehenderit et nulla blanditiis at doloremque perspiciatis. Quas nobis a hic odio accusamus.', '2021-02-25 14:07:55', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 90, 23, 'offfre n° 0', 'Animi est voluptatem et omnis blanditiis aliquam. Qui velit omnis incidunt et. Animi maxime qui id incidunt aut sequi.', 294, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(2, 51, 67, 'offfre n° 1', 'Laboriosam eum et unde dolores aliquid labore molestiae. Soluta quis sed laboriosam placeat quo eos ut. Accusamus numquam ut magni enim et reprehenderit dolor dolor.', 19, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(3, 89, 54, 'offfre n° 2', 'Nisi nihil repellat et quia. Ea nostrum explicabo sit sequi tempore. Omnis numquam a quo laboriosam aliquam. Rerum sequi ratione accusamus aperiam maxime. Omnis magni fugit quibusdam id ut.', 411, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(4, 57, 32, 'offfre n° 3', 'Voluptates perferendis asperiores qui qui aut dolorum. Voluptatem modi facilis nihil dolorem dolore deserunt. Voluptatem recusandae ipsum consequuntur consectetur laudantium quos.', 274, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(5, 76, 41, 'offfre n° 4', 'Hic quasi tenetur minus inventore aut delectus. Ratione praesentium vel vel. Iste perferendis odio eum amet.', 391, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(6, 23, 92, 'offfre n° 5', 'Eum rem rerum corrupti. Non optio ipsa dolores tempora nihil amet. Accusamus libero dolores perspiciatis. Molestias hic aut laborum mollitia optio rerum.', 311, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(7, 37, 57, 'offfre n° 6', 'Natus aut veniam dicta quibusdam. Magnam rerum ut ullam nulla et qui odio. Et molestias optio amet deleniti ad dignissimos. Pariatur ducimus ipsam enim minima nihil id quam.', 297, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(8, 28, 3, 'offfre n° 7', 'Illo error ipsa iusto laudantium doloribus neque. Aut eaque omnis amet ullam est. Laborum dolores provident ex ut. Aut rerum eos est ea laudantium magnam dolorem.', 265, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(9, 21, 63, 'offfre n° 8', 'Quia qui quis neque nisi qui. Consequatur veniam iusto occaecati reiciendis tempore minus aut. Quae ipsum maiores id minima deleniti dolorum.', 459, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(10, 6, 62, 'offfre n° 9', 'Omnis occaecati voluptas quos blanditiis hic dolorum quasi qui. Quia possimus neque et quia laborum exercitationem ea. Consectetur cupiditate id quia esse consequuntur incidunt.', 678, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(11, 78, 84, 'offfre n° 10', 'Voluptatem aut modi ullam quisquam nam tempore. Consequatur corporis minus ut sed. Magni neque dolor laboriosam fugit vel. Rerum repudiandae consequatur ab et.', 676, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(12, 8, 66, 'offfre n° 11', 'Harum sunt et nesciunt sed et. Omnis enim expedita aut at quia nulla nihil ratione. Praesentium sed perferendis consequatur est. Molestiae consequuntur velit nesciunt atque id vel.', 28, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(13, 76, 55, 'offfre n° 12', 'Dolore nemo debitis deserunt similique. Quod perferendis architecto autem quam repellendus quasi. Ipsam itaque fuga ullam ullam perferendis eos.', 457, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(14, 16, 25, 'offfre n° 13', 'Aut omnis architecto adipisci laborum consequatur. Omnis ut magnam nesciunt porro non non. Eaque minus fugit sequi et excepturi qui necessitatibus. Aut eos incidunt et asperiores.', 724, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(15, 51, 98, 'offfre n° 14', 'Earum dolor ratione porro consequatur. Quia dolor tempora officiis vitae suscipit. Quis eius corporis dolores consectetur. Natus provident ut eum tempore. Aspernatur eius modi aut quis.', 939, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(16, 69, 25, 'offfre n° 15', 'Omnis qui consequatur tempore numquam sapiente fugit. Rerum fuga unde vel veniam. Molestiae iste quos atque laudantium optio error deleniti. Eveniet quia inventore doloremque dolores odit in et.', 177, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(17, 76, 62, 'offfre n° 16', 'Atque voluptatem assumenda nemo. Voluptas sequi aut corporis necessitatibus. Enim dolore modi earum optio necessitatibus vitae.', 125, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(18, 30, 63, 'offfre n° 17', 'Deleniti aut quo illum tempore quam. Enim expedita perspiciatis alias omnis. Qui quis aliquam aliquam iste velit.', 395, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(19, 85, 19, 'offfre n° 18', 'Et eum animi assumenda est. Qui nisi autem necessitatibus assumenda ab. Ut sunt et dolorum vitae est vel.', 518, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(20, 4, 8, 'offfre n° 19', 'Officia sunt eos deserunt labore et adipisci error saepe. Inventore ea enim aperiam natus. Accusantium voluptatem aut deserunt deleniti aut ut.', 372, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(21, 18, 95, 'offfre n° 20', 'Libero aut nihil excepturi iste nemo voluptatum qui. Harum nulla doloribus corrupti ex ipsum qui velit maiores. Repellendus sit sequi eum amet quaerat enim.', 759, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(22, 83, 15, 'offfre n° 21', 'Sunt ut perferendis numquam nobis. Perferendis optio ipsum occaecati amet labore rem. Necessitatibus excepturi cum officia veniam eligendi qui facilis.', 181, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(23, 79, 91, 'offfre n° 22', 'Sit qui iste assumenda similique eos. Reprehenderit aut perspiciatis perspiciatis nobis placeat eum. Rerum sequi vel voluptas a temporibus qui ut iste.', 431, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(24, 1, 100, 'offfre n° 23', 'Dolor aut exercitationem odit in. Delectus possimus reiciendis iste hic est ipsa. Consequuntur porro ut asperiores incidunt quis tenetur et quos. Non eos nulla dolores ea voluptatibus est.', 455, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(25, 11, 23, 'offfre n° 24', 'Eos dolore rem eaque consequatur. Accusantium itaque aperiam quae qui voluptatem quis eaque. Adipisci officia nulla inventore.', 715, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(26, 98, 23, 'offfre n° 25', 'Qui reiciendis molestias tempore quis sint qui. Rerum qui veritatis porro a. Est fugiat repellat aut qui cum doloremque omnis. Fugit quas ut asperiores corrupti itaque.', 503, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(27, 38, 11, 'offfre n° 26', 'Tempore praesentium qui sint. Molestiae voluptatem aut qui et. Quam rerum quam laborum qui optio.', 142, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(28, 7, 77, 'offfre n° 27', 'Possimus consequatur pariatur nostrum et. Deleniti enim pariatur ducimus consequatur. Aliquid harum magni eveniet architecto assumenda recusandae facilis.', 684, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(29, 59, 78, 'offfre n° 28', 'Est illum nobis architecto aut hic qui assumenda. Dolores fugiat est quidem molestiae.', 444, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(30, 27, 15, 'offfre n° 29', 'Nisi doloribus delectus laudantium magni. Ut quasi voluptatem possimus dolorum porro vel praesentium. Repellat voluptatum ipsam placeat doloremque itaque. In veritatis voluptatibus facilis.', 420, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(31, 18, 31, 'offfre n° 30', 'Suscipit aspernatur reiciendis dolor odit debitis. Quis sunt sit quae sed eum. Nihil aut ducimus soluta corporis est corporis sunt.', 496, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(32, 46, 20, 'offfre n° 31', 'Est sint dicta incidunt in odit. Tenetur repellat nisi voluptates nihil suscipit praesentium aperiam. Quae distinctio nesciunt facere deserunt nostrum.', 122, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(33, 95, 100, 'offfre n° 32', 'Cum cumque maxime quo aut dolorem in. Rerum ea laudantium repudiandae. Voluptas ipsa quod consequatur tempora temporibus commodi. Vero amet ut laudantium nam.', 252, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(34, 49, 25, 'offfre n° 33', 'Aut perspiciatis quis enim nemo. Sunt et eum autem fuga est dicta qui. Modi amet recusandae quidem sed molestias in unde. Commodi in quia molestias.', 771, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(35, 95, 99, 'offfre n° 34', 'Id atque quos omnis quas laboriosam neque. Corporis omnis maxime hic fugiat tempore voluptas. Tempore tempora fugiat dolor. Fugit nemo itaque ut.', 957, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(36, 93, 97, 'offfre n° 35', 'Earum et fuga temporibus et. Est sint explicabo itaque necessitatibus corporis laudantium nam. Nihil quas pariatur culpa incidunt atque occaecati.', 965, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(37, 15, 54, 'offfre n° 36', 'Voluptas pariatur facilis velit et architecto iste. Inventore veritatis et autem aut velit sit. Doloremque iste error aut soluta quod dolore. In alias qui minima repellendus sint iure.', 317, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(38, 61, 11, 'offfre n° 37', 'Amet eum quae at sit sit expedita vero. Dignissimos amet eum culpa fuga ex dolores quaerat. Consequatur sit et magni et animi. Vel quisquam eligendi eum ducimus enim.', 446, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(39, 36, 94, 'offfre n° 38', 'Assumenda reprehenderit ad ex et aut similique. Et perspiciatis consequatur nemo fugit et magni soluta. Et qui laudantium pariatur aut exercitationem. Et sint beatae id rem aut.', 851, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(40, 56, 29, 'offfre n° 39', 'Magnam aliquid eum pariatur sit ut molestias quas. Aliquam suscipit eaque praesentium itaque culpa quasi. Nostrum ab quisquam temporibus quo reiciendis iusto.', 377, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(41, 57, 81, 'offfre n° 40', 'Quia nam deleniti esse ducimus ea. Consequatur sed rerum voluptas ut aut nulla. Nam a delectus et inventore. Voluptatem culpa odit alias sint debitis.', 639, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(42, 10, 83, 'offfre n° 41', 'Nihil sed sed aut quis aspernatur ipsam quibusdam quia. Ad voluptates qui distinctio. Quam labore rerum qui sed.', 559, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(43, 6, 16, 'offfre n° 42', 'Ut doloribus dolorem accusamus perferendis. Rerum adipisci voluptatum rem enim suscipit ipsum consequatur. Blanditiis dolore asperiores ut cum facilis.', 131, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(44, 28, 23, 'offfre n° 43', 'Doloribus ut consequatur velit reprehenderit nihil in laudantium et. Dignissimos quaerat ea incidunt sit.', 357, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(45, 19, 34, 'offfre n° 44', 'Sit qui et sed. Sequi quas sequi dolorum sapiente et perspiciatis. Natus iure nisi dolorem sapiente et provident quo. Est amet eos sit consequatur omnis quod eos. Ullam nihil tenetur nobis velit cum.', 227, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(46, 53, 90, 'offfre n° 45', 'Quibusdam repudiandae et tenetur necessitatibus. Modi aperiam corporis in nostrum deleniti architecto. Aliquam ipsum inventore sed quia minima. Qui dignissimos temporibus eum sunt.', 488, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(47, 4, 22, 'offfre n° 46', 'Facere voluptatem enim sit et vitae. Laudantium quisquam est adipisci a et neque. Minima error recusandae laboriosam non. Expedita blanditiis natus vel sint qui pariatur optio.', 195, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(48, 20, 29, 'offfre n° 47', 'Et voluptas et animi aut velit quo consequatur. Ab dignissimos sint animi quod voluptatibus. Molestiae mollitia saepe omnis consequatur. Neque soluta ut a. Ad cum voluptas repellat laudantium ad.', 63, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(49, 98, 87, 'offfre n° 48', 'In reiciendis rem sed minus et nihil. Et modi veniam perspiciatis. Facere doloribus magnam est dolor.', 136, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(50, 27, 73, 'offfre n° 49', 'Aut autem numquam ab quas quia voluptatem corporis. Pariatur odio error iure et non aperiam. Aut doloribus tempore qui.', 820, 0, 0, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(51, 52, 57, 'offfre n° 50', 'Est quae maiores quidem. Debitis ea et soluta reprehenderit veritatis facere. Dolorem est dolor in eos labore. Amet molestiae totam molestiae. Consectetur illo quaerat in.', 718, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(52, 97, 89, 'offfre n° 51', 'Placeat iusto fuga adipisci autem reiciendis nostrum tempora. Qui itaque voluptatem neque perferendis ipsa. Distinctio aut aut rem qui.', 846, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(53, 67, 25, 'offfre n° 52', 'Totam voluptas qui modi eius quis recusandae. Dolores facere est et asperiores amet excepturi. Amet dolor cumque accusamus quis in. Asperiores quo sed et assumenda.', 285, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(54, 49, 39, 'offfre n° 53', 'Aut ut et aspernatur fuga alias officia aliquam. Sed debitis sequi impedit iste ratione. Ea rem similique aut reiciendis quidem. Aut numquam et doloribus sint molestias rerum deserunt esse.', 571, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(55, 86, 9, 'offfre n° 54', 'Quo temporibus numquam provident ad id ut eum. At amet atque dolorem necessitatibus veniam. Ducimus sint nihil cum omnis quis iste. Ut praesentium est omnis est.', 131, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(56, 62, 96, 'offfre n° 55', 'Dolorum repudiandae a voluptates dolores quo veritatis et voluptate. Ex blanditiis dolorum aliquam natus eligendi. Quasi optio aut repellat repudiandae. Aspernatur sunt temporibus dolores quaerat.', 7, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(57, 54, 42, 'offfre n° 56', 'Tenetur ut molestiae ut adipisci eligendi eveniet ex dignissimos. Voluptatem explicabo modi quidem placeat. Nihil at eius soluta sunt modi et sequi.', 249, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(58, 72, 26, 'offfre n° 57', 'Temporibus fugiat corporis neque. Nam est repellat error sit vitae et officiis. Sed accusamus eos sed nostrum dolores nostrum numquam porro.', 499, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(59, 5, 38, 'offfre n° 58', 'Necessitatibus dolore optio qui est eligendi minima non. Optio iure iste enim. Pariatur aspernatur velit voluptas quo quibusdam provident est. Dignissimos ut odio temporibus veniam.', 331, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(60, 49, 52, 'offfre n° 59', 'Debitis explicabo nisi voluptatem. Neque deserunt eligendi deserunt ab. Tenetur ipsam voluptatibus quam aut recusandae vel.', 788, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(61, 24, 49, 'offfre n° 60', 'Quia doloribus modi totam sed repellendus molestias. Consectetur quia qui hic inventore quos magnam suscipit. Vero ea cum natus natus.', 681, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(62, 85, 15, 'offfre n° 61', 'Quibusdam consectetur voluptatem corporis et eveniet. Nemo doloremque quia aliquid et. Quasi rerum dignissimos in. Incidunt magni voluptas repellat incidunt sunt.', 426, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(63, 56, 12, 'offfre n° 62', 'Debitis voluptatem aut quia voluptatem. Explicabo ea cupiditate nihil impedit. Impedit aut est provident sint. Nemo repellendus quo et et et odit quis. Facere aut dolor suscipit ut.', 753, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(64, 51, 99, 'offfre n° 63', 'Molestiae omnis ducimus tempora iste. Tempora doloremque non perspiciatis distinctio error aut voluptate. Excepturi quia et quia.', 724, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(65, 74, 1, 'offfre n° 64', 'Pariatur autem accusamus quisquam atque aut quisquam. Ut ipsa sunt veritatis. Quo quos quo vel iste omnis reiciendis sequi.', 923, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(66, 48, 87, 'offfre n° 65', 'Nihil neque explicabo provident velit fuga in nihil. Quas est iure enim id. Qui voluptatem magnam eum omnis ipsa tenetur. Omnis excepturi rerum ut consequatur nam sed.', 849, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(67, 59, 77, 'offfre n° 66', 'Temporibus cum et omnis harum sunt quam vitae. Blanditiis illo hic consequatur minus. Numquam quibusdam amet provident tenetur. Quae dolorem aliquid enim neque.', 549, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(68, 27, 90, 'offfre n° 67', 'Corrupti enim qui voluptate commodi. Ut aperiam dignissimos qui assumenda quibusdam et. Rerum ipsam consectetur est reprehenderit. In nostrum voluptas fuga rerum. Vero distinctio provident esse non.', 699, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(69, 35, 41, 'offfre n° 68', 'Id aut ut saepe at odio ut quibusdam. Consectetur facere reprehenderit nobis eaque. Quo qui velit repellendus fugit. Quas qui quia quia et et architecto.', 817, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(70, 8, 46, 'offfre n° 69', 'Deserunt deserunt ab possimus quos quaerat. Aut earum cupiditate cum voluptas et et. In blanditiis rerum sed eveniet eos rem minima. Eius ut reiciendis odit odio earum molestiae.', 909, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(71, 76, 66, 'offfre n° 70', 'Numquam laudantium voluptatem quis neque sit. Rerum libero quidem unde quod sit alias sed architecto. Molestias quisquam saepe iusto hic at.', 23, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(72, 14, 67, 'offfre n° 71', 'Vero libero consequatur ut qui ut omnis quis. Ducimus qui quisquam quibusdam vero. Autem autem aliquam rem.', 594, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(73, 82, 74, 'offfre n° 72', 'Omnis neque est modi sed sit qui quibusdam. Similique dolor autem nihil consequatur laudantium et sunt. Libero corrupti qui et.', 512, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(74, 86, 42, 'offfre n° 73', 'Ipsa a error dicta velit rerum recusandae. Autem ea et sunt dolor ullam iure deleniti. Blanditiis similique quae voluptatem perspiciatis consequatur totam officia officiis.', 776, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(75, 24, 36, 'offfre n° 74', 'Et praesentium error esse provident. Enim dolorem nesciunt iusto voluptas. Et dolores dicta et quisquam sunt consequatur.', 896, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(76, 15, 39, 'offfre n° 75', 'Ratione atque iste placeat blanditiis. Sunt quaerat praesentium nemo explicabo incidunt numquam. Saepe et explicabo et. Aliquam corrupti ipsa aut non pariatur.', 389, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(77, 15, 25, 'offfre n° 76', 'Voluptas voluptatum eligendi et quo incidunt et quis. Aut vel tempore est ratione. Praesentium et rerum voluptas tenetur deleniti nisi.', 232, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(78, 45, 88, 'offfre n° 77', 'Autem occaecati harum nemo cumque facilis voluptas dolorem. Et ipsam molestiae eius nesciunt omnis labore velit quia. Culpa cupiditate ab odit veritatis voluptates autem.', 820, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(79, 55, 11, 'offfre n° 78', 'Molestias maxime vitae iusto vel incidunt consequatur debitis. Magnam id voluptas occaecati labore. Dolores repellat voluptatem dignissimos autem maiores et autem.', 92, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(80, 59, 18, 'offfre n° 79', 'Necessitatibus ab explicabo quasi quaerat ea eos alias. Praesentium sed itaque deserunt id. Odio adipisci iusto voluptas labore nobis vitae.', 701, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(81, 62, 32, 'offfre n° 80', 'Alias et iusto beatae et aperiam ea. Non in officia nihil sed ut et. Sed ut enim laudantium aut odit similique magnam tempora. Impedit nam officia similique assumenda voluptates magnam magnam.', 907, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(82, 27, 12, 'offfre n° 81', 'Adipisci quos omnis nemo suscipit mollitia eaque. Suscipit ducimus sunt consequatur optio. Porro et amet quam dolore provident sit quisquam. Et est assumenda officiis accusantium.', 117, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(83, 97, 17, 'offfre n° 82', 'Earum temporibus dolorum libero minus vel impedit iste. Fugiat ex et assumenda. Enim aut reprehenderit quis ut enim.', 360, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(84, 12, 63, 'offfre n° 83', 'Ducimus voluptatem quos soluta nam. Molestiae cum corrupti facilis hic adipisci. Voluptates error aut minus.', 183, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(85, 96, 43, 'offfre n° 84', 'Animi est maiores voluptatem sapiente iure. Repudiandae placeat autem dolorem non est. Nesciunt pariatur laudantium numquam id molestiae quia. Maxime sunt impedit ratione enim ullam.', 915, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(86, 87, 28, 'offfre n° 85', 'Et eos voluptas perspiciatis labore modi. Pariatur hic explicabo molestiae. Ut est architecto deserunt repudiandae sed fugit magnam perspiciatis.', 515, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(87, 15, 30, 'offfre n° 86', 'Non nihil eum exercitationem quisquam. Laboriosam rerum velit sed sunt dolorem corrupti qui. Repudiandae corrupti tenetur repellat at aperiam est odit. Sed consequatur quod ut omnis nihil quasi.', 744, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(88, 37, 2, 'offfre n° 87', 'Soluta quaerat fuga atque dolores distinctio quas aut quo. Possimus voluptatum sed non veritatis magni. Illum voluptate a laborum eveniet velit. Eos deserunt non omnis quos quam.', 752, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(89, 72, 91, 'offfre n° 88', 'Numquam quos architecto aspernatur fugit qui vitae ut ut. Consequatur aspernatur necessitatibus velit hic quod. Sapiente fuga et nihil voluptate.', 231, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(90, 88, 49, 'offfre n° 89', 'Corporis non vitae libero voluptatem quae. Magni aspernatur quo culpa blanditiis occaecati minus temporibus. Nihil doloribus nihil quam aliquam blanditiis labore.', 562, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(91, 6, 89, 'offfre n° 90', 'Nobis optio quasi ut dolorem sapiente eum rerum. Est quis beatae repellat et soluta nostrum. Corrupti vel facilis dolorem illum molestiae magnam. Et amet ut est quasi quod.', 549, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(92, 97, 41, 'offfre n° 91', 'Soluta libero quibusdam ipsa sunt est aut sapiente. Inventore perspiciatis possimus sunt dicta. Ex nihil eum debitis dolorem sunt. Quia et nulla officia est et maxime.', 842, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(93, 28, 26, 'offfre n° 92', 'Voluptatibus sit possimus pariatur doloremque qui dolor praesentium ut. Accusantium qui qui quia in voluptate perferendis. Ullam ut nulla sit accusantium rerum molestiae. Quia sit quos et corrupti.', 44, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(94, 57, 84, 'offfre n° 93', 'Consequuntur quia corrupti veniam modi excepturi voluptas ut. Consequuntur fugiat commodi qui omnis est voluptate. Vero eos autem porro impedit voluptatem et.', 339, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(95, 34, 19, 'offfre n° 94', 'Porro facere amet laboriosam ab eveniet similique. Porro doloremque sit sit et tenetur adipisci inventore. Autem quasi esse quod vitae.', 204, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(96, 78, 49, 'offfre n° 95', 'Repellendus error deleniti tempora harum. Deserunt eligendi quo nihil quia. Veritatis numquam voluptas cupiditate repellat cum debitis voluptas ratione.', 802, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(97, 36, 35, 'offfre n° 96', 'Commodi vel sunt soluta. Doloribus velit est sit beatae. Provident consequatur repudiandae ut. Placeat et fugiat consequatur cupiditate mollitia soluta.', 799, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(98, 46, 18, 'offfre n° 97', 'Vel harum labore accusantium aut suscipit dolore. Vel similique repellat inventore velit.', 631, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(99, 43, 88, 'offfre n° 98', 'Tempora quo cumque repudiandae ut. In quas eligendi illo voluptas possimus similique sed exercitationem. A eum voluptates est consequatur quo ab.', 374, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00'),
(100, 3, 99, 'offfre n° 99', 'Voluptatem omnis architecto et et aut atque. Ipsum atque error aspernatur repudiandae. Assumenda et id sint aut sed tenetur ipsa consequatur.', 377, 0, 0, '2021-02-25 14:08:03', '0000-00-00 00:00:00');

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
(1, 1, 'users#show', '/tynkle/app/public/uploads/1614098078-isometric-it-people-concept_1284-23188.jpg', '2021-02-23 13:51:12', '2021-02-23 17:34:38'),
(2, 1, 'users#edit', '/tynkle/app/public/uploads/1614097794-istockphoto-1159368222-612x612-1.jpg', '2021-02-23 13:51:20', '2021-02-23 17:29:54'),
(3, 1, 'users#new', '/tynkle/app/public/uploads/1614097448-online-desktop-laptop-repair-service-500x500.jpg', '2021-02-23 13:51:57', '2021-02-23 17:24:08'),
(4, 4, 'posts#new', '/tynkle/app/public/uploads/1614098392-online-desktop-laptop-repair-service-500x500.jpg', '2021-02-23 13:53:10', '2021-02-23 17:39:52'),
(5, 4, 'posts#edit', '/tynkle/app/public/uploads/1614149687-istockphoto-1159368222-612x612-1.jpg', '2021-02-23 13:53:19', '2021-02-24 07:54:47'),
(6, 4, 'posts#show', '', '2021-02-23 13:53:26', '0000-00-00 00:00:00'),
(7, 4, 'posts#index', '', '2021-02-23 13:53:34', '0000-00-00 00:00:00'),
(8, 5, 'home#index', NULL, '2021-02-23 14:53:47', '0000-00-00 00:00:00'),
(9, 3, 'chat#index', '/tynkle/app/public/uploads/1614098166-isometric-it-people-concept_1284-23188.jpg', '2021-02-23 14:55:13', '2021-02-23 17:36:06'),
(10, 3, 'chat#show', '/tynkle/app/public/uploads/1614098289-isometric-it-people-concept_1284-23188.jpg', '2021-02-23 14:55:25', '2021-02-23 17:38:09'),
(11, 6, 'activity#index', NULL, '2021-02-23 14:58:37', '0000-00-00 00:00:00'),
(12, 2, 'admin#platform', NULL, '2021-02-24 07:59:42', '0000-00-00 00:00:00'),
(13, 2, 'admin#insights', NULL, '2021-02-24 07:59:55', '0000-00-00 00:00:00'),
(14, 2, 'admin#users', NULL, '2021-02-25 11:37:51', '0000-00-00 00:00:00');

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
(6, 'activité', '2021-02-23 14:57:55', '0000-00-00 00:00:00');

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
(1, 'Informatique', 'Magnam voluptas voluptas repellendus consequuntur numquam exercitationem. Rerum ipsa facilis dicta. Aperiam aut id nihil autem omnis.', '2021-01-26 09:53:05', '0000-00-00 00:00:00'),
(2, 'Smartphone/tablette', 'Corrupti earum ipsum rerum magni sed quasi molestias. Assumenda eum dolorem nemo rerum ut. Non libero corrupti culpa molestias deleniti. Incidunt placeat dicta voluptatum.', '2021-01-26 09:53:05', '0000-00-00 00:00:00'),
(3, 'Reseau', 'Aliquid est ipsum sed expedita at. Ea nisi modi aliquid. Consequuntur quis debitis necessitatibus debitis quod.', '2021-01-26 09:53:05', '0000-00-00 00:00:00'),
(4, 'Electroménager', 'Et omnis iste tempora odit id sed. Est doloremque voluptatem molestias nulla qui et soluta. Saepe ex aut illo ad aliquam deleniti ea. Ut vel non officia.', '2021-01-26 09:53:05', '0000-00-00 00:00:00'),
(5, 'Console de jeux', 'Quo dolores cupiditate autem commodi quo dolorem accusantium magnam. Ea dolore et ipsum tenetur ipsa culpa et. Cum fugit ipsum debitis culpa voluptatem.', '2021-01-26 09:53:05', '0000-00-00 00:00:00'),
(6, 'Tv/multimédia', 'Adipisci maxime earum dolore facilis nobis. Fuga quis ut corporis sit. Voluptatem consequatur beatae expedita vel aspernatur error libero. Et est doloremque ipsa modi odio.', '2021-01-26 09:53:05', '0000-00-00 00:00:00');

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
(1, 27, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 0', 'Nobis eius expedita possimus ducimus qui eos. Odio porro et ullam reprehenderit accusantium ab. Animi explicabo quas architecto fugiat libero praesentium.', 466, 'Paulaland', '70487-2809', 12.371868, 142.75402, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(2, 88, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 1', 'Libero ut voluptatem enim iste exercitationem. Quia ea corporis voluptas aut aut esse. Et iste fugit optio sunt quam ad. Repellendus sapiente quis voluptas nisi soluta.', 22, 'West Elva', '00958-1733', 19.85525, 7.924483, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(3, 21, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 2', 'Quos voluptas provident ea libero ab. In maiores nihil quia suscipit rem. Unde sapiente rerum repellat hic vero voluptatum. Quasi et voluptatibus nihil velit mollitia.', 443, 'Conntown', '21155', -46.775196, 130.850442, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(4, 76, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 3', 'Quam at asperiores et consequatur accusamus laudantium inventore. Odio autem maiores veritatis eligendi placeat provident ipsa consectetur. Ut laboriosam cumque iste dolorum debitis.', 851, 'Gudrunport', '65312', -84.450796, 151.707486, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(5, 2, 13, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 4', 'Tenetur quia eaque a praesentium mollitia. Dolores alias ipsa sed officia delectus quia. Blanditiis non et rerum cumque. Non quidem soluta et dolores.', 174, 'Kadeview', '80802-3778', -24.85105, 59.234656, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(6, 64, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 5', 'Ipsa non qui reiciendis minus illo tempora recusandae ea. Commodi numquam repellat dicta minima voluptatem. Aut et beatae deserunt error. Omnis earum tempore ad temporibus blanditiis explicabo quis.', 869, 'East Elwin', '34633', -33.557141, 173.748352, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(7, 23, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 6', 'Ut velit reprehenderit quisquam laudantium enim. Magnam quo dolores dolores molestiae. Dolor vel harum ex.', 397, 'Dickensmouth', '10161', -49.877685, -8.463165, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(8, 26, 13, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 7', 'Consequatur eaque quibusdam voluptatibus aut. Iusto quia est voluptas facilis aliquid minima sunt. Ipsa et ea id sint repudiandae reiciendis. Optio atque atque nulla voluptas.', 164, 'Kreigerstad', '63012-7325', 6.248935, -111.384604, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(9, 59, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 8', 'Quam similique quisquam et sint sed pariatur soluta. Consequatur molestiae et earum qui. Reiciendis nihil saepe explicabo sint quo. Commodi et at error accusamus tempore itaque.', 570, 'New Emilehaven', '98873-8060', -66.871175, 42.924859, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(10, 43, 20, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 9', 'Architecto fugit vel expedita expedita repudiandae est. Id qui voluptatem beatae nihil ea. Fugit error quasi amet veniam non repellat.', 998, 'New Uliseshaven', '75818-9379', -28.105045, 144.716743, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(11, 42, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 10', 'Et cumque sit et velit quis aliquid. Quis quia est placeat repudiandae quasi quia. Blanditiis vero voluptas quae nulla placeat rerum.', 256, 'Lake Khalil', '15806-0363', -54.335706, -65.063509, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(12, 37, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 11', 'Sed id quia expedita illo aut. Quisquam rerum molestiae est repudiandae omnis et. Nam nihil harum odit ut voluptas qui quibusdam aspernatur.', 728, 'Vincenzachester', '26999-9716', -9.983479, 145.165135, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(13, 14, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 12', 'Neque aut omnis expedita sit. Repellendus libero consequuntur labore at. Quod voluptatem ut cupiditate est cum dolore ut.', 352, 'Tarynmouth', '56252-8153', -79.902246, -47.735447, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(14, 27, 17, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 13', 'Aut deleniti qui vel ducimus dolor. Ea molestias aut provident cumque. Voluptatum nemo quidem mollitia et. Vel tempore distinctio dolorem id similique.', 859, 'North Ashlynnview', '98164', 31.500089, -33.069044, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(15, 35, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 14', 'Delectus officiis provident in facilis iste similique consectetur. Voluptatem corrupti facere similique unde. In officiis omnis ut recusandae aperiam et ut corporis.', 822, 'Port Normabury', '02103-5169', -86.554252, -37.942882, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(16, 7, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 15', 'Laudantium minus totam dicta eius voluptates architecto voluptatem. Quia est sint quo dolore vel tenetur. Quo quidem ullam fugiat qui.', 262, 'Baumbachton', '25835-9414', 13.145125, 66.448531, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(17, 2, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 16', 'Rem facere rerum quasi culpa praesentium asperiores. Aut alias a eum ut voluptas harum. Sit repellat nulla unde illo provident qui atque.', 771, 'New Reagan', '33366', 88.19055, -99.277258, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(18, 92, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 17', 'Officiis mollitia earum est eveniet tempore et explicabo. Inventore at reprehenderit deleniti commodi. Et dolorem vel nesciunt quia natus ut. Rerum voluptatem vel ex officia accusantium.', 547, 'East Amina', '43129-1488', 10.823233, 32.388153, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(19, 28, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 18', 'Autem qui soluta ratione ut. Et et est unde ut. Ut consequuntur delectus distinctio quo aut nostrum qui. Voluptatum magnam natus accusamus quisquam.', 32, 'North Zacharyfort', '18238-8135', 19.866758, -128.630046, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(20, 72, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 19', 'Ducimus iusto molestias rerum perspiciatis atque quia. Itaque et voluptas esse voluptatum sunt est eum. Magnam et odit cupiditate debitis quis eius. Laboriosam maxime officia omnis fugiat.', 775, 'Medhursttown', '40282', 24.891073, 99.580842, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(21, 61, 19, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 20', 'Quia veritatis libero assumenda non tempora inventore soluta iste. Occaecati sint velit maxime vitae in. Non perspiciatis unde aperiam illo.', 764, 'North Lillianport', '18591', -85.231968, 18.244166, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(22, 28, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 21', 'Voluptatem porro aliquid aut facilis quas. Et voluptas voluptatum placeat molestiae earum in et ullam. Et nihil non voluptas sequi velit iste qui ut. Tempore ab unde pariatur quia tempore velit hic.', 883, 'South Desmondton', '94939-6826', -69.983666, 108.228438, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(23, 62, 9, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 22', 'Libero eaque explicabo assumenda non facilis necessitatibus eaque. Sint voluptatem pariatur et voluptatum impedit officiis. Ut modi ab accusamus dolores sit incidunt aliquam.', 535, 'Erlingburgh', '95217-6692', -11.771063, -151.394015, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(24, 66, 17, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 23', 'Nesciunt et quia culpa eius accusamus autem pariatur. Reprehenderit sed provident ut qui quisquam aliquid. Minus ea corporis ad eum vero. Qui veniam non mollitia et dolorum.', 472, 'North Heloise', '64497-1551', 64.896829, -64.537126, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(25, 23, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 24', 'Voluptate quia et error sint perferendis. Error nisi assumenda voluptatibus sed dolor. Laborum explicabo est qui aut tenetur blanditiis. Et ut rerum cumque praesentium eum natus omnis.', 596, 'Alberthafort', '45771', -66.582723, -147.507353, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(26, 88, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 25', 'Voluptatum odit voluptates commodi adipisci. Ducimus libero corrupti ut magnam cumque. Dolorem qui odio velit aperiam atque delectus. Velit quia ut porro non ea.', 430, 'Howellshire', '99292-9790', -89.887626, -141.115276, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(27, 30, 6, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 26', 'Exercitationem eius iusto molestias facilis sit aut modi. Provident rem officiis animi saepe voluptatem cum. Laborum sed facere quae nulla blanditiis. Id distinctio omnis repellat non voluptatem.', 621, 'Lake Spencer', '96914-9077', -48.264478, -51.678692, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(28, 78, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 27', 'Vel est vel consequuntur est et quis magni. Saepe et fuga corrupti dicta aliquam. Molestiae non qui et consequatur ipsum provident. Fugiat eligendi quo est necessitatibus hic officiis temporibus.', 545, 'Port Ernestinaside', '57653-2333', 42.751863, -19.815049, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(29, 58, 13, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 28', 'Recusandae sit quo iusto nihil dolor dolore dicta. Libero occaecati ab eveniet distinctio numquam eveniet illo. Dignissimos fuga et deleniti exercitationem aut est velit.', 420, 'Walterview', '35760-0077', 50.686349, -101.840545, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(30, 38, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 29', 'Adipisci sint eos et iste blanditiis. Iste ducimus libero saepe laborum. Et voluptas perferendis repellendus. Dicta cumque et beatae magnam et.', 503, 'Davismouth', '64686', -7.217208, -134.19881, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(31, 28, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 30', 'Provident qui ipsam voluptatem nihil. Impedit cupiditate eos vitae voluptatem aut. Odit deleniti quos officiis.', 196, 'Port Jermain', '66941', 79.287457, -139.138805, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(32, 53, 2, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 31', 'Aut enim voluptatem qui ut. Qui quia dolores molestiae est qui velit facere. Esse nam nostrum unde voluptatum. Sed aut consequatur beatae iure aperiam sit.', 298, 'North Tinaburgh', '50549', -78.125969, -10.780269, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(33, 91, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 32', 'Quos blanditiis et doloremque natus aut. Occaecati dolores ab qui ea. Ab corporis et optio non.', 880, 'West Orpha', '03946-2764', -79.81427, -111.861502, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(34, 48, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 33', 'Non autem repellendus libero molestiae. Reprehenderit optio aut voluptatem eius assumenda commodi praesentium qui. Vitae necessitatibus nemo nihil possimus facere neque.', 343, 'Kutchhaven', '63827-1633', 27.587226, 70.099144, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(35, 48, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 34', 'Alias et minima rem. Molestiae vitae rerum voluptatem odio ut veritatis debitis. Reprehenderit eum est ipsa ut iste aliquam. Consectetur explicabo iusto aut similique porro.', 614, 'Lake Astrid', '38667-1060', -62.215193, -15.185518, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(36, 35, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 35', 'Et rerum eveniet fuga doloremque. Dolorem quibusdam temporibus debitis repellat autem. Debitis non iste et cum repudiandae dolor consequatur tenetur.', 814, 'South Mabelstad', '41567-6936', -35.750541, -92.500906, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(37, 94, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 36', 'Porro velit maxime atque molestiae illum dolor deserunt et. Qui velit iusto consectetur iusto vel tempore dolorem. Quia accusamus quisquam possimus. Atque animi sit perspiciatis nihil.', 107, 'North Ashton', '35973-7475', 69.936767, -162.8863, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(38, 56, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 37', 'Debitis placeat unde incidunt nam quisquam suscipit similique a. Quis id vero quidem. Veniam qui esse nemo ratione sit.', 400, 'Okunevaburgh', '37675-3151', 48.747387, -59.664741, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(39, 98, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 38', 'Nesciunt ab fuga repudiandae. Tenetur id laudantium maxime molestiae. Minus veniam eligendi aut non. Et quidem voluptatum veniam vel. Soluta harum vel reiciendis voluptatum.', 278, 'Gutmannstad', '64010', 71.946037, 108.764287, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(40, 61, 19, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 39', 'Doloremque eligendi enim enim vero. Aperiam maxime incidunt incidunt enim ducimus illum. Numquam dignissimos deleniti sint.', 219, 'Jaskolskitown', '09480-9104', -88.662685, 80.590015, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(41, 24, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 40', 'Rerum quam ipsum molestias facere autem recusandae. Nam ea eum velit blanditiis accusantium aliquid voluptatem. Ipsum inventore ut dicta vel. Aliquid id iusto accusamus rerum.', 786, 'Lake Nelsview', '23184-7955', -35.596339, -87.608978, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(42, 67, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 41', 'Quos eveniet alias consectetur qui totam ad consectetur voluptatem. Suscipit recusandae unde amet maxime suscipit odio aut. Possimus error quod est sed excepturi mollitia.', 116, 'East Theaport', '56837', 19.06551, -45.542156, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(43, 100, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 42', 'Quis hic sunt ducimus veniam distinctio voluptas quos. Soluta repellendus aut ut rem. Ut id cupiditate dolor. Delectus beatae corrupti aspernatur modi.', 733, 'Idellamouth', '67603-2980', -7.495114, -81.1533, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(44, 28, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 43', 'Nihil qui ullam aliquid officiis at. Minima qui illum est modi. Explicabo autem impedit laudantium sequi.', 151, 'West Addisonside', '13472-4398', 17.560758, 67.093612, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(45, 46, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 44', 'Qui dolore dolorem quam et qui iure qui. Qui amet inventore atque eligendi sint reiciendis. In laboriosam voluptate quibusdam unde illum minima ut natus.', 66, 'Madelinetown', '59857-8647', -47.954549, 6.582255, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(46, 100, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 45', 'Ea aut sapiente aliquid ut ea. Animi deserunt consequatur neque architecto. Mollitia tenetur error qui aut asperiores laudantium odit doloremque.', 844, 'East Mayra', '27632-8131', 41.204456, -126.12274, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(47, 94, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 46', 'Sit ea molestias tenetur molestiae ut et porro. Deleniti inventore nemo qui. Qui consequatur aspernatur reiciendis quo eius asperiores.', 407, 'Grahamshire', '30988-0086', -26.080903, -89.869551, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(48, 37, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 47', 'Doloremque et nobis ab in. Voluptas facilis explicabo sit expedita minus cumque.', 977, 'North Meghan', '33958-4673', -24.032113, -0.90377, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(49, 5, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 48', 'Voluptatem quia nam esse voluptatum saepe quasi. Qui sit iure aut rerum quia vitae soluta.', 393, 'Lake Kendrick', '50489', -21.21342, 73.610759, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(50, 14, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 49', 'Esse reiciendis dolor consequatur voluptatem ut occaecati rerum. Minus dolorem fugiat optio. Dolore quo vel exercitationem molestiae ad. Atque consequatur dolorem voluptates vel reiciendis.', 227, 'Wainoland', '47463', -67.097391, -115.401017, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(51, 100, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 50', 'Repudiandae assumenda porro accusamus ut. Ut earum aut consequatur itaque. Labore eaque ut qui veritatis molestiae cumque. Sed eos ipsum sit inventore modi.', 517, 'New Bell', '67075-8093', 2.288544, 70.896621, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(52, 71, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 51', 'Iure nulla dolor modi aspernatur occaecati corrupti earum. Eligendi tempore et repellat reprehenderit nulla eius. Reprehenderit adipisci odit maiores quod impedit mollitia ut.', 55, 'Ellenberg', '57737-0976', -7.239097, 25.565891, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(53, 62, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 52', 'Amet voluptas reprehenderit et animi et aut at. Delectus facilis vel iusto quis eaque. Molestias sint hic ullam autem reprehenderit et.', 635, 'North Sonya', '25175', 28.680971, -59.65716, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(54, 36, 19, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 53', 'Et ea est nisi occaecati. Suscipit accusantium aut perspiciatis hic harum optio. Ea necessitatibus omnis dolorum qui provident.', 911, 'McLaughlinstad', '89280', 66.557936, 64.422172, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(55, 16, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 54', 'Ut quaerat ut aperiam provident suscipit dolores. Explicabo magnam tempore facere ut deserunt numquam provident.', 443, 'Evalynborough', '71204', 43.805667, -77.042979, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(56, 83, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 55', 'Quibusdam aliquid unde ut quia amet temporibus qui. Laborum nihil voluptas unde eos. Aut ipsum alias reprehenderit assumenda est.', 821, 'West Careyview', '99079', 39.219737, -38.843973, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(57, 30, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 56', 'Vel voluptatem est delectus. Ducimus dolorem eaque deserunt dolor aliquam dolorem. Est rerum rem ea. Nemo voluptatem veritatis ipsum iste non qui rerum.', 342, 'Arlieberg', '88323', 29.407417, -103.949313, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(58, 70, 9, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 57', 'Voluptas voluptas sed temporibus vel ut. Dignissimos blanditiis doloremque ratione et. Voluptate hic fuga maxime. Molestiae blanditiis odio voluptatem unde. Ea tempora neque vitae saepe est quidem.', 624, 'Wildermanview', '29185-4081', 16.199724, 77.580443, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(59, 24, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 58', 'Optio sapiente cum impedit soluta suscipit illum. Deleniti fugiat tempore quidem quia. Est ad sint sint qui.', 92, 'North Gracie', '20931', -12.302726, 111.767029, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(60, 16, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 59', 'Ullam qui quas quia cum sint aut. Reprehenderit sit sed et minus. Sint qui quia et magni assumenda non. Optio iste deleniti autem consequatur et et ea.', 373, 'Port Hilma', '41278', -77.820597, 68.653918, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(61, 33, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 60', 'Et iure nulla saepe omnis hic in. Facilis cum nemo tempora qui tempora eos sequi soluta. At eum perspiciatis sunt sunt ut sequi. Sunt voluptate ipsam dolorum.', 178, 'South Rockyborough', '41712', 21.097749, -103.262813, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(62, 37, 6, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 61', 'Ad asperiores qui a aut adipisci id. Officia cum impedit laudantium ipsa a quasi. Recusandae accusamus assumenda voluptatem quae.', 262, 'Karolannfurt', '81753-4933', 43.146012, 28.49414, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(63, 63, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 62', 'Reprehenderit est ut quia inventore libero. Corporis quis illum aut ut quasi maxime labore cupiditate. Dolore enim dolorum amet perspiciatis.', 390, 'Xavierfort', '60939-0167', -30.395751, -85.978914, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(64, 34, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 63', 'Vitae incidunt omnis ea eos. Et quidem quo laboriosam illum. In est aut dignissimos praesentium sunt ea.', 768, 'East Marie', '21762-6901', 37.408379, -73.272552, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(65, 67, 9, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 64', 'Id nesciunt inventore esse soluta omnis. Ut consequatur adipisci et dolores ullam. Veritatis dicta voluptatibus inventore et omnis non perspiciatis.', 599, 'Lake Augustmouth', '29639-6741', 85.9556, -112.791236, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(66, 22, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 65', 'Quia ut ut voluptatum corrupti dolor beatae autem. Mollitia tempora et repellat soluta a. Neque eos natus dignissimos atque at iure. Aperiam voluptatem non explicabo.', 352, 'West Gabriel', '55504', 70.630529, 121.203784, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(67, 78, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 66', 'Enim vel necessitatibus repellat et quo. Eum ipsam qui eum ipsum at sequi quia. Est consequatur dolorem optio.', 945, 'Joport', '00034', 11.571201, -43.448238, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(68, 2, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 67', 'Dolor nam perferendis quae reiciendis porro. Vitae at esse est est.', 934, 'Grimesfort', '10239-8116', -1.18704, -102.931996, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(69, 61, 2, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 68', 'Qui et omnis voluptatem eos voluptas officiis voluptatum beatae. Est natus sed qui. Ea ratione eveniet dolorem. Consequatur et sed accusantium aliquam.', 401, 'West Malindachester', '98953-8820', 39.024911, -163.558089, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(70, 2, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 69', 'Recusandae perferendis ut cum animi aut. Perspiciatis eum tempora sit sit pariatur. Dolorem quas facere eos velit aspernatur perspiciatis quia.', 318, 'Laronton', '19568', 1.340371, 96.007754, '2021-02-25 14:08:01', '0000-00-00 00:00:00');
INSERT INTO `posts` (`id`, `id_user`, `id_breakdown_category`, `images`, `cover_image`, `is_solved`, `title`, `content`, `budget`, `city`, `postal_code`, `lat`, `lng`, `created_at`, `updated_at`) VALUES
(71, 19, 21, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 70', 'Vel et facilis aliquid exercitationem aut. Expedita alias consequatur fugiat maiores sunt. Ducimus voluptatum ea sunt et. Voluptate consectetur est ea adipisci tenetur impedit.', 572, 'Port Pansystad', '43747-5377', 21.848228, -162.896104, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(72, 48, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 71', 'Minus illum impedit id amet iure. Cupiditate recusandae enim illo praesentium beatae. Ut ut molestiae commodi in incidunt eum natus.', 763, 'West Lester', '57880-4239', 72.891696, 27.883687, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(73, 88, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 72', 'Eum eos non ipsa. Ipsam rerum ullam ut ea molestias. Autem quo vel nobis corporis quibusdam amet culpa. Eveniet a quod ipsum itaque. Consequatur nemo et ut corporis doloremque saepe eum.', 871, 'Lake Demariohaven', '65610-4343', -36.952869, -59.828508, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(74, 29, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 73', 'Est et rerum illum vero. Unde qui illum doloremque sit quos in. Natus eius qui dignissimos quisquam suscipit aut dolor. At possimus labore fuga asperiores dolore laboriosam.', 571, 'Lebsackmouth', '77563', -88.770751, -65.739356, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(75, 6, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 74', 'Voluptate aspernatur fuga asperiores laborum sint aut expedita cupiditate. Unde aspernatur explicabo tempore minus vero est libero cupiditate. Consequatur aliquid est deserunt dolorum.', 653, 'North Katlynton', '49842-7139', 42.171907, -144.455293, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(76, 31, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 75', 'Quo ad iure magni. Illo id et a ut architecto harum. Maxime iure officia inventore possimus repudiandae. Aperiam sit enim inventore sed et et ut unde.', 470, 'Beahanland', '49237-8275', -9.866869, 85.033416, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(77, 54, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 76', 'Et tempore non magnam repellat quo veritatis vel. Et corporis ab vel commodi ut. Dignissimos vel reprehenderit quam. Et quo reiciendis quasi omnis.', 453, 'Swiftborough', '57975', -75.629893, 106.440053, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(78, 66, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 77', 'Veniam fugiat aut et aliquam sit. Incidunt et ullam laboriosam rem. Est expedita suscipit reiciendis quo accusamus fuga molestiae.', 984, 'Jacobsonview', '04149', 29.29083, 8.262179, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(79, 83, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 78', 'Qui aut molestiae sit corrupti ut sed dolorem. Modi a consequatur et culpa corporis. Accusantium quisquam fugit quisquam illum recusandae ullam. Accusantium autem illo inventore et voluptas aliquam.', 931, 'Smithamfurt', '37898', 78.568429, -121.141707, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(80, 38, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 79', 'Ratione placeat ipsam soluta voluptatem consequuntur. Vel deleniti praesentium similique. Vero consequatur tempore tenetur aut debitis.', 544, 'West Halleshire', '61655', -3.452209, 153.583902, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(81, 63, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 80', 'Qui quasi labore excepturi optio laborum repellat. Quaerat sit sed ipsa.', 316, 'East Hyman', '89863-0695', 58.015094, 94.304063, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(82, 30, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 81', 'Qui fugiat ipsam libero officiis ea ipsam et dolorum. Quia dolor consequatur optio est nisi in dolor. Facilis laborum voluptatem consequatur. Aut possimus doloribus sunt dolores deserunt eos.', 505, 'Torphyfurt', '73766', 34.763182, 109.074594, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(83, 47, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 82', 'Ipsa nobis sit est hic temporibus atque neque. Non ipsum cupiditate eum distinctio consequatur. Quis voluptas omnis nisi et ad veniam et iusto.', 303, 'West Franco', '50310', -33.772368, -52.677519, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(84, 24, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 83', 'Dolorem non illum veritatis et quibusdam voluptas ipsum. Occaecati dolor vitae laboriosam iure explicabo omnis. Ipsa nihil quo corporis incidunt illum harum sint vitae.', 871, 'Lilianburgh', '17648', -54.425339, 11.535327, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(85, 34, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 84', 'Vel aut reprehenderit nihil tempora ut aut recusandae. Voluptas est numquam harum repudiandae quisquam. Fugit aut quo nemo minima et ratione non.', 730, 'West Stephaniebury', '18010', 88.700685, 132.460775, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(86, 57, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 85', 'Iusto vel nisi qui et earum. Rerum pariatur ut ut error est est repudiandae natus. Doloremque libero at maxime quia tenetur. Velit eveniet delectus neque quaerat. Sed quia molestiae cum et ipsa rem.', 455, 'East Clara', '06402', -5.68543, -12.234408, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(87, 31, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 86', 'Eligendi alias quasi voluptatum ipsum. Dolorem dicta animi quaerat. Nam aperiam ut nobis quibusdam libero.', 89, 'Binstown', '17231-0539', 75.822018, -77.821015, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(88, 79, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 87', 'Incidunt dolorum eum non in. Aliquid sapiente ex veniam vel. Modi sit corporis et quae. Ea quia earum non doloremque natus.', 241, 'South Earlland', '97273-6042', 79.488777, 55.793083, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(89, 15, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 88', 'Delectus repellat exercitationem et consequatur amet ut corrupti. Non error qui odit qui rerum quidem.', 130, 'Daughertychester', '78586-4308', -51.353886, 83.791692, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(90, 32, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 89', 'Ducimus earum libero et ab ex sunt. Esse rerum inventore rerum molestiae occaecati. Recusandae commodi voluptates aut recusandae voluptatibus nesciunt. Consequuntur qui ut qui hic minima iure.', 204, 'Ephraimbury', '68885-1099', -47.847324, -82.053753, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(91, 55, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 90', 'Eos minima in voluptas qui. Perspiciatis qui vero facere sit porro. Vel at magni quas vitae commodi mollitia debitis.', 295, 'Okunevafort', '27687-7898', 43.827824, -137.678609, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(92, 35, 20, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 91', 'Omnis rem sit provident suscipit est molestias recusandae. Molestiae itaque et beatae accusamus voluptatem dignissimos ipsam. Distinctio aut nesciunt doloribus excepturi minima et magni.', 804, 'Berneiceberg', '42348', 70.688715, 177.005159, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(93, 19, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 92', 'Doloremque facere amet et facere. Ut est odio voluptatem mollitia. Quis qui quo dolorem ut fugiat officiis non et. Dolores laborum et perspiciatis itaque libero veritatis.', 836, 'South Dora', '01925', -60.191007, -12.49079, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(94, 1, 9, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 93', 'Et voluptas officia dolores. Vel doloribus omnis veniam dolore et. Sint modi vero facilis hic.', 112, 'Aniyahmouth', '90887-0475', 54.653891, -52.440026, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(95, 35, 2, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 94', 'Aliquam aliquam laboriosam nihil est. Et molestiae veritatis at perferendis.', 818, 'Port Nelson', '75218', -28.994899, 91.389926, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(96, 30, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 95', 'Sit omnis nihil omnis aut qui minus. Ad non in rem optio autem. Ullam quia vel id ipsam sed veniam dolores. Assumenda quae ipsa ea delectus et dicta.', 247, 'Stammtown', '65620', 64.736965, 3.551714, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(97, 46, 17, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 96', 'Eos voluptatibus quam dolores officia veniam. Quis maiores est excepturi corrupti officiis deleniti est. Omnis quia accusamus sit.', 890, 'Josefinaborough', '28152-3025', -36.689573, 132.211086, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(98, 93, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 97', 'Iusto mollitia et beatae et. Consequatur in debitis aperiam. Aut exercitationem in et dolorem perferendis. Pariatur molestiae esse aut.', 147, 'Willowview', '66936-6672', -47.196527, 148.598523, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(99, 40, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 98', 'Rerum aut dolores fugit animi esse ut. Rerum minus provident dolores adipisci. Vitae cum unde quos amet. Aperiam et non adipisci at omnis.', 957, 'New Ezequielmouth', '53861-1239', -66.104084, 144.276488, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(100, 22, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 99', 'Ipsa itaque consequatur qui possimus illum. Non rerum eum sit dolorem consectetur dolor. Ut doloribus ipsam perspiciatis est quis sed eaque labore.', 74, 'Port Mohammedfurt', '93222', -88.447323, -165.799715, '2021-02-25 14:08:01', '0000-00-00 00:00:00');

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
(1, 'Formattage/redémarrage', 1, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(2, 'Installation Système exploitation', 1, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(3, 'Changement de pièce', 1, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(4, 'Changement de pièce', 2, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(5, 'Installation périphérique', 2, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(6, 'Assemblage ordinateur', 2, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(7, 'Installation Système exploitation', 3, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(8, 'Installation logiciel', 3, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(9, 'Cours/Aide à l\'utilisation', 4, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(10, 'Apple iOS', 5, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(11, 'Android', 5, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(12, 'Windows Phone', 5, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(13, 'Apple iOS', 6, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(14, 'Android', 6, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(15, 'Windows Phone', 6, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(16, 'Apple iOS', 7, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(17, 'Android', 7, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(18, 'Windows Phone', 7, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(19, 'Installation box', 9, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(20, 'Configuration réseau', 10, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(21, 'Configuration réseau', 11, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(22, 'Installation (gros/petit)', 13, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(23, 'Réparation/Entretien petit', 14, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(24, 'Réparation/Entretien gros', 15, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(25, 'Réparation', 16, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(26, 'Changer le stockage', 16, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(27, 'Réparation', 17, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(28, 'Changer le stockage', 17, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(29, 'Réparation', 18, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(30, 'Changer le stockage', 18, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(31, 'Réparation', 19, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(32, 'Changer le stockage', 19, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(33, 'Installation/Configuration TV', 20, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(34, 'Réparation TV', 20, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(35, 'Installation audio/vidéo', 21, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(36, 'Configuration audio/vidéo', 21, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(37, 'Réparation', 21, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(38, 'Installation audio/vidéo', 22, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(39, 'Configuration audio/vidéo', 22, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(40, 'Réparation', 22, '2021-02-25 14:08:02', '0000-00-00 00:00:00');

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
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `avatar`, `username`, `firstname`, `lastname`, `birthdate`, `email`, `adress`, `city`, `postal_code`, `phone_number`, `password`, `lat`, `lon`, `is_helper`, `is_admin`, `is_google`, `created_at`, `updated_at`) VALUES
(1, NULL, 'swilliamson', 'Cronin', 'Chelsey', '1982-09-24', 'mohr.catharine@terry.com', '4009 Fahey Inlet Suite 418\nShanieberg, GA 19681', NULL, NULL, '(873) 850-3959', '$2y$10$xQiMOnaSSRGRhnl9vcUYuutt.fBaq4AaXshKEPwhEa8R7B0lkAEJu', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(2, NULL, 'xmraz', 'Witting', 'Alice', '1977-05-06', 'vebert@stokes.org', '200 Pacocha Place Apt. 527\nEast Delfinafort, IL 65861', NULL, NULL, '(494) 642-6834', '$2y$10$5NrNqoMoDcQ4cjBKHMvLi.gfxCzDemXAKIm7//9K8ephk4ogjMy2m', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(3, NULL, 'zveum', 'Kuhn', 'Unique', '1981-04-05', 'beer.cristina@hotmail.com', '54311 Mohammad Mountains Apt. 616\nWest Madysonland, NE 74020', NULL, NULL, '538.358.8691 x8960', '$2y$10$ZVcBwjc.5/j5qs3j4FOXvuop/tvPEeCHXv4a3pWGESPVpRudAa/N6', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(4, NULL, 'laura26', 'Bartell', 'Barney', '2001-04-09', 'watsica.mohamed@yahoo.com', '83894 Friesen Track Apt. 626\nPort Brennanburgh, MT 97771', NULL, NULL, '(873) 493-4605', '$2y$10$/wSNEwGJ9DpOYCXv0R.SB.3PFyfpAjh5SPrK92IZfjEfXRdSeB1U.', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(5, NULL, 'reta.kertzmann', 'Bernier', 'Annamarie', '1992-03-20', 'rkulas@fay.com', '561 Lauriane Inlet Apt. 689\nTheodoraland, WI 68439-8986', NULL, NULL, '374-563-9421 x201', '$2y$10$hQBA9K.7KwNHlvWZxTVRaOmhLpsn9SrXaVZgzDsIQCcDGDUPH65fe', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(6, NULL, 'danny35', 'Hyatt', 'Estel', '2012-12-26', 'rkovacek@wisoky.info', '47503 Renner Summit Suite 812\nPadbergview, NH 58053', NULL, NULL, '+16249328959', '$2y$10$pKveNLMkqB3d2ziW.4Su3OndP1Ptd9FXW6uBQH4Tdr3MMjR1ioiFS', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(7, NULL, 'janet09', 'Thompson', 'Shayne', '1983-08-29', 'afahey@kirlin.com', '1938 Rohan Burg\nNorth Tateview, AK 78912-7503', NULL, NULL, '(273) 263-5983 x066', '$2y$10$RTtw70PN7hEaJCOf4NlP7O7LEKfoOwV7gNhQhHAloaaY6b.pnew/a', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(8, NULL, 'aurelia.runolfsson', 'Greenfelder', 'Eugene', '2020-10-30', 'damien.hudson@yahoo.com', '778 Mills Shore Suite 668\nPort Jeffreyshire, UT 49286-8105', NULL, NULL, '(208) 901-8560', '$2y$10$4q9wfm7FT4PMzADdNnlS2.FAmM/biuk57V8EyEHNrNidAl.9LWSB2', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(9, NULL, 'henderson10', 'Gutkowski', 'Mckenzie', '1972-01-20', 'mhowe@morar.com', '12261 Eda Lane\nSouth Brentberg, DC 98328', NULL, NULL, '305.364.3348 x323', '$2y$10$TxZeLtNm/7HDRU/Cy77RcOoVaIETZoVve34y2RQ1c.iAhuBhf.EAS', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(10, NULL, 'jherman', 'Marvin', 'Anita', '2009-11-24', 'bhermann@gmail.com', '63157 Glenda Hill Apt. 018\nWest Ida, NE 93297-1298', NULL, NULL, '(827) 614-2234', '$2y$10$WdooYbNTgMmC/sheJIunqui7aWEJiz9C0.vfTSWiUPtitVZmXKbiG', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(11, NULL, 'russ.turner', 'Legros', 'Hugh', '1975-06-02', 'emelia42@price.com', '54764 Oberbrunner Plains Suite 898\nGloverhaven, AR 85355', NULL, NULL, '(576) 937-1894 x3383', '$2y$10$Xe5bUPCVxJDsT5wu7HsUZuJoAJ/U9eF4T3rx315897X3/Uqd3QPw.', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(12, NULL, 'alexane.cartwright', 'Kling', 'Dave', '1983-06-06', 'kbradtke@okeefe.org', '4312 Kuhn Centers Apt. 424\nNorth Randi, MA 72999-3606', NULL, NULL, '1-596-521-7919 x4297', '$2y$10$qkAMGleVQdGkOtxE0W/Ss.a.5ofawRWl/MUDdIpxcHX3ccRh.qWpS', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(13, NULL, 'maggio.june', 'Steuber', 'Ottis', '2018-01-06', 'nschiller@hotmail.com', '43087 Leopold Summit Suite 077\nNew Burnice, MA 61821-6358', NULL, NULL, '(775) 276-3596', '$2y$10$2nrZvUhR1FiePz31GECk2O5G1qw6LS9m9yYXzK5NgPpvEQtZ.Uk6y', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(14, NULL, 'heller.bryon', 'Cormier', 'Harvey', '2011-01-14', 'ona80@mueller.org', '8608 Mohr Shore Apt. 197\nNew Aliza, TN 89609-5594', NULL, NULL, '534-421-2703', '$2y$10$CCs42mztQeyPLDRo2uTgX.VwG5KojpyuuTp/y7aAjIMri2svpcuQC', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:55', '0000-00-00 00:00:00'),
(15, NULL, 'russel.malinda', 'O\'Reilly', 'Daryl', '2011-01-12', 'salvatore26@legros.info', '3188 Russel Lakes\nEast Emilia, MA 44221', NULL, NULL, '(934) 678-4362 x037', '$2y$10$IGJqv5o/XV2th9.ttJLWoe13glS2dpt8CmA/KqDbufHYGSn56rLZi', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(16, NULL, 'cormier.janet', 'Mann', 'Arnulfo', '1995-02-24', 'kub.jordi@hotmail.com', '66082 Crooks Port Suite 914\nAudrabury, OK 78332-6827', NULL, NULL, '(528) 384-7277', '$2y$10$pUpuo5NUWIfwEOYdihyCGeaMDh9zm98xXp.UTpls0UVk6P7yL.P5a', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(17, NULL, 'kenton23', 'Torp', 'Scot', '2012-10-27', 'mozelle00@mertz.net', '5858 Doyle Ville Apt. 167\nNew Bartborough, WA 56595-2266', NULL, NULL, '701.550.5822 x7599', '$2y$10$hImdvzdNvRgax2tPkB9uS.6jCn3ZVqCJB1W.aRbZfLJeDEY/7E.lu', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(18, NULL, 'albert20', 'Wilderman', 'Burley', '1995-08-23', 'cmaggio@rolfson.info', '4887 Ron Ford Apt. 977\nDuBuquemouth, HI 07103-9835', NULL, NULL, '1-273-813-7376 x119', '$2y$10$0GL6GQJ6E.cMcNRrCFrAFuiJp.zBJ4ghpWGptoQw56e/H5gUOWRu2', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(19, NULL, 'andreanne68', 'Pacocha', 'Eleonore', '2003-04-06', 'astrid93@hotmail.com', '10475 Boyd Shore\nHansenshire, MI 30150-6542', NULL, NULL, '635-782-6917 x66933', '$2y$10$x27M4M91az.Lq1/bSBLvbu.NkyhCx1Xp0Qd4oersGwtTsjCPYb5Fi', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(20, NULL, 'merl.padberg', 'Wilderman', 'Karina', '1974-01-22', 'lennie.wehner@koelpin.info', '4108 Arden Landing\nBartellburgh, WA 45777', NULL, NULL, '(495) 768-8950 x013', '$2y$10$MuzXFH2O2a0Yvz/awqWxB.OfJDdHsf1XNvKbsrwoXkDW5rHuFb5YG', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(21, NULL, 'xleuschke', 'Roberts', 'Jasmin', '2017-10-18', 'lenny.kihn@gmail.com', '91797 Coby Fall Apt. 298\nMariahmouth, IA 00324-8582', NULL, NULL, '(425) 951-2312 x89666', '$2y$10$/K5dS4fb8qSwPDLPWo4SQ.ylWNe4qmu/XnajAjf1lDXXzh.61bLb6', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(22, NULL, 'waters.frederic', 'Wolf', 'Aimee', '2003-01-01', 'fanny33@hotmail.com', '24440 Alessandro Views Suite 509\nKihnside, IN 83798', NULL, NULL, '1-265-417-2959', '$2y$10$DZgDCDDmGVGpUOV6sN/vWO2QYTEbATkU7.DVovdAl8aqR5BF/vzZ2', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(23, NULL, 'gdenesik', 'Dach', 'Michel', '1989-06-16', 'crona.genesis@yahoo.com', '4030 Martin Mews\nSouth Mckaylashire, MS 94092', NULL, NULL, '827-576-1042', '$2y$10$rbUk2pZKbxZ0aUSw.djzkuUxvMeYYu7k/WUXgZ5dddzbmm1Ukx2aG', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(24, NULL, 'grant06', 'Koepp', 'Antwon', '2011-11-01', 'lesch.wellington@feest.com', '65876 Verlie Place\nPort Gabriella, CA 55098', NULL, NULL, '1-451-223-4025', '$2y$10$VAlOZUYu8kuEjCiAvkwuCOB3J3LUcmWyg4GdKNbPozlaJj2Ne7YCW', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(25, NULL, 'kunze.elena', 'Franecki', 'Cristopher', '2002-09-04', 'walter.obie@monahan.biz', '3877 Liliane Squares Apt. 128\nLake Elisabethberg, KY 98095-3539', NULL, NULL, '(658) 936-3299', '$2y$10$Z2oa9wjyyAbMenmPEt.bQezOcDVpsqFl1R2Ttl.YKZzR.hpO4LFgK', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(26, NULL, 'hschaden', 'Bosco', 'Tabitha', '2001-05-21', 'rhegmann@zieme.com', '52691 Easter Prairie\nSouth Isabella, NY 13099-3538', NULL, NULL, '1-331-823-0282 x592', '$2y$10$DU6pw7qhmvzCGQBFY1nDR.6OqJQ/2HledIWcJ4vrx1C0JOjGu62yK', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(27, NULL, 'zmraz', 'Waters', 'Arvel', '2005-10-10', 'hannah.wisozk@crist.net', '3594 Alessia Street\nEast Madonnahaven, MN 30416', NULL, NULL, '+1-575-895-4834', '$2y$10$BEqKFDoV9VXOS2NygGY07.7OCvHkOeIxYx5PwUtVtn7YVAPFYEw2y', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(28, NULL, 'ipollich', 'Tremblay', 'Destiney', '1993-09-01', 'carli.wyman@yahoo.com', '663 Estell River\nTayatown, NV 81738-4640', NULL, NULL, '1-276-977-6418 x8046', '$2y$10$cNufpb5h7IFL5.4sQKxV3eSOFg5a32r2tVZ4OuCstjvcOTHaaUWla', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(29, NULL, 'adan28', 'Rice', 'Magdalen', '1977-08-06', 'lottie.greenfelder@hotmail.com', '80741 Nova Parks Apt. 000\nMorarberg, TX 11416', NULL, NULL, '1-245-933-7669 x403', '$2y$10$aAcX9wAf49suyzQ6dpi0B.Y/e1BVYU0n6bqxFQ32BcA5mZhveRTXe', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:56', '0000-00-00 00:00:00'),
(30, NULL, 'kathleen01', 'Abbott', 'Dalton', '2016-11-27', 'bailee.sporer@schaden.org', '21813 Erdman Brook Apt. 089\nPort Rogerschester, PA 82441', NULL, NULL, '882-455-4718', '$2y$10$PvG7HgFVmraCA6qeHDw9LuQeG/efGgc0Ss1HTaWUSjBBLE3f0r3sm', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(31, NULL, 'littel.nona', 'Tillman', 'Monserrate', '1975-04-19', 'lambert.kuphal@padberg.net', '81383 Justus Rapids Suite 864\nKiehnstad, KY 93702', NULL, NULL, '(582) 716-1616 x83392', '$2y$10$rgU94G9VPXtHXXTkFAAkE.zLstzvsGFkOAx47xu5kfZhyZkt35fxO', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(32, NULL, 'telly99', 'Green', 'Henriette', '2013-12-20', 'tyson.dibbert@beer.net', '9496 Letitia Prairie Suite 446\nNorth Ena, PA 85727-2948', NULL, NULL, '452.631.6490 x40213', '$2y$10$ngoAncWdAv5XRIWcN3lP8eFVmJ66E3C3Ucb.mQi5Acgua6D3sU6fu', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(33, NULL, 'walsh.kristy', 'Cruickshank', 'Keanu', '1981-03-30', 'lloyd13@yahoo.com', '7687 Ryleigh Unions Apt. 537\nEast Alba, NJ 79807-3237', NULL, NULL, '1-724-369-5069 x589', '$2y$10$ukbSnH1AjovwA0/zlkhqp.ttaJ2TYaMWHFDwoJ/bn7mJoqRa6ySKe', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(34, NULL, 'jbergstrom', 'Feeney', 'Napoleon', '2017-02-15', 'lpollich@prohaska.com', '610 Christian Lakes Suite 154\nEzrabury, AK 56335-6859', NULL, NULL, '310-320-6346 x56165', '$2y$10$uReVhA4YrMIKcCLRhwOlHOu0FAHnjtMuwG7i6jd1nvRquAjSJmhdm', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(35, NULL, 'precious39', 'Stoltenberg', 'Roxanne', '2021-01-13', 'nmiller@yahoo.com', '28048 Alexanne Burgs Suite 782\nSouth Kelvinberg, MN 52345-7619', NULL, NULL, '518-782-0834', '$2y$10$YxS94pa6CZhQRy2KzsJ/re8zEljov/yd0HumMHkZOac.sm7s1ygJi', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(36, NULL, 'ari31', 'Gleason', 'Leslie', '2002-09-18', 'tritchie@hotmail.com', '49080 Littel Drive\nNedraport, NH 47458-3547', NULL, NULL, '(570) 909-9301', '$2y$10$gFf8WvT3i/t0qFnJ7tXgveOqEXGO0Xb29TZ6QT4UGaEbVZc81ZAW.', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(37, NULL, 'logan45', 'Zieme', 'Felipa', '1992-09-21', 'lowe.jordy@gmail.com', '1065 Magali Shore\nLake Lailaborough, NC 96061-9397', NULL, NULL, '+1 (796) 447-9991', '$2y$10$01ovxTon5ZojxEw2hxMkaOZqlHRRjnehDj4r/dJHWfrx07fpvkA5O', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(38, NULL, 'tfritsch', 'Graham', 'Yasmin', '1985-01-07', 'arch04@rowe.com', '5807 Daniel Inlet\nNorth Kurtis, ME 85240-8121', NULL, NULL, '569.238.5596', '$2y$10$8AO1ZkArYCcZkneL00HHP./0cIrm.vTLFYVXQttmUYg5gvi8pI12q', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(39, NULL, 'yjohns', 'Heathcote', 'Victor', '1976-11-10', 'boyer.earlene@hotmail.com', '65884 Stanton Well\nDareborough, SD 87360', NULL, NULL, '+1-486-516-6469', '$2y$10$XucAAoJ/.9JZQlOOZROrwufuz0wRDcIBkBAHuo/5ijWxtIER9cGrq', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(40, NULL, 'kenny26', 'Moore', 'Camylle', '1979-09-14', 'mhuels@harvey.com', '8715 Orn Canyon Apt. 582\nWarrenchester, MD 46778', NULL, NULL, '+1-640-701-2474', '$2y$10$2ZUFPfyeFWMEbOPmFhp9ieTUsfUOgwI0ydljnq1283Exq0mPoJOYO', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(41, NULL, 'luettgen.malinda', 'Moore', 'Jason', '1993-06-01', 'bridgette.kutch@donnelly.com', '573 West Stream Apt. 913\nSouth Gideonside, WV 84480-7935', NULL, NULL, '742-826-8148', '$2y$10$oiPbVy.hgEonq6zNb1JPXuSfeq8j4sF7QEF.sAkYDjct6k9xR9NYG', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(42, NULL, 'marianna84', 'Hoeger', 'Dejon', '1999-06-10', 'vince48@koepp.info', '97330 Norene Locks Suite 912\nLake Anahi, VT 62472', NULL, NULL, '271.978.9854', '$2y$10$4IcIVu4jFX/dSyVFUCn8JOV6i6Tqvs3MYavxB9PnX.8Z2S432OBMG', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(43, NULL, 'murphy.violet', 'Rath', 'Virginia', '2001-08-13', 'dietrich.graham@bailey.info', '851 Rowe Lodge\nZiemanntown, TN 02389', NULL, NULL, '206-509-6058', '$2y$10$W.hpVG28ml6vSCE6FeNlLeJcjfIgAvjSGpVxeyZuqXYQTTJATkACC', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(44, NULL, 'droob', 'Boehm', 'Domenica', '2002-08-07', 'jstark@wilderman.com', '80300 Hills Circles Apt. 060\nKihnmouth, RI 99798-7716', NULL, NULL, '1-398-546-7007 x7636', '$2y$10$hRYRmK.y43xN3qfzP3RyYe5/qcNwloBRQVPdQicWq9c309wKgNhqm', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(45, NULL, 'dach.wayne', 'Reynolds', 'Alfreda', '1986-09-04', 'laurine43@kozey.com', '8559 Tremblay Viaduct\nRutherfordmouth, WV 99732-6956', NULL, NULL, '257-952-9730 x773', '$2y$10$5IAdumaGks0C8XyRTmTZ/e1w8sQJ9hyFEuV/uPx7cr3/P2YOCau2y', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(46, NULL, 'jturner', 'Spinka', 'Bryce', '2013-06-21', 'jacinthe25@pouros.com', '99025 McGlynn Haven Suite 589\nFunkburgh, SD 99348-7237', NULL, NULL, '+1 (382) 563-4512', '$2y$10$PU0NcWR9kYJQCTDhYF3gjuMdkLNRi5f5aMtkf/mj1EBDFUqGLjeVG', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:57', '0000-00-00 00:00:00'),
(47, NULL, 'laney.effertz', 'O\'Keefe', 'Tanner', '2013-07-10', 'schowalter.sylvia@hotmail.com', '9019 Braeden Mountain\nEast Floydfurt, PA 10097', NULL, NULL, '+1-704-876-1450', '$2y$10$DneQXg6XBvzNCcOZQVfzouzVlQBSfA/RrLluOlCRkP8ImKJcmqG9O', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(48, NULL, 'odell63', 'Kunze', 'Clair', '2008-09-04', 'katelynn.reilly@vandervort.com', '5184 Brennan Camp Suite 568\nPort Sanford, NC 62615', NULL, NULL, '+1-726-871-7772', '$2y$10$z/tes3WmzYitwW9ufaHsjeChrk5SKXFuxVFiR/G6vL/uW8Izg0eUu', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(49, NULL, 'ynitzsche', 'Sanford', 'Deondre', '2015-03-29', 'berry.huels@hotmail.com', '9941 Chelsey Walk Suite 879\nLake Whitneyland, DC 06320', NULL, NULL, '(853) 386-2294 x465', '$2y$10$XPpBdw4gt6UmgDgeQKNxSOv1TxtWfOWDzDGxaJY1kDgrfjmGtgiG2', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(50, NULL, 'adan.marvin', 'Satterfield', 'Jacky', '1992-09-13', 'aschaefer@hotmail.com', '82135 Yolanda Manors\nMillertown, MI 64232', NULL, NULL, '896.977.0757', '$2y$10$.3RQQgUU19IjJ0LjaX.CS.ZN0DgWj6xMezLtss.tk8e3ymTEWHzCu', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(51, NULL, 'cary.russel', 'Cruickshank', 'Wilburn', '2014-01-01', 'parisian.gabe@murazik.com', '3417 Keon Views Apt. 289\nEast Stephaniamouth, SD 58879-7785', NULL, NULL, '789-579-6418', '$2y$10$GSBMv2NZfk3aW4O1y9Ph7OGJ4RiMuQroyBTCv.X/ML5TJJDPJNduq', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(52, NULL, 'lynch.otha', 'Shields', 'Derek', '2019-03-20', 'rsatterfield@gmail.com', '13269 Fahey Wells Suite 114\nConsidineville, NJ 92455-9540', NULL, NULL, '248-742-3611 x112', '$2y$10$QOuOU70yrucT9gkX7XbsReedEU3VeJEHvoiqVTe.mrYb4h.n9yAnW', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(53, NULL, 'bogan.filiberto', 'Pfannerstill', 'Pauline', '1989-05-26', 'fwunsch@nolan.com', '39736 Marks Corner Apt. 491\nLake Desmondbury, FL 41397', NULL, NULL, '1-710-555-2485', '$2y$10$xuy/BUTHRZ01p4.fiCrxy.i4ZXC48x9wHLe5nfahQtZ3VEjVEgrNO', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(54, NULL, 'hilpert.eve', 'Altenwerth', 'Tyrese', '1993-06-14', 'santiago.windler@yahoo.com', '80087 Isaiah Drive\nSawaynmouth, WY 34491', NULL, NULL, '837-776-7150 x01795', '$2y$10$t3Ti81Dt4Q7irswyCsyZh.mRO9U8RWImtFAlxFj7Vnxu0mB7iZfIq', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(55, NULL, 'jonathon.morar', 'Dooley', 'Trevion', '1992-10-12', 'schaefer.hugh@yundt.info', '96345 Wisoky Lake\nMonahanton, NE 67825', NULL, NULL, '+14018531402', '$2y$10$FpBh0qmT.zibw5gTO1oLeOOvICSNNV06uK.fL/zc3X7fuX03Sz7nq', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(56, NULL, 'alvah46', 'Bahringer', 'Mercedes', '1970-03-24', 'dock39@schumm.info', '82766 Leone Club\nLake Novella, SC 74731', NULL, NULL, '+1-804-238-6662', '$2y$10$mf6PqWm5yWqgkQx5WnSHtehQX37udKT0rzv1cQUcooo6CW4V13RdK', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(57, NULL, 'ankunding.max', 'Tillman', 'Nolan', '1970-05-07', 'allan12@reichel.com', '32848 Diana Drive Suite 727\nLake Tyresemouth, NY 55780', NULL, NULL, '1-474-469-5939 x77389', '$2y$10$Iw.T7IgfH3FMje6Ew9YeS.KEc3w2joViZy9KL6hdd6vopvdRkAXe.', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(58, NULL, 'eichmann.meggie', 'Lehner', 'Noelia', '1980-05-30', 'jsimonis@gmail.com', '69964 Kuphal Unions\nCroninburgh, MS 38124-2668', NULL, NULL, '528.567.5750 x2513', '$2y$10$fdj2J2r7FbE6P8Z8.FQsMuCrLKNzocpzPHwB743Oxx9NYFWGRNGZ.', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(59, NULL, 'priscilla.pfannerstill', 'Shields', 'Bridgette', '2013-11-21', 'cgutmann@mclaughlin.com', '9982 Beth Loop Apt. 740\nNorth Clevelandbury, RI 75014', NULL, NULL, '361.203.4992 x3158', '$2y$10$l/.9cr/XRa10Xge5KnERPuPn/OguAurtSIDCvP7QSvITL6MfMJ8iG', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(60, NULL, 'tgleichner', 'Osinski', 'Tiana', '1980-01-15', 'vhills@feil.com', '64384 Waylon Cliffs Suite 325\nEast Stantonhaven, OH 27922-7328', NULL, NULL, '1-619-395-6794', '$2y$10$lUgke9VUJ7iJUAkLvtdpyest3RF8OX/kHQAD5rW9IuhKHpYM7nso2', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(61, NULL, 'alexie84', 'Schultz', 'Guadalupe', '1996-08-08', 'khammes@hermiston.com', '8502 Kaci Viaduct Suite 549\nNorth Jace, MO 19570-1859', NULL, NULL, '(571) 289-9011 x121', '$2y$10$wHcndnTLh7DnwIicNRnYKe2Djwt0SNZwFDbooaMM8vg3u8zlI1mxS', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(62, NULL, 'elisabeth.donnelly', 'Carter', 'June', '1995-12-27', 'anderson.sydney@stark.biz', '258 Magnolia Roads\nHettingerberg, NC 83906', NULL, NULL, '(808) 416-8703 x115', '$2y$10$lrQaAeMtm3sUofPO7lz0WOmVvQmNazxgFxNgrc8EqlbzKLNUdnTIy', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:58', '0000-00-00 00:00:00'),
(63, NULL, 'kerluke.yvonne', 'Jast', 'Jose', '1992-08-18', 'nschinner@dooley.biz', '697 Johanna Glen Apt. 897\nBeckerbury, WA 37533', NULL, NULL, '+1-458-745-5144', '$2y$10$CngXpIuTcbOsSQ1Vxhgu/OoAgU44ZppGQ2IcycXKnK/x0U8nFrx6C', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(64, NULL, 'vschumm', 'Yundt', 'Micah', '1988-06-17', 'ujohnson@schamberger.com', '4362 O\'Reilly Springs\nSouth Betsy, AL 03464', NULL, NULL, '795-436-6259', '$2y$10$Zsa12Kws7YhYU24Ucs7VG.eTzPr/9GZHLOmS3ub0cj8qap0ljJCIC', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(65, NULL, 'jeffrey.okuneva', 'Gleason', 'Pansy', '1988-09-07', 'harmon.harris@yahoo.com', '9768 Monique Loop\nNew Charleyshire, MI 60536', NULL, NULL, '(334) 883-4539 x2929', '$2y$10$lwPNDOhgqSUNDBKXLtl4X.3gJ/mvRNr2.rvn4iHOGBvi/Qgraum4y', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(66, NULL, 'rpacocha', 'Quigley', 'Freddie', '1996-11-25', 'donnelly.alisha@hotmail.com', '1563 Kaylah Streets Apt. 485\nColumbusfurt, MO 80739-7234', NULL, NULL, '987.529.4099 x772', '$2y$10$x1RLCxvIEvdSuthfS5G4d.9BhnXX4HGvxtDtQHp2epFHbO2puvLCe', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(67, NULL, 'gabriel55', 'Reynolds', 'Lura', '2012-10-27', 'ikertzmann@hill.com', '36513 Emard Inlet Apt. 944\nPort Orin, MS 00574-2047', NULL, NULL, '(381) 938-5333 x259', '$2y$10$KHNbqisw3PyfHvJW4PbHWedCJ2MAT9b59Hrh69oKCFsW8uY4w3XZG', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(68, NULL, 'rolfson.nils', 'Prohaska', 'Karianne', '1981-07-28', 'cloyd.waelchi@tillman.net', '58065 Bergstrom Pass\nZboncakhaven, KS 01636', NULL, NULL, '+1 (712) 833-4058', '$2y$10$i8lex5eJ0X/Rrvgf4PdMKetI5W6CRkOk3b29wYGMybCUp93FaWYvm', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(69, NULL, 'royce.kerluke', 'Botsford', 'Alana', '1993-04-21', 'dickinson.noah@gmail.com', '51204 Bradtke Forge\nPort Dakotabury, AZ 69490-1162', NULL, NULL, '+1 (403) 336-4156', '$2y$10$pbS6HyEox.EtosEF4NoDle6VGznbYkARqMwkjknZYy9DYqeuqHL9u', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(70, NULL, 'ukeebler', 'Tromp', 'Oswald', '1982-10-10', 'rwindler@gmail.com', '396 Joanie Trace\nLake Hortense, CO 04324', NULL, NULL, '1-281-295-7836 x1494', '$2y$10$wyY0eawbsD4F/8a6gWT/i.w40wGGJdlhC0O9Pktm3pjdWqBAPZnza', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(71, NULL, 'anais18', 'Corkery', 'Gillian', '1987-01-14', 'megane75@gmail.com', '6303 Davis Mountain\nLauryfort, FL 75656', NULL, NULL, '530.745.9180', '$2y$10$Bl3/4FQBzAtmFWCxt0wLBeZwXLEjmmtF.8xDq/eCNZEULhvEOS7ee', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(72, NULL, 'anastacio.powlowski', 'Yost', 'Jasen', '2013-01-05', 'crystel.kautzer@gmail.com', '54054 Gutkowski Manor Suite 946\nSengerview, MT 27150-0264', NULL, NULL, '425-450-4784', '$2y$10$fp2tPq31wJIhAFpLgMbzLuvXurV1OCJQPPZEqQDN3pEdi2cOc8aBa', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(73, NULL, 'ward.predovic', 'Reilly', 'Minnie', '1972-02-02', 'xbailey@price.com', '69776 Trantow Mills Suite 296\nNolanfurt, UT 28615-8603', NULL, NULL, '(667) 310-5541 x53877', '$2y$10$/VFHKrKZ4/X.CSwDPuvGCOr8GR0qHT8Im4JLeJHyLfwIPOZSoCFyi', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(74, NULL, 'qlang', 'Lakin', 'Brandyn', '1977-07-28', 'bode.elliott@trantow.com', '52115 Eino Pines\nPort Ashley, CT 85800', NULL, NULL, '1-427-627-7626 x8434', '$2y$10$Dr.9/kzhf.KupoY8vsAC9.ttEdAJO4sFsBZe2MseQMDo9Q/r38G5e', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(75, NULL, 'general20', 'Kessler', 'Brisa', '2000-04-20', 'yziemann@wintheiser.net', '439 Brain Crossroad Apt. 405\nCoraliehaven, MD 02197', NULL, NULL, '743-346-2869 x88853', '$2y$10$thPnsdzEEs5s.pLQs69g2eULUiiEYrv6HpsObse9VKbQVidC5obAe', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(76, NULL, 'tbode', 'Welch', 'Mohammad', '1990-07-26', 'marianna23@yahoo.com', '2737 Adele Divide Apt. 843\nNew Abbigailville, OH 18849-8257', NULL, NULL, '(918) 430-7852 x764', '$2y$10$fjOQ6K3YKO2nq7zeY4N2BOwO/EsKPtx/VW9CS/9H00KI55McpvzNK', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(77, NULL, 'mrosenbaum', 'Bosco', 'Claudia', '1984-08-22', 'schaefer.alisa@yahoo.com', '67976 Bruen Mission Suite 103\nNew Tyshawnport, ID 27676-0519', NULL, NULL, '+1 (880) 531-9112', '$2y$10$pq9vvMqbW2V6.drrzdmDnOp5zTqhZlX4xXjDn2ajzqyuvatZ8Ti2.', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(78, NULL, 'zohara', 'Steuber', 'Meredith', '2014-09-03', 'aurore.ernser@gerhold.com', '57672 Rippin Field Suite 154\nDedricfort, MD 28100', NULL, NULL, '(683) 967-9010', '$2y$10$7BVe503Ok.4wiVvE43ZAaO6457Owndv1bNtveqNKn2aJ/y4Cxe.bO', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(79, NULL, 'stacey.hessel', 'Sporer', 'Mitchell', '2002-09-24', 'axel.hansen@yahoo.com', '82617 Izaiah Cliff Suite 368\nWest Hellenburgh, KY 68388-8585', NULL, NULL, '+1.347.462.8722', '$2y$10$ikRlutD672iZMjVG/Db8ueFhHEePDDJuAzWebKel7PYutTpmTiBR2', NULL, NULL, 0, 0, 0, '2021-02-25 14:07:59', '0000-00-00 00:00:00'),
(80, NULL, 'allison.ryan', 'Klein', 'Royal', '2001-12-20', 'kevin.williamson@pfeffer.com', '18371 Kohler Inlet\nWadeton, OH 08068', NULL, NULL, '+1-995-592-9568', '$2y$10$5ZZVhtc.rk3eBbqeSc0BcubFpx.ULa5DnirqEyc5XVAvNhvsN8ywK', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(81, NULL, 'amy73', 'Cartwright', 'Breanne', '2004-04-01', 'sterling09@lebsack.com', '458 Olin Islands Suite 250\nNigelhaven, OH 99008', NULL, NULL, '225.507.0215 x9155', '$2y$10$STLOh59rSTIFugUipWxv6eGVGh8vy8R0m0rg28bJAsxpsS2fZ0WHW', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(82, NULL, 'quigley.reta', 'Quigley', 'Presley', '1980-09-15', 'fred.pacocha@hotmail.com', '393 Tavares Overpass\nNorth Darrellberg, NV 71994', NULL, NULL, '+1-436-600-4757', '$2y$10$RquUJ0F1So5XZvo7K3UmQOcCCZY67g5rJgwqvAeki00pn/NhKx1eO', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(83, NULL, 'xkessler', 'Larkin', 'Maybelle', '2005-05-17', 'jenkins.nicola@yahoo.com', '8151 Junius Fort\nJacobsonside, FL 71092-9407', NULL, NULL, '1-276-605-0613 x10514', '$2y$10$VO2VbEGvAugJD/ZeSq9M3uS5miuwWXBDJ8u0wWOaQyz3XQn/gBNkK', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(84, NULL, 'ukuphal', 'Lockman', 'Kyle', '1996-02-15', 'lfritsch@jones.com', '681 Margie Cape\nTabithaport, AK 36856', NULL, NULL, '882.241.0354', '$2y$10$nw6ZDwkM2DUENUuqKmjGRehT2hKoZXXxiUZ7k3D5j6VTGa9f1Xf.m', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(85, NULL, 'qdare', 'Rippin', 'Albina', '2004-04-26', 'dkohler@jones.com', '7021 Lexus Track Apt. 228\nWardshire, HI 89971-7012', NULL, NULL, '1-391-755-7687 x0554', '$2y$10$LzSDhW/Y7aB0CbezctfPt.3i/yrcqsV9q892YsMUpBU3NCYxqyA0a', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(86, NULL, 'aleuschke', 'Hoppe', 'Tremaine', '1972-06-26', 'brooklyn71@ankunding.info', '4974 Casey Shoal\nWestport, NY 88198-8145', NULL, NULL, '831-397-1625', '$2y$10$uYZGPwfeW0bXPECWRuDXwOW3WSE4UEvz2d0jr1okr2nPwNKA0Je8.', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(87, NULL, 'tia.mills', 'Strosin', 'Megane', '1971-06-03', 'cummings.dillon@gmail.com', '7537 Schroeder Lodge\nLake Felipeburgh, NM 21160-2625', NULL, NULL, '521-851-3352', '$2y$10$K20z23bfd6YRDrAPRJ994ey4DglVRwvZNJVI2D.Pv4vliMlpGPae.', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(88, NULL, 'braynor', 'Feeney', 'Lee', '1982-09-29', 'hyatt.tyson@gmail.com', '440 Kiehn Springs Suite 044\nHarberville, IL 81506', NULL, NULL, '1-604-779-8256 x495', '$2y$10$jkWShaCte0xvysCnotb4P.OkNdK.OnBdVym8hHhBjfLNguI95CLYW', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(89, NULL, 'stokes.beatrice', 'Nitzsche', 'Graham', '1986-09-17', 'nathanial80@hotmail.com', '71871 Vincent Vista\nNorth Isac, NJ 01714', NULL, NULL, '(742) 614-8513 x568', '$2y$10$qES6vSf9PAXuV62zGuVy4.hx/GbXII3D24k2XTKZPxnB0Evu8yDmC', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(90, NULL, 'nayeli.davis', 'Bashirian', 'Danielle', '1998-12-10', 'orolfson@hotmail.com', '7845 Gennaro View\nEast Janet, MD 10340', NULL, NULL, '847-619-4547', '$2y$10$EhntAlj9VbRCAl8wzrIn4uQvoHeuNz/DXbEvCXFW8zqXaikne2dau', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(91, NULL, 'ebrakus', 'Kuvalis', 'Jamil', '2005-05-13', 'carmel83@yahoo.com', '860 Metz Landing\nWest Austynhaven, VA 68316-5496', NULL, NULL, '447-299-1112 x82766', '$2y$10$2yAMuvP4Hfd9RBVHw.CrtOrVDWegSN0JSdj3zn7N7ziFa7XY5rPly', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(92, NULL, 'lgraham', 'Romaguera', 'Niko', '2018-01-04', 'kelley.wilkinson@schinner.com', '9981 Aracely Burgs\nChristopherberg, NC 16325', NULL, NULL, '227.277.1395', '$2y$10$45/L8cdXgIFBtT0CFPjAwus8MBNqZcP6NTxjywAI9t4TWj/FbUAXC', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(93, NULL, 'shayna40', 'Herman', 'Jon', '2010-07-10', 'myra23@hilpert.com', '540 Lucy Mission Suite 735\nDarebury, KS 85072-8219', NULL, NULL, '(949) 726-6192', '$2y$10$CzMaJVaGKGmqbxCyr4UU7uQcf4NjoeJwVDQ5eanPBee8AnTApTtxu', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(94, NULL, 'dhermiston', 'Borer', 'Vinnie', '1975-12-03', 'friesen.london@gmail.com', '8707 Kemmer Vista\nNew Maraside, OK 16892', NULL, NULL, '940-543-1641', '$2y$10$iVL4YfOlJbIlXxbQTVZygey4Zqyt9MINl61DROMRJpAfPzDKNqnAy', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(95, NULL, 'windler.hertha', 'Ortiz', 'Tania', '2020-05-14', 'yokon@hotmail.com', '4400 Metz Well\nNorth Brandonburgh, TN 63800-0427', NULL, NULL, '(568) 288-7949 x16944', '$2y$10$wXX6mzvd9Rm/uXe3U1AaQ.jLcOZNCuny/xdY91k.z6PKf2yLhn2Ai', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:00', '0000-00-00 00:00:00'),
(96, NULL, 'jwolff', 'Stoltenberg', 'Lindsay', '2009-11-07', 'pfeffer.zackery@gmail.com', '35416 Wilkinson Circle\nWest Marcus, KY 15142-8733', NULL, NULL, '(863) 713-2100', '$2y$10$HsAlXdUrU0Ea3eDVK8Ti.u6UQJHWUCqHMYbQWcVCetlARN/6Bd0zu', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(97, NULL, 'agnes.hahn', 'Wolff', 'Johann', '2013-12-09', 'vivien.kirlin@yahoo.com', '854 Hegmann Islands\nDoloresbury, NH 84664-4295', NULL, NULL, '1-268-489-4375', '$2y$10$HB2I8j5rl07Xmr0NXqtaruTTFuLu2nNib1Pud.UHYPuMvTUakoPxq', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(98, NULL, 'kevon.gerhold', 'Gottlieb', 'Ezra', '1973-12-31', 'ddubuque@yahoo.com', '52231 Nolan Spur\nChristopherport, MI 20681', NULL, NULL, '653-264-1830 x4329', '$2y$10$JWFpHzDf5YoRS5Y7wJLwueaRuJAJFmGqBlcGERSEdvaqDVM7UoKKu', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(99, NULL, 'gussie79', 'Jenkins', 'Shemar', '1983-08-30', 'rozella.wisoky@upton.net', '85092 Bayer Street\nLake Lloydmouth, WI 92445', NULL, NULL, '+1.950.470.9354', '$2y$10$L3Ao.euWeuUw2jkMyy0rPe8uetsQNZfrtsSV6..4zQ35HdAWgsZ1i', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(100, NULL, 'elvis.heathcote', 'Kulas', 'Delpha', '1997-06-20', 'gabrielle12@howell.com', '3523 Bernita Mews\nSatterfieldbury, NJ 49941', NULL, NULL, '261.834.9420 x712', '$2y$10$ElOpQ4gYJYxCKRLHc5aVteSIn59cot6iUj7UkgDkxgV8KFEcrqikW', NULL, NULL, 0, 0, 0, '2021-02-25 14:08:01', '0000-00-00 00:00:00'),
(101, NULL, 'antoine.lga.leguillou@gmail.com', NULL, NULL, NULL, 'antoine.lga.leguillou@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$bYpIsqOj2Z4/vIZqVUZ4gud5MQDdsl2DdbipHWAfQxn.WhOrFc7IK', NULL, NULL, 0, 0, 1, '2021-02-25 14:08:24', '0000-00-00 00:00:00');

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
(1, 33, 48, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(2, 4, 43, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(3, 2, 12, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(4, 35, 32, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(5, 28, 49, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(6, 35, 30, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(7, 6, 89, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(8, 1, 56, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(9, 13, 67, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(10, 8, 100, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(11, 24, 25, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(12, 7, 25, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(13, 28, 84, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(14, 16, 62, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(15, 32, 65, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(16, 21, 93, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(17, 5, 45, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(18, 33, 49, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(19, 10, 100, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(20, 19, 42, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(21, 15, 23, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(22, 17, 72, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(23, 40, 31, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(24, 26, 20, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(25, 37, 35, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(26, 10, 31, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(27, 34, 72, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(28, 7, 61, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(29, 14, 90, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(30, 34, 38, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(31, 30, 35, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(32, 21, 21, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(33, 21, 84, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(34, 31, 63, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(35, 17, 31, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(36, 10, 19, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(37, 25, 91, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(38, 5, 100, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(39, 32, 30, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(40, 30, 6, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(41, 26, 71, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(42, 30, 72, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(43, 13, 5, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(44, 33, 81, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(45, 29, 12, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(46, 18, 79, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(47, 36, 99, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(48, 26, 100, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(49, 24, 9, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(50, 12, 86, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(51, 25, 28, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(52, 28, 6, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(53, 33, 8, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(54, 14, 60, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(55, 38, 60, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(56, 36, 59, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(57, 3, 97, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(58, 1, 36, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(59, 21, 82, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(60, 18, 96, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(61, 5, 70, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(62, 38, 15, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(63, 2, 92, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(64, 39, 22, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(65, 32, 48, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(66, 28, 65, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(67, 40, 89, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(68, 14, 41, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(69, 38, 96, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(70, 12, 37, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(71, 2, 3, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(72, 16, 61, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(73, 33, 76, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(74, 9, 23, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(75, 30, 4, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(76, 37, 70, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(77, 29, 13, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(78, 3, 45, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(79, 17, 30, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(80, 9, 19, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(81, 11, 41, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(82, 4, 99, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(83, 18, 53, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(84, 27, 26, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(85, 23, 10, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(86, 26, 37, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(87, 29, 15, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(88, 17, 29, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(89, 19, 80, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(90, 9, 94, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(91, 3, 73, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(92, 28, 85, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(93, 36, 42, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(94, 34, 7, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(95, 5, 18, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(96, 13, 31, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(97, 3, 5, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(98, 18, 75, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(99, 5, 56, '2021-02-25 14:08:02', '0000-00-00 00:00:00'),
(100, 19, 54, '2021-02-25 14:08:02', '0000-00-00 00:00:00');

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
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `metadatas`
--
ALTER TABLE `metadatas`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
-- Index pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `chat_users`
--
ALTER TABLE `chat_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `page_group`
--
ALTER TABLE `page_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT pour la table `user_skills`
--
ALTER TABLE `user_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pour la table `warnings`
--
ALTER TABLE `warnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `breakdown_categories`
--
ALTER TABLE `breakdown_categories`
  ADD CONSTRAINT `breakdown_categories_ibfk_1` FOREIGN KEY (`id_platform`) REFERENCES `platforms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

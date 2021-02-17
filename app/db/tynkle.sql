-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 16 fév. 2021 à 15:25
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
(1, 1, 'Dépanner mon PC/ MAC', 'Commodi enim rerum sint repellendus. Enim est porro sit est quos repudiandae. Iure mollitia rem et quasi enim deleniti placeat illum.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(2, 1, 'Faire évoluer mon matériel', 'Et accusantium commodi distinctio veniam non voluptas illum laborum. Sapiente quisquam sint culpa. Itaque error libero corporis velit doloribus repellendus.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(3, 1, 'Installer un logiciel', 'Aspernatur ea laudantium illum voluptas quia qui. Sed maxime exercitationem voluptatem ad ea facere qui. Assumenda sunt accusantium illum quisquam repellendus illo veritatis.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(4, 1, 'Aide à l\'utilisation', 'Est esse quos est dolor. Pariatur veniam repellat et rerum. Error ab in sed fuga voluptas tenetur. Ea ab accusantium mollitia est aliquam accusantium.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(5, 2, 'Dépanner mon smartphone', 'Nisi amet deserunt quaerat repellat. Incidunt eligendi qui et non et quo maxime. Iure corporis ratione vitae. Accusantium id et sint recusandae.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(6, 2, 'Depanner ma tablette', 'Aut quam ea et odit. Blanditiis eius eum totam quisquam veniam et. Voluptatem placeat aut iusto impedit sint provident vitae.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(7, 2, 'Changer une pièce', 'Officia commodi enim tempora assumenda. Quos expedita dolores aut ad nesciunt ex adipisci. Saepe dolorem placeat et quis laboriosam numquam quasi.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(8, 2, 'Aide à l\'utilisation', 'Sapiente dolores quis omnis voluptas. Quod nobis aliquid dicta eum. Corrupti hic ut consectetur et sint.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(9, 3, 'Installation box internet', 'Ut quam expedita necessitatibus rerum at sed. Cumque sunt in et vel sapiente reiciendis. Nesciunt repellat veritatis rerum sed dolores fugit.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(10, 3, 'Connecter mes appareils', 'Facilis eum tenetur aliquam ut et enim voluptatibus. Error eos architecto quod quasi quasi nesciunt. Aut ratione blanditiis quasi dignissimos et possimus.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(11, 3, 'Dépanner ma connection internet', 'Possimus molestias et sunt inventore. Mollitia ut dolor sunt corrupti temporibus itaque.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(12, 3, 'Aide à l\'utilisation', 'Voluptas blanditiis sequi eum esse. Et maxime nulla corporis aliquam enim. Ea quis sit sint exercitationem unde dolorum dicta cupiditate.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(13, 4, 'Installation gros/petit électroménager', 'Inventore nisi optio quidem et asperiores. Unde repellendus et ut sint quia ea. Vero corrupti omnis dicta quos similique ratione ex. Voluptas est ea sit aut eum.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(14, 4, 'Réparation / entretien petit électroménager', 'Voluptatem voluptatem autem tenetur tenetur pariatur non voluptatem. Aliquid perferendis aliquid sit vero sit ut. Et id laudantium numquam. Dolorem voluptatem temporibus id quia.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(15, 4, 'Réparation / entretien gros électroménager', 'Doloremque consequuntur totam nihil aut. Repellat soluta aut optio rerum eum. Consequatur harum mollitia corporis et id natus odit. Aperiam deserunt doloremque quos repellat qui cum nisi.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(16, 5, 'Réparer / configurer ma playstation', 'Distinctio placeat sint provident eius. Quaerat nobis voluptatum excepturi ut et et. Aut rem consequatur cum nostrum et fugit. Molestiae quo quia sit eum aut quo.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(17, 5, 'Réparer / configurer ma xBox', 'Explicabo voluptatibus fugit itaque qui sed neque dolor. Ea dicta cupiditate voluptas architecto alias voluptatibus veniam. Et fugiat illo dolor similique.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(18, 5, 'Réparer / configurer ma NintendosSwitch', 'Vero rem saepe totam et neque et. Non nostrum ea tempore ut architecto beatae voluptatem dolorum. Et libero error aut fuga impedit animi soluta. Sit sequi quia sit molestias reprehenderit labore eos.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(19, 5, 'Autres consoles', 'Ipsam velit et aspernatur. Dolor in quis consequuntur unde et autem. Vel voluptas aut impedit error temporibus dolorem eligendi voluptatem.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(20, 6, 'Depanner/installer ma TV', 'Necessitatibus nulla tempora praesentium numquam voluptatem molestiae enim quidem. Totam tempore et ex quos temporibus maxime. Ut odio temporibus reiciendis odio ipsa error similique.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(21, 6, 'Depanner/installer mon système audio', 'Eaque nisi quibusdam eius quia distinctio quasi et. Aut tenetur minus non autem neque. Est delectus et voluptas ut. Laudantium sapiente perferendis in provident.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(22, 6, 'Depanner/installer mon lecteur vidéo', 'Enim commodi eligendi dolorem qui qui et. Deleniti quia dolorem et quos quia. Alias rerum dolor hic neque explicabo et magnam. Aut eum ad quod neque vitae.', '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(23, 6, 'Aide à l\'utilisation', 'Minima et numquam consequatur in. Accusantium commodi officia iste. Ipsum dolore nisi neque. Impedit excepturi quam necessitatibus nisi.', '2021-02-12 15:16:43', '0000-00-00 00:00:00');

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
(5, '2021-02-16 09:40:49', '0000-00-00 00:00:00');

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
(9, 5, 101, '2021-02-16 09:40:49', '0000-00-00 00:00:00'),
(10, 5, 101, '2021-02-16 09:40:49', '0000-00-00 00:00:00');

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
(12, 101, 5, 'Vous avez reçu une nouvelle offre', '/activities', '2021-02-16 10:02:06', '0000-00-00 00:00:00'),
(13, 101, 5, 'Vous avez reçu une nouvelle offre', '/activities', '2021-02-16 10:20:18', '0000-00-00 00:00:00'),
(14, 101, 5, 'Vous avez reçu une nouvelle offre', '/activities', '2021-02-16 10:26:06', '0000-00-00 00:00:00'),
(15, 101, 5, 'Vous avez reçu une nouvelle offre', '/activities', '2021-02-16 10:36:12', '0000-00-00 00:00:00'),
(16, 101, 5, 'Vous avez reçu une nouvelle offre', '/activities', '2021-02-16 10:42:26', '0000-00-00 00:00:00'),
(17, 101, 5, 'Vous avez reçu une nouvelle offre', '/activities', '2021-02-16 10:45:32', '0000-00-00 00:00:00');

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
(103, 101, 102, 'Hello You', 'ahahhahahhahhah', 600, 0, 1, '2021-02-16 09:40:49', '2021-02-16 09:41:24'),
(104, 101, 102, 'ahhahhaha', 'aoaooaaooaoaoao', 200, 1, 0, '2021-02-16 10:02:06', '2021-02-16 10:02:43'),
(105, 101, 102, 'Hello You', 'yo mec ! 200 keus !', 200, 0, 1, '2021-02-16 10:20:18', '2021-02-16 10:21:25'),
(106, 101, 101, 'Hello wolrd is coming to you', 'jajajajjjajjajajja', 400, 0, 1, '2021-02-16 10:26:06', '2021-02-16 10:34:43'),
(107, 101, 102, 'AHAHAHHAHHA', 'PPSZZOZOZPZPZOZZPZP', 800, 0, 1, '2021-02-16 10:36:12', '2021-02-16 10:38:04'),
(108, 101, 101, 'HALLLO', 'haoaoaoaoaooaoao', 777, 0, 1, '2021-02-16 10:42:26', '2021-02-16 10:42:39'),
(109, 101, 102, 'Test', 'test', 900, 0, 1, '2021-02-16 10:45:32', '2021-02-16 10:45:42');

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
(1, 65, 2, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 0', 'Iste qui aut quibusdam sequi. Deserunt itaque ab qui magni eveniet voluptas. Eos incidunt nihil eius autem sunt consequuntur. Sint fugit possimus nisi eos minus perferendis tempore.', 802, 'Gorczanyfort', '59043-4629', 5.291059, 137.568097, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(2, 91, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 1', 'Et omnis in harum fugiat aperiam totam. Ullam dolorem blanditiis repellat exercitationem nihil enim neque. Cumque sint quis quis itaque quod.', 742, 'Christiansenshire', '74839', -17.396809, 171.90405, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(3, 80, 19, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 2', 'Dignissimos aut est voluptates quisquam illo ut dolor magnam. Et distinctio eos sed eligendi. Maxime est ea neque itaque minus et doloribus. Rem unde dolorum amet et. Maiores sed qui qui sint.', 25, 'New Andersonview', '21428-4662', -83.747802, 26.788661, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(4, 73, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 3', 'Quo suscipit et quia perferendis mollitia veniam occaecati. Culpa maiores fugit et eos tempore. Eius maiores voluptas consequatur tempore ullam in laboriosam deleniti.', 520, 'Jerrellstad', '00824', 63.685737, -93.27512, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(5, 68, 19, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 4', 'Unde ea rerum enim ea quis deleniti. Impedit officiis neque expedita dolorem sed voluptatum ipsa. Quibusdam qui est voluptas voluptatem ut. Eligendi aut ea enim eum.', 19, 'Dietrichhaven', '67039-2723', 36.932967, 123.818666, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(6, 26, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 5', 'Autem consectetur voluptatem dolorem dolorem praesentium. Inventore ad distinctio amet placeat cum sed. Et at et beatae at repellendus laudantium non.', 683, 'Johnsberg', '21655', 74.160519, 159.841095, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(7, 80, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 6', 'Autem hic mollitia porro qui ad. Aliquam repudiandae explicabo accusamus ratione dignissimos eum. Officiis facilis sit aliquam a qui inventore.', 827, 'East Haroldview', '73288', -56.35544, -146.768776, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(8, 88, 20, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 7', 'Sint quidem consequuntur minus eaque autem consequatur magnam et. Voluptate laudantium sint quis maiores ea quos. Qui culpa aperiam sed est perferendis esse.', 293, 'Edwardbury', '32218', -68.534581, 109.895592, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(9, 39, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 8', 'Dolores ut inventore molestiae quisquam nulla inventore. Iure aspernatur tempora quam similique. Quam excepturi in sequi corporis ut. Voluptas est occaecati tempora et culpa quis.', 122, 'Deefurt', '82652-5056', 29.767335, -77.373478, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(10, 72, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 9', 'Ipsum est fuga magni illum porro. Sed rerum unde sunt non velit. Iusto repudiandae aliquam mollitia eaque qui est quis.', 537, 'Zanefort', '82176', -69.56636, 162.686571, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(11, 83, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 10', 'Laudantium itaque sunt quod distinctio ratione ratione fugiat. Laborum sunt et tenetur consequuntur et consequuntur ut. Est ut veniam odit minima velit quia et. Voluptatem laudantium sed iure iste.', 846, 'Bellachester', '74064', -14.678733, 10.862191, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(12, 38, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 11', 'Dolores repudiandae dignissimos error odio. Dicta inventore eos repellat. Velit rerum in nemo officia totam saepe.', 254, 'Port Yadira', '35217-6216', -4.546689, -71.302104, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(13, 34, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 12', 'Quasi dolorum cum animi ullam quia quis velit in. Sit qui dolor atque amet delectus natus ea. Aut officiis soluta enim. Non itaque qui eos possimus veniam. Repudiandae ut facere aut praesentium.', 420, 'Rippinside', '84662-9362', 58.785284, -2.263816, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(14, 6, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 13', 'Maiores ut non ut placeat dicta earum. Ipsum est quasi cum nam amet incidunt. Aliquid quidem numquam quidem animi.', 594, 'South Reannamouth', '33947-5581', 72.180363, 19.703394, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(15, 97, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 14', 'A ratione officiis earum natus molestiae. Ut sed et molestiae.', 62, 'South Gregg', '02819', 77.962662, -38.894216, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(16, 33, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 15', 'Quia sed et praesentium voluptatum dolorem incidunt aliquam. Est corrupti nobis et impedit. Quibusdam ut temporibus consequatur ut alias odio.', 425, 'Sydneyborough', '63077-4947', 53.620835, 106.321598, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(17, 1, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 16', 'Deserunt voluptas officia iure repudiandae. Quos ut cupiditate ab et alias quasi. Officia vel eum totam fugit non voluptas rem. Quis fuga accusamus et.', 904, 'Taylorport', '46211-6419', 0.989281, -176.628361, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(18, 43, 17, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 17', 'Est totam tempore et sit. Maxime labore illum nam iure aspernatur magnam.', 152, 'West Bettye', '83423-9455', 10.769924, 30.320122, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(19, 15, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 18', 'Eveniet quasi nihil nisi quas voluptatibus eos enim. Maiores nulla consequatur amet.', 318, 'New Hollishaven', '34661-9500', 75.682447, 17.669291, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(20, 60, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 19', 'Earum aut ratione suscipit eos voluptas eum voluptatum. Quia quos sequi quis quia sapiente vero. Eius animi laboriosam odio est. Qui neque ex cupiditate voluptatem non aliquid nostrum.', 174, 'Nicolasberg', '50894', 3.421132, 117.734083, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(21, 73, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 20', 'Iure dolorem consequatur inventore delectus. Voluptatibus enim sed voluptas tempore distinctio ab.', 738, 'New Velmaborough', '03771-6765', 1.741918, 161.266669, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(22, 44, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 21', 'Sunt totam tempora alias veniam ipsum autem. Voluptatem consequuntur nulla et asperiores ducimus est quas. Et ipsum rerum dolore eum. Qui quis magni non mollitia in voluptatibus ratione.', 588, 'East Leliaview', '06707', 86.907339, 94.254965, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(23, 94, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 22', 'Qui ea facere expedita quia omnis eveniet occaecati. Et vero qui cumque officiis dolorem. Aspernatur laboriosam impedit qui consectetur perspiciatis id et nobis.', 488, 'West Dolly', '57938', -41.336475, -10.14849, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(24, 50, 2, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 23', 'Aliquid quis repellat inventore iure molestias cumque. Ut autem ipsa et modi. Eaque tenetur tempore ipsum eveniet exercitationem dolor asperiores.', 424, 'Lake Roxane', '40454-1249', 14.001205, -17.990239, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(25, 100, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 24', 'Modi voluptatibus tempore excepturi laborum vero. Eum aut qui veniam quis ea consequatur at.', 541, 'Dixiebury', '44052', -35.350946, 16.457268, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(26, 90, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 25', 'Sunt et consequatur eius neque. Tenetur itaque deleniti sequi occaecati veniam consequatur. Et similique consequatur neque qui deleniti.', 636, 'South Murlview', '61252-1374', 57.265295, -65.035472, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(27, 84, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 26', 'Rem fugit voluptatibus maxime laborum voluptates sequi. Rerum culpa voluptatem nobis facere. Id consequatur maiores id sit et.', 719, 'South Stacey', '48325', -86.546811, -147.269065, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(28, 40, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 27', 'Rem minus optio saepe perferendis repellat exercitationem quos possimus. Excepturi praesentium rerum quo aliquid odit. Deserunt aut sed sunt. Et dolorem voluptatem incidunt officiis.', 64, 'Tillmanfort', '67501-1794', 80.247099, 17.429943, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(29, 13, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 28', 'Repellendus vel reprehenderit eum omnis velit voluptatem. Et et ut facilis et et vero est. Et sit incidunt ut ipsa tempore repudiandae debitis.', 475, 'Jastton', '59237', -45.266683, -82.675853, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(30, 46, 9, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 29', 'Sed placeat pariatur ex ea. Asperiores vero aperiam suscipit facilis. Id dolor quaerat illo in et temporibus natus.', 266, 'North Angel', '11972', -54.36416, 175.348862, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(31, 20, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 30', 'Voluptates voluptatem illo iusto eos et quo tempora tempora. Nihil vel saepe omnis odio sapiente nihil voluptatum. Dolorum sunt dolores voluptatem.', 959, 'South Eloisachester', '06442-1057', 67.699153, -5.424391, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(32, 32, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 31', 'Iure facere error accusamus. Sunt et dolore libero. Et est distinctio laboriosam soluta eveniet. Ducimus consequuntur quis nesciunt asperiores mollitia placeat.', 617, 'Neilview', '73829-8867', -16.337905, 93.269342, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(33, 38, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 32', 'In dolore voluptas corrupti odit ut quia illo. Aut a corrupti et sint autem. Earum voluptatem dolor ut provident voluptatem.', 468, 'Schoenport', '75934-3015', -58.954269, 48.586651, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(34, 91, 9, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 33', 'Molestiae id qui labore et. Nihil mollitia sunt fugit dignissimos est inventore. Illum earum ut necessitatibus a.', 885, 'New Andre', '28165', 31.547176, 121.646456, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(35, 14, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 34', 'Eos vel explicabo molestiae libero consequatur odit tenetur. Tempora ut qui impedit et voluptas sunt fugiat. Ea eius maxime at aut magni quisquam occaecati.', 802, 'Port Alainastad', '11178', -87.102377, 27.913642, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(36, 22, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 35', 'Quae occaecati sed et esse amet. Dolor veniam explicabo et voluptas modi iure. Rerum facere quis reprehenderit aut rem quibusdam commodi.', 228, 'Romaguerafort', '29988', -63.577476, -140.338123, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(37, 11, 17, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 36', 'Repellendus et rerum non et. Fuga eos quaerat eligendi corporis facilis.', 253, 'North Kingburgh', '02339', -43.564877, -76.245956, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(38, 39, 17, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 37', 'Ex molestiae ut et quis et laborum ut nihil. Corrupti velit vitae est.', 537, 'South Alysson', '10372-9617', 16.345498, -155.681841, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(39, 79, 9, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 38', 'Vero unde possimus ut voluptas inventore voluptatem. Voluptas ut suscipit commodi. Et nemo et sit et. Iusto ipsa aut mollitia vel.', 322, 'Jerrellview', '56348', -59.033751, 136.94692, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(40, 66, 19, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 39', 'Perferendis eos atque tempore et ex quis. Ut vel et omnis. Id in consectetur sapiente doloremque voluptatum repudiandae. Odit numquam ut atque aut quas.', 16, 'Braxtonport', '84312', -52.768019, 129.994492, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(41, 42, 7, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 40', 'Qui non rerum dolore ducimus optio impedit facilis. Expedita nobis exercitationem reiciendis qui cum. Nesciunt iure cupiditate quam consequatur architecto molestiae.', 170, 'New Bailee', '70674-5280', 54.93916, -123.99271, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(42, 77, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 41', 'Et veniam laborum enim veniam quia et aliquam magnam. Dolorem quia qui non est dolorem delectus.', 784, 'North Maryam', '54037-8162', -59.287584, -45.026586, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(43, 4, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 42', 'Repellendus dolores aut vel excepturi. Similique eveniet officiis fuga possimus ex dolorem vero.', 110, 'Clarissaton', '65663-3072', 8.858503, -136.986553, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(44, 62, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 43', 'Doloremque in optio quo ad maiores sint. Rerum modi nobis doloribus fugit saepe ex impedit ut. Quo quisquam repellendus quaerat vel quibusdam illum autem.', 920, 'Hillsfurt', '98539-4911', 45.899099, -30.460805, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(45, 41, 20, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 44', 'Delectus ducimus velit voluptas similique beatae. Sit excepturi incidunt in maxime sit blanditiis. Quis amet et ipsa non aut facilis laudantium et.', 499, 'East Johnathonside', '50684-3953', 1.053062, 124.606215, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(46, 60, 19, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 45', 'In pariatur architecto voluptas porro et fugiat ipsum. Architecto voluptas facere modi quis temporibus rerum. Dolores iure qui omnis.', 407, 'South Tate', '00105-1735', 51.434818, 31.260624, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(47, 8, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 46', 'Iste debitis debitis et blanditiis accusantium. Recusandae eum fuga nam voluptas assumenda. Voluptatum suscipit quam est sequi dolorum libero doloribus.', 372, 'West Ernieview', '24346-6142', 51.994442, -93.749726, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(48, 50, 21, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 47', 'Et ea beatae et ut eos. Aperiam optio aliquam ab saepe error id amet. Libero autem atque ad rem sed praesentium cupiditate. Nam enim vero fugit sunt. Recusandae sunt cupiditate quia.', 963, 'East Marcelinobury', '12970-9364', -89.107891, -129.331867, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(49, 78, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 48', 'Maiores rerum est quod beatae omnis accusantium. Ut fuga omnis vero ratione error. Qui repellendus rerum sunt ut quis.', 564, 'South Donato', '44111-7032', -57.256495, -175.438818, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(50, 37, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 49', 'Libero commodi nihil cumque necessitatibus. Non debitis earum dolores sunt rem repellat assumenda. Quia itaque temporibus et odit ipsum libero.', 127, 'Dachhaven', '08122-6981', -45.440373, 111.298083, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(51, 48, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 50', 'Dolorum omnis et aut rem ab. Omnis dolor at ut. Eos beatae ea similique earum quis ut quod. Nostrum in doloremque pariatur nesciunt maxime assumenda sint.', 855, 'New Kennedy', '16283-4053', 10.647331, -115.703277, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(52, 38, 19, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 51', 'Ad accusantium ut eaque dolore quo. Eos vel id molestias atque quae placeat ut. Quis ullam eum quo. Hic quod ea nesciunt quo ut optio consequuntur voluptas.', 722, 'Kingland', '03683-8221', 56.331403, -177.0861, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(53, 37, 9, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 52', 'Et exercitationem quasi consequatur laboriosam ut velit est accusantium. Sit quae aut earum molestiae ex a architecto. Ipsam veniam fugit necessitatibus. Qui sed inventore quod.', 683, 'Ricehaven', '74427', 10.395471, 66.206899, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(54, 80, 13, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 53', 'Adipisci neque et ipsa necessitatibus earum molestiae maiores. Optio est perferendis natus voluptatem enim. Id quia voluptates suscipit et eum. Veritatis ad sed vero aut ipsam rem.', 836, 'Elinorberg', '69715', -49.666689, 142.90185, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(55, 66, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 54', 'Id nihil vero omnis esse. Perspiciatis explicabo architecto nemo dolor. Molestiae aut commodi error dolores vel tempore omnis vitae. Eos placeat omnis et.', 693, 'Nitzscheshire', '58587', 5.34878, 140.542065, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(56, 29, 2, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 55', 'Voluptates quis eum nam. Molestiae et possimus facilis harum quidem voluptatum.', 639, 'Blickview', '47633', 10.883184, 120.857228, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(57, 49, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 56', 'Earum et tempora rerum est assumenda commodi. Sed aut velit est aut inventore aut provident. Molestiae qui sunt omnis et voluptas dolor. Est perferendis sit ratione ut ipsa quis et.', 390, 'Quitzonmouth', '50655', -45.941645, 4.06093, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(58, 44, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 57', 'Est vero occaecati facilis est repellendus ut earum. Et facere eos id dolor mollitia placeat. Laudantium qui maiores ut omnis.', 622, 'Edwardoburgh', '16518', -13.783293, -104.765127, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(59, 68, 17, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 58', 'Architecto iste sit debitis magni tenetur. Ut minima dolore consequuntur placeat autem. Occaecati eos odio quo unde dolor quia. Accusamus enim voluptatem quisquam nihil dolorem laborum rerum.', 690, 'Sanfordhaven', '63458', -10.84548, -136.74964, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(60, 2, 9, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 59', 'Et eveniet iure et et necessitatibus nihil illum. Eum doloremque illum dolor commodi consequatur fugiat consectetur voluptas. Nostrum aspernatur omnis ullam possimus. Ducimus ratione animi et ut.', 148, 'Okunevaburgh', '47450-5664', 32.944093, -118.202952, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(61, 41, 9, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 60', 'Vitae ut accusantium voluptatibus tempore omnis omnis. Repellendus incidunt ut qui non ad. Unde dignissimos optio tempore quo numquam non reiciendis.', 934, 'Champlinmouth', '94746-1912', 10.972492, 48.299869, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(62, 66, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 61', 'Molestias nemo sunt iure at quis aut. Minus quia nihil quia. Voluptatem enim cumque earum et quo at ipsam eos.', 336, 'Lake Alycetown', '40684-1470', 40.937484, -109.604274, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(63, 9, 17, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 62', 'Commodi qui et ut libero aspernatur voluptatem voluptas. Quas odio eaque dolorem illum ut voluptas repudiandae. Cum et aliquam blanditiis commodi. Aut adipisci et nobis autem.', 47, 'New Amaya', '28846-7848', -72.652897, -51.81459, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(64, 7, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 63', 'Necessitatibus iusto porro voluptatem aut quod aperiam vel. Mollitia harum excepturi aut sed. Repudiandae eveniet rem et numquam maiores.', 173, 'Lewiston', '29212', 12.770699, 47.838742, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(65, 27, 17, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 64', 'Architecto alias suscipit non aut sunt iusto. Facilis unde atque voluptatem delectus qui ut. Distinctio rem aliquam est aliquid distinctio mollitia enim.', 620, 'Xzavierton', '58750-1962', -58.672477, 40.270273, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(66, 62, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 65', 'Omnis nemo ex veniam dolores. Dolor expedita et ut libero ullam. In dolorem sint consequuntur tempore. Fugiat et debitis maiores quis earum et.', 697, 'New Estaside', '75129', -43.016775, 26.536834, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(67, 74, 13, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 66', 'Quo dicta voluptatem et in quas non et. Et delectus vero aperiam eligendi. Velit voluptatum est dolorem incidunt assumenda sit. Natus pariatur neque natus et reprehenderit accusamus eaque.', 578, 'Millertown', '73248-7958', -22.739273, 65.425322, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(68, 50, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 67', 'Consequatur harum et ab omnis delectus. Qui et aperiam voluptas rem et est. Dolore molestiae id laudantium distinctio odit iste debitis.', 112, 'Port Jeffery', '79796', -88.737901, -107.86527, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(69, 52, 6, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 68', 'Ut ipsam aut enim optio. Illum magnam quibusdam quo cumque perferendis est.', 929, 'Ondrickaview', '57113', 71.530373, -134.091675, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(70, 99, 12, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 69', 'Quibusdam asperiores totam autem voluptas eveniet. Blanditiis eos ut atque.', 847, 'Uniqueview', '65945-1362', 2.263489, 144.837535, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(71, 40, 6, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 70', 'Architecto id molestias magnam ut minus. Non rerum quo error consequatur ea sit. Eos ipsa illum facilis. Et dolor sapiente sed inventore illum.', 628, 'Lake Karelleburgh', '52840-0138', -7.175345, 52.133315, '2021-02-12 15:16:50', '0000-00-00 00:00:00');
INSERT INTO `posts` (`id`, `id_user`, `id_breakdown_category`, `images`, `cover_image`, `is_solved`, `title`, `content`, `budget`, `city`, `postal_code`, `lat`, `lng`, `created_at`, `updated_at`) VALUES
(72, 98, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 71', 'Aut dignissimos ullam voluptatem accusamus consectetur illo. Nihil ea dignissimos fugit accusamus consequatur. Dolores commodi reprehenderit eos ea aut fugit nisi. Autem dolore sit quidem.', 893, 'East Rosieborough', '43849-0619', -25.73659, 56.507336, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(73, 85, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 72', 'Minima aut quae provident voluptatibus nam esse dicta. Unde quo non fuga ducimus. Et itaque doloremque rerum. Quia id ea maiores placeat. Quos debitis veniam veritatis qui. Sed dolor ut sit.', 303, 'North Eliashaven', '76418', -9.981682, -78.745805, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(74, 49, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 73', 'Sequi non totam libero sint. Ex repellendus sapiente mollitia sed placeat et molestiae. Perspiciatis illum assumenda quidem quidem qui sint.', 69, 'Thompsontown', '19682', -34.860156, -172.9689, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(75, 17, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 74', 'Quae est quod est iste quibusdam autem. Et dolorum adipisci sit praesentium atque sed. Corporis maiores voluptas at eos quia et. Eum rem accusantium vel.', 181, 'Fritschstad', '53045-3976', 52.609879, -173.776203, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(76, 41, 2, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 75', 'Ipsam rerum ullam vel. Hic quis inventore molestiae ullam. Quam ut et ut repellendus saepe. Nemo eum enim ullam blanditiis consectetur.', 688, 'Germainestad', '47406', -30.054362, -157.292637, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(77, 62, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 76', 'Expedita voluptas sit voluptatem. Itaque hic accusantium repudiandae magni distinctio. Quisquam fugit aliquid aliquid sit iure. Rerum qui quam reiciendis quo. Ea velit consectetur enim.', 533, 'Mertzfurt', '29982-0064', 16.397992, -120.075096, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(78, 82, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 77', 'Soluta nobis et iusto odit magni. Consequatur atque voluptatum est alias aspernatur qui reprehenderit. Quis quia corrupti voluptates sit aut.', 570, 'Murphyshire', '28900-3038', -44.192619, -158.470134, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(79, 82, 11, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 78', 'Tenetur et veniam ratione commodi. Provident sint deserunt ut vitae amet accusantium. Aliquid repellat ut in. Fuga ea aliquam cum eum.', 803, 'South Danny', '54881', 36.002469, 3.177082, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(80, 47, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 79', 'Asperiores aut qui non illum corrupti repellat quaerat. Alias autem omnis reprehenderit earum ea et nesciunt. Sed exercitationem aut amet nemo.', 316, 'South Chelsea', '67392', -44.77941, -90.119268, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(81, 69, 6, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 80', 'Occaecati est qui a ullam nesciunt sint. Iure ea architecto maiores officiis. Facere reprehenderit quo impedit corrupti architecto et.', 664, 'McLaughlintown', '11901-7704', 27.758016, 106.993733, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(82, 26, 0, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 81', 'Quidem ducimus aut maxime cum necessitatibus porro tenetur. Molestiae quo incidunt corporis quam nemo aut dolorum. Corporis praesentium labore architecto sit aut. Alias et quo aut et molestiae.', 194, 'Martinamouth', '33198', 65.166495, 151.14394, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(83, 62, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 82', 'Magni culpa a sint ad et architecto officia. Fugiat vel voluptas eveniet est quibusdam ratione id. Eligendi assumenda maiores est at id. Aliquid enim sapiente quia ullam omnis.', 403, 'Michaleshire', '78397-2044', 67.838032, 59.601827, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(84, 10, 15, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 83', 'Blanditiis ipsam autem esse similique. Quod ad sit ut et. Ut consequatur assumenda qui in possimus et.', 353, 'North Macy', '05631-3328', -45.164424, -172.251476, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(85, 70, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 84', 'Illum non qui quo. In itaque laborum sapiente libero maiores. Esse nihil placeat quia aut. Delectus illo nisi vel dolore reiciendis a. Et sed error incidunt. Aliquam dolorem dolorum facilis dolor.', 274, 'New Lula', '73753-6208', -65.336407, -40.591476, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(86, 99, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 85', 'Officiis atque est dolorum rerum expedita repellendus ducimus suscipit. Ut sed possimus fuga et saepe dolor ipsum dolore.', 752, 'Schusterfurt', '56526', 88.795557, -139.171063, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(87, 1, 13, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 86', 'Distinctio ipsam odio enim rerum ad. Praesentium facilis deleniti qui totam. Voluptatum incidunt qui sit maiores.', 762, 'Sunnyview', '17805', -38.727431, 156.436623, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(88, 47, 1, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 87', 'Minus occaecati quam dolores quibusdam. Qui odit qui esse. Ipsam nisi quos earum dicta.', 947, 'Port Marcelfurt', '96518-8811', 33.213319, -11.012716, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(89, 99, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 88', 'Accusantium magnam quo sunt ad hic ab et. Nostrum odio dignissimos atque voluptate doloremque. Quos iste et aut est modi fugiat. Deserunt quia ab et ea sunt delectus ea.', 183, 'Lake Adolphus', '54886', 85.175602, -2.295253, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(90, 24, 3, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 89', 'Similique sunt ipsum eligendi aut est quia. Enim et expedita nihil delectus eveniet voluptate fugiat. Quis et vel qui eaque. Voluptatem molestias asperiores eos autem corporis.', 621, 'Twilaside', '96736-1101', 17.816593, 71.777624, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(91, 47, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 90', 'Et ipsa ducimus illo officia accusantium nemo. Omnis ipsa commodi ut voluptate aut atque. Delectus enim molestiae totam assumenda.', 405, 'Elsastad', '00924', 57.799912, 101.934253, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(92, 78, 14, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 91', 'Eveniet expedita ea sint eaque facilis odio. Vitae nihil aut ipsum tenetur cumque sit magni. Assumenda doloribus mollitia consectetur voluptas ut voluptas maiores quas.', 668, 'Nyasiaport', '63491-3788', 13.575803, -175.064554, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(93, 22, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 92', 'Eos voluptatem velit sunt alias. Ad aut dolorum ab aut molestias est. Numquam id ut in occaecati voluptates sit officia.', 41, 'Hellenside', '81427-9096', -44.324498, 126.849144, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(94, 92, 8, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 93', 'Possimus corrupti non et a. Modi quis voluptatum quo est modi architecto rem. Numquam autem ullam animi est sed et. Perferendis in occaecati libero quia distinctio.', 901, 'Orloborough', '98905', -25.99775, -171.117973, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(95, 65, 5, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/821652/pexels-photo-821652.jpeg', 0, 'Super titre 94', 'Repellat quibusdam et repellat veniam. Quo quia voluptatibus modi magnam pariatur illo. Rerum voluptatibus ipsum aut officiis possimus tempora.', 970, 'Jenniferborough', '10047', -50.614399, -153.154, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(96, 30, 22, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 95', 'Necessitatibus similique voluptatibus rem corrupti neque id. Qui libero nemo officiis aut. Debitis neque dolorem ea aut ducimus qui iusto.', 121, 'Lake Ricky', '96581', 18.947415, 4.145771, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(97, 86, 10, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 96', 'Deserunt quas nisi amet maxime laborum. Facere itaque necessitatibus voluptas sed ut sunt facere. Accusantium ducimus nostrum porro est numquam. In qui iure omnis repudiandae quo assumenda mollitia.', 215, 'Lake Loy', '17512', 74.779441, 119.653172, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(98, 49, 4, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/5053740/pexels-photo-5053740.jpeg', 0, 'Super titre 97', 'Assumenda ut rerum perspiciatis. Totam ut accusamus non aut. Quo quas sequi ipsa. Aperiam dolore autem sequi ut perspiciatis. In suscipit ab neque tempora rerum cumque corrupti.', 522, 'Diegoborough', '61340', -38.698925, -92.849339, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(99, 59, 16, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/719399/pexels-photo-719399.jpeg', 0, 'Super titre 98', 'Doloribus tempora vel saepe est consequatur vitae. Omnis et quia consequatur consequuntur nesciunt. Ratione illum minima quia veritatis rerum. Blanditiis fugiat vel asperiores.', 579, 'O\'Reillyton', '83748-9994', 29.556591, -78.542543, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(100, 31, 18, '[\"https:\\/\\/images.pexels.com\\/photos\\/821652\\/pexels-photo-821652.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/1388947\\/technology-telephone-mobile-smart-1388947.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/719399\\/pexels-photo-719399.jpeg\",\"https:\\/\\/images.pexels.com\\/photos\\/5053740\\/pexels-photo-5053740.jpeg\"]', 'https://images.pexels.com/photos/1388947/technology-telephone-mobile-smart-1388947.jpeg', 0, 'Super titre 99', 'Itaque consectetur voluptatem eos sequi ullam maxime. Error non culpa dolorum provident incidunt. Delectus voluptatem ipsum voluptates nesciunt totam.', 440, 'East Gideonport', '60746-8086', -31.369564, -147.289802, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(101, 101, 7, '[\"\\/tynkle\\/app\\/public\\/uploads\\/1613139581-pexels-oleg-magni-2764678.jpg\"]', '/tynkle/app/public/uploads/1613139581-pexels-oleg-magni-2764678.jpg', 0, 'Ecran cassé smarthphone', 'Mon écran de mon Samsung galaxy S3 est cassé quelqu\'un pour le changer ? \r\nMerci.', 25, 'Vauvenargues', '13126', 43.5670696, 5.6142558, '2021-02-12 15:19:41', '0000-00-00 00:00:00'),
(102, 101, 1, '[\"\\/tynkle\\/app\\/public\\/uploads\\/1613139754-pexels-oleg-magni-2764678.jpg\"]', '/tynkle/app/public/uploads/1613139754-pexels-oleg-magni-2764678.jpg', 0, 'Achat RAM pc portable 8GO', 'Achete RAM pc portable 8GO.\r\nMe contacter.', 100, 'Paris', '75001', 48.8640493, 2.3310526, '2021-02-12 15:22:34', '0000-00-00 00:00:00');

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
(1, 'Formattage/redémarrage', 1, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(2, 'Installation Système exploitation', 1, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(3, 'Changement de pièce', 1, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(5, 'Installation périphérique', 2, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(6, 'Assemblage ordinateur', 2, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(8, 'Installation logiciel', 3, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(9, 'Cours/Aide à l\'utilisation', 4, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(10, 'Apple iOS', 5, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(11, 'Android', 5, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(12, 'Windows Phone', 5, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(22, 'Installation box', 9, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(23, 'Configuration réseau', 10, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(26, 'Installation (gros/petit)', 13, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(27, 'Réparation/Entretien petit', 14, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(28, 'Réparation/Entretien gros', 15, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(29, 'Réparation', 16, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(30, 'Changer le stockage', 16, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(37, 'Installation/Configuration TV', 20, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(38, 'Réparation TV', 20, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(39, 'Installation audio/vidéo', 21, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(40, 'Configuration audio/vidéo', 21, '2021-02-12 15:16:50', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
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
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `avatar`, `username`, `firstname`, `lastname`, `birthdate`, `email`, `adress`, `city`, `postal_code`, `phone_number`, `password`, `lat`, `lon`, `is_helper`, `is_admin`, `created_at`, `updated_at`) VALUES
(1, NULL, 'kenyon08', 'Schinner', 'Korey', '1975-06-20', 'darby95@yahoo.com', '9339 Collins Station Apt. 793\nHahnland, NE 69594', NULL, NULL, '1-778-844-8941 x0229', '$2y$10$pvKrE//D9lUwPIfwa.WqGugSOwO0rBQN.cdutl9fp7r5rS9FbrQ5i', NULL, NULL, 0, 0, '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(2, NULL, 'laisha.green', 'Stiedemann', 'Sydnie', '1979-05-01', 'rprohaska@hotmail.com', '23318 Jazmyn Common Apt. 312\nPort Faye, HI 98613', NULL, NULL, '1-446-591-2130 x649', '$2y$10$gGYAMpHNtA/s2wNSGXP4WOcxOxtogoO6BrvGgHh.84ixQ5Ln77HgC', NULL, NULL, 0, 0, '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(3, NULL, 'hmarvin', 'O\'Kon', 'Zoie', '1982-01-04', 'robin.bahringer@harber.com', '43950 Bertram Trail\nOkunevashire, RI 83054', NULL, NULL, '(728) 522-3569 x923', '$2y$10$RqFY1QM/XI/TLn6Zg3Plx.A22LLEWScGBK4QewvbRMVomJR2MytIS', NULL, NULL, 0, 0, '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(4, NULL, 'robel.kiana', 'Fadel', 'Lawrence', '1992-04-20', 'chandler.adams@gottlieb.com', '7749 Hill Lock Suite 328\nEast Annabelfurt, IN 69265', NULL, NULL, '+1 (290) 948-2679', '$2y$10$cyC5/nVvQxmrL/OcXxASYePlx.Uh3GKnLgvzAtbVAud3vUA9RuRp.', NULL, NULL, 0, 0, '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(5, NULL, 'loma86', 'Wyman', 'Maurine', '1993-12-25', 'ymurray@hotmail.com', '855 Lila Wall\nBergstromshire, SC 48739', NULL, NULL, '921.252.5657 x058', '$2y$10$QmE5Bwz65Lod4U43mNcv0uqIpzZwU0.1kg4BD6MjgNKrKJQbkSxsO', NULL, NULL, 0, 0, '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(6, NULL, 'bailey.haven', 'Hilpert', 'Brant', '2006-08-02', 'aufderhar.evie@brekke.com', '6738 Ova Parkways Apt. 228\nJeniferland, TN 81120', NULL, NULL, '394-448-9534 x7625', '$2y$10$AyxZIcPwbJ6op60j03sU8uyZeC0N1aayzVEPdwX0mH/LiM8.Jogyi', NULL, NULL, 0, 0, '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(7, NULL, 'yratke', 'Nikolaus', 'Ruth', '2020-11-14', 'skiles.icie@rutherford.com', '901 Stracke Fords Apt. 334\nMarksfurt, NJ 47415-6897', NULL, NULL, '770-432-4155 x930', '$2y$10$OZCXQEsDZn0SNld9EZgMyO2WNc4a7EAI82KwfQALvsTia.Tmv6BXq', NULL, NULL, 0, 0, '2021-02-12 15:16:43', '0000-00-00 00:00:00'),
(8, NULL, 'bshanahan', 'Vandervort', 'Dakota', '1993-12-20', 'rodrick.labadie@yahoo.com', '94996 Cody Plains\nPort Adrienneside, SC 46586', NULL, NULL, '651-448-0476 x271', '$2y$10$.qabyuV9ZUqRnEN9dPOZGOQhWwl6fCXhkUceEohdrVTaFrtwJscTi', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(9, NULL, 'breichel', 'Schneider', 'Carrie', '2013-06-24', 'evangeline.rice@yahoo.com', '681 Walter Inlet Apt. 029\nWalshfurt, NC 90389-1837', NULL, NULL, '1-687-291-6634', '$2y$10$LPP8GoczjoNaEmeWL2b7g.x5g0936Tfel5tbylW7Zw3kCZlhrWVo.', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(10, NULL, 'vdibbert', 'Yost', 'Mckenna', '1988-06-22', 'zdietrich@yahoo.com', '80437 Rosenbaum Meadows Apt. 850\nTurcotteburgh, MS 11733', NULL, NULL, '(240) 915-1406 x35998', '$2y$10$QvniIPA7ZsaDkZjtu2SA7e9Fv3YcpP2RUm6QJgizdgApM84SAGluS', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(11, NULL, 'shanny40', 'Beier', 'Roman', '2009-04-26', 'irving43@gmail.com', '351 Chanelle Divide\nGoldaville, DC 83644-5497', NULL, NULL, '1-828-895-4367 x619', '$2y$10$F/gsoJepsUbGG5JpFmRUt.tq0hKggkFC.JAdLJU79wcuAMC808QB6', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(12, NULL, 'czulauf', 'Kunde', 'Shane', '1993-08-26', 'nader.evan@yahoo.com', '7181 Zaria Drive Apt. 503\nLorafurt, NC 62593-5363', NULL, NULL, '1-872-556-3212', '$2y$10$G6/xVsRyGs6L8zriJRqHZ.hjMYLOPUWzvfhSMi6/JHRg8rsyw.6su', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(13, NULL, 'muhammad34', 'Lowe', 'Jamir', '2020-07-01', 'emmanuelle87@schumm.info', '197 Monahan Turnpike Suite 158\nLizafurt, MN 82511', NULL, NULL, '856.394.8536', '$2y$10$WnZw/aa9hBG7doDjGuAOreMSz4mmWGYNGzZxj0P8dctfJwmRdsWSu', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(14, NULL, 'strosin.blanca', 'Gorczany', 'Pamela', '2002-04-17', 'lschinner@gmail.com', '42216 Carter Throughway Apt. 519\nRhettstad, OK 93780', NULL, NULL, '513.662.7716 x80764', '$2y$10$QdmWppkyM5JcjWlQXMoSleGU/P1nQwD2cEq8f.NZxZZRpFVwm.bsy', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(15, NULL, 'elliott.mckenzie', 'Dicki', 'Laron', '1976-02-21', 'jerde.fritz@lemke.biz', '9746 Grant Branch\nWest Jodieborough, MO 02901', NULL, NULL, '1-797-592-6713', '$2y$10$wgaJuul5QrLjFLSDoDYQluDvW.bgTuC6PiR5bIMmCfxPZQV75zesK', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(16, NULL, 'katelyn.schoen', 'Altenwerth', 'Caitlyn', '2008-11-10', 'imosciski@kling.com', '72882 Orn Villages\nEast Annabelleville, MA 65968', NULL, NULL, '(807) 310-4208 x176', '$2y$10$NyXfG7QGyy6ic7duQPQUCeDfqfaXqZPoGS1is6JSSSBP1fOLlRzJe', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(17, NULL, 'gorczany.amaya', 'Purdy', 'Reed', '2014-12-24', 'nfarrell@yahoo.com', '298 Roberts Cliff Apt. 402\nSouth Kelsishire, AR 45245', NULL, NULL, '+1-846-964-8266', '$2y$10$vz2RKrOfFJBZ5oe0wz9RMOUZiyiubeYfN3XFfYf.YXdFXw7bPVonG', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(18, NULL, 'edythe.hauck', 'Crooks', 'Arianna', '1984-04-09', 'natalia.nienow@gmail.com', '60168 Geovanny Forest Apt. 227\nEast Juston, VA 54208-0832', NULL, NULL, '678-676-6457', '$2y$10$0y/jEaRG8snV/Ms7wv7wJ.W47fkd20kdLQhtkjWniqCn/EbtXzKZm', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(19, NULL, 'elyse.considine', 'Stark', 'Jewell', '2014-11-27', 'wisoky.alexandrea@rutherford.com', '143 Gerhold Inlet Apt. 603\nNorth Mckaylabury, CT 55902', NULL, NULL, '1-890-556-5692 x86490', '$2y$10$BthT98FkwU0IqBCeHaDXz.ar9t6tZvhbJsRuBGac9RnD/RLnAKuBW', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(20, NULL, 'amelia.windler', 'Eichmann', 'Amari', '1972-09-16', 'ansley00@white.com', '35643 Cremin Path Apt. 395\nPasqualeborough, NH 44302-1636', NULL, NULL, '1-301-213-7684', '$2y$10$UykMdsSqZ.RqFxbijCIuFOHRUuRlCvipo69KwCI0cLBe5WTGT76M.', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(21, NULL, 'lance.kohler', 'Hagenes', 'Wilmer', '2008-03-03', 'domenick89@streich.biz', '93809 Tremblay Cliffs Suite 863\nPort Lazaroton, NV 58182', NULL, NULL, '681.667.4515', '$2y$10$vMUIHM5ItnZ4iIC.zIP7x.Obcq8t00RvUA1KFpHSxi6w.TLA365IW', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(22, NULL, 'mueller.haleigh', 'Altenwerth', 'Leonardo', '1978-08-15', 'mertz.myron@gmail.com', '121 Wisoky Cape Apt. 846\nNorth Benjaminstad, NY 81016-9347', NULL, NULL, '363-494-9949', '$2y$10$fQs7njsV1OyBqgRzMnASFexldRVMgl.m/4pmqBZpUJnp0ZYuh1IVS', NULL, NULL, 0, 0, '2021-02-12 15:16:44', '0000-00-00 00:00:00'),
(23, NULL, 'thalia.bradtke', 'Klocko', 'Cora', '1973-11-23', 'kirsten.larson@hotmail.com', '36750 O\'Keefe Manors\nDelaneyhaven, KY 60409-7245', NULL, NULL, '1-746-917-1484 x6995', '$2y$10$Xs/jR5QMBUY66F21U.NmWefqL35OkZsEBhRD.8Dv4m.hwX1zbhr6a', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(24, NULL, 'davin92', 'Murazik', 'Aric', '1982-12-22', 'jewell84@dooley.info', '3144 Turcotte Islands Suite 499\nPort Carolineborough, OR 79950-9700', NULL, NULL, '217-848-4368 x899', '$2y$10$Id/n9d2ZNY9wqeH7tnQUSeJpnHvvXLIov2uQ75DNYsjIg0.Y14G.q', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(25, NULL, 'hope.murazik', 'Leuschke', 'Lorna', '1983-04-03', 'beatty.hans@gmail.com', '25294 Samson Pike Suite 699\nLake Ahmadtown, CA 88483', NULL, NULL, '283.657.2484 x56664', '$2y$10$47ukFnrSAFbLWLJynfZjqe/5NViCTgV0Z75/383BHlGAc4xe.VYvi', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(26, NULL, 'casimer14', 'Strosin', 'Earline', '2002-08-15', 'purdy.malinda@spinka.org', '9025 Twila Terrace\nNorth Toney, AR 92080-7802', NULL, NULL, '(309) 819-3224 x19620', '$2y$10$sW6MljP0XzF/yOi2BwrHI.4E7.GeDCLBH1TNVall5flicuxd5xUnW', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(27, NULL, 'pdamore', 'Maggio', 'Lelah', '2020-10-30', 'adooley@tillman.org', '9552 Carlotta Loaf\nStrosinland, WY 82626', NULL, NULL, '326-742-5785 x5324', '$2y$10$TCWBt51EXLui0yRZLR3nDORu.UtA0dweFctqBuXQsCa1GZJ4OgDuS', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(28, NULL, 'ucarter', 'Gottlieb', 'Samanta', '1992-03-22', 'woodrow60@hotmail.com', '4432 Reba Loaf Apt. 810\nAbshirechester, CT 35277', NULL, NULL, '1-798-274-0737 x032', '$2y$10$c7oBEH9UH0ovNErDEzOHz.G58DcCMsbZOP6/rtPpysV9jGjDN0h8i', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(29, NULL, 'peggie.weissnat', 'Gutmann', 'Jamarcus', '2011-05-21', 'zlarkin@hotmail.com', '966 Sarai Trafficway Suite 281\nWest Rivershire, IA 90581-6637', NULL, NULL, '867.400.9047 x278', '$2y$10$RD.UOTu5M07buyP0ATtG3OQU/0QAO1WA0iS27YS5N5RFJ0TU4SVAy', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(30, NULL, 'feil.annabelle', 'Farrell', 'Delphia', '1984-04-05', 'schuppe.wilfrid@gmail.com', '75521 Zena Knolls Suite 675\nNew Patienceton, PA 05439-8720', NULL, NULL, '649.203.9299', '$2y$10$d5ZGujmypNFpOd4iJbALwuuTMKe5479qC0gnwCNxhVjsgLnAiXBom', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(31, NULL, 'baron.cole', 'O\'Reilly', 'Pamela', '1990-12-14', 'lucius96@shanahan.com', '835 Prince Locks Apt. 006\nWest Mia, DC 86641', NULL, NULL, '(212) 393-8061 x9387', '$2y$10$.PsPWMtSLzg0T5cuF1bJauFSsAbyVWmMbBOX1kPPgbXr6kxM50T.6', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(32, NULL, 'kuhlman.graham', 'Sauer', 'Araceli', '2010-08-28', 'tmurazik@ritchie.biz', '284 Lora Lane Suite 327\nBoehmfurt, AL 43250', NULL, NULL, '986.399.5972 x006', '$2y$10$X7G4UBk2Po8gSkisYTcVK.3WlSB74hB4ChRCfQZ/BF6KDnNB4bs9q', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(33, NULL, 'annamae.cronin', 'Kihn', 'Matilde', '1999-03-19', 'simonis.rico@larson.com', '17865 Crona Prairie Suite 529\nJonesborough, KS 74062', NULL, NULL, '+1-945-212-7544', '$2y$10$GmOBiEualY3BRAS.WnALZe6SI5ENFUWU9Ocd87ciqghORFn8YlSHO', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(34, NULL, 'waters.leon', 'Hane', 'Albertha', '2008-05-23', 'vgraham@gmail.com', '830 Upton Court\nMarysefurt, GA 15790', NULL, NULL, '+1-834-355-2309', '$2y$10$GvG2yznyiPQtORzHcUPXluEKvGXwZmN.9tnaLh.Wdz/2vtxUMNxYK', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(35, NULL, 'qoconnell', 'Bahringer', 'Weston', '1988-07-08', 'bettie.hoeger@gmail.com', '34551 Freida Turnpike\nNew Alva, UT 21933-8001', NULL, NULL, '1-731-479-6533 x627', '$2y$10$bbE4STjcDc9uTXvlQVR.eOGIqi7C1pPPTl7bVxT/0ChabRcuvgTzC', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(36, NULL, 'stanton.christ', 'Effertz', 'Annamarie', '1977-07-03', 'lempi.parisian@yahoo.com', '6051 Buckridge Parkway\nElinorebury, GA 36977', NULL, NULL, '661.675.7097 x9681', '$2y$10$iVB5N8B.zltUNkAjRXYHqORSoV46xvmXFA0cn8yrVJanUGr91rR5y', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(37, NULL, 'jacques37', 'Kshlerin', 'Leland', '1982-07-21', 'stella33@hotmail.com', '76056 Royal Fort\nRivershire, HI 93330', NULL, NULL, '313-694-3231 x2654', '$2y$10$2dW3RTqLtRBnjzyHrNi4DOznvGHCqESPEfgZWkibGUDA1dF5dazsy', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(38, NULL, 'aterry', 'Pacocha', 'Marlon', '2009-01-04', 'doreilly@gmail.com', '1411 Darian Ranch\nJaskolskifurt, OH 36406-1797', NULL, NULL, '1-837-271-9995 x6822', '$2y$10$aVtZ4EbW1BuSmlcA5mXAvO/sWuV0mGqivZd6/4BJn9.VQ7oHn5fiK', NULL, NULL, 0, 0, '2021-02-12 15:16:45', '0000-00-00 00:00:00'),
(39, NULL, 'leonora.fritsch', 'Schiller', 'Oswald', '1998-07-20', 'yundt.king@hotmail.com', '987 Kertzmann Station Apt. 917\nRosenbaummouth, LA 44680', NULL, NULL, '435-883-0905', '$2y$10$/qgx4BWJ4r2ia0oe2B2/keuFmsgpUpwBX7XTIvm.1jmtpAppTypRK', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(40, NULL, 'fpacocha', 'Davis', 'Elyssa', '1971-02-02', 'tremblay.rosetta@kertzmann.biz', '5616 Beier Ports\nWest Sophiamouth, MO 64817', NULL, NULL, '1-503-892-0653', '$2y$10$pA3S8kCaFQZXQn9MSlb.9ukTTcNUvQatMDXNIeDRBuidVrRzjYHlq', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(41, NULL, 'trystan.kunze', 'Predovic', 'Shad', '1994-09-11', 'nikolaus.kenny@wunsch.com', '45472 Abigale Loaf Apt. 222\nNew Alvera, WI 61871', NULL, NULL, '317-436-5903 x765', '$2y$10$7VWJvxxcNvrOqS/N1opKFOVck.eZMLv0nzruevnsdXpMezw0qymG6', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(42, NULL, 'mertie80', 'Marks', 'Clemens', '1970-06-03', 'odessa06@hettinger.biz', '9455 Bechtelar Corner Apt. 513\nPort Tristonport, IN 64223-4257', NULL, NULL, '494.713.3713 x8708', '$2y$10$iN3YP3esYoScnPP00Sar3uHCgcnbDwZO8NRsU0sVPnhQL/2mQHnum', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(43, NULL, 'vince56', 'Raynor', 'Robb', '2008-05-06', 'ocie09@oberbrunner.com', '47534 Beryl Way\nWest Otismouth, AZ 33290', NULL, NULL, '1-262-601-4259 x0823', '$2y$10$oSHvL0JqPWFZ99Er7Z9SA.NrzmUAJqbKhGWufObUGaBIqf47jiJrC', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(44, NULL, 'thaddeus05', 'Gottlieb', 'Gail', '2002-07-03', 'jacobi.robbie@schuster.org', '408 Jakubowski Mall Apt. 148\nHegmannburgh, WA 42635', NULL, NULL, '(515) 614-8922', '$2y$10$DRIrDpImFmljIrc/h/9SKONRIGVg7da8HKP/XKwAEx29kkZfcyA1O', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(45, NULL, 'mkunde', 'Donnelly', 'Maxine', '1997-07-08', 'carroll.reanna@gmail.com', '912 Rhiannon Hills\nLake Louisatown, NV 66548', NULL, NULL, '1-763-864-7907 x68764', '$2y$10$CwvnyOKIObzM5jE5BzKAz.rJEsZd6MzbLdE./Bgd6cVSkA1JzyHTC', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(46, NULL, 'kira.ryan', 'Wuckert', 'Tyson', '2016-10-23', 'adolf.haley@gmail.com', '11128 Isabella Stream\nSouth Mina, PA 19054-9446', NULL, NULL, '+1 (346) 632-3446', '$2y$10$Z38JRIloduPzCyRZAhaFzuhwdoua8nQzErSi7GE.AdYbgd3wlBU.a', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(47, NULL, 'lesley.conn', 'Homenick', 'Freida', '2018-02-28', 'stevie43@yahoo.com', '2531 Kessler Drive\nNew Kiarraport, SD 86718', NULL, NULL, '726.302.7218', '$2y$10$vFZa6pRxOWHKotw.t.Fs5.QKNyl8blVrO30fsHoHb1N0VJNqWQyy2', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(48, NULL, 'edgardo38', 'Ward', 'Kale', '1985-11-20', 'clementine22@kreiger.com', '6034 Baumbach Fall Suite 589\nSouth Nicholas, NC 86736', NULL, NULL, '1-620-694-6301', '$2y$10$RC/JtJzXrYk/SphnCVvZfOTwoKfj/hLHwpstSNOMkrrHVdfoWn7NS', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(49, NULL, 'ucrist', 'Jacobs', 'Elenora', '1993-04-06', 'stamm.sonny@fay.net', '20065 Smitham Oval\nNew Kaciton, NY 66584-9526', NULL, NULL, '951.280.6833', '$2y$10$o8Bz2KzSkK9kbqc7o7NHCep2HetY7TE.7WyYCrUQb8aFMEQIHOtVa', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(50, NULL, 'tarmstrong', 'Bernhard', 'Holden', '2013-03-20', 'ashleigh29@hotmail.com', '34570 Gusikowski Crest\nLake Elishaburgh, HI 57973', NULL, NULL, '(463) 693-2219 x893', '$2y$10$/rPqI109gGaJZUzOO/BfgeaS5V.kI/lLz7cPx9h/Uyv/TgkQV9M4m', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(51, NULL, 'patience.eichmann', 'Jacobson', 'Aida', '1996-07-15', 'maureen12@vandervort.com', '985 Rodriguez Crest Apt. 048\nGiovanihaven, PA 30353-7964', NULL, NULL, '817-485-0685', '$2y$10$AbT3sX62a5DSNNkKEHCUHeryKccbwkO673Jb6hYH8eqGhmCB/CRGW', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(52, NULL, 'axel77', 'Okuneva', 'Theron', '1994-10-14', 'cbuckridge@wunsch.com', '628 McCullough Curve Suite 850\nLake Corinebury, RI 87152-9786', NULL, NULL, '272.936.4188', '$2y$10$CYlaaNmlx26EDsiTKuqG0ufBu3zt7fAJPlNPtSncEK5mTSpmwb/Tq', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(53, NULL, 'hauck.austin', 'Frami', 'Monserrate', '2015-01-29', 'ufeeney@graham.info', '42618 Jalen Forge\nPagacfurt, OK 40300', NULL, NULL, '1-920-870-3911', '$2y$10$k1wlVlhLLJ7Ob34OlEFc4.fnLZ3Ie9Y0nNxfGd8n5KcIrGaWG1PwK', NULL, NULL, 0, 0, '2021-02-12 15:16:46', '0000-00-00 00:00:00'),
(54, NULL, 'turcotte.monique', 'Greenholt', 'Jennings', '1992-04-08', 'yvette15@hotmail.com', '583 Winfield Place\nJarretborough, VT 34416', NULL, NULL, '1-804-284-3348 x255', '$2y$10$bMLzdsb9SsqfnfpIJgsSvutKFYbV142Hd9GQ6LHISiAwSpy2GU9tu', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(55, NULL, 'smitham.laverna', 'Morar', 'Wyatt', '1977-09-23', 'spfannerstill@hotmail.com', '2804 Hoeger Heights\nSouth Oleta, TX 37887-3208', NULL, NULL, '(318) 350-6303 x1360', '$2y$10$zBvXzK1WgPawixBRTEDsz.2DoOcPK0xva0u0XLPTSjupZx.3122ci', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(56, NULL, 'laurence.weimann', 'Hyatt', 'Leonora', '1981-12-17', 'gregorio18@lockman.com', '36336 Lakin Union\nJonestown, FL 91021-7792', NULL, NULL, '+1.326.392.4011', '$2y$10$bo5hqiJh.Ze1T0CE59PnfONd6pYwJeqoVPJMeneWkprTaJU5j5POS', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(57, NULL, 'carson67', 'Marks', 'Brooke', '1987-04-29', 'beverly29@douglas.com', '75684 Wisoky Ford Suite 153\nNew Clairfort, PA 88321-1148', NULL, NULL, '727-436-9383 x4725', '$2y$10$RIzZKLwmRO.h9eT5OnpmFetAZOTbLZz8jEFPd.aB9w9NDV/bsQ8ca', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(58, NULL, 'ckris', 'Turcotte', 'Keven', '2013-10-16', 'dorn@romaguera.com', '2391 McDermott Parks\nDenahaven, UT 30072-3031', NULL, NULL, '964-794-1024 x150', '$2y$10$nMi5s9RIXUCwB39YRqer3OplrLJJeZocHBWzUumhvFHzWVPseLssW', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(59, NULL, 'rgislason', 'Rogahn', 'Mack', '1974-11-06', 'yturcotte@gmail.com', '59029 Steve Stravenue Suite 520\nWest Elizabethtown, AL 40226-1745', NULL, NULL, '1-239-938-6643', '$2y$10$sPofwRdIPMIWvjPRp/4tGehw31VUhcg/cI4.N21OcEO4NgMVm4cyu', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(60, NULL, 'peggie49', 'Lakin', 'Cristina', '1981-11-11', 'kaylin27@prohaska.com', '218 Deanna Stravenue Apt. 197\nFionamouth, MI 70389', NULL, NULL, '(957) 610-2494 x90335', '$2y$10$xez1PDInpAz0gIaG1KRoHOeBf/AXe3LznSc0tlKnZvPRFN/rezhUe', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(61, NULL, 'zvon', 'Boehm', 'Conor', '1977-02-11', 'rae.casper@yahoo.com', '6014 Kuhn Junction\nKaitlinfort, CT 30906', NULL, NULL, '1-914-720-6821', '$2y$10$VH5dlzfNFfYyt97CxCHLU.lLUY3UZXj3IlkoXQ.Aa3gJK3Dn3tq/y', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(62, NULL, 'ezekiel36', 'Jacobson', 'Shaina', '2005-11-17', 'vanessa.okon@gmail.com', '6736 Wiza Freeway\nOrenmouth, AZ 22499-2070', NULL, NULL, '+13618415508', '$2y$10$Qq.Aat27A5HtqcTkxnVKBuaGAPPq.Cdxxy0c0iWSabzm4vg/KmLcm', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(63, NULL, 'romaguera.mariam', 'Krajcik', 'Lura', '2003-05-13', 'vickie57@yahoo.com', '976 Meggie Common Suite 511\nJaskolskiville, WI 04374', NULL, NULL, '1-802-207-8974 x557', '$2y$10$Yar3ii0xa8Ea.vARuj0Yh.ajhmCDSfVI7X6VRJ/HveG5b2LglbCH2', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(64, NULL, 'vrunte', 'Bernhard', 'Emmalee', '2003-11-24', 'gislason.mustafa@gmail.com', '57637 Danielle Harbor Apt. 996\nNorth Kaela, MO 03767', NULL, NULL, '653.591.2279 x0983', '$2y$10$ctVAQosol0kfY0bjN7mPM.prz/yRjeGIEEdEjzZ5tBii4vSV.Cevu', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(65, NULL, 'hailey50', 'Luettgen', 'Marta', '2008-03-21', 'alaina62@gmail.com', '92198 Lueilwitz Junction Suite 898\nNew Sarai, OK 53304', NULL, NULL, '969.855.1790', '$2y$10$FrAZCfOG5/QeqhzTbE6O6uWetRwkV1wq1gTDpQP7Gd64JGnmZZvL6', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(66, NULL, 'yschoen', 'Sanford', 'Callie', '2011-06-26', 'norwood69@gmail.com', '3115 Hermann Ridges Suite 676\nEast Isadore, DE 98268-6253', NULL, NULL, '(617) 483-6020 x44106', '$2y$10$N73eMSgte8xpRTS8cmrRc.CQCtXOkREdnbK.xfMKG.rGuR250BJZK', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(67, NULL, 'bashirian.heloise', 'Littel', 'Darrell', '2018-03-21', 'koepp.zelda@yahoo.com', '59567 Schaefer Glens\nNorth Mia, NC 59708', NULL, NULL, '(995) 793-8103 x214', '$2y$10$g0U5Jt6bl5KjObtNing2eOkC29yjcLaUoBXvyw7R8ZNAzxOX0wCpC', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(68, NULL, 'hattie.reynolds', 'Mante', 'Marcelle', '2003-12-26', 'trudie75@king.info', '36112 Mann Gardens\nFaymouth, ME 35940-9702', NULL, NULL, '(690) 987-9429 x0319', '$2y$10$mRHvvKynGBdjGSs6bIBabeh0lgL2v46pC8y4/Cq1Np0cwIbD29uLO', NULL, NULL, 0, 0, '2021-02-12 15:16:47', '0000-00-00 00:00:00'),
(69, NULL, 'justina.gutkowski', 'Heidenreich', 'Theodora', '2013-11-16', 'dquigley@roberts.com', '8671 Clyde Ports\nAbelview, DE 97429', NULL, NULL, '+1-682-871-8804', '$2y$10$4rs5dcM10AAnk3AjJCgPI.j709VmQCHIOJkeJkApdLSksPRzJ6Bz.', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(70, NULL, 'nienow.irving', 'Borer', 'Eloise', '1983-01-22', 'neal72@gerhold.com', '7745 Kaleb Bridge Suite 319\nLeschland, NY 34105-7303', NULL, NULL, '382-839-7719 x3939', '$2y$10$bW6y19B.VP3Dv.km.McBMuptpKffVqug4keJ3cCBq/B.Zdl3WZyC6', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(71, NULL, 'hills.general', 'Herman', 'Angela', '1990-09-05', 'agustina40@hoppe.com', '620 Murphy Village Suite 562\nBellashire, WI 55018', NULL, NULL, '(492) 408-1905 x47104', '$2y$10$nVRxY0wDkPuAZYzTNuZbbe3xjaLr/JXMSsRaVlTculkDbczizz1wK', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(72, NULL, 'dietrich.duane', 'Wilkinson', 'Lily', '1981-04-09', 'doyle62@moen.com', '67420 O\'Kon Branch\nRosenbaumview, FL 57919-3353', NULL, NULL, '260.866.8703', '$2y$10$5fawJOainsgdAjSCfNlMleB1JXvqVYiVZNy2YmMAQfRGdeW6iWBSq', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(73, NULL, 'victoria68', 'Schimmel', 'Rodrick', '1977-05-18', 'harvey.napoleon@kuphal.com', '5981 Greenfelder Mountains\nEast Rogerport, DC 29309', NULL, NULL, '461-964-2384 x20944', '$2y$10$cojxhsccr/sjwewaiLmmuO9gEfPjaStS7a6fznpoAdLwYC/UUPm4O', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(74, NULL, 'ludwig.roberts', 'Lueilwitz', 'Janet', '1973-03-07', 'ydurgan@leffler.com', '91756 Herzog Track Apt. 561\nNorth Willis, DC 67450', NULL, NULL, '890.785.2836', '$2y$10$S8mG47h9Fbt7Z6//ZQV7aujwNqjKtSeGj1J848FGHkuN.Ok90kYqG', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(75, NULL, 'qzemlak', 'Herman', 'Raymundo', '1980-02-21', 'gcrooks@hotmail.com', '1422 Soledad Grove\nEast Sandrine, ND 78863-0341', NULL, NULL, '(261) 665-6603', '$2y$10$MwPUOxSWuGfCWcRy3YyYfOeUDAdJJyRhYtrfl3AMb74XvRVLUiyiC', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(76, NULL, 'fblick', 'Casper', 'Ova', '2013-08-16', 'frederique.goodwin@bosco.com', '5121 Heaney Highway\nPricefort, MN 01937', NULL, NULL, '1-959-246-7718 x468', '$2y$10$x9GzbJPHVJg2q86F1aFvuuPEfsP9xLyRPcs1X71KCitk6VatlKYva', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(77, NULL, 'connelly.kim', 'Gerhold', 'Mollie', '1985-01-30', 'hermiston.ambrose@hotmail.com', '469 Torp Summit\nWest Daryl, AR 95455', NULL, NULL, '+1-458-331-0231', '$2y$10$zjb0stXuZuPA1SZgcZhTSeaGCBzrFaDRbCqmGPKwoDUphAgE8Jt52', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(78, NULL, 'gerry.connelly', 'Christiansen', 'Elda', '1983-11-29', 'alena.reichel@yahoo.com', '14633 Hagenes Fort Suite 250\nEast Aidatown, MA 36737-7381', NULL, NULL, '+1-297-753-9612', '$2y$10$VttidMbB5G1tbNugxg0YWuibJi7IPVqiFURLg4DcKeZCcWiB/0bfG', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(79, NULL, 'balistreri.tatum', 'Paucek', 'Tressa', '1997-09-20', 'dario19@yahoo.com', '82893 Raynor Turnpike\nWittingmouth, NH 08378', NULL, NULL, '(672) 754-2131', '$2y$10$VbSFI.DdA85lGHiHbmDCDOZLhg0TD7M7FmYG/F7AGCbTOpSXIxVLm', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(80, NULL, 'marco43', 'Bins', 'Norene', '1984-05-27', 'coby.spencer@hotmail.com', '2237 Zulauf Green\nLake Antoniaborough, VT 08611-0511', NULL, NULL, '1-469-727-4656 x524', '$2y$10$Ajv.BUUWdHoQq0qrK5HDz.vLF0menGtpqKF.3mO8RdAcVjnkhCTY.', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(81, NULL, 'madelynn37', 'Quitzon', 'Carlee', '2009-05-01', 'brittany36@yahoo.com', '132 McGlynn Terrace\nNorth Devynmouth, TN 07556-3528', NULL, NULL, '523.990.5589', '$2y$10$3UKuf.6FQ4mNjRfCMLI6d.ShKcsZDD.aRvPbKCOFTKI5OVp.No7we', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(82, NULL, 'craig.mosciski', 'Abbott', 'Olen', '1990-10-30', 'rthompson@hotmail.com', '296 Johnson Fort\nMorissetteport, DE 85189', NULL, NULL, '+1-317-786-8207', '$2y$10$r0ec9tmFB.SklfYgeD4BJ.Bk9bBA5Z8VzMLvyVBLRrnbOSwCV.rG6', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(83, NULL, 'wframi', 'Schmidt', 'Arne', '1978-11-24', 'carlos81@green.org', '2662 Roy Rapids\nPort Barbara, ND 31132', NULL, NULL, '694.250.0554 x399', '$2y$10$vRLXRFbdumgU5qNEVwt2nu0jsKZgI0lzpIns2TMQXkmFfcwqaIUom', NULL, NULL, 0, 0, '2021-02-12 15:16:48', '0000-00-00 00:00:00'),
(84, NULL, 'kassulke.nico', 'Herman', 'Dawn', '1974-05-01', 'hammes.hollie@emmerich.com', '3626 Eloise Groves Apt. 577\nWest Tristinbury, MI 05411', NULL, NULL, '(868) 716-2373 x25399', '$2y$10$SYvuDztpxWXha3x0RZkgXOZV.IeVcXTYFW9u9XGFfM36yW6erZjU6', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(85, NULL, 'trystan56', 'Kerluke', 'Lurline', '1974-06-27', 'xthompson@hotmail.com', '774 Schaden Course\nLednerchester, NM 30395-5569', NULL, NULL, '748.919.5780 x17305', '$2y$10$DunyoH9HS46PjLX3RkD5pOauE.xx9C8htMg8GIR.ujsyX2iysaSLG', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(86, NULL, 'oma06', 'Daniel', 'Elbert', '2003-10-03', 'zakary07@hotmail.com', '90331 Reichel Mount\nJovanyview, AL 43714-0926', NULL, NULL, '806-732-6029', '$2y$10$1OwLvG9MURkTs0aSCRU/I.fXBXf1zb7M9h1o.1lsg4.33oiXsVURO', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(87, NULL, 'leonora07', 'Waters', 'Anais', '1990-06-22', 'roy.marquardt@nienow.org', '62676 Vivian Path\nPort Oma, ND 51882-7766', NULL, NULL, '(424) 890-5210', '$2y$10$IarCipRIZzdDE4GvhyoajuQGe2wlXaOyLM6izNEILuFngAf0fpb6y', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(88, NULL, 'tjacobi', 'Veum', 'Patsy', '1993-05-13', 'hester68@mann.biz', '117 Anya Crossing Apt. 092\nPriceborough, IL 52645-6210', NULL, NULL, '(459) 932-3616 x5455', '$2y$10$8/ZeKjnKJgBDdyxhCpxZru6iNkiUlyohtnDny/k0MAG/8f18O9qKa', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(89, NULL, 'kozey.jaron', 'Dare', 'Reed', '1970-07-22', 'torphy.dexter@yahoo.com', '84246 D\'Amore Knoll\nSouth Vickie, OH 63612', NULL, NULL, '461-715-7304', '$2y$10$HHtBuyQoNkYweZmQjsp.G.v5cvPvBtJc5il8P83gy.eoH5k77LF3y', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(90, NULL, 'hpagac', 'Kihn', 'Jennings', '1987-02-13', 'drake.gutkowski@kreiger.com', '96138 Domingo Streets Apt. 607\nKipfurt, NV 41216-8400', NULL, NULL, '848.512.2841', '$2y$10$cXABut8oZRyETeRgi9BG0eajS2srlHCQRRoBLDaTaAbhOsPwRks2S', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(91, NULL, 'amurazik', 'Corkery', 'Jameson', '1975-11-14', 'altenwerth.paolo@hotmail.com', '51245 Alvah Views\nHoegerside, MD 14882', NULL, NULL, '361-465-5408', '$2y$10$WvX4juLFhSLnaVJdnoWTueU9S8aeohPk87KFUUgKz680zgO4fWb7y', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(92, NULL, 'nils73', 'Daniel', 'Berniece', '2002-05-13', 'hbuckridge@greenholt.com', '968 Rachael Road\nPricechester, WV 07062', NULL, NULL, '339.304.3489 x3757', '$2y$10$VtJGsl2Vu8PjEK12bCm2teB0vt8U0sH4W515Hc7nrfi4yyI9T8zrO', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(93, NULL, 'pfeffer.maria', 'Gislason', 'Jovanny', '1998-01-06', 'ondricka.yasmine@bailey.com', '2733 Sanford Pass\nSchowalterton, ID 73978', NULL, NULL, '417-220-7219 x1983', '$2y$10$Q9uq6jCG5tiGAx823FbnUOr2/G5B4dbMytmTb59V9Uv81Vp0z95.S', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(94, NULL, 'sdoyle', 'Bednar', 'Vern', '1980-07-04', 'king.tito@hahn.com', '547 Hattie Courts\nAlejandraside, MI 79461-4032', NULL, NULL, '778-504-6362 x77727', '$2y$10$Y.QiKxvFXo3OBY0ksZYyEO8aNpwfeN6fNgaezgCsYKkuWyIrwNRzy', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(95, NULL, 'hmante', 'Nader', 'Alison', '2016-11-06', 'ariane38@hotmail.com', '657 Willie Junction\nPort Martatown, NE 52879-5217', NULL, NULL, '(843) 853-9099', '$2y$10$hktqImp2kEJQQepyK1SyLua0exHckI8rvo3bdcADkasz.h3v/rvKO', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(96, NULL, 'sblanda', 'DuBuque', 'Maverick', '2003-12-23', 'qgreenfelder@hotmail.com', '78040 Kovacek Corners Suite 250\nSouth Meghan, VA 29701', NULL, NULL, '1-824-344-9559', '$2y$10$L3XmJt5iifeQ3B5yIEPDAuSLrMqmokJkTCj85c.mBfDafBDEsJb5m', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(97, NULL, 'breanne07', 'Bode', 'Claudie', '2013-06-26', 'fnienow@yahoo.com', '1176 Jamarcus Loop Apt. 124\nOkeytown, NV 99450-0556', NULL, NULL, '+12069616357', '$2y$10$5EM04yYYDBYY1JEl27VUm.weK6RjFx5H85vx0.hVq7bi7AiGqHU1W', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(98, NULL, 'erempel', 'Predovic', 'Brenda', '1994-06-16', 'mante.shany@hotmail.com', '4034 Koelpin Islands\nNorth Melissa, WY 63847', NULL, NULL, '836-874-5135', '$2y$10$rKRzZkTGz2fr0ly0u/KUkuZCz5NJBHyfxuYuWZNRseQnnxonnWyNu', NULL, NULL, 0, 0, '2021-02-12 15:16:49', '0000-00-00 00:00:00'),
(99, NULL, 'eleonore.kub', 'Schoen', 'Thora', '2017-06-03', 'conn.alfreda@gmail.com', '291 Hyatt Path Apt. 219\nEast Faustoside, AR 51377', NULL, NULL, '+1 (834) 784-0433', '$2y$10$UnN7GMQlMLa.XqYkXDHZTu36su0eIvQ7u0JV5yeX9uyDYUE8lgd36', NULL, NULL, 0, 0, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(100, NULL, 'bins.savannah', 'Kuphal', 'Vaughn', '1996-02-10', 'ynikolaus@reynolds.com', '600 Filiberto Club Suite 315\nPort Elinor, WV 10253-1990', NULL, NULL, '812.721.5256 x5014', '$2y$10$xGo/MCuJTlA.tC294rVtAOML4VGwfhd3jMrMILZPcI68KLBJg0Qki', NULL, NULL, 0, 0, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(101, NULL, 'test123', 'James', 'bond', '2021-02-17', 'test123@yopmail.com', '221B baker street', 'LONDON', NULL, NULL, '$2y$10$sh7azbiOEKU4LcXBz53Y4e77U.XmCTALAfgqGKYlFVTd5gBxiPCKu', NULL, NULL, 0, 0, '2021-02-12 15:21:25', '2021-02-16 08:55:36');

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
(1, 5, 80, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(2, 29, 47, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(3, 8, 72, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(4, 10, 92, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(5, 30, 3, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(6, 6, 27, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(7, 26, 22, '2021-02-12 15:16:50', '0000-00-00 00:00:00'),
(8, 5, 67, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(9, 8, 31, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(10, 22, 70, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(11, 9, 79, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(12, 23, 37, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(13, 26, 77, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(14, 12, 82, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(15, 22, 80, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(16, 9, 14, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(17, 29, 79, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(18, 37, 42, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(19, 30, 51, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(20, 2, 46, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(21, 30, 19, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(22, 1, 12, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(23, 29, 30, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(24, 8, 16, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(25, 23, 33, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(26, 40, 93, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(27, 9, 32, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(28, 28, 2, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(29, 3, 40, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(30, 27, 99, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(31, 9, 50, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(32, 8, 82, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(33, 26, 10, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(34, 27, 12, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(35, 26, 48, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(36, 8, 79, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(37, 9, 56, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(38, 37, 6, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(39, 40, 7, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(40, 8, 92, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(41, 28, 3, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(42, 39, 47, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(43, 6, 44, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(44, 22, 3, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(45, 22, 45, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(46, 40, 67, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(47, 9, 19, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(48, 2, 74, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(49, 37, 18, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(50, 27, 30, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(51, 1, 31, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(52, 37, 39, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(53, 37, 74, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(54, 9, 22, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(55, 5, 15, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(56, 27, 36, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(57, 5, 28, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(58, 12, 51, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(59, 39, 41, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(60, 27, 71, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(61, 38, 62, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(62, 10, 10, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(63, 28, 86, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(64, 37, 96, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(65, 12, 86, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(66, 37, 82, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(67, 38, 20, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(68, 22, 31, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(69, 28, 21, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(70, 40, 94, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(71, 38, 52, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(72, 39, 34, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(73, 1, 82, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(74, 40, 74, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(75, 9, 22, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(76, 23, 7, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(77, 2, 89, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(78, 23, 99, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(79, 8, 44, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(80, 39, 22, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(81, 8, 15, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(82, 38, 14, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(83, 10, 94, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(84, 28, 80, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(85, 8, 77, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(86, 39, 23, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(87, 22, 64, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(88, 28, 94, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(89, 10, 12, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(90, 30, 17, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(91, 10, 71, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(92, 37, 76, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(93, 37, 77, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(94, 23, 32, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(95, 26, 46, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(96, 22, 50, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(97, 8, 40, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(98, 5, 35, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(99, 40, 64, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(100, 40, 23, '2021-02-12 15:16:51', '0000-00-00 00:00:00'),
(101, 37, 101, '2021-02-16 11:03:10', '0000-00-00 00:00:00');

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
-- Index pour la table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`,`id_post`),
  ADD KEY `id_post` (`id_post`);

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
  ADD UNIQUE KEY `name` (`name`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `chat_users`
--
ALTER TABLE `chat_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT pour la table `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT pour la table `user_skills`
--
ALTER TABLE `user_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

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

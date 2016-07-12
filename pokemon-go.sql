-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 12, 2016 at 01:28 AM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pokemon-go`
--

-- --------------------------------------------------------

--
-- Table structure for table `alliances`
--

CREATE TABLE IF NOT EXISTS `alliances` (
  `user_id` int(11) NOT NULL,
  `team` enum('valor','mystic','instinct') NOT NULL,
  `name` varchar(500) NOT NULL,
  `mention` varchar(500) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `encounters`
--

CREATE TABLE IF NOT EXISTS `encounters` (
  `sighting_id` int(11) NOT NULL AUTO_INCREMENT,
  `pokemon_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sighting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pokedex`
--

CREATE TABLE IF NOT EXISTS `pokedex` (
  `pokemon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `common` tinyint(1) NOT NULL,
  `image` varchar(200) NOT NULL,
  `type1` varchar(20) NOT NULL,
  `type2` varchar(20) NOT NULL,
  PRIMARY KEY (`pokemon_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=152 ;

--
-- Dumping data for table `pokedex`
--

INSERT INTO `pokedex` (`pokemon_id`, `name`, `common`, `image`, `type1`, `type2`) VALUES
(1, 'Bulbasaur', 1, 'http://cdn.bulbagarden.net/upload/e/ec/001MS.png', 'grass', 'poison'),
(2, 'Ivysaur', 1, 'http://cdn.bulbagarden.net/upload/6/6b/002MS.png', 'grass', 'poison'),
(3, 'Venusaur', 1, 'http://cdn.bulbagarden.net/upload/d/df/003MS.png', 'grass', 'poison'),
(4, 'Charmander', 1, 'http://cdn.bulbagarden.net/upload/b/bb/004MS.png', 'fire', ''),
(5, 'Charmeleon', 1, 'http://cdn.bulbagarden.net/upload/d/dc/005MS.png', 'fire', ''),
(6, 'Charizard', 1, 'http://cdn.bulbagarden.net/upload/0/01/006MS.png', 'fire', 'flying'),
(7, 'Squirtle', 1, 'http://cdn.bulbagarden.net/upload/9/92/007MS.png', 'water', ''),
(8, 'Wartortle', 1, 'http://cdn.bulbagarden.net/upload/f/f3/008MS.png', 'water', ''),
(9, 'Blastoise', 1, 'http://cdn.bulbagarden.net/upload/c/cb/009MS.png', 'water', ''),
(10, 'Caterpie', 1, 'http://cdn.bulbagarden.net/upload/6/69/010MS.png', 'bug', ''),
(11, 'Metapod', 1, 'http://cdn.bulbagarden.net/upload/c/ce/011MS.png', 'bug', ''),
(12, 'Butterfree', 1, 'http://cdn.bulbagarden.net/upload/1/14/012MS.png', 'bug', 'flying'),
(13, 'Weedle', 1, 'http://cdn.bulbagarden.net/upload/6/65/013MS.png', 'bug', 'poison'),
(14, 'Kakuna', 1, 'http://cdn.bulbagarden.net/upload/8/81/014MS.png', 'bug', 'poison'),
(15, 'Beedrill', 1, 'http://cdn.bulbagarden.net/upload/5/5a/015MS.png', 'bug', 'poison'),
(16, 'Pidgey', 1, 'http://cdn.bulbagarden.net/upload/9/9c/016MS.png', 'normal', 'flying'),
(17, 'Pidgeotto', 1, 'http://cdn.bulbagarden.net/upload/a/a9/017MS.png', 'normal', 'flying'),
(18, 'Pidgeot', 1, 'http://cdn.bulbagarden.net/upload/6/68/018MS.png', 'normal', 'flying'),
(19, 'Rattata', 1, 'http://cdn.bulbagarden.net/upload/4/4d/019MS.png', 'normal', ''),
(20, 'Raticate', 1, 'http://cdn.bulbagarden.net/upload/4/4d/020MS.png', 'normal', ''),
(21, 'Spearow', 1, 'http://cdn.bulbagarden.net/upload/5/5b/021MS.png', 'normal', 'flying'),
(22, 'Fearow', 1, 'http://cdn.bulbagarden.net/upload/3/35/022MS.png', 'normal', 'flying'),
(23, 'Ekans', 1, 'http://cdn.bulbagarden.net/upload/0/0d/023MS.png', 'poison', ''),
(24, 'Arbok', 1, 'http://cdn.bulbagarden.net/upload/d/d3/024MS.png', 'poison', ''),
(25, 'Pikachu', 1, 'http://cdn.bulbagarden.net/upload/0/0f/025MS.png', 'electric', ''),
(26, 'Raichu', 1, 'http://cdn.bulbagarden.net/upload/d/da/026MS.png', 'electric', ''),
(27, 'Sandshrew', 1, 'http://cdn.bulbagarden.net/upload/c/c3/027MS.png', 'ground', ''),
(28, 'Sandslash', 1, 'http://cdn.bulbagarden.net/upload/e/e0/028MS.png', 'ground', ''),
(29, 'Nidoran?', 1, 'http://cdn.bulbagarden.net/upload/a/ab/029MS.png', 'poison', ''),
(30, 'Nidorina', 1, 'http://cdn.bulbagarden.net/upload/d/d0/030MS.png', 'poison', ''),
(31, 'Nidoqueen', 1, 'http://cdn.bulbagarden.net/upload/3/31/031MS.png', 'poison', 'ground'),
(32, 'Nidoran?', 1, 'http://cdn.bulbagarden.net/upload/f/fb/032MS.png', 'poison', ''),
(33, 'Nidorino', 1, 'http://cdn.bulbagarden.net/upload/0/0e/033MS.png', 'poison', ''),
(34, 'Nidoking', 1, 'http://cdn.bulbagarden.net/upload/1/18/034MS.png', 'poison', 'ground'),
(35, 'Clefairy', 1, 'http://cdn.bulbagarden.net/upload/f/f9/035MS.png', 'fairy', ''),
(36, 'Clefable', 1, 'http://cdn.bulbagarden.net/upload/7/75/036MS.png', 'fairy', ''),
(37, 'Vulpix', 1, 'http://cdn.bulbagarden.net/upload/8/85/037MS.png', 'fire', ''),
(38, 'Ninetales', 1, 'http://cdn.bulbagarden.net/upload/1/10/038MS.png', 'fire', ''),
(39, 'Jigglypuff', 1, 'http://cdn.bulbagarden.net/upload/9/9c/039MS.png', 'normal', 'fairy'),
(40, 'Wigglytuff', 1, 'http://cdn.bulbagarden.net/upload/f/f1/040MS.png', 'normal', 'fairy'),
(41, 'Zubat', 1, 'http://cdn.bulbagarden.net/upload/9/96/041MS.png', 'poison', 'flying'),
(42, 'Golbat', 1, 'http://cdn.bulbagarden.net/upload/d/d0/042MS.png', 'poison', 'flying'),
(43, 'Oddish', 1, 'http://cdn.bulbagarden.net/upload/a/a5/043MS.png', 'grass', 'poison'),
(44, 'Gloom', 1, 'http://cdn.bulbagarden.net/upload/d/d9/044MS.png', 'grass', 'poison'),
(45, 'Vileplume', 1, 'http://cdn.bulbagarden.net/upload/3/3e/045MS.png', 'grass', 'poison'),
(46, 'Paras', 1, 'http://cdn.bulbagarden.net/upload/7/7a/046MS.png', 'bug', 'grass'),
(47, 'Parasect', 1, 'http://cdn.bulbagarden.net/upload/4/41/047MS.png', 'bug', 'grass'),
(48, 'Venonat', 1, 'http://cdn.bulbagarden.net/upload/1/1e/048MS.png', 'bug', 'poison'),
(49, 'Venomoth', 1, 'http://cdn.bulbagarden.net/upload/3/31/049MS.png', 'bug', 'poison'),
(50, 'Diglett', 1, 'http://cdn.bulbagarden.net/upload/8/8b/050MS.png', 'ground', ''),
(51, 'Dugtrio', 1, 'http://cdn.bulbagarden.net/upload/8/86/051MS.png', 'ground', ''),
(52, 'Meowth', 1, 'http://cdn.bulbagarden.net/upload/5/50/052MS.png', 'normal', ''),
(53, 'Persian', 1, 'http://cdn.bulbagarden.net/upload/a/a7/053MS.png', 'normal', ''),
(54, 'Psyduck', 1, 'http://cdn.bulbagarden.net/upload/6/6b/054MS.png', 'water', ''),
(55, 'Golduck', 1, 'http://cdn.bulbagarden.net/upload/6/64/055MS.png', 'water', ''),
(56, 'Mankey', 1, 'http://cdn.bulbagarden.net/upload/a/ad/056MS.png', 'fighting', ''),
(57, 'Primeape', 1, 'http://cdn.bulbagarden.net/upload/f/f1/057MS.png', 'fighting', ''),
(58, 'Growlithe', 1, 'http://cdn.bulbagarden.net/upload/6/69/058MS.png', 'fire', ''),
(59, 'Arcanine', 1, 'http://cdn.bulbagarden.net/upload/3/35/059MS.png', 'fire', ''),
(60, 'Poliwag', 1, 'http://cdn.bulbagarden.net/upload/1/17/060MS.png', 'water', ''),
(61, 'Poliwhirl', 1, 'http://cdn.bulbagarden.net/upload/3/36/061MS.png', 'water', ''),
(62, 'Poliwrath', 1, 'http://cdn.bulbagarden.net/upload/5/5e/062MS.png', 'water', 'fighting'),
(63, 'Abra', 1, 'http://cdn.bulbagarden.net/upload/c/cf/063MS.png', 'psychic', ''),
(64, 'Kadabra', 1, 'http://cdn.bulbagarden.net/upload/b/b6/064MS.png', 'psychic', ''),
(65, 'Alakazam', 1, 'http://cdn.bulbagarden.net/upload/c/ca/065MS.png', 'psychic', ''),
(66, 'Machop', 1, 'http://cdn.bulbagarden.net/upload/6/6c/066MS.png', 'fighting', ''),
(67, 'Machoke', 1, 'http://cdn.bulbagarden.net/upload/0/0f/067MS.png', 'fighting', ''),
(68, 'Machamp', 1, 'http://cdn.bulbagarden.net/upload/1/1e/068MS.png', 'fighting', ''),
(69, 'Bellsprout', 1, 'http://cdn.bulbagarden.net/upload/7/7b/069MS.png', 'grass', 'poison'),
(70, 'Weepinbell', 1, 'http://cdn.bulbagarden.net/upload/d/d5/070MS.png', 'grass', 'poison'),
(71, 'Victreebel', 1, 'http://cdn.bulbagarden.net/upload/9/9b/071MS.png', 'grass', 'poison'),
(72, 'Tentacool', 1, 'http://cdn.bulbagarden.net/upload/4/42/072MS.png', 'water', 'poison'),
(73, 'Tentacruel', 1, 'http://cdn.bulbagarden.net/upload/f/fc/073MS.png', 'water', 'poison'),
(74, 'Geodude', 1, 'http://cdn.bulbagarden.net/upload/0/04/074MS.png', 'rock', 'ground'),
(75, 'Graveler', 1, 'http://cdn.bulbagarden.net/upload/5/5c/075MS.png', 'rock', 'ground'),
(76, 'Golem', 1, 'http://cdn.bulbagarden.net/upload/3/34/076MS.png', 'rock', 'ground'),
(77, 'Ponyta', 1, 'http://cdn.bulbagarden.net/upload/5/55/077MS.png', 'fire', ''),
(78, 'Rapidash', 1, 'http://cdn.bulbagarden.net/upload/6/66/078MS.png', 'fire', ''),
(79, 'Slowpoke', 1, 'http://cdn.bulbagarden.net/upload/6/6a/079MS.png', 'water', 'psychic'),
(80, 'Slowbro', 1, 'http://cdn.bulbagarden.net/upload/b/b6/080MS.png', 'water', 'psychic'),
(81, 'Magnemite', 1, 'http://cdn.bulbagarden.net/upload/0/0f/081MS.png', 'electric', 'steel'),
(82, 'Magneton', 1, 'http://cdn.bulbagarden.net/upload/0/0c/082MS.png', 'electric', 'steel'),
(83, 'Farfetch''d', 1, 'http://cdn.bulbagarden.net/upload/5/57/083MS.png', 'normal', 'flying'),
(84, 'Doduo', 1, 'http://cdn.bulbagarden.net/upload/f/fc/084MS.png', 'normal', 'flying'),
(85, 'Dodrio', 1, 'http://cdn.bulbagarden.net/upload/1/19/085MS.png', 'normal', 'flying'),
(86, 'Seel', 1, 'http://cdn.bulbagarden.net/upload/9/9b/086MS.png', 'water', ''),
(87, 'Dewgong', 1, 'http://cdn.bulbagarden.net/upload/2/20/087MS.png', 'water', 'ice'),
(88, 'Grimer', 1, 'http://cdn.bulbagarden.net/upload/5/50/088MS.png', 'poison', ''),
(89, 'Muk', 1, 'http://cdn.bulbagarden.net/upload/b/b4/089MS.png', 'poison', ''),
(90, 'Shellder', 1, 'http://cdn.bulbagarden.net/upload/4/41/090MS.png', 'water', ''),
(91, 'Cloyster', 1, 'http://cdn.bulbagarden.net/upload/b/bc/091MS.png', 'water', 'ice'),
(92, 'Gastly', 1, 'http://cdn.bulbagarden.net/upload/c/cf/092MS.png', 'ghost', 'poison'),
(93, 'Haunter', 1, 'http://cdn.bulbagarden.net/upload/7/71/093MS.png', 'ghost', 'poison'),
(94, 'Gengar', 1, 'http://cdn.bulbagarden.net/upload/a/a4/094MS.png', 'ghost', 'poison'),
(95, 'Onix', 1, 'http://cdn.bulbagarden.net/upload/c/cd/095MS.png', 'rock', 'ground'),
(96, 'Drowzee', 1, 'http://cdn.bulbagarden.net/upload/8/8e/096MS.png', 'psychic', ''),
(97, 'Hypno', 1, 'http://cdn.bulbagarden.net/upload/9/98/097MS.png', 'psychic', ''),
(98, 'Krabby', 1, 'http://cdn.bulbagarden.net/upload/4/40/098MS.png', 'water', ''),
(99, 'Kingler', 1, 'http://cdn.bulbagarden.net/upload/5/5c/099MS.png', 'water', ''),
(100, 'Voltorb', 1, 'http://cdn.bulbagarden.net/upload/c/c1/100MS.png', 'electric', ''),
(101, 'Electrode', 1, 'http://cdn.bulbagarden.net/upload/6/69/101MS.png', 'electric', ''),
(102, 'Exeggcute', 1, 'http://cdn.bulbagarden.net/upload/a/a6/102MS.png', 'grass', 'psychic'),
(103, 'Exeggutor', 1, 'http://cdn.bulbagarden.net/upload/d/db/103MS.png', 'grass', 'psychic'),
(104, 'Cubone', 1, 'http://cdn.bulbagarden.net/upload/2/2e/104MS.png', 'ground', ''),
(105, 'Marowak', 1, 'http://cdn.bulbagarden.net/upload/6/6f/105MS.png', 'ground', ''),
(106, 'Hitmonlee', 1, 'http://cdn.bulbagarden.net/upload/6/60/106MS.png', 'fighting', ''),
(107, 'Hitmonchan', 1, 'http://cdn.bulbagarden.net/upload/1/1a/107MS.png', 'fighting', ''),
(108, 'Lickitung', 1, 'http://cdn.bulbagarden.net/upload/2/25/108MS.png', 'normal', ''),
(109, 'Koffing', 1, 'http://cdn.bulbagarden.net/upload/3/3f/109MS.png', 'poison', ''),
(110, 'Weezing', 1, 'http://cdn.bulbagarden.net/upload/2/22/110MS.png', 'poison', ''),
(111, 'Rhyhorn', 1, 'http://cdn.bulbagarden.net/upload/6/67/111MS.png', 'ground', 'rock'),
(112, 'Rhydon', 1, 'http://cdn.bulbagarden.net/upload/c/ce/112MS.png', 'ground', 'rock'),
(113, 'Chansey', 1, 'http://cdn.bulbagarden.net/upload/e/ea/113MS.png', 'normal', ''),
(114, 'Tangela', 1, 'http://cdn.bulbagarden.net/upload/4/45/114MS.png', 'grass', ''),
(115, 'Kangaskhan', 1, 'http://cdn.bulbagarden.net/upload/6/68/115MS.png', 'normal', ''),
(116, 'Horsea', 1, 'http://cdn.bulbagarden.net/upload/2/23/116MS.png', 'water', ''),
(117, 'Seadra', 1, 'http://cdn.bulbagarden.net/upload/8/81/117MS.png', 'water', ''),
(118, 'Goldeen', 1, 'http://cdn.bulbagarden.net/upload/9/9b/118MS.png', 'water', ''),
(119, 'Seaking', 1, 'http://cdn.bulbagarden.net/upload/8/88/119MS.png', 'water', ''),
(120, 'Staryu', 1, 'http://cdn.bulbagarden.net/upload/6/60/120MS.png', 'water', ''),
(121, 'Starmie', 1, 'http://cdn.bulbagarden.net/upload/5/55/121MS.png', 'water', 'psychic'),
(122, 'Mr. Mime', 1, 'http://cdn.bulbagarden.net/upload/5/58/122MS.png', 'psychic', 'fairy'),
(123, 'Scyther', 1, 'http://cdn.bulbagarden.net/upload/5/54/123MS.png', 'bug', 'flying'),
(124, 'Jynx', 1, 'http://cdn.bulbagarden.net/upload/f/f5/124MS.png', 'ice', 'psychic'),
(125, 'Electabuzz', 1, 'http://cdn.bulbagarden.net/upload/7/72/125MS.png', 'electric', ''),
(126, 'Magmar', 1, 'http://cdn.bulbagarden.net/upload/e/e7/126MS.png', 'fire', ''),
(127, 'Pinsir', 1, 'http://cdn.bulbagarden.net/upload/5/5c/127MS.png', 'bug', ''),
(128, 'Tauros', 1, 'http://cdn.bulbagarden.net/upload/9/95/128MS.png', 'normal', ''),
(129, 'Magikarp', 1, 'http://cdn.bulbagarden.net/upload/7/7c/129MS.png', 'water', ''),
(130, 'Gyarados', 1, 'http://cdn.bulbagarden.net/upload/a/a0/130MS.png', 'water', 'flying'),
(131, 'Lapras', 1, 'http://cdn.bulbagarden.net/upload/4/4b/131MS.png', 'water', 'ice'),
(132, 'Ditto', 1, 'http://cdn.bulbagarden.net/upload/5/53/132MS.png', 'normal', ''),
(133, 'Eevee', 1, 'http://cdn.bulbagarden.net/upload/d/de/133MS.png', 'normal', ''),
(134, 'Vaporeon', 1, 'http://cdn.bulbagarden.net/upload/b/be/134MS.png', 'water', ''),
(135, 'Jolteon', 1, 'http://cdn.bulbagarden.net/upload/1/16/135MS.png', 'electric', ''),
(136, 'Flareon', 1, 'http://cdn.bulbagarden.net/upload/3/30/136MS.png', 'fire', ''),
(137, 'Porygon', 1, 'http://cdn.bulbagarden.net/upload/f/f7/137MS.png', 'normal', ''),
(138, 'Omanyte', 1, 'http://cdn.bulbagarden.net/upload/9/97/138MS.png', 'rock', 'water'),
(139, 'Omastar', 1, 'http://cdn.bulbagarden.net/upload/2/2a/139MS.png', 'rock', 'water'),
(140, 'Kabuto', 1, 'http://cdn.bulbagarden.net/upload/1/1e/140MS.png', 'rock', 'water'),
(141, 'Kabutops', 1, 'http://cdn.bulbagarden.net/upload/0/08/141MS.png', 'rock', 'water'),
(142, 'Aerodactyl', 1, 'http://cdn.bulbagarden.net/upload/d/d1/142MS.png', 'rock', 'flying'),
(143, 'Snorlax', 1, 'http://cdn.bulbagarden.net/upload/d/d6/143MS.png', 'normal', ''),
(144, 'Articuno', 1, 'http://cdn.bulbagarden.net/upload/0/04/144MS.png', 'ice', 'flying'),
(145, 'Zapdos', 1, 'http://cdn.bulbagarden.net/upload/3/3f/145MS.png', 'electric', 'flying'),
(146, 'Moltres', 1, 'http://cdn.bulbagarden.net/upload/f/fe/146MS.png', 'fire', 'flying'),
(147, 'Dratini', 1, 'http://cdn.bulbagarden.net/upload/2/26/147MS.png', 'dragon', ''),
(148, 'Dragonair', 1, 'http://cdn.bulbagarden.net/upload/4/4e/148MS.png', 'dragon', ''),
(149, 'Dragonite', 1, 'http://cdn.bulbagarden.net/upload/c/cc/149MS.png', 'dragon', 'flying'),
(150, 'Mewtwo', 1, 'http://cdn.bulbagarden.net/upload/1/1a/150MS.png', 'psychic', ''),
(151, 'Mew', 1, 'http://cdn.bulbagarden.net/upload/a/a7/151MS.png', 'psychic', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

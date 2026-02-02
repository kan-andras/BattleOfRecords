-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Feb 02. 15:03
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `battle_of_records`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jatek`
--

CREATE TABLE `jatek` (
  `jatek_id` int(11) NOT NULL,
  `jatekneve` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `jatek`
--

INSERT INTO `jatek` (`jatek_id`, `jatekneve`) VALUES
(1, 'Devil May Cry'),
(2, 'Minecraft'),
(3, 'Battlefront 2');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `karakter`
--

CREATE TABLE `karakter` (
  `karakter_id` int(11) NOT NULL,
  `jatek_id` int(11) NOT NULL,
  `karakterneve` varchar(100) NOT NULL,
  `eletero` int(11) NOT NULL,
  `mana` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `karakter`
--

INSERT INTO `karakter` (`karakter_id`, `jatek_id`, `karakterneve`, `eletero`, `mana`) VALUES
(1, 1, 'Dante', 100, 100),
(2, 1, 'Vergil', 100, 100),
(3, 1, 'Nero', 100, 100),
(4, 1, 'Trish', 100, 100),
(5, 2, 'Steve', 100, 100),
(6, 2, 'Herobrine', 100, 100),
(7, 2, 'Enderman', 100, 100),
(8, 2, 'Blaze', 100, 100),
(9, 2, 'Wither', 100, 100),
(10, 2, 'Ender Dragon', 100, 100),
(11, 2, 'Iron Golem', 100, 100),
(12, 3, 'Luke Skywalker', 100, 100),
(13, 3, 'Darth Vader', 100, 100),
(14, 3, 'Han Solo', 100, 100),
(15, 3, 'Yoda', 100, 100),
(16, 3, 'Darth Maul', 100, 100),
(17, 3, 'Boba Fett', 100, 100);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kepesseg`
--

CREATE TABLE `kepesseg` (
  `kepesseg_id` int(11) NOT NULL,
  `karakter_id` int(11) NOT NULL,
  `kepessegneve` varchar(100) NOT NULL,
  `tipusa` enum('normal','heavy','ulti') NOT NULL,
  `manafogyasztas` int(11) NOT NULL,
  `serules` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `kepesseg`
--

INSERT INTO `kepesseg` (`kepesseg_id`, `karakter_id`, `kepessegneve`, `tipusa`, `manafogyasztas`, `serules`) VALUES
(1, 4, 'V divider', '', 10, 9),
(2, 4, 'round trip', '', 12, 10),
(3, 4, 'high voltage', '', 15, 13),
(4, 4, 'rolling thunder', '', 18, 15),
(5, 4, 'thunder blow', '', 20, 18),
(6, 4, 'collider', '', 22, 20),
(7, 4, 'PF013: Epidemic', '', 28, 26),
(8, 4, 'PF398: Revenge', '', 32, 30),
(9, 3, 'Roulette spin', '', 6, 5),
(10, 3, 'high roller', '', 10, 9),
(11, 3, 'streak', '', 12, 10),
(12, 3, 'shuffle', '', 15, 13),
(13, 3, 'split', '', 15, 14),
(14, 3, 'calibur', '', 18, 15),
(15, 3, 'payline', '', 20, 18),
(16, 3, 'high shot', '', 10, 8),
(17, 3, 'charged shot', '', 25, 22),
(18, 2, 'upper slash', '', 6, 5),
(19, 2, 'Aerial cleave', '', 10, 9),
(20, 2, 'rapid slash', '', 12, 10),
(21, 2, 'rising star', '', 15, 13),
(22, 2, 'void slash', '', 18, 15),
(23, 2, 'judgement cut', '', 22, 20),
(24, 2, 'starfall', '', 25, 22),
(25, 2, 'lunar phase', '', 20, 18),
(26, 2, 'rising dragon', '', 28, 26),
(27, 2, 'stinger', '', 15, 13),
(28, 1, 'helm braker', '', 10, 9),
(29, 1, 'high time', '', 12, 10),
(30, 1, 'stinger', '', 15, 13),
(31, 1, 'million stab', '', 18, 15),
(32, 1, 'drive', '', 20, 18),
(33, 1, 'light blow', '', 6, 5),
(34, 1, 'heavy jolt', '', 22, 20),
(35, 1, 'friction', '', 15, 14),
(36, 1, 'updraft', '', 12, 10),
(37, 1, 'break spiral', '', 25, 22),
(38, 1, 'flint wheel', '', 18, 15),
(39, 1, 'idling', '', 5, 4),
(40, 1, 'cross line', '', 20, 18),
(41, 1, 'high side', '', 28, 26),
(42, 5, 'pickaxe throw', '', 8, 7),
(43, 5, 'fire bomb', '', 12, 10),
(44, 5, 'crossbow', '', 10, 9),
(45, 5, 'netherite sword', '', 15, 13),
(46, 5, 'Sweep Attack', '', 13, 12),
(47, 5, 'power shot', '', 18, 15),
(48, 5, 'axe chop', '', 12, 10),
(49, 5, 'trident throw', '', 20, 18),
(50, 6, 'lightning strike', '', 18, 15),
(51, 6, 'ghost teleport', '', 8, 6),
(52, 6, 'soul fire burst', '', 15, 13),
(53, 6, 'cursed strike', '', 12, 10),
(54, 6, 'soul sand grip', '', 14, 12),
(55, 6, 'dark flame slash', '', 20, 18),
(56, 6, 'nether blink', '', 10, 8),
(57, 7, 'teleport hit', '', 10, 8),
(58, 7, 'block throw', '', 12, 10),
(59, 7, 'ender scream', '', 14, 12),
(60, 7, 'void touch', '', 18, 15),
(61, 7, 'portal punch', '', 13, 11),
(62, 7, 'ender pulse', '', 20, 18),
(63, 7, 'block smash', '', 15, 13),
(64, 7, 'void ripple', '', 25, 22),
(65, 8, 'fireball burst', '', 10, 9),
(66, 8, 'blaze charge', '', 12, 10),
(67, 8, 'flame ring', '', 14, 12),
(68, 8, 'overheat', '', 18, 15),
(69, 8, 'firestorm burst', '', 22, 20),
(70, 8, 'blaze spin', '', 15, 13),
(71, 8, 'ember shot', '', 8, 7),
(72, 8, 'inferno pillar', '', 26, 24),
(73, 8, 'magma burst', '', 20, 18),
(74, 9, 'wither skull shot', '', 10, 9),
(75, 9, 'explosive skull', '', 18, 15),
(76, 9, 'wither bomb', '', 22, 20),
(77, 9, 'decay wave', '', 15, 13),
(78, 9, 'bone shatter', '', 14, 12),
(79, 9, 'wither charge', '', 20, 18),
(80, 9, 'soul drain', '', 25, 22),
(81, 9, 'triple skull volley', '', 28, 26),
(82, 10, 'dragon breath', '', 20, 18),
(83, 10, 'wing knockback', '', 15, 13),
(84, 10, 'end dive', '', 22, 20),
(85, 10, 'end crystal surge', '', 26, 24),
(86, 10, 'tail swipe', '', 14, 12),
(87, 10, 'dragon roar', '', 10, 8),
(88, 10, 'ender shockwave', '', 24, 22),
(89, 10, 'void breath', '', 30, 28),
(90, 11, 'iron slam', '', 12, 10),
(91, 11, 'ground pound', '', 15, 13),
(92, 11, 'iron charge', '', 18, 15),
(93, 11, 'iron toss', '', 14, 12),
(94, 11, 'heavy punch', '', 10, 9),
(95, 11, 'boulder throw', '', 20, 18),
(96, 11, 'metal stomp', '', 16, 14),
(97, 11, 'iron spin', '', 22, 20),
(98, 12, 'Saber Strike', '', 8, 6),
(99, 12, 'Heavy Slash', '', 15, 13),
(100, 12, 'Force Push', '', 12, 10),
(101, 12, 'Dash Attack', '', 10, 9),
(102, 12, 'Saber Throw', '', 14, 12),
(103, 12, 'Aerial Slash', '', 12, 10),
(104, 12, 'Precision Strike', '', 18, 15),
(105, 13, 'Saber Crush', '', 10, 9),
(106, 13, 'Force Choke', '', 18, 15),
(107, 13, 'Force Slam', '', 20, 18),
(108, 13, 'Saber Throw', '', 14, 12),
(109, 13, 'Dark Lunge', '', 15, 13),
(110, 13, 'Dark Crush', '', 22, 20),
(111, 13, 'Force Wave', '', 25, 22),
(112, 14, 'DL-44 Shot', '', 8, 6),
(113, 14, 'Rapid Fire', '', 12, 10),
(114, 14, 'Sharpshooter', '', 18, 15),
(115, 14, 'Shoulder Charge', '', 10, 9),
(116, 14, 'Detonite Charge', '', 20, 18),
(117, 14, 'Lucky Shot', '', 15, 13),
(118, 14, 'Heroic Blast', '', 25, 22),
(119, 15, 'Lightsaber Flurry', '', 10, 9),
(120, 15, 'Force Push', '', 12, 10),
(121, 15, 'Force Lift', '', 15, 13),
(122, 15, 'Acrobatic Strike', '', 8, 6),
(123, 15, 'Saber Spin', '', 12, 10),
(124, 15, 'Master’s Slash', '', 18, 15),
(125, 15, 'Force Burst', '', 20, 18),
(126, 15, 'Agile Dash', '', 6, 5),
(127, 15, 'Grand Master Strike', '', 28, 26),
(128, 16, 'Dual Saber Slash', '', 10, 9),
(129, 16, 'Spin Attack', '', 12, 10),
(130, 16, 'Saber Throw', '', 14, 12),
(131, 16, 'Force Push', '', 12, 10),
(132, 16, 'Acrobatic Lunge', '', 15, 13),
(133, 16, 'Furious Combo', '', 18, 15),
(134, 16, 'Dark Side Strike', '', 20, 18),
(135, 16, 'Whirlwind Slash', '', 22, 20),
(136, 16, 'Shadow Dash', '', 8, 6),
(137, 17, 'EE-3 Burst Shot', '', 10, 9),
(138, 17, 'Wrist Rocket', '', 18, 15),
(139, 17, 'Flamethrower', '', 15, 13),
(140, 17, 'Jetpack Slam', '', 12, 10),
(141, 17, 'Jetpack Shot', '', 14, 12),
(142, 17, 'Concussion Rocket', '', 20, 18),
(143, 17, 'Poison Dart', '', 12, 10),
(144, 17, 'Tracking Shot', '', 18, 15),
(145, 17, 'Thermal Detonator', '', 25, 22);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `jatek`
--
ALTER TABLE `jatek`
  ADD PRIMARY KEY (`jatek_id`);

--
-- A tábla indexei `karakter`
--
ALTER TABLE `karakter`
  ADD PRIMARY KEY (`karakter_id`),
  ADD KEY `fk_karakter_jatek` (`jatek_id`);

--
-- A tábla indexei `kepesseg`
--
ALTER TABLE `kepesseg`
  ADD PRIMARY KEY (`kepesseg_id`),
  ADD KEY `fk_kepesseg_karakter` (`karakter_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `jatek`
--
ALTER TABLE `jatek`
  MODIFY `jatek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `karakter`
--
ALTER TABLE `karakter`
  MODIFY `karakter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `kepesseg`
--
ALTER TABLE `kepesseg`
  MODIFY `kepesseg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `karakter`
--
ALTER TABLE `karakter`
  ADD CONSTRAINT `fk_karakter_jatek` FOREIGN KEY (`jatek_id`) REFERENCES `jatek` (`jatek_id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `kepesseg`
--
ALTER TABLE `kepesseg`
  ADD CONSTRAINT `fk_kepesseg_karakter` FOREIGN KEY (`karakter_id`) REFERENCES `karakter` (`karakter_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

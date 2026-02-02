-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Feb 01. 15:16
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
(41, 1, 'high side', '', 28, 26);

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
  MODIFY `kepesseg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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

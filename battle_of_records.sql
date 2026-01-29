-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Jan 29. 12:28
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

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
-- Tábla szerkezet ehhez a táblához `játék`
--

CREATE TABLE `játék` (
  `jatek_id` int(5) NOT NULL,
  `jatek_neve` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `karakterek`
--

CREATE TABLE `karakterek` (
  `karakter_id` int(100) NOT NULL,
  `jatek_id` int(5) NOT NULL,
  `neve` varchar(100) NOT NULL,
  `eletero` int(100) NOT NULL,
  `mana` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kepesseg`
--

CREATE TABLE `kepesseg` (
  `kepesseg_id` int(100) NOT NULL,
  `karakter_id` int(100) NOT NULL,
  `neve` varchar(100) NOT NULL,
  `mana_fogyasztas` int(100) NOT NULL,
  `ereje` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `meccs_karakter`
--

CREATE TABLE `meccs_karakter` (
  `meccs_id` int(100) NOT NULL,
  `karakter_id` int(100) NOT NULL,
  `aktualis_elet` int(100) NOT NULL,
  `aktualis_mana` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `játék`
--
ALTER TABLE `játék`
  ADD PRIMARY KEY (`jatek_id`);

--
-- A tábla indexei `karakterek`
--
ALTER TABLE `karakterek`
  ADD PRIMARY KEY (`karakter_id`),
  ADD UNIQUE KEY `jatek_id` (`jatek_id`);

--
-- A tábla indexei `kepesseg`
--
ALTER TABLE `kepesseg`
  ADD PRIMARY KEY (`kepesseg_id`),
  ADD UNIQUE KEY `karakter_id` (`karakter_id`);

--
-- A tábla indexei `meccs_karakter`
--
ALTER TABLE `meccs_karakter`
  ADD PRIMARY KEY (`meccs_id`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `karakterek`
--
ALTER TABLE `karakterek`
  ADD CONSTRAINT `karakterek_ibfk_1` FOREIGN KEY (`jatek_id`) REFERENCES `játék` (`jatek_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `karakterek_ibfk_2` FOREIGN KEY (`karakter_id`) REFERENCES `kepesseg` (`karakter_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

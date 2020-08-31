-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 11 Cze 2020, 15:48
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `projekt`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ilosc_sklepow` (OUT `ilosc` INT(3) UNSIGNED)  NO SQL
SELECT COUNT(*) INTO ilosc from lista_sklepow$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inicjaly` (IN `imie` VARCHAR(50), IN `nazwisko` VARCHAR(50))  NO SQL
SELECT LEFT(imie,1),LEFT(nazwisko,1)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `wys_imie` (IN `tmp_imie` VARCHAR(50))  NO SQL
SELECT * FROM pracownicy WHERE Imie=tmp_imie$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `except_view_zad7`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `except_view_zad7` (
`Imie` varchar(50)
,`Nazwisko` varchar(50)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `groupp_zad6`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `groupp_zad6` (
`Nr_stanowiska` int(3)
,`COUNT(*)` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `having_view_zad6`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `having_view_zad6` (
`Liczba_Dzieci` int(2)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `historia_sesji`
--

CREATE TABLE `historia_sesji` (
  `Nr_historii_logowania` int(11) NOT NULL,
  `Nr_sesji` int(11) DEFAULT NULL,
  `Nr_Pracownika` int(11) DEFAULT NULL,
  `Czas_logowania` date DEFAULT NULL,
  `IP` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `intersect_view_zad7`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `intersect_view_zad7` (
`Imie` varchar(50)
,`Nazwisko` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `karta_multisport`
--

CREATE TABLE `karta_multisport` (
  `Nr_karty_multisport` int(20) NOT NULL,
  `Aktywna_od` date DEFAULT NULL,
  `Aktywna_do` date DEFAULT NULL,
  `Typ` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `karta_multisport`
--

INSERT INTO `karta_multisport` (`Nr_karty_multisport`, `Aktywna_od`, `Aktywna_do`, `Typ`) VALUES
(1, '2020-04-01', '2020-04-30', 'Norm'),
(2, '2020-03-01', '2020-04-30', 'Norm'),
(3, '2020-02-11', '2020-04-30', 'Lite');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kierownicy`
--

CREATE TABLE `kierownicy` (
  `Nr_kierownika` int(11) NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Nr_kierownika_rejonu` int(11) NOT NULL,
  `Nr_sklepu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kierownicy`
--

INSERT INTO `kierownicy` (`Nr_kierownika`, `Imie`, `Nazwisko`, `Nr_kierownika_rejonu`, `Nr_sklepu`) VALUES
(2, 'Arkadiusz', 'Kos', 1, 1),
(4, 'Marzena', 'Kosiorowska', 2, 2),
(5, 'Aleksader', 'Nosowski', 3, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kierownicy_rejonu`
--

CREATE TABLE `kierownicy_rejonu` (
  `Nr_kierownika_rejonu` int(11) NOT NULL,
  `Imie` varchar(50) DEFAULT NULL,
  `Nazwisko` varchar(50) DEFAULT NULL,
  `Region` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kierownicy_rejonu`
--

INSERT INTO `kierownicy_rejonu` (`Nr_kierownika_rejonu`, `Imie`, `Nazwisko`, `Region`) VALUES
(1, 'Andrzej', 'Por', 'Kraków'),
(2, 'Michał', 'Nowak', 'Warszawa'),
(3, 'Mariola', 'War', 'Gadńsk');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `kierownicy_widok_zad4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `kierownicy_widok_zad4` (
`Nr_kierownika` int(11)
,`Imie` varchar(50)
,`Nazwisko` varchar(50)
,`Nr_kierownika_rejonu` int(11)
,`Nr_sklepu` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `kier_rejonu_sklep_zad4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `kier_rejonu_sklep_zad4` (
`Imie` varchar(50)
,`Nazwisko` varchar(50)
,`Region` varchar(30)
,`Nr_sklepu` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `kier_rejonu_zad5`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `kier_rejonu_zad5` (
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lista_sklepow`
--

CREATE TABLE `lista_sklepow` (
  `Nr_sklepu` int(11) NOT NULL,
  `Adres` varchar(100) DEFAULT '',
  `Liczba_pracownikow` int(11) DEFAULT NULL,
  `Nr_kierownika` int(11) DEFAULT NULL,
  `Nr_kierownika_rejonu` int(11) DEFAULT NULL,
  `Nr_Telefon` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `lista_sklepow`
--

INSERT INTO `lista_sklepow` (`Nr_sklepu`, `Adres`, `Liczba_pracownikow`, `Nr_kierownika`, `Nr_kierownika_rejonu`, `Nr_Telefon`) VALUES
(1, 'Kraków ul.3-Maja 2', 10, 2, 1, 654321234),
(2, 'Warszawa ul.Kosciuszki 31A', 25, 4, 2, 123456789),
(3, 'Gdańsk ul.Jana Pawła 3', 6, 5, 3, 987654321);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `lista_sklepow_widok_zad4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `lista_sklepow_widok_zad4` (
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lista_stanowisk`
--

CREATE TABLE `lista_stanowisk` (
  `Nr_stanowiska` int(3) NOT NULL,
  `Nazwa_stanowiska` varchar(25) DEFAULT NULL,
  `Placa` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `lista_stanowisk`
--

INSERT INTO `lista_stanowisk` (`Nr_stanowiska`, `Nazwa_stanowiska`, `Placa`) VALUES
(1, 'Pracownik_sklepu', 3200),
(2, 'Kasjer', 2800),
(3, 'Starszy_kasjer', 3700);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `math_pracownicyaddzatru_zad6`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `math_pracownicyaddzatru_zad6` (
`Nr_pracownika` int(11)
,`adddate(Rok_zatrudnienia,10)` date
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `math_pracownicy_haslorandom1_zad6`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `math_pracownicy_haslorandom1_zad6` (
`Nr_pracownika` int(11)
,`rand()*100` double
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `math_pracownicy_urlop15_zad6`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `math_pracownicy_urlop15_zad6` (
`Nr_pracownika` int(11)
,`Imie` varchar(50)
,`Nazwisko` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nr_multisport_nr_pracownika`
--

CREATE TABLE `nr_multisport_nr_pracownika` (
  `Nr_pracownika` int(11) NOT NULL,
  `Nr_karty_multisport` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `nr_multisport_nr_pracownika`
--

INSERT INTO `nr_multisport_nr_pracownika` (`Nr_pracownika`, `Nr_karty_multisport`) VALUES
(1, 1),
(2, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nr_pracownika_baza_sesja`
--

CREATE TABLE `nr_pracownika_baza_sesja` (
  `Nr_Pracownika_baza` int(11) DEFAULT NULL,
  `Nr_Pracownika_sesja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `Nr_Pracownika` int(11) NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Pesel` int(11) DEFAULT NULL,
  `Rok_zatrudnienia` date NOT NULL,
  `Liczba_Dzieci` int(2) DEFAULT NULL,
  `Ilosc_dni_urlopu` int(3) NOT NULL,
  `Nr_kierownika` int(11) DEFAULT NULL,
  `Nr_stanowiska` int(3) DEFAULT NULL,
  `Nr_sklepu` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`Nr_Pracownika`, `Imie`, `Nazwisko`, `Pesel`, `Rok_zatrudnienia`, `Liczba_Dzieci`, `Ilosc_dni_urlopu`, `Nr_kierownika`, `Nr_stanowiska`, `Nr_sklepu`) VALUES
(1, 'Sebastian', 'Pokrywka', 1111111111, '2019-07-26', 0, 20, 2, 1, 1),
(2, 'Aneta', 'Malos', 1234245432, '2020-01-15', 2, 5, 4, 2, 2),
(4, 'Kamil', 'Nowak', 212123221, '2013-06-26', 0, 20, 5, 3, 3);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `pracownicy_karta_multi_zad4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `pracownicy_karta_multi_zad4` (
`Nr_Pracownika` int(11)
,`Nr_karty_multisport` int(20)
,`Imie` varchar(50)
,`Nazwisko` varchar(50)
,`Pesel` int(11)
,`Rok_zatrudnienia` date
,`Liczba_Dzieci` int(2)
,`Ilosc_dni_urlopu` int(3)
,`Nr_kierownika` int(11)
,`Nr_stanowiska` int(3)
,`Nr_sklepu` int(4)
,`Aktywna_od` date
,`Aktywna_do` date
,`Typ` varchar(20)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `pracownicy_viwe3_zad5`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `pracownicy_viwe3_zad5` (
`Nr_Pracownika` int(11)
,`Imie` varchar(50)
,`Nazwisko` varchar(50)
,`Pesel` int(11)
,`Rok_zatrudnienia` date
,`Liczba_Dzieci` int(2)
,`Ilosc_dni_urlopu` int(3)
,`Nr_kierownika` int(11)
,`Nr_stanowiska` int(3)
,`Nr_sklepu` int(4)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `pracownicy_viwe_zad5`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `pracownicy_viwe_zad5` (
`Nr_Pracownika` int(11)
,`Imie` varchar(50)
,`Nazwisko` varchar(50)
,`Pesel` int(11)
,`Rok_zatrudnienia` date
,`Liczba_Dzieci` int(2)
,`Ilosc_dni_urlopu` int(3)
,`Nr_kierownika` int(11)
,`Nr_stanowiska` int(3)
,`Nr_sklepu` int(4)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `pracownicy_widok_zad4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `pracownicy_widok_zad4` (
`pesel` int(11)
,`Imie` varchar(50)
,`Nazwisko` varchar(50)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `pracownik_placa_zad4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `pracownik_placa_zad4` (
`Nr_Pracownika` int(11)
,`Imie` varchar(50)
,`Nazwisko` varchar(50)
,`Nazwa_stanowiska` varchar(25)
,`Placa` int(7)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `pracownik_sklep_zad4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `pracownik_sklep_zad4` (
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `pracownik_stanowiska_zad4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `pracownik_stanowiska_zad4` (
`Nr_stanowiska` int(3)
,`Nazwa_stanowiska` varchar(25)
,`Placa` int(7)
,`Nr_Pracownika` int(11)
,`Imie` varchar(50)
,`Nazwisko` varchar(50)
,`Pesel` int(11)
,`Rok_zatrudnienia` date
,`Liczba_Dzieci` int(2)
,`Ilosc_dni_urlopu` int(3)
,`Nr_kierownika` int(11)
,`Nr_sklepu` int(4)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `procownicy_kasjer_zad5`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `procownicy_kasjer_zad5` (
`Imie` varchar(50)
,`Nazwisko` varchar(50)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `procownicy_notkasjer_zad5`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `procownicy_notkasjer_zad5` (
`Imie` varchar(50)
,`Nazwisko` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sesja`
--

CREATE TABLE `sesja` (
  `Nr_Sesji` int(11) NOT NULL,
  `Nr_Pracownika` int(11) DEFAULT NULL,
  `Czas_logowania` date DEFAULT NULL,
  `IP` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typ_uprawnien`
--

CREATE TABLE `typ_uprawnien` (
  `Nr_uprawnien` int(3) NOT NULL,
  `Nazwa_prawnien` varchar(30) DEFAULT NULL,
  `Odczyt` int(1) DEFAULT NULL,
  `Zapis` int(1) DEFAULT NULL,
  `Wykonywanie` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `union_view_zad7`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `union_view_zad7` (
`Imie` varchar(50)
,`Nazwisko` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `Nr_Pracownika` int(11) NOT NULL,
  `Login` varchar(30) DEFAULT NULL,
  `Haslo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy_typ_uprawnien`
--

CREATE TABLE `uzytkownicy_typ_uprawnien` (
  `Nr_Pracownika` int(11) DEFAULT NULL,
  `Nr_uprawnien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura widoku `except_view_zad7`
--
DROP TABLE IF EXISTS `except_view_zad7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `except_view_zad7`  AS  select `pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko` from `pracownicy` except select `kierownicy`.`Imie` AS `Imie`,`kierownicy`.`Nazwisko` AS `Nazwisko` from `kierownicy` ;

-- --------------------------------------------------------

--
-- Struktura widoku `groupp_zad6`
--
DROP TABLE IF EXISTS `groupp_zad6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `groupp_zad6`  AS  select `pracownicy`.`Nr_stanowiska` AS `Nr_stanowiska`,count(0) AS `COUNT(*)` from `pracownicy` group by `pracownicy`.`Nr_stanowiska` ;

-- --------------------------------------------------------

--
-- Struktura widoku `having_view_zad6`
--
DROP TABLE IF EXISTS `having_view_zad6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `having_view_zad6`  AS  select `pracownicy`.`Liczba_Dzieci` AS `Liczba_Dzieci` from `pracownicy` group by `pracownicy`.`Liczba_Dzieci` having `pracownicy`.`Liczba_Dzieci` > 1 ;

-- --------------------------------------------------------

--
-- Struktura widoku `intersect_view_zad7`
--
DROP TABLE IF EXISTS `intersect_view_zad7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `intersect_view_zad7`  AS  select `pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko` from `pracownicy` intersect select `kierownicy`.`Imie` AS `Imie`,`kierownicy`.`Nazwisko` AS `Nazwisko` from `kierownicy` ;

-- --------------------------------------------------------

--
-- Struktura widoku `kierownicy_widok_zad4`
--
DROP TABLE IF EXISTS `kierownicy_widok_zad4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kierownicy_widok_zad4`  AS  select `kierownicy`.`Nr_kierownika` AS `Nr_kierownika`,`kierownicy`.`Imie` AS `Imie`,`kierownicy`.`Nazwisko` AS `Nazwisko`,`kierownicy`.`Nr_kierownika_rejonu` AS `Nr_kierownika_rejonu`,`kierownicy`.`Nr_sklepu` AS `Nr_sklepu` from `kierownicy` ;

-- --------------------------------------------------------

--
-- Struktura widoku `kier_rejonu_sklep_zad4`
--
DROP TABLE IF EXISTS `kier_rejonu_sklep_zad4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kier_rejonu_sklep_zad4`  AS  select `kierownicy_rejonu`.`Imie` AS `Imie`,`kierownicy_rejonu`.`Nazwisko` AS `Nazwisko`,`kierownicy_rejonu`.`Region` AS `Region`,`lista_sklepow`.`Nr_sklepu` AS `Nr_sklepu` from (`lista_sklepow` left join `kierownicy_rejonu` on(`lista_sklepow`.`Nr_kierownika_rejonu` = `kierownicy_rejonu`.`Nr_kierownika_rejonu`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `kier_rejonu_zad5`
--
DROP TABLE IF EXISTS `kier_rejonu_zad5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kier_rejonu_zad5`  AS  select `kierownicy_rejonu`.`Imie` AS `Imie`,`kierownicy_rejonu`.`Nazwisko` AS `Nazwisko`,`kierownicy_rejonu`.`Region` AS `Region` from `kierownicy_rejonu` where `kierownicy_rejonu`.`Nr_kierownika_rejonu` in (select `lista_sklepow`.`Nr_kierownika_rejonu` from `lista_sklepow` where `lista_sklepow`.`Miejscowosc` = 'Kraków') ;

-- --------------------------------------------------------

--
-- Struktura widoku `lista_sklepow_widok_zad4`
--
DROP TABLE IF EXISTS `lista_sklepow_widok_zad4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lista_sklepow_widok_zad4`  AS  select `lista_sklepow`.`Nr_sklepu` AS `nr_Sklepu`,`lista_sklepow`.`Miejscowosc` AS `Miejscowosc` from `lista_sklepow` ;

-- --------------------------------------------------------

--
-- Struktura widoku `math_pracownicyaddzatru_zad6`
--
DROP TABLE IF EXISTS `math_pracownicyaddzatru_zad6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `math_pracownicyaddzatru_zad6`  AS  select `pracownicy`.`Nr_Pracownika` AS `Nr_pracownika`,`pracownicy`.`Rok_zatrudnienia` + interval 10 day AS `adddate(Rok_zatrudnienia,10)` from `pracownicy` ;

-- --------------------------------------------------------

--
-- Struktura widoku `math_pracownicy_haslorandom1_zad6`
--
DROP TABLE IF EXISTS `math_pracownicy_haslorandom1_zad6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `math_pracownicy_haslorandom1_zad6`  AS  select `pracownicy`.`Nr_Pracownika` AS `Nr_pracownika`,rand() * 100 AS `rand()*100` from `pracownicy` ;

-- --------------------------------------------------------

--
-- Struktura widoku `math_pracownicy_urlop15_zad6`
--
DROP TABLE IF EXISTS `math_pracownicy_urlop15_zad6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `math_pracownicy_urlop15_zad6`  AS  select `pracownicy`.`Nr_Pracownika` AS `Nr_pracownika`,`pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko` from `pracownicy` where `pracownicy`.`Ilosc_dni_urlopu` between 15 and 25 ;

-- --------------------------------------------------------

--
-- Struktura widoku `pracownicy_karta_multi_zad4`
--
DROP TABLE IF EXISTS `pracownicy_karta_multi_zad4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pracownicy_karta_multi_zad4`  AS  select `pracownicy`.`Nr_Pracownika` AS `Nr_Pracownika`,`karta_multisport`.`Nr_karty_multisport` AS `Nr_karty_multisport`,`pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko`,`pracownicy`.`Pesel` AS `Pesel`,`pracownicy`.`Rok_zatrudnienia` AS `Rok_zatrudnienia`,`pracownicy`.`Liczba_Dzieci` AS `Liczba_Dzieci`,`pracownicy`.`Ilosc_dni_urlopu` AS `Ilosc_dni_urlopu`,`pracownicy`.`Nr_kierownika` AS `Nr_kierownika`,`pracownicy`.`Nr_stanowiska` AS `Nr_stanowiska`,`pracownicy`.`Nr_sklepu` AS `Nr_sklepu`,`karta_multisport`.`Aktywna_od` AS `Aktywna_od`,`karta_multisport`.`Aktywna_do` AS `Aktywna_do`,`karta_multisport`.`Typ` AS `Typ` from ((`pracownicy` join `karta_multisport`) join `nr_multisport_nr_pracownika` on(`pracownicy`.`Nr_Pracownika` = `nr_multisport_nr_pracownika`.`Nr_pracownika` and `karta_multisport`.`Nr_karty_multisport` = `nr_multisport_nr_pracownika`.`Nr_karty_multisport`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `pracownicy_viwe3_zad5`
--
DROP TABLE IF EXISTS `pracownicy_viwe3_zad5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pracownicy_viwe3_zad5`  AS  select `pracownicy`.`Nr_Pracownika` AS `Nr_Pracownika`,`pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko`,`pracownicy`.`Pesel` AS `Pesel`,`pracownicy`.`Rok_zatrudnienia` AS `Rok_zatrudnienia`,`pracownicy`.`Liczba_Dzieci` AS `Liczba_Dzieci`,`pracownicy`.`Ilosc_dni_urlopu` AS `Ilosc_dni_urlopu`,`pracownicy`.`Nr_kierownika` AS `Nr_kierownika`,`pracownicy`.`Nr_stanowiska` AS `Nr_stanowiska`,`pracownicy`.`Nr_sklepu` AS `Nr_sklepu` from `pracownicy` where !(`pracownicy`.`Nr_stanowiska` in (select `lista_stanowisk`.`Nr_stanowiska` from `lista_stanowisk`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `pracownicy_viwe_zad5`
--
DROP TABLE IF EXISTS `pracownicy_viwe_zad5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pracownicy_viwe_zad5`  AS  select `pracownicy`.`Nr_Pracownika` AS `Nr_Pracownika`,`pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko`,`pracownicy`.`Pesel` AS `Pesel`,`pracownicy`.`Rok_zatrudnienia` AS `Rok_zatrudnienia`,`pracownicy`.`Liczba_Dzieci` AS `Liczba_Dzieci`,`pracownicy`.`Ilosc_dni_urlopu` AS `Ilosc_dni_urlopu`,`pracownicy`.`Nr_kierownika` AS `Nr_kierownika`,`pracownicy`.`Nr_stanowiska` AS `Nr_stanowiska`,`pracownicy`.`Nr_sklepu` AS `Nr_sklepu` from `pracownicy` where `pracownicy`.`Nr_stanowiska` <> any (select `lista_stanowisk`.`Nr_stanowiska` from `lista_stanowisk`) ;

-- --------------------------------------------------------

--
-- Struktura widoku `pracownicy_widok_zad4`
--
DROP TABLE IF EXISTS `pracownicy_widok_zad4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pracownicy_widok_zad4`  AS  select `pracownicy`.`Pesel` AS `pesel`,`pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko` from `pracownicy` ;

-- --------------------------------------------------------

--
-- Struktura widoku `pracownik_placa_zad4`
--
DROP TABLE IF EXISTS `pracownik_placa_zad4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pracownik_placa_zad4`  AS  select `pracownicy`.`Nr_Pracownika` AS `Nr_Pracownika`,`pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko`,`lista_stanowisk`.`Nazwa_stanowiska` AS `Nazwa_stanowiska`,`lista_stanowisk`.`Placa` AS `Placa` from (`pracownicy` left join `lista_stanowisk` on(`pracownicy`.`Nr_stanowiska` = `lista_stanowisk`.`Nr_stanowiska`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `pracownik_sklep_zad4`
--
DROP TABLE IF EXISTS `pracownik_sklep_zad4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pracownik_sklep_zad4`  AS  select `lista_sklepow`.`Nr_sklepu` AS `Nr_sklepu`,`lista_sklepow`.`Nr_kierownika` AS `Nr_kierownika`,`lista_sklepow`.`Miejscowosc` AS `Miejscowosc`,`lista_sklepow`.`Liczba_pracownikow` AS `Liczba_pracownikow`,`lista_sklepow`.`Nr_kierownika_rejonu` AS `Nr_kierownika_rejonu`,`pracownicy`.`Nr_Pracownika` AS `Nr_Pracownika`,`pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko`,`pracownicy`.`Pesel` AS `Pesel`,`pracownicy`.`Rok_zatrudnienia` AS `Rok_zatrudnienia`,`pracownicy`.`Liczba_Dzieci` AS `Liczba_Dzieci`,`pracownicy`.`Ilosc_dni_urlopu` AS `Ilosc_dni_urlopu`,`pracownicy`.`Nr_stanowiska` AS `Nr_stanowiska` from (`lista_sklepow` join `pracownicy` on(`lista_sklepow`.`Nr_sklepu` = `pracownicy`.`Nr_sklepu` and `lista_sklepow`.`Nr_kierownika` = `pracownicy`.`Nr_kierownika`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `pracownik_stanowiska_zad4`
--
DROP TABLE IF EXISTS `pracownik_stanowiska_zad4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pracownik_stanowiska_zad4`  AS  select `lista_stanowisk`.`Nr_stanowiska` AS `Nr_stanowiska`,`lista_stanowisk`.`Nazwa_stanowiska` AS `Nazwa_stanowiska`,`lista_stanowisk`.`Placa` AS `Placa`,`pracownicy`.`Nr_Pracownika` AS `Nr_Pracownika`,`pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko`,`pracownicy`.`Pesel` AS `Pesel`,`pracownicy`.`Rok_zatrudnienia` AS `Rok_zatrudnienia`,`pracownicy`.`Liczba_Dzieci` AS `Liczba_Dzieci`,`pracownicy`.`Ilosc_dni_urlopu` AS `Ilosc_dni_urlopu`,`pracownicy`.`Nr_kierownika` AS `Nr_kierownika`,`pracownicy`.`Nr_sklepu` AS `Nr_sklepu` from (`lista_stanowisk` join `pracownicy` on(`lista_stanowisk`.`Nr_stanowiska` = `pracownicy`.`Nr_stanowiska`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `procownicy_kasjer_zad5`
--
DROP TABLE IF EXISTS `procownicy_kasjer_zad5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `procownicy_kasjer_zad5`  AS  select `pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko` from `pracownicy` where !exists(select 1 from `lista_stanowisk` where `pracownicy`.`Nr_stanowiska` = `lista_stanowisk`.`Nr_stanowiska` and `lista_stanowisk`.`Nazwa_stanowiska` <> 'Kasjer' limit 1) ;

-- --------------------------------------------------------

--
-- Struktura widoku `procownicy_notkasjer_zad5`
--
DROP TABLE IF EXISTS `procownicy_notkasjer_zad5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `procownicy_notkasjer_zad5`  AS  select `pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko` from `pracownicy` where exists(select 1 from `lista_stanowisk` where `pracownicy`.`Nr_stanowiska` = `lista_stanowisk`.`Nr_stanowiska` and `lista_stanowisk`.`Nazwa_stanowiska` <> 'Kasjer' limit 1) ;

-- --------------------------------------------------------

--
-- Struktura widoku `union_view_zad7`
--
DROP TABLE IF EXISTS `union_view_zad7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `union_view_zad7`  AS  select `pracownicy`.`Imie` AS `Imie`,`pracownicy`.`Nazwisko` AS `Nazwisko` from `pracownicy` union select `kierownicy`.`Imie` AS `Imie`,`kierownicy`.`Nazwisko` AS `Nazwisko` from `kierownicy` ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `historia_sesji`
--
ALTER TABLE `historia_sesji`
  ADD PRIMARY KEY (`Nr_historii_logowania`),
  ADD KEY `Nr_sesji` (`Nr_sesji`),
  ADD KEY `Nr_Pracownika` (`Nr_Pracownika`);

--
-- Indeksy dla tabeli `karta_multisport`
--
ALTER TABLE `karta_multisport`
  ADD PRIMARY KEY (`Nr_karty_multisport`);

--
-- Indeksy dla tabeli `kierownicy`
--
ALTER TABLE `kierownicy`
  ADD PRIMARY KEY (`Nr_kierownika`);

--
-- Indeksy dla tabeli `kierownicy_rejonu`
--
ALTER TABLE `kierownicy_rejonu`
  ADD PRIMARY KEY (`Nr_kierownika_rejonu`);

--
-- Indeksy dla tabeli `lista_sklepow`
--
ALTER TABLE `lista_sklepow`
  ADD PRIMARY KEY (`Nr_sklepu`);

--
-- Indeksy dla tabeli `lista_stanowisk`
--
ALTER TABLE `lista_stanowisk`
  ADD PRIMARY KEY (`Nr_stanowiska`);

--
-- Indeksy dla tabeli `nr_multisport_nr_pracownika`
--
ALTER TABLE `nr_multisport_nr_pracownika`
  ADD KEY `Nr_pracownika` (`Nr_pracownika`),
  ADD KEY `Nr_karty_multisport` (`Nr_karty_multisport`);

--
-- Indeksy dla tabeli `nr_pracownika_baza_sesja`
--
ALTER TABLE `nr_pracownika_baza_sesja`
  ADD KEY `Nr_Pracownika_baza` (`Nr_Pracownika_baza`),
  ADD KEY `Nr_Pracownika_sesja` (`Nr_Pracownika_sesja`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`Nr_Pracownika`);

--
-- Indeksy dla tabeli `sesja`
--
ALTER TABLE `sesja`
  ADD PRIMARY KEY (`Nr_Sesji`),
  ADD KEY `Nr_Pracownika` (`Nr_Pracownika`);

--
-- Indeksy dla tabeli `typ_uprawnien`
--
ALTER TABLE `typ_uprawnien`
  ADD PRIMARY KEY (`Nr_uprawnien`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`Nr_Pracownika`);

--
-- Indeksy dla tabeli `uzytkownicy_typ_uprawnien`
--
ALTER TABLE `uzytkownicy_typ_uprawnien`
  ADD KEY `Nr_Pracownika` (`Nr_Pracownika`),
  ADD KEY `Nr_uprawnien` (`Nr_uprawnien`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `historia_sesji`
--
ALTER TABLE `historia_sesji`
  MODIFY `Nr_historii_logowania` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `karta_multisport`
--
ALTER TABLE `karta_multisport`
  MODIFY `Nr_karty_multisport` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `kierownicy`
--
ALTER TABLE `kierownicy`
  MODIFY `Nr_kierownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `kierownicy_rejonu`
--
ALTER TABLE `kierownicy_rejonu`
  MODIFY `Nr_kierownika_rejonu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `lista_sklepow`
--
ALTER TABLE `lista_sklepow`
  MODIFY `Nr_sklepu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `sesja`
--
ALTER TABLE `sesja`
  MODIFY `Nr_Sesji` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `typ_uprawnien`
--
ALTER TABLE `typ_uprawnien`
  MODIFY `Nr_uprawnien` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `Nr_Pracownika` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `historia_sesji`
--
ALTER TABLE `historia_sesji`
  ADD CONSTRAINT `historia_sesji_ibfk_1` FOREIGN KEY (`Nr_sesji`) REFERENCES `sesja` (`Nr_Sesji`),
  ADD CONSTRAINT `historia_sesji_ibfk_2` FOREIGN KEY (`Nr_Pracownika`) REFERENCES `uzytkownicy` (`Nr_Pracownika`);

--
-- Ograniczenia dla tabeli `nr_multisport_nr_pracownika`
--
ALTER TABLE `nr_multisport_nr_pracownika`
  ADD CONSTRAINT `nr_multisport_nr_pracownika_ibfk_1` FOREIGN KEY (`Nr_pracownika`) REFERENCES `pracownicy` (`Nr_Pracownika`),
  ADD CONSTRAINT `nr_multisport_nr_pracownika_ibfk_2` FOREIGN KEY (`Nr_karty_multisport`) REFERENCES `karta_multisport` (`Nr_karty_multisport`);

--
-- Ograniczenia dla tabeli `nr_pracownika_baza_sesja`
--
ALTER TABLE `nr_pracownika_baza_sesja`
  ADD CONSTRAINT `nr_pracownika_baza_sesja_ibfk_1` FOREIGN KEY (`Nr_Pracownika_baza`) REFERENCES `pracownicy` (`Nr_Pracownika`),
  ADD CONSTRAINT `nr_pracownika_baza_sesja_ibfk_2` FOREIGN KEY (`Nr_Pracownika_sesja`) REFERENCES `uzytkownicy` (`Nr_Pracownika`);

--
-- Ograniczenia dla tabeli `sesja`
--
ALTER TABLE `sesja`
  ADD CONSTRAINT `sesja_ibfk_1` FOREIGN KEY (`Nr_Pracownika`) REFERENCES `uzytkownicy` (`Nr_Pracownika`);

--
-- Ograniczenia dla tabeli `uzytkownicy_typ_uprawnien`
--
ALTER TABLE `uzytkownicy_typ_uprawnien`
  ADD CONSTRAINT `uzytkownicy_typ_uprawnien_ibfk_1` FOREIGN KEY (`Nr_Pracownika`) REFERENCES `uzytkownicy` (`Nr_Pracownika`),
  ADD CONSTRAINT `uzytkownicy_typ_uprawnien_ibfk_2` FOREIGN KEY (`Nr_uprawnien`) REFERENCES `typ_uprawnien` (`Nr_uprawnien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

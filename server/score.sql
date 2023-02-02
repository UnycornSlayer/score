-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2023 at 01:31 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `score`
--

-- --------------------------------------------------------

--
-- Table structure for table `leagues`
--

CREATE TABLE `leagues` (
  `id` smallint(6) NOT NULL,
  `season_id` smallint(6) NOT NULL,
  `name` text NOT NULL,
  `logo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leagues`
--

INSERT INTO `leagues` (`id`, `season_id`, `name`, `logo`) VALUES
(1, 1, 'Primeira Liga', 'https://media.api-sports.io/football/leagues/94.png'),
(2, 1, 'Segunda Liga', 'https://media-3.api-sports.io/football/leagues/95.png'),
(3, 2, 'Primeira Liga', 'https://media.api-sports.io/football/leagues/94.png'),
(4, 2, 'Segunda Liga', 'https://media-3.api-sports.io/football/leagues/95.png'),
(5, 3, 'Primeira Liga', 'https://media.api-sports.io/football/leagues/94.png'),
(6, 3, 'Segunda Liga', 'https://media-3.api-sports.io/football/leagues/95.png');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` smallint(6) NOT NULL,
  `api_id` smallint(6) NOT NULL,
  `team_id` smallint(6) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `birth_date` text NOT NULL,
  `nationality` text NOT NULL,
  `height` text NOT NULL,
  `weight` text NOT NULL,
  `photo` longtext NOT NULL,
  `antidopping_date` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `api_id`, `team_id`, `first_name`, `last_name`, `birth_date`, `nationality`, `height`, `weight`, `photo`, `antidopping_date`) VALUES
(1, 1571, 3, 'Francisco Javier', 'García Fernández', '1987-02-08', 'Spain', '187 cm', '82 kg', 'https://media.api-sports.io/football/players/1571.png', NULL),
(2, 10153, 3, 'César Bernardo', 'Dutra', '1992-01-27', 'Brazil', '194 cm', '84 kg', 'https://media.api-sports.io/football/players/10153.png', NULL),
(3, 32767, 3, 'Ibrahima', 'Camará', '1999-01-25', 'Guinea', '190 cm', '76 kg', 'https://media.api-sports.io/football/players/41126.png', NULL),
(4, 32767, 3, 'Vincent Julien', 'Sasso', '1991-02-16', 'France', '190 cm', '82 kg', 'https://media-3.api-sports.io/football/players/41238.png', NULL),
(5, 32767, 3, 'Rafael', 'Wihby Bracali', '1981-05-05', 'Brazil', '185 cm', '80 kg', 'https://media.api-sports.io/football/players/41295.png', NULL),
(6, 32767, 3, 'Ricardo Luís', 'Chaby Mangas', '1998-03-19', 'Portugal', '179 cm', '66 kg', 'https://media.api-sports.io/football/players/41324.png', NULL),
(7, 32767, 3, 'Filipe Miguel', 'Neves Ferreira', '1990-09-27', 'Portugal', '178 cm', '70 kg', 'https://media.api-sports.io/football/players/41463.png', NULL),
(8, 32767, 3, 'Reginald Jacob', 'Cannon', '1998-06-11', 'USA', '181 cm', '74 kg', 'https://media.api-sports.io/football/players/51123.png', NULL),
(9, 32767, 3, 'Rodrigo', 'Abascal Barros', '1994-01-14', 'Uruguay', '187 cm', '88 kg', 'https://media-3.api-sports.io/football/players/51478.png', NULL),
(10, 32767, 3, 'Bruno Miguel', 'Ponces Lourenço', '1998-02-02', 'Portugal', '179 cm', '67 kg', 'https://media.api-sports.io/football/players/64265.png', NULL),
(11, 32767, 3, 'Jeriel Nicolás', 'De Santis Córdova', '2002-06-18', 'Venezuela', '190 cm', '83 kg', 'https://media-3.api-sports.io/football/players/67947.png', NULL),
(12, 32767, 3, 'Paul-Georges', 'Ntep de Madiba', '1992-07-29', 'Cameroon', '180 cm', '80 kg', 'https://media-3.api-sports.io/football/players/71567.png', NULL),
(13, 32767, 3, 'Yanis', 'Hamache', '1999-07-13', 'Algeria', '177 cm', '73 kg', 'https://media.api-sports.io/football/players/87306.png', NULL),
(14, 32767, 3, 'João Pedro', 'Oliveira Gonçalves', '2000-11-05', 'Portugal', '188 cm', '82 kg', 'https://media.api-sports.io/football/players/129774.png', NULL),
(15, 32767, 3, 'Nathan', 'Santos de Araújo', '2001-09-05', 'Brazil', '183 cm', '75 kg', 'https://media-3.api-sports.io/football/players/197035.png', NULL),
(16, 32767, 3, 'Tiago', 'Fontoura Fonseca Morais', '2003-09-03', 'Portugal', '', '', 'https://media.api-sports.io/football/players/278783.png', NULL),
(17, 32767, 3, 'Robson', 'Alves Reis', '2000-05-21', 'Brazil', '', '', 'https://media-3.api-sports.io/football/players/279810.png', NULL),
(18, 32767, 3, 'Diego', 'Llorente Salmerón', '2001-10-08', 'Spain', '179 cm', '', 'https://media.api-sports.io/football/players/337513.png', NULL),
(19, 32767, 3, 'Julio', 'Augusto Dabo', '2004-03-13', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/379077.png', NULL),
(20, 32767, 3, 'Pedro', 'Injai Gomes', '2003-06-04', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/379079.png', NULL),
(21, 1337, 2, 'Berke', 'Özer', '2000-05-25', 'Turkey', '190 cm', '73 kg', 'https://media.api-sports.io/football/players/1337.png', NULL),
(22, 2681, 2, 'Seyed Payam', 'Niazmand Ghader', '1995-04-06', 'Iran', '193 cm', '86 kg', 'https://media.api-sports.io/football/players/2681.png', NULL),
(23, 13683, 2, 'Juan Esteban', 'Ocampo Rubio', '1999-02-18', 'Colombia', '', '', 'https://media-3.api-sports.io/football/players/13683.png', NULL),
(24, 19376, 2, 'Achraf', 'Lazaar', '1992-01-22', 'Morocco', '184 cm', '80 kg', 'https://media-3.api-sports.io/football/players/19376.png', NULL),
(25, 32767, 2, 'Fabrício', 'dos Santos Messias', '1990-03-28', 'Brazil', '183 cm', '78 kg', 'https://media-3.api-sports.io/football/players/33108.png', NULL),
(26, 32767, 2, 'Raphael Aflalo', 'Lopes Martins', '1996-07-08', 'Brazil', '190 cm', '82 kg', 'https://media.api-sports.io/football/players/41319.png', NULL),
(27, 32767, 2, 'Leonardo', 'Navacchio', '1992-12-28', 'Brazil', '189 cm', '77 kg', 'https://media-3.api-sports.io/football/players/41350.png', NULL),
(28, 32767, 2, 'Henrique', 'Gelain Custódio', '1995-01-05', 'Brazil', '179 cm', '81 kg', 'https://media.api-sports.io/football/players/41352.png', NULL),
(29, 32767, 2, 'Willyan', 'da Silva Rocha', '1995-01-27', 'Brazil', '193 cm', '86 kg', 'https://media.api-sports.io/football/players/41765.png', NULL),
(30, 32767, 2, 'Gilbert Gianelli', 'Imbula Wanga', '1992-09-12', 'Congo DR', '186 cm', '78 kg', 'https://media-3.api-sports.io/football/players/47544.png', NULL),
(31, 32767, 2, 'Samuel', 'Portugal Lima', '1994-03-29', 'Brazil', '180 cm', '80 kg', 'https://media-3.api-sports.io/football/players/80667.png', NULL),
(32, 32767, 2, 'Vinícius', 'Szeuczuk Ribeiro', '1997-08-05', 'Brazil', '191 cm', '81 kg', 'https://media.api-sports.io/football/players/106458.png', NULL),
(33, 32767, 2, 'Shuhei', 'Kawasaki', '2001-04-28', 'Japan', '168 cm', '66 kg', 'https://media-3.api-sports.io/football/players/109397.png', NULL),
(34, 32767, 2, 'Adewale Oluwafemi', 'Sapara', '1995-01-27', 'Nigeria', '175 cm', '68 kg', 'https://media.api-sports.io/football/players/142488.png', NULL),
(35, 32767, 2, 'João Henrique', 'Oliveira Veras', '2000-10-26', 'Brazil', '187 cm', '73 kg', 'https://media.api-sports.io/football/players/195461.png', NULL),
(36, 32767, 2, 'Wilinton', 'Aponzá Carabali', '2000-03-29', 'Colombia', '', '', 'https://media.api-sports.io/football/players/201700.png', NULL),
(37, 32767, 2, 'Mateus', 'Oliveira Mendes', '2002-05-02', 'Brazil', '199 cm', '89 kg', 'https://media.api-sports.io/football/players/278331.png', NULL),
(38, 32767, 2, 'Sana', 'Dafa Gomes', '2002-07-09', 'Guinea-Bissau', '', '', 'https://media.api-sports.io/football/players/323611.png', NULL),
(39, 32767, 2, 'Felipe Dini', 'da Cruz Pires', '1999-09-21', 'Brazil', '183 cm', '', 'https://media-3.api-sports.io/football/players/323795.png', NULL),
(40, 32767, 2, 'Francisco André', 'Ferreira Cardoso', '1998-12-19', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/326834.png', NULL),
(41, 27, 5, 'Antonio', 'Adán Garrido', '1987-05-13', 'Spain', '190 cm', '86 kg', 'https://media-3.api-sports.io/football/players/27.png', NULL),
(42, 298, 5, 'Rafael Euclides', 'Soares Camacho', '2000-05-22', 'Portugal', '175 cm', '65 kg', 'https://media.api-sports.io/football/players/298.png', NULL),
(43, 1374, 5, 'Islam', 'Slimani', '1988-06-18', 'Algeria', '188 cm', '83 kg', 'https://media.api-sports.io/football/players/1374.png', NULL),
(44, 1484, 5, 'Rodrigo Andrés', 'Battaglia', '1991-07-12', 'Argentina', '187 cm', '79 kg', 'https://media.api-sports.io/football/players/1484.png', NULL),
(45, 1499, 5, 'Pedro David', 'Rosendo Marques', '1998-04-25', 'Portugal', '181 cm', '77 kg', 'https://media.api-sports.io/football/players/1499.png', NULL),
(46, 1563, 5, 'Zouhair', 'Feddal Agharbi', '1989-12-23', 'Morocco', '192 cm', '84 kg', 'https://media.api-sports.io/football/players/1563.png', NULL),
(47, 16369, 5, 'Gonzalo Jordy', 'Plata Jiménez', '2000-11-01', 'Ecuador', '178 cm', '65 kg', 'https://media.api-sports.io/football/players/16369.png', NULL),
(48, 18755, 5, 'João Manuel', 'Neves Virgínia', '1999-10-10', 'Portugal', '193 cm', '83 kg', 'https://media.api-sports.io/football/players/18755.png', NULL),
(49, 32767, 5, 'Jeremiah', 'St. Juste', '1996-10-19', 'Netherlands', '184 cm', '74 kg', 'https://media.api-sports.io/football/players/37148.png', NULL),
(50, 32767, 5, 'Matheus', 'Reis de Lima', '1995-02-18', 'Brazil', '183 cm', '80 kg', 'https://media-3.api-sports.io/football/players/41179.png', NULL),
(51, 32767, 5, 'Eduardo Henrique', 'da Silva', '1995-05-17', 'Brazil', '184 cm', '73 kg', 'https://media-3.api-sports.io/football/players/41241.png', NULL),
(52, 32767, 5, 'Bruno Vinícius', 'Souza Ramos', '1997-03-30', 'Brazil', '175 cm', '72 kg', 'https://media-3.api-sports.io/football/players/41368.png', NULL),
(53, 32767, 5, 'Andraž', 'Šporar', '1994-02-27', 'Slovenia', '186 cm', '82 kg', 'https://media-3.api-sports.io/football/players/56026.png', NULL),
(54, 32767, 5, 'Franco', 'Israel Wibmer', '2000-04-22', 'Uruguay', '186 cm', '76 kg', 'https://media.api-sports.io/football/players/56266.png', NULL),
(55, 32767, 5, 'André Filipe', 'Eusébio Paulo', '1996-12-18', 'Portugal', '188 cm', '76 kg', 'https://media-3.api-sports.io/football/players/142411.png', NULL),
(56, 32767, 5, 'João Pedro', 'Goulart Silva', '2000-01-27', 'Portugal', '191 cm', '', 'https://media-3.api-sports.io/football/players/163481.png', NULL),
(57, 32767, 5, 'Tiago Barreiros', 'de Melo Tomás', '2002-06-16', 'Portugal', '180 cm', '78 kg', 'https://media-3.api-sports.io/football/players/265363.png', NULL),
(58, 32767, 5, 'Tiago Filipe', 'Prazeres Ferreira', '2002-03-18', 'Portugal', '174 cm', '64 kg', 'https://media.api-sports.io/football/players/304735.png', NULL),
(59, 32767, 5, 'Gonçalo do Lago', 'Pontes Esteves', '2004-02-27', 'Portugal', '171 cm', '', 'https://media-3.api-sports.io/football/players/325052.png', NULL),
(60, 32767, 5, 'Diego', 'Callai Silva', '2004-07-18', 'Brazil', '190 cm', '90 kg', 'https://media.api-sports.io/football/players/330296.png', NULL),
(61, 145, 6, 'Oriol', 'Busquets Mas', '1999-01-20', 'Spain', '185 cm', '77 kg', 'https://media-3.api-sports.io/football/players/145.png', NULL),
(62, 8457, 6, 'David', 'Martins Simão', '1990-05-15', 'Portugal', '183 cm', '77 kg', 'https://media.api-sports.io/football/players/8457.png', NULL),
(63, 10011, 6, 'Fernando Augusto', 'de Castro Ribeiro', '1997-03-30', 'Brazil', '195 cm', '95 kg', 'https://media.api-sports.io/football/players/10011.png', NULL),
(64, 10154, 6, 'Thiago', 'Rodrigues da Silva', '1996-06-12', 'Brazil', '185 cm', '75 kg', 'https://media.api-sports.io/football/players/10154.png', NULL),
(65, 32767, 6, 'Nino', 'Galović', '1992-07-06', 'Croatia', '186 cm', '79 kg', 'https://media-3.api-sports.io/football/players/33389.png', NULL),
(66, 32767, 6, 'João Nuno', 'Figueiredo Valido', '2000-03-03', 'Portugal', '185 cm', '76 kg', 'https://media-3.api-sports.io/football/players/41377.png', NULL),
(67, 32767, 6, 'Marco Paulo', 'Silva Soares', '1984-06-16', 'Cape Verde', '180 cm', '75 kg', 'https://media.api-sports.io/football/players/41497.png', NULL),
(68, 32767, 6, 'João', 'Othávio Basso', '1997-01-13', 'Brazil', '187 cm', '', 'https://media.api-sports.io/football/players/41609.png', NULL),
(69, 32767, 6, 'André', 'Watshini Bukia', '1995-03-03', 'Congo DR', '173 cm', '69 kg', 'https://media.api-sports.io/football/players/41930.png', NULL),
(70, 32767, 6, 'Ignacio', 'De Arruabarrena Fernández', '1997-01-16', 'Uruguay', '186 cm', '81 kg', 'https://media.api-sports.io/football/players/51762.png', NULL),
(71, 32767, 6, 'Emilijus', 'Zubas', '1990-07-10', 'Lithuania', '195 cm', '80 kg', 'https://media.api-sports.io/football/players/55890.png', NULL),
(72, 32767, 6, 'Mustafa', 'Kizza', '1999-10-03', 'Uganda', '', '', 'https://media-3.api-sports.io/football/players/67978.png', NULL),
(73, 32767, 6, 'José Manuel', 'Velázquez Rodríguez', '1990-09-08', 'Venezuela', '184 cm', '77 kg', 'https://media-3.api-sports.io/football/players/95252.png', NULL),
(74, 32767, 6, 'Jerome', 'Osei Opoku', '1998-10-14', 'England', '194 cm', '79 kg', 'https://media-3.api-sports.io/football/players/137223.png', NULL),
(75, 32767, 6, 'Norbert', 'Alexandre Haymamba', '1999-03-30', 'Cameroon', '', '', 'https://media-3.api-sports.io/football/players/141557.png', NULL),
(76, 32767, 6, 'Mateus', 'Quaresma Correia', '1996-08-22', 'Brazil', '181 cm', '71 kg', 'https://media.api-sports.io/football/players/157284.png', NULL),
(77, 32767, 6, 'Bohdan', 'Milovanov', '1998-04-19', 'Ukraine', '178 cm', '75 kg', 'https://media.api-sports.io/football/players/169281.png', NULL),
(78, 32767, 6, 'Morlaye', 'Sylla', '1998-07-27', 'Guinea', '170 cm', '', 'https://media-3.api-sports.io/football/players/175413.png', NULL),
(79, 32767, 6, 'Weverson', 'Moreira da Costa', '2000-07-05', 'Brazil', '', '', 'https://media-3.api-sports.io/football/players/196101.png', NULL),
(80, 32767, 6, 'Rafael Tavares', 'Gomes Fernandes', '2002-06-28', 'Portugal', '191 cm', '83 kg', 'https://media-3.api-sports.io/football/players/330288.png', NULL),
(81, 36, 9, 'Carlos Isaac', 'Muñoz Obejero', '1998-04-30', 'Spain', '184 cm', '74 kg', 'https://media-3.api-sports.io/football/players/36.png', NULL),
(82, 13305, 9, 'Andrés De Jesús', 'Sarmiento Salas', '1998-01-15', 'Colombia', '176 cm', '58 kg', 'https://media-3.api-sports.io/football/players/13305.png', NULL),
(83, 25196, 9, 'Fabijan', 'Buntić', '1997-02-24', 'Croatia', '194 cm', '90 kg', 'https://media-3.api-sports.io/football/players/25196.png', NULL),
(84, 32767, 9, 'Ivanildo Jorge', 'Mendes Fernandes', '1996-03-26', 'Portugal', '193 cm', '83 kg', 'https://media-3.api-sports.io/football/players/41122.png', NULL),
(85, 32767, 9, 'Christian Neiva', 'Afonso', '1994-12-10', 'Portugal', '181 cm', '76 kg', 'https://media.api-sports.io/football/players/41230.png', NULL),
(86, 32767, 9, 'Bruno Ricardo', 'Valdez Wilson', '1996-12-27', 'Portugal', '192 cm', '78 kg', 'https://media-3.api-sports.io/football/players/41969.png', NULL),
(87, 32767, 9, 'Luiz Felipe', 'da Silva Nunes', '1997-04-24', 'Brazil', '197 cm', '75 kg', 'https://media-3.api-sports.io/football/players/63427.png', NULL),
(88, 32767, 9, 'Francis', 'Cann', '1998-02-06', 'Ghana', '175 cm', '', 'https://media.api-sports.io/football/players/68445.png', NULL),
(89, 32767, 9, 'Anderson', 'de Jesus Santos', '1995-03-02', 'Brazil', '185 cm', '71 kg', 'https://media.api-sports.io/football/players/80664.png', NULL),
(90, 32767, 9, 'Francisco Miguel', 'Ribeiro Tomé Tavares Bondoso', '1995-11-17', 'Portugal', '', '', 'https://media.api-sports.io/football/players/119633.png', NULL),
(91, 32767, 9, 'Mohamed', 'Aidara', '1996-11-06', 'Côte d\'Ivoire', '186 cm', '', 'https://media.api-sports.io/football/players/141858.png', NULL),
(92, 32767, 9, 'Matheus', 'Pereira de Souza', '2000-12-21', 'Brazil', '', '', 'https://media-3.api-sports.io/football/players/195091.png', NULL),
(93, 32767, 9, 'João Ricardo', 'Meireles Machado', '2001-11-02', 'Portugal', '178 cm', '68 kg', 'https://media.api-sports.io/football/players/278255.png', NULL),
(94, 32767, 9, 'Nor Nor Emmanuel', 'Maviram', '2001-04-04', 'Nigeria', '', '', 'https://media.api-sports.io/football/players/279095.png', NULL),
(95, 32767, 9, 'Manuel Mama Samba', 'Baldé', '2002-11-14', 'Guinea-Bissau', '', '', 'https://media.api-sports.io/football/players/289105.png', NULL),
(96, 32767, 9, 'Hassan', 'Usman', '2002-04-01', 'Nigeria', '', '', 'https://media.api-sports.io/football/players/306878.png', NULL),
(97, 32767, 9, 'Oluwapelumi Emmanuel', 'Adeyemo', '2002-05-21', 'Nigeria', '', '', 'https://media-3.api-sports.io/football/players/323913.png', NULL),
(98, 32767, 9, 'Gonçalo', 'Ferreira da Cunha', '2002-05-24', 'Portugal', '189 cm', '73 kg', 'https://media-3.api-sports.io/football/players/325764.png', NULL),
(99, 32767, 9, 'Tiago', 'Ventura da Silva', '2002-06-19', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/325765.png', NULL),
(100, 32767, 9, 'Abdul', 'Mohammed', '2002-03-15', 'Ghana', '', '', 'https://media.api-sports.io/football/players/325766.png', NULL),
(101, 1692, 15, 'Xavier', 'Quintillà Guasch', '1996-08-23', 'Spain', '183 cm', '70 kg', 'https://media-3.api-sports.io/football/players/1692.png', NULL),
(102, 5960, 15, 'Marcos Guillermo', 'Díaz', '1986-02-05', 'Argentina', '186 cm', '87 kg', 'https://media.api-sports.io/football/players/5960.png', NULL),
(103, 7061, 15, 'Kennedy Kofi', 'Boateng', '1996-11-29', 'Togo', '191 cm', '78 kg', 'https://media-3.api-sports.io/football/players/7061.png', NULL),
(104, 10152, 15, 'Gabriel', 'Batista de Souza', '1998-06-03', 'Brazil', '190 cm', '80 kg', 'https://media.api-sports.io/football/players/10152.png', NULL),
(105, 13645, 15, 'Óscar David', 'Barreto Pérez', '1993-04-28', 'Colombia', '173 cm', '72 kg', 'https://media.api-sports.io/football/players/13645.png', NULL),
(106, 32767, 15, 'Cristian Marcelo', 'González Tassano', '1996-07-23', 'Uruguay', '185 cm', '80 kg', 'https://media-3.api-sports.io/football/players/36833.png', NULL),
(107, 32767, 15, 'João Ricardo', 'da Silva Afonso', '1990-05-28', 'Portugal', '188 cm', '84 kg', 'https://media-3.api-sports.io/football/players/41148.png', NULL),
(108, 32767, 15, 'Marco André', 'Rocha Pereira', '1987-01-12', 'Portugal', '184 cm', '79 kg', 'https://media-3.api-sports.io/football/players/41201.png', NULL),
(109, 32767, 15, 'Diogo', 'dos Santos Cabral', '1998-10-10', 'Portugal', '180 cm', '73 kg', 'https://media-3.api-sports.io/football/players/41234.png', NULL),
(110, 32767, 15, 'Rúben Alexandre', 'Gomes Oliveira', '1994-12-14', 'Portugal', '170 cm', '70 kg', 'https://media-3.api-sports.io/football/players/41336.png', NULL),
(111, 32767, 15, 'Paulo Henrique', 'Rodrigues Cabral', '1996-10-13', 'Portugal', '180 cm', '', 'https://media.api-sports.io/football/players/41522.png', NULL),
(112, 32767, 15, 'Ricardo José', 'da Silva Fernandes', '1994-10-28', 'Portugal', '193 cm', '79 kg', 'https://media-3.api-sports.io/football/players/41537.png', NULL),
(113, 32767, 15, 'Ricardo Manuel', 'Rodrigues Vieira da Silva', '1999-05-09', 'Portugal', '184 cm', '73 kg', 'https://media-3.api-sports.io/football/players/41716.png', NULL),
(114, 32767, 15, 'Rui Pedro', 'Silva Costa', '1996-02-20', 'Portugal', '179 cm', '73 kg', 'https://media.api-sports.io/football/players/41737.png', NULL),
(115, 32767, 15, 'Patrick', 'Machado Ferreira', '1998-11-23', 'Brazil', '175 cm', '65 kg', 'https://media-3.api-sports.io/football/players/69198.png', NULL),
(116, 32767, 15, 'André Filipe', 'Rebelo Mesquita', '1997-10-10', 'Portugal', '170 cm', '70 kg', 'https://media.api-sports.io/football/players/96724.png', NULL),
(117, 32767, 15, 'Luis Felipe', 'Gómez Miranda', '1999-10-11', 'Colombia', '', '', 'https://media.api-sports.io/football/players/126094.png', NULL),
(118, 32767, 15, 'Martim Malheiro', 'Fabião Maia', '1998-05-24', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/128389.png', NULL),
(119, 32767, 15, 'Mohammad', 'Mohebi', '1998-12-20', 'Iran', '186 cm', '84 kg', 'https://media-3.api-sports.io/football/players/134217.png', NULL),
(120, 32767, 15, 'Tomás Caldas', 'Januário Carvalho Domingos', '1999-05-01', 'Portugal', '', '', 'https://media.api-sports.io/football/players/277196.png', NULL),
(121, 589, 7, 'Rodrigo Galo', 'Brito', '1986-09-19', 'Brazil', '174 cm', '70 kg', 'https://media.api-sports.io/football/players/589.png', NULL),
(122, 32767, 7, 'Kang-min', 'Choi', '2002-04-24', 'Korea Republic', '174 cm', '', 'https://media.api-sports.io/football/players/303441.png', NULL),
(123, 32767, 7, 'Hebert', 'Silva Santos', '1991-05-23', 'Brazil', '191 cm', '87 kg', 'https://media-3.api-sports.io/football/players/33850.png', NULL),
(124, 32767, 7, 'Kelechi', 'John Christian', '1998-09-07', 'Nigeria', '191 cm', '83 kg', 'https://media.api-sports.io/football/players/193213.png', NULL),
(125, 32767, 7, 'Camilo José', 'Triana Fragozo', '1997-06-17', 'Colombia', '190 cm', '86 kg', 'https://media-3.api-sports.io/football/players/81641.png', NULL),
(126, 32767, 7, 'Anderson', 'Cordeiro Costa', '1998-10-10', 'Brazil', '', '', 'https://media.api-sports.io/football/players/119892.png', NULL),
(127, 32767, 7, 'Yan Brice', 'Eteki', '1997-08-26', 'Cameroon', '180 cm', '70 kg', 'https://media.api-sports.io/football/players/46920.png', NULL),
(128, 32767, 7, 'Ricardo', 'Vaz Afonso Fernandes', '2002-08-28', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/291836.png', NULL),
(129, 32767, 7, 'Kleis', 'Bozhanaj', '2001-03-01', 'Albania', '', '', 'https://media.api-sports.io/football/players/215902.png', NULL),
(130, 32767, 7, 'Zach', 'Muscat', '1993-08-22', 'Malta', '', '', 'https://media.api-sports.io/football/players/55976.png', NULL),
(131, 32767, 7, 'Victor Emanuel', 'Araújo Ferreira', '1997-09-18', 'Portugal', '180 cm', '70 kg', 'https://media-3.api-sports.io/football/players/41182.png', NULL),
(132, 32767, 7, 'João André', 'Ribeiro Vieira', '1991-12-19', 'Portugal', '189 cm', '78 kg', 'https://media-3.api-sports.io/football/players/96557.png', NULL),
(133, 32767, 7, 'Zidane Agustini', 'Banjaqui', '1998-12-15', 'Guinea-Bissau', '175 cm', '', 'https://media.api-sports.io/football/players/96576.png', NULL),
(134, 32767, 7, 'Lucas', 'Rodrigues da Silva', '1999-08-27', 'Brazil', '182 cm', '75 kg', 'https://media-3.api-sports.io/football/players/41134.png', NULL),
(135, 32767, 7, 'João Victor', 'Donna Bravim', '1998-05-03', 'Brazil', '', '', 'https://media.api-sports.io/football/players/141575.png', NULL),
(136, 32767, 7, 'Ricardo Jorge', 'Cecília Batista', '1986-11-19', 'Angola', '190 cm', '', 'https://media-3.api-sports.io/football/players/43147.png', NULL),
(137, 9943, 7, 'Lucas', 'Paes Souza', '1997-12-07', 'Brazil', '193 cm', '86 kg', 'https://media.api-sports.io/football/players/9943.png', NULL),
(138, 32767, 7, 'Eduardo Enrique', 'Fereira Peñaranda', '2000-09-20', 'Venezuela', '196 cm', '63 kg', 'https://media-3.api-sports.io/football/players/52568.png', NULL),
(139, 32767, 7, 'João', 'Aniceto Grandela Nunes', '1995-11-19', 'Portugal', '186 cm', '78 kg', 'https://media.api-sports.io/football/players/40438.png', NULL),
(140, 32767, 7, 'Leonardo', 'da Costa Bolgado', '1998-08-20', 'Brazil', '', '', 'https://media.api-sports.io/football/players/268225.png', NULL),
(141, 19, 1, 'Julian', 'Weigl', '1995-09-08', 'Germany', '186 cm', '80 kg', 'https://media.api-sports.io/football/players/19.png', NULL),
(142, 170, 1, 'Jan', 'Vertonghen', '1987-04-24', 'Belgium', '189 cm', '79 kg', 'https://media-3.api-sports.io/football/players/170.png', NULL),
(143, 557, 1, 'Odysseas', 'Vlachodimos', '1994-04-26', 'Greece', '188 cm', '78 kg', 'https://media.api-sports.io/football/players/557.png', NULL),
(144, 566, 1, 'Francisco', 'Reis Ferreira', '1997-03-26', 'Portugal', '191 cm', '83 kg', 'https://media-3.api-sports.io/football/players/566.png', NULL),
(145, 569, 1, 'Gedson', 'Carvalho Fernandes', '1999-01-09', 'Portugal', '183 cm', '71 kg', 'https://media.api-sports.io/football/players/569.png', NULL),
(146, 572, 1, 'Luís Miguel Afonso', 'Fernandes', '1989-10-06', 'Portugal', '177 cm', '71 kg', 'https://media.api-sports.io/football/players/572.png', NULL),
(147, 578, 1, 'Adel', 'Taarabt', '1989-05-24', 'Morocco', '178 cm', '72 kg', 'https://media-3.api-sports.io/football/players/578.png', NULL),
(148, 582, 1, 'Haris', 'Seferović', '1992-02-22', 'Switzerland', '186 cm', '85 kg', 'https://media.api-sports.io/football/players/582.png', NULL),
(149, 2414, 1, 'Everton', 'Sousa Soares', '1996-03-22', 'Brazil', '174 cm', '72 kg', 'https://media-3.api-sports.io/football/players/2414.png', NULL),
(150, 8493, 1, 'Roman', 'Yaremchuk', '1995-11-27', 'Ukraine', '191 cm', '78 kg', 'https://media-3.api-sports.io/football/players/8493.png', NULL),
(151, 10225, 1, 'João Victor', 'da Silva Marcelino', '1998-07-17', 'Brazil', '187 cm', '77 kg', 'https://media.api-sports.io/football/players/10225.png', NULL),
(152, 10305, 1, 'Gilberto', 'Moraes Júnior', '1993-03-07', 'Brazil', '181 cm', '76 kg', 'https://media-3.api-sports.io/football/players/10305.png', NULL),
(153, 19300, 1, 'Diogo António', 'Cupido Gonçalves', '1997-02-06', 'Portugal', '178 cm', '70 kg', 'https://media-3.api-sports.io/football/players/19300.png', NULL),
(154, 25397, 1, 'John Anthony', 'Brooks', '1993-01-28', 'USA', '193 cm', '78 kg', 'https://media-3.api-sports.io/football/players/25397.png', NULL),
(155, 32767, 1, 'Helton Brant', 'Aleixo Leite', '1990-11-02', 'Brazil', '196 cm', '92 kg', 'https://media-3.api-sports.io/football/players/41293.png', NULL),
(156, 32767, 1, 'Nuno Miguel', 'Valente Santos', '1999-03-02', 'Portugal', '179 cm', '73 kg', 'https://media-3.api-sports.io/football/players/41587.png', NULL),
(157, 32767, 1, 'Leo Brian', 'Kokubo', '2001-01-23', 'Japan', '', '', 'https://media-3.api-sports.io/football/players/162482.png', NULL),
(158, 32767, 1, 'Samuel', 'Jumpe Soares', '2002-06-15', 'Portugal', '189 cm', '85 kg', 'https://media-3.api-sports.io/football/players/162595.png', NULL),
(159, 32767, 1, 'Martim', 'Carvalho Neto', '2003-01-14', 'Portugal', '', '', 'https://media.api-sports.io/football/players/271580.png', NULL),
(160, 32767, 1, 'André', 'Nogueira Gomes', '2004-10-20', 'Portugal', '182 cm', '', 'https://media.api-sports.io/football/players/350337.png', NULL),
(161, 3409, 14, 'Fabrice', 'Olinga Essono', '1996-05-12', 'Cameroon', '176 cm', '66 kg', 'https://media.api-sports.io/football/players/3409.png', NULL),
(162, 9602, 14, 'Patrick William', 'Sá de Oliveira', '1997-06-03', 'Brazil', '185 cm', '78 kg', 'https://media-3.api-sports.io/football/players/9602.png', NULL),
(163, 9828, 14, 'Sávio Antônio', 'Alves', '1995-05-26', 'Brazil', '175 cm', '69 kg', 'https://media-3.api-sports.io/football/players/9828.png', NULL),
(164, 10109, 14, 'Leonardo', 'da Silva Vieira', '1990-09-22', 'Brazil', '193 cm', '77 kg', 'https://media-3.api-sports.io/football/players/10109.png', NULL),
(165, 14502, 14, 'Renato', 'Pantalon', '1997-10-27', 'Croatia', '', '', 'https://media-3.api-sports.io/football/players/14502.png', NULL),
(166, 26767, 14, 'Pedro Miguel', 'Gaspar Amaral', '1997-08-25', 'Portugal', '178 cm', '70 kg', 'https://media.api-sports.io/football/players/26767.png', NULL),
(167, 26779, 14, 'Gonçalo Rosa', 'Gonçalves Pereira Rodrigues', '1997-07-18', 'Portugal', '167 cm', '59 kg', 'https://media.api-sports.io/football/players/26779.png', NULL),
(168, 32767, 14, 'Jhonatan Luiz', 'da Siqueira', '1991-05-08', 'Brazil', '189 cm', '80 kg', 'https://media-3.api-sports.io/football/players/41115.png', NULL),
(169, 32767, 14, 'Júnio Ricardo', 'da Rocha', '1997-02-27', 'Brazil', '182 cm', '75 kg', 'https://media-3.api-sports.io/football/players/41175.png', NULL),
(170, 32767, 14, 'Ronan David', 'Jerônimo', '1995-04-22', 'Brazil', '195 cm', '88 kg', 'https://media.api-sports.io/football/players/41195.png', NULL),
(171, 32767, 14, 'José Manuel', 'Silva Oliveira', '1990-10-23', 'Portugal', '178 cm', '65 kg', 'https://media-3.api-sports.io/football/players/41224.png', NULL),
(172, 32767, 14, 'Hugo', 'Domingos Gomes', '1995-01-04', 'Brazil', '187 cm', '82 kg', 'https://media.api-sports.io/football/players/41540.png', NULL),
(173, 32767, 14, 'Miguel Raimundo', 'Nóbrega', '2000-04-17', 'Portugal', '', '', 'https://media.api-sports.io/football/players/41568.png', NULL),
(174, 32767, 14, 'Aderllan Leandro', 'de Jesus Santos', '1989-04-09', 'Brazil', '193 cm', '83 kg', 'https://media-3.api-sports.io/football/players/44419.png', NULL),
(175, 32767, 14, 'Josué Humberto', 'Gonçalves Leal Sá', '1992-06-17', 'Portugal', '187 cm', '80 kg', 'https://media.api-sports.io/football/players/50058.png', NULL),
(176, 32767, 14, 'Leandro', 'da Silva Alves', '1999-01-16', 'Brazil', '174 cm', '67 kg', 'https://media.api-sports.io/football/players/179674.png', NULL),
(177, 32767, 14, 'João Pedro', 'Loureiro da Costa', '2000-03-26', 'Portugal', '181 cm', '', 'https://media.api-sports.io/football/players/204037.png', NULL),
(178, 32767, 14, 'Audenirton', 'Soares da Silva', '2000-05-15', 'Brazil', '', '', 'https://media.api-sports.io/football/players/286927.png', NULL),
(179, 32767, 14, 'Mohammed', 'Sulemana', '2002-12-13', 'Ghana', '', '', 'https://media-3.api-sports.io/football/players/303473.png', NULL),
(180, 32767, 14, 'Lucas', 'Flores de Oliveira', '2002-07-04', 'Brazil', '196 cm', '87 kg', 'https://media.api-sports.io/football/players/354058.png', NULL),
(181, 6245, 11, 'Joel', 'Soñora', '1996-09-15', 'USA', '176 cm', '70 kg', 'https://media-3.api-sports.io/football/players/6245.png', NULL),
(182, 10079, 11, 'Vitor Eudes', 'de Souza Costa', '1998-10-21', 'Brazil', '196 cm', '85 kg', 'https://media-3.api-sports.io/football/players/10079.png', NULL),
(183, 10563, 11, 'Cláudio', 'Winck Neto', '1994-04-15', 'Brazil', '183 cm', '77 kg', 'https://media-3.api-sports.io/football/players/10563.png', NULL),
(184, 32767, 11, 'João Miguel', 'Macedo Silva', '1995-04-07', 'Portugal', '190 cm', '78 kg', 'https://media.api-sports.io/football/players/41143.png', NULL),
(185, 32767, 11, 'Zainadine Abdula', 'Chavango Júnior', '1988-06-24', 'Mozambique', '178 cm', '70 kg', 'https://media.api-sports.io/football/players/41264.png', NULL),
(186, 32767, 11, 'Renê', 'Ferreira dos Santos', '1992-04-21', 'Brazil', '187 cm', '80 kg', 'https://media-3.api-sports.io/football/players/41267.png', NULL),
(187, 32767, 11, 'Pedro Henrique', 'Rocha Pelágio', '2000-04-21', 'Portugal', '181 cm', '77 kg', 'https://media-3.api-sports.io/football/players/41275.png', NULL),
(188, 32767, 11, 'Gonçalo Bento', 'Soares Cardoso', '2000-10-21', 'Portugal', '189 cm', '', 'https://media.api-sports.io/football/players/41301.png', NULL),
(189, 32767, 11, 'Giorgi', 'Makaridze', '1990-03-31', 'Georgia', '193 cm', '80 kg', 'https://media.api-sports.io/football/players/41379.png', NULL),
(190, 32767, 11, 'Matheus', 'de Mello Costa', '1995-01-26', 'Brazil', '188 cm', '80 kg', 'https://media.api-sports.io/football/players/41746.png', NULL),
(191, 32767, 11, 'Marcelo Henrique', 'Passos Carné', '1990-02-06', 'Brazil', '189 cm', '83 kg', 'https://media.api-sports.io/football/players/53932.png', NULL),
(192, 32767, 11, 'Clésio', 'Palmirim David Baúque', '1994-10-11', 'Mozambique', '183 cm', '71 kg', 'https://media-3.api-sports.io/football/players/62127.png', NULL),
(193, 32767, 11, 'Matouš', 'Trmal', '1998-10-02', 'Czech Republic', '192 cm', '', 'https://media-3.api-sports.io/football/players/66085.png', NULL),
(194, 32767, 11, 'Leonardo', 'de Andrade Silva', '1998-04-18', 'Brazil', '189 cm', '75 kg', 'https://media.api-sports.io/football/players/129782.png', NULL),
(195, 32767, 11, 'Miguel', 'Ferreira de Sousa', '1998-09-19', 'Portugal', '162 cm', '48 kg', 'https://media.api-sports.io/football/players/187916.png', NULL),
(196, 32767, 11, 'Bruno Miguel', 'Pereira', '2001-06-16', 'Portugal', '190 cm', '87 kg', 'https://media-3.api-sports.io/football/players/197732.png', NULL),
(197, 32767, 11, 'Luciano Gastón', 'Vega Albornoz', '1999-04-09', 'Argentina', '185 cm', '', 'https://media-3.api-sports.io/football/players/216953.png', NULL),
(198, 32767, 11, 'Antonio', 'Zarzana Pérez', '2002-03-21', 'Spain', '177 cm', '', 'https://media.api-sports.io/football/players/253699.png', NULL),
(199, 32767, 11, 'Moisés', 'Castillo Mosquera', '2001-05-24', 'Colombia', '188 cm', '', 'https://media.api-sports.io/football/players/279201.png', NULL),
(200, 32767, 11, 'João Pedro', 'Teixeira Silva', '2001-11-20', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/323915.png', NULL),
(201, 32767, 13, 'Paulo Vítor', 'Fagundes dos Anjos', '1988-11-21', 'Brazil', '195 cm', '', 'https://media-3.api-sports.io/football/players/41168.png', NULL),
(202, 32767, 13, 'Nélson', 'Macedo Monte', '1995-07-20', 'Portugal', '187 cm', '77 kg', 'https://media.api-sports.io/football/players/41177.png', NULL),
(203, 32767, 13, 'Nuno Miguel', 'Prata Coelho', '1987-11-23', 'Portugal', '183 cm', '76 kg', 'https://media.api-sports.io/football/players/41245.png', NULL),
(204, 32767, 13, 'Higor Inácio Platiny', 'de Oliveira Rodrigues', '1990-10-02', 'Brazil', '178 cm', '71 kg', 'https://media.api-sports.io/football/players/41428.png', NULL),
(205, 32767, 13, 'Fábio Patrick', 'dos Reis dos Santos Fernandes', '1993-12-13', 'Cape Verde', '190 cm', '73 kg', 'https://media-3.api-sports.io/football/players/41452.png', NULL),
(206, 32767, 13, 'Bruno', 'Martins Teles', '1986-05-01', 'Brazil', '183 cm', '77 kg', 'https://media-3.api-sports.io/football/players/41520.png', NULL),
(207, 32767, 13, 'Sandro Plínio', 'Rosa Cruz', '2001-05-12', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/41574.png', NULL),
(208, 32767, 13, 'Joel António', 'Soares Ferreira', '1992-01-10', 'Portugal', '180 cm', '72 kg', 'https://media-3.api-sports.io/football/players/41643.png', NULL),
(209, 32767, 13, 'Kevin Lenini', 'Gonçalves Pereira de Pina', '1997-01-27', 'Cape Verde', '190 cm', '78 kg', 'https://media-3.api-sports.io/football/players/96512.png', NULL),
(210, 32767, 13, 'Žiga', 'Frelih', '1998-02-06', 'Slovenia', '197 cm', '90 kg', 'https://media-3.api-sports.io/football/players/108460.png', NULL),
(211, 32767, 13, 'Rodrigo', 'Moura Nascimento', '1996-01-25', 'Brazil', '', '', 'https://media.api-sports.io/football/players/119477.png', NULL),
(212, 32767, 13, 'Bruno Alberto', 'Langa', '1997-10-31', 'Mozambique', '169 cm', '61 kg', 'https://media.api-sports.io/football/players/126901.png', NULL),
(213, 32767, 13, 'João Pedro', 'Fortes Bachiessa', '1998-05-01', 'Angola', '', '', 'https://media-3.api-sports.io/football/players/130247.png', NULL),
(214, 32767, 13, 'Rúben Filipe', 'Gomes Pereira', '1998-04-19', 'Portugal', '193 cm', '80 kg', 'https://media-3.api-sports.io/football/players/141355.png', NULL),
(215, 32767, 13, 'Gonçalo', 'Filipe Jesus Pinto', '2000-04-30', 'Portugal', '', '', 'https://media.api-sports.io/football/players/142296.png', NULL),
(216, 32767, 13, 'Nicolas', 'Reis Bernardo', '1999-06-04', 'Brazil', '176 cm', '68 kg', 'https://media-3.api-sports.io/football/players/277195.png', NULL),
(217, 32767, 13, 'Habib', 'Sylla', '1999-02-12', 'Côte d\'Ivoire', '177 cm', '73 kg', 'https://media.api-sports.io/football/players/279280.png', NULL),
(218, 32767, 13, 'Emmanuel Christopher', 'Pavlis', '2002-12-04', 'Australia', '', '', 'https://media.api-sports.io/football/players/287885.png', NULL),
(219, 32767, 13, 'Hélder', 'Gomes Morim', '2001-05-14', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/313133.png', NULL),
(220, 32767, 13, 'Valentino Claude', 'Rodrigues Lesieur', '2003-03-18', 'Portugal', '195 cm', '', 'https://media.api-sports.io/football/players/325762.png', NULL),
(221, 558, 18, 'Ivan', 'Zlobin', '1997-03-07', 'Russia', '191 cm', '84 kg', 'https://media.api-sports.io/football/players/558.png', NULL),
(222, 6049, 18, 'Hernán', 'De La Fuente', '1997-01-07', 'Argentina', '177 cm', '73 kg', 'https://media-3.api-sports.io/football/players/6049.png', NULL),
(223, 8445, 18, 'Buduka Dylan', 'Batubinsika', '1996-02-15', 'France', '184 cm', '84 kg', 'https://media-3.api-sports.io/football/players/8445.png', NULL),
(224, 26772, 18, 'Enea', 'Mihaj', '1998-07-05', 'Albania', '186 cm', '78 kg', 'https://media.api-sports.io/football/players/26772.png', NULL),
(225, 32767, 18, 'Diogo José', 'Rosário Gomes Figueiras', '1991-07-01', 'Portugal', '171 cm', '62 kg', 'https://media-3.api-sports.io/football/players/41098.png', NULL),
(226, 32767, 18, 'Rúben Alexandre', 'Rocha Lima', '1989-10-03', 'Portugal', '177 cm', '69 kg', 'https://media.api-sports.io/football/players/41123.png', NULL),
(227, 32767, 18, 'Heriberto Moreno', 'Borges Tavares', '1997-02-19', 'Portugal', '181 cm', '69 kg', 'https://media.api-sports.io/football/players/41125.png', NULL),
(228, 32767, 18, 'Lawrence', 'Ofori', '1998-06-28', 'Ghana', '181 cm', '75 kg', 'https://media-3.api-sports.io/football/players/41500.png', NULL),
(229, 32767, 18, 'Bernardo Neves Jesus', 'Gouveia Silva', '2001-05-31', 'Portugal', '190 cm', '64 kg', 'https://media.api-sports.io/football/players/41583.png', NULL),
(230, 32767, 18, 'Diogo Lucas', 'Queirós', '1999-01-05', 'Portugal', '185 cm', '80 kg', 'https://media.api-sports.io/football/players/41723.png', NULL),
(231, 32767, 18, 'Cláudio Moreira', 'da Silva', '2000-06-29', 'Portugal', '', '', 'https://media.api-sports.io/football/players/130257.png', NULL),
(232, 32767, 18, 'Owen Michael', 'Beck', '2002-08-09', 'Wales', '', '', 'https://media-3.api-sports.io/football/players/158693.png', NULL),
(233, 32767, 18, 'Alexandre Manuel', 'Penetra Correia', '2001-09-09', 'Portugal', '184 cm', '73 kg', 'https://media.api-sports.io/football/players/162594.png', NULL),
(234, 32767, 18, 'Francisco', 'Saldanha Morais', '2001-03-19', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/163002.png', NULL),
(235, 32767, 18, 'Alejandro', 'Millán Iranzo', '1999-11-07', 'Spain', '', '', 'https://media.api-sports.io/football/players/182668.png', NULL),
(236, 32767, 18, 'Abdul Wahab', 'Ibrahim', '1999-01-13', 'Ghana', '176 cm', '70 kg', 'https://media-3.api-sports.io/football/players/187917.png', NULL),
(237, 32767, 18, 'Lucas Henrique', 'Soares Alves de Souza', '2000-06-14', 'Brazil', '', '', 'https://media.api-sports.io/football/players/197345.png', NULL),
(238, 32767, 18, 'Luiz Lúcio', 'Reis Júnior', '2001-01-14', 'Brazil', '194 cm', '88 kg', 'https://media-3.api-sports.io/football/players/278619.png', NULL),
(239, 32767, 18, 'Fábio', 'Mutaro Baldé', '2000-05-03', 'Portugal', '193 cm', '84 kg', 'https://media.api-sports.io/football/players/279099.png', NULL),
(240, 32767, 18, 'Samuel', 'Gomes Lobato', '2001-10-19', 'Portugal', '184 cm', '', 'https://media-3.api-sports.io/football/players/378332.png', NULL),
(241, 527, 4, 'Bruno Miguel', 'Semedo Varela', '1994-11-04', 'Portugal', '191 cm', '86 kg', 'https://media.api-sports.io/football/players/527.png', NULL),
(242, 1989, 4, 'Ricardo', 'Andrade Quaresma Bernardo', '1983-09-26', 'Portugal', '175 cm', '67 kg', 'https://media.api-sports.io/football/players/1989.png', NULL),
(243, 2445, 4, 'Mikel', 'Villanueva Álvarez', '1993-04-14', 'Venezuela', '192 cm', '79 kg', 'https://media-3.api-sports.io/football/players/2445.png', NULL),
(244, 15900, 4, 'Khalid Abdul', 'Mumin Suleman', '1998-06-06', 'Ghana', '188 cm', '79 kg', 'https://media.api-sports.io/football/players/15900.png', NULL),
(245, 32767, 4, 'Ryoya', 'Ogawa', '1996-11-24', 'Japan', '183 cm', '78 kg', 'https://media.api-sports.io/football/players/32855.png', NULL),
(246, 32767, 4, 'Domingos André', 'Ribeiro Almeida', '2000-05-30', 'Portugal', '172 cm', '62 kg', 'https://media-3.api-sports.io/football/players/41157.png', NULL),
(247, 32767, 4, 'Jorge Filipe', 'Oliveira Fernandes', '1997-04-02', 'Portugal', '193 cm', '84 kg', 'https://media.api-sports.io/football/players/41441.png', NULL),
(248, 32767, 4, 'Alfa', 'Semedo Esteves', '1997-08-30', 'Guinea-Bissau', '190 cm', '75 kg', 'https://media-3.api-sports.io/football/players/47343.png', NULL),
(249, 32767, 4, 'Bruno', 'Duarte da Silva', '1996-03-24', 'Brazil', '183 cm', '78 kg', 'https://media.api-sports.io/football/players/63475.png', NULL),
(250, 32767, 4, 'Maxwell', 'Woledzi', '2001-07-02', 'Ghana', '190 cm', '', 'https://media-3.api-sports.io/football/players/128762.png', NULL),
(251, 32767, 4, 'João Pedro', 'Gomes Ricciulli', '1999-10-10', 'Portugal', '194 cm', '82 kg', 'https://media-3.api-sports.io/football/players/136114.png', NULL),
(252, 32767, 4, 'Antonio', 'Cortés Heredia', '2000-04-16', 'Spain', '182 cm', '71 kg', 'https://media.api-sports.io/football/players/147797.png', NULL),
(253, 32767, 4, 'Celton', 'Ansumane Biai', '2000-08-13', 'Portugal', '179 cm', '72 kg', 'https://media-3.api-sports.io/football/players/153324.png', NULL),
(254, 32767, 4, 'Felipe Estrella', 'Galeazzi', '2001-01-10', 'Italy', '', '', 'https://media.api-sports.io/football/players/162745.png', NULL),
(255, 32767, 4, 'Antal', 'Bencze', '2002-02-03', 'Hungary', '190 cm', '84 kg', 'https://media.api-sports.io/football/players/279583.png', NULL),
(256, 32767, 4, 'Hélder José', 'Oliveira Sá', '2002-11-10', 'Portugal', '187 cm', '72 kg', 'https://media.api-sports.io/football/players/279585.png', NULL),
(257, 32767, 4, 'André', 'Fonseca Amaro', '2002-08-13', 'Portugal', '186 cm', '76 kg', 'https://media.api-sports.io/football/players/281342.png', NULL),
(258, 32767, 4, 'Miguel Ângelo', 'Gomes Ferreira Magalhães', '2002-11-16', 'Portugal', '175 cm', '68 kg', 'https://media.api-sports.io/football/players/310094.png', NULL),
(259, 32767, 4, 'Pedro Rafael', 'Silva Oliveira', '2003-09-28', 'Portugal', '193 cm', '84 kg', 'https://media-3.api-sports.io/football/players/330416.png', NULL),
(260, 32767, 4, 'Alberto', 'Oliveira Baio', '2003-09-29', 'Portugal', '186 cm', '77 kg', 'https://media.api-sports.io/football/players/330419.png', NULL),
(261, 2201, 16, 'Edson André', 'Sitoe', '1988-09-08', 'Mozambique', '188 cm', '79 kg', 'https://media-3.api-sports.io/football/players/2201.png', NULL),
(262, 10006, 16, 'Arthur', 'Gomes Lourenço', '1998-07-03', 'Brazil', '175 cm', '73 kg', 'https://media.api-sports.io/football/players/10006.png', NULL),
(263, 10154, 16, 'Thiago', 'Rodrigues da Silva', '1996-06-12', 'Brazil', '185 cm', '75 kg', 'https://media-3.api-sports.io/football/players/10154.png', NULL),
(264, 22162, 16, 'Racine', 'Coly', '1995-12-08', 'Senegal', '185 cm', '70 kg', 'https://media.api-sports.io/football/players/22162.png', NULL),
(265, 24173, 16, 'Shaquil', 'Delos', '1999-06-16', 'France', '183 cm', '73 kg', 'https://media.api-sports.io/football/players/24173.png', NULL),
(266, 32767, 16, 'Lucas Henrique', 'da Silva', '1995-02-05', 'Brazil', '185 cm', '79 kg', 'https://media.api-sports.io/football/players/41265.png', NULL),
(267, 32767, 16, 'Pedro José', 'Moreira da Silva', '1997-02-13', 'Portugal', '189 cm', '76 kg', 'https://media-3.api-sports.io/football/players/41433.png', NULL),
(268, 32767, 16, 'João Carlos', 'Reis Graça', '1989-07-02', 'Portugal', '185 cm', '77 kg', 'https://media.api-sports.io/football/players/41442.png', NULL),
(269, 32767, 16, 'Pedro Miguel', 'Costa Álvaro', '2000-03-02', 'Portugal', '186 cm', '71 kg', 'https://media.api-sports.io/football/players/41565.png', NULL),
(270, 32767, 16, 'Daniel Alexis', 'Leite Figueira', '1998-07-20', 'Portugal', '189 cm', '72 kg', 'https://media-3.api-sports.io/football/players/41992.png', NULL),
(271, 32767, 16, 'Mohamed Elias', 'Achouri', '1999-02-10', 'Tunisia', '177 cm', '68 kg', 'https://media-3.api-sports.io/football/players/42012.png', NULL),
(272, 32767, 16, 'André Filipe', 'Russo Franco', '1998-04-12', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/130256.png', NULL),
(273, 32767, 16, 'Titouan', 'Thomas', '2002-01-12', 'France', '183 cm', '', 'https://media-3.api-sports.io/football/players/161915.png', NULL),
(274, 32767, 16, 'Volnei', 'Feltes', '2000-04-15', 'Brazil', '188 cm', '75 kg', 'https://media-3.api-sports.io/football/players/277165.png', NULL),
(275, 32767, 16, 'Bernardo Maria Morais', 'Cardoso Vital', '2000-12-29', 'Portugal', '', '', 'https://media.api-sports.io/football/players/277166.png', NULL),
(276, 32767, 16, 'João Victor', 'Felix Alves', '2002-01-02', 'Brazil', '185 cm', '78 kg', 'https://media.api-sports.io/football/players/306042.png', NULL),
(277, 32767, 16, 'João Pedro', 'Espírito Santo Oliveira', '2002-09-18', 'Portugal', '185 cm', '70 kg', 'https://media-3.api-sports.io/football/players/323945.png', NULL),
(278, 32767, 16, 'Gonçalo do Lago', 'Pontes Esteves', '2004-02-27', 'Portugal', '171 cm', '', 'https://media-3.api-sports.io/football/players/325052.png', NULL),
(279, 32767, 16, 'Tiago', 'Santos Carvalho', '2002-07-23', 'Portugal', '175 cm', '', 'https://media.api-sports.io/football/players/379329.png', NULL),
(280, 32767, 16, 'Francisco', 'Marques Leite Ribeiro Lemos', '2002-09-13', 'Portugal', '', '', 'https://media.api-sports.io/football/players/380235.png', NULL),
(281, 369, 10, 'Diogo', 'Meireles da Costa', '1999-09-19', 'Portugal', '186 cm', '81 kg', 'https://media.api-sports.io/football/players/369.png', NULL),
(282, 373, 10, 'Képler Laveran', 'de Lima Ferreira', '1983-02-26', 'Portugal', '188 cm', '81 kg', 'https://media-3.api-sports.io/football/players/373.png', NULL),
(283, 375, 10, 'Chancel', 'Mbemba Mangulu', '1994-08-08', 'Congo DR', '182 cm', '81 kg', 'https://media-3.api-sports.io/football/players/375.png', NULL),
(284, 376, 10, 'Diogo Filipe', 'Monteiro Pinto Leite', '1999-01-23', 'Portugal', '188 cm', '82 kg', 'https://media.api-sports.io/football/players/376.png', NULL),
(285, 389, 10, 'Jesús Manuel', 'Corona Ruíz', '1993-01-06', 'Mexico', '173 cm', '62 kg', 'https://media-3.api-sports.io/football/players/389.png', NULL),
(286, 2375, 10, 'Sérgio Miguel', 'Relvas de Oliveira', '1992-06-02', 'Portugal', '181 cm', '72 kg', 'https://media-3.api-sports.io/football/players/2375.png', NULL),
(287, 2464, 10, 'Agustín Federico', 'Marchesín', '1988-03-16', 'Argentina', '188 cm', '82 kg', 'https://media-3.api-sports.io/football/players/2464.png', NULL),
(288, 2470, 10, 'Renzo', 'Saravia', '1993-06-16', 'Argentina', '176 cm', '75 kg', 'https://media.api-sports.io/football/players/2470.png', NULL),
(289, 32767, 10, 'Rúben Afonso', 'Borges Semedo', '1994-04-04', 'Portugal', '189 cm', '84 kg', 'https://media-3.api-sports.io/football/players/41173.png', NULL),
(290, 32767, 10, 'Fábio Rafael', 'Rodrigues Cardoso', '1994-04-19', 'Portugal', '187 cm', '79 kg', 'https://media.api-sports.io/football/players/41208.png', NULL),
(291, 32767, 10, 'Cláudio Pires', 'Morais Ramos', '1991-11-16', 'Portugal', '183 cm', '83 kg', 'https://media-3.api-sports.io/football/players/41432.png', NULL),
(292, 32767, 10, 'Francisco', 'Meira Meixedo', '2001-05-19', 'Portugal', '184 cm', '', 'https://media-3.api-sports.io/football/players/41715.png', NULL),
(293, 32767, 10, 'José Pedro', 'da Silva Figueiredo Freitas', '1997-06-06', 'Portugal', '187 cm', '73 kg', 'https://media-3.api-sports.io/football/players/41964.png', NULL),
(294, 32767, 10, 'David', 'Mota Veiga Teixeira Carmo', '1999-07-19', 'Portugal', '196 cm', '82 kg', 'https://media.api-sports.io/football/players/41970.png', NULL),
(295, 32767, 10, 'Romain', 'Rodrigues Correia', '1999-09-06', 'Portugal', '188 cm', '', 'https://media-3.api-sports.io/football/players/42002.png', NULL),
(296, 32767, 10, 'Samuel', 'Portugal Lima', '1994-03-29', 'Brazil', '180 cm', '80 kg', 'https://media.api-sports.io/football/players/80667.png', NULL),
(297, 32767, 10, 'Vítor', 'Machado Ferreira', '2000-02-13', 'Portugal', '172 cm', '64 kg', 'https://media-3.api-sports.io/football/players/128384.png', NULL),
(298, 32767, 10, 'Francisco', 'Fernandes da Conceição', '2002-12-14', 'Portugal', '170 cm', '64 kg', 'https://media.api-sports.io/football/players/161585.png', NULL),
(299, 32767, 10, 'João Miguel', 'Teixeira Mendes', '2000-04-13', 'Portugal', '179 cm', '66 kg', 'https://media.api-sports.io/football/players/197734.png', NULL),
(300, 32767, 10, 'Vasco José', 'Cardoso Sousa', '2003-04-03', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/325830.png', NULL),
(301, 1473, 17, 'Tiago Abiola Delfim', 'Almeida Ilori', '1993-02-26', 'Portugal', '190 cm', '80 kg', 'https://media.api-sports.io/football/players/1473.png', NULL),
(302, 9380, 17, 'Jóbson', 'de Brito Gonzaga', '1994-04-27', 'Brazil', '184 cm', '71 kg', 'https://media.api-sports.io/football/players/9380.png', NULL),
(303, 10179, 17, 'Lucas', 'da Silva de Jesus', '1998-01-30', 'Brazil', '176 cm', '66 kg', 'https://media-3.api-sports.io/football/players/10179.png', NULL),
(304, 30500, 17, 'Erick Steven', 'Ferigra Burnham', '1999-02-07', 'Ecuador', '188 cm', '74 kg', 'https://media.api-sports.io/football/players/30500.png', NULL),
(305, 32767, 17, 'Jose Carlos', 'Coentrão Marafona', '1987-05-08', 'Portugal', '190 cm', '86 kg', 'https://media-3.api-sports.io/football/players/41088.png', NULL),
(306, 32767, 17, 'Flávio', 'da Silva Ramos', '1994-05-12', 'Brazil', '191 cm', '86 kg', 'https://media-3.api-sports.io/football/players/41490.png', NULL),
(307, 32767, 17, 'João Miguel', 'Ribeiro Vigário', '1995-11-20', 'Portugal', '180 cm', '74 kg', 'https://media-3.api-sports.io/football/players/41611.png', NULL),
(308, 32767, 17, 'Fernando Manuel', 'Ferreira Fonseca', '1997-03-14', 'Portugal', '182 cm', '75 kg', 'https://media.api-sports.io/football/players/41720.png', NULL),
(309, 32767, 17, 'Jorge Fernando', 'dos Santos Silva', '1996-03-22', 'Portugal', '183 cm', '76 kg', 'https://media-3.api-sports.io/football/players/41747.png', NULL),
(310, 32767, 17, 'Vitorino Gabriel', 'Pacheco Antunes', '1987-04-01', 'Portugal', '175 cm', '72 kg', 'https://media-3.api-sports.io/football/players/47255.png', NULL),
(311, 32767, 17, 'Igor', 'Vekič', '1998-05-06', 'Slovenia', '', '', 'https://media.api-sports.io/football/players/109939.png', NULL),
(312, 32767, 17, 'Dor', 'Jan', '1994-12-16', 'Israel', '181 cm', '78 kg', 'https://media.api-sports.io/football/players/111081.png', NULL),
(313, 32767, 17, 'Jordan William', 'Holsgrove', '1999-09-10', 'Scotland', '', '', 'https://media-3.api-sports.io/football/players/129728.png', NULL),
(314, 32767, 17, 'Pedro Luís', 'Machado Ganchas', '2000-05-31', 'Portugal', '190 cm', '84 kg', 'https://media-3.api-sports.io/football/players/204126.png', NULL),
(315, 32767, 17, 'José Pedro', 'Ferreira Oliveira', '2002-04-06', 'Portugal', '186 cm', '85 kg', 'https://media-3.api-sports.io/football/players/266367.png', NULL),
(316, 32767, 17, 'João Miguel', 'Vieira Nóbrega', '2001-12-04', 'Portugal', '183 cm', '68 kg', 'https://media.api-sports.io/football/players/278136.png', NULL),
(317, 32767, 17, 'Jeimes', 'Menezes de Almeida', '2001-04-28', 'Brazil', '188 cm', '', 'https://media-3.api-sports.io/football/players/278260.png', NULL),
(318, 32767, 17, 'Luís Pedro', 'Alves Bastos', '2001-09-10', 'Portugal', '175 cm', '72 kg', 'https://media.api-sports.io/football/players/279577.png', NULL),
(319, 32767, 17, 'Nuno Miguel', 'Reis Lima', '2001-03-16', 'Portugal', '184 cm', '76 kg', 'https://media-3.api-sports.io/football/players/282946.png', NULL),
(320, 32767, 17, 'Vasco', 'Pereira de Sousa', '2004-04-06', 'Portugal', '', '', 'https://media.api-sports.io/football/players/379080.png', NULL),
(321, 1476, 12, 'Cristián Alexis', 'Borja González', '1993-02-18', 'Colombia', '179 cm', '66 kg', 'https://media.api-sports.io/football/players/1476.png', NULL),
(322, 10565, 12, 'Lucas', 'da Silva Izidoro', '1996-02-24', 'Brazil', '188 cm', '74 kg', 'https://media-3.api-sports.io/football/players/10565.png', NULL),
(323, 20884, 12, 'Sikou', 'Niakaté', '1999-07-10', 'France', '186 cm', '', 'https://media.api-sports.io/football/players/20884.png', NULL),
(324, 32767, 12, 'Matheus', 'Lima Magalhães', '1992-03-29', 'Brazil', '187 cm', '76 kg', 'https://media-3.api-sports.io/football/players/41089.png', NULL),
(325, 32767, 12, 'Tiago', 'Magalhães de Sá', '1995-01-11', 'Portugal', '185 cm', '78 kg', 'https://media.api-sports.io/football/players/41090.png', NULL),
(326, 32767, 12, 'Nuno Miguel', 'Ribeiro Cruz Jerónimo Sequeira', '1990-08-19', 'Portugal', '184 cm', '79 kg', 'https://media-3.api-sports.io/football/players/41097.png', NULL);
INSERT INTO `players` (`id`, `api_id`, `team_id`, `first_name`, `last_name`, `birth_date`, `nationality`, `height`, `weight`, `photo`, `antidopping_date`) VALUES
(327, 32767, 12, 'João Pedro', 'Barradas Novais', '1993-07-10', 'Portugal', '183 cm', '77 kg', 'https://media-3.api-sports.io/football/players/41101.png', NULL),
(328, 32767, 12, 'Vítor', 'Tormena de Farias', '1996-01-04', 'Brazil', '192 cm', '84 kg', 'https://media.api-sports.io/football/players/41359.png', NULL),
(329, 32767, 12, 'Paulo André', 'Rodrigues de Oliveira', '1992-01-08', 'Portugal', '187 cm', '81 kg', 'https://media-3.api-sports.io/football/players/47383.png', NULL),
(330, 32767, 12, 'Mario', 'González Gutiérrez', '1996-02-25', 'Spain', '183 cm', '76 kg', 'https://media-3.api-sports.io/football/players/104827.png', NULL),
(331, 32767, 12, 'Dion', 'McGhee', '2000-09-14', 'England', '', '', 'https://media-3.api-sports.io/football/players/138811.png', NULL),
(332, 32767, 12, 'Dinis Lourenço', 'Casals Namura Borges Pinto', '2000-08-24', 'Portugal', '178 cm', '73 kg', 'https://media-3.api-sports.io/football/players/141890.png', NULL),
(333, 32767, 12, 'Víctor', 'Gómez Perea', '2000-04-01', 'Spain', '166 cm', '69 kg', 'https://media.api-sports.io/football/players/153290.png', NULL),
(334, 32767, 12, 'Pierre Junior', 'Dwomoh', '2004-06-21', 'Belgium', '185 cm', '69 kg', 'https://media.api-sports.io/football/players/162158.png', NULL),
(335, 32767, 12, 'Fabiano Josué', 'de Souza Silva', '2000-03-14', 'Brazil', '175 cm', '70 kg', 'https://media.api-sports.io/football/players/187920.png', NULL),
(336, 32767, 12, 'Bruno Miguel', 'Ferreira Rodrigues', '2001-06-08', 'Portugal', '192 cm', '86 kg', 'https://media.api-sports.io/football/players/187921.png', NULL),
(337, 32767, 12, 'Eduardo', 'Ferreira Soares', '2001-08-17', 'Portugal', '173 cm', '', 'https://media.api-sports.io/football/players/190486.png', NULL),
(338, 32767, 12, 'Lukáš', 'Horníček', '2002-07-13', 'Czech Republic', '194 cm', '90 kg', 'https://media.api-sports.io/football/players/269349.png', NULL),
(339, 32767, 12, 'Serdar', 'Saatçı', '2003-02-14', 'Turkey', '190 cm', '', 'https://media-3.api-sports.io/football/players/286839.png', NULL),
(340, 32767, 12, 'Guilherme', 'Araújo Soares', '2001-02-08', 'Portugal', '186 cm', '', 'https://media-3.api-sports.io/football/players/314513.png', NULL),
(341, 2066, 8, 'Stanislav', 'Vasilyevich Kritsyuk', '1990-12-01', 'Russia', '192 cm', '85 kg', 'https://media.api-sports.io/football/players/2066.png', NULL),
(342, 10049, 8, 'Lucas', 'Barros da Cunha', '1999-08-21', 'Brazil', '', '', 'https://media-3.api-sports.io/football/players/10049.png', NULL),
(343, 32767, 8, 'Lucas', 'de Souza Cunha', '1997-01-23', 'Brazil', '186 cm', '77 kg', 'https://media.api-sports.io/football/players/41092.png', NULL),
(344, 32767, 8, 'Rui Filipe', 'Caetano Moura', '1993-03-01', 'Portugal', '177 cm', '74 kg', 'https://media.api-sports.io/football/players/41304.png', NULL),
(345, 32767, 8, 'Emmanuel', 'Hackman', '1995-05-14', 'Togo', '189 cm', '74 kg', 'https://media.api-sports.io/football/players/41353.png', NULL),
(346, 32767, 8, 'Rúben Miguel', 'Marques dos Santos Fernandes', '1986-05-06', 'Portugal', '186 cm', '75 kg', 'https://media.api-sports.io/football/players/41355.png', NULL),
(347, 32767, 8, 'Adrián', 'Marín Gómez', '1997-01-09', 'Spain', '181 cm', '73 kg', 'https://media-3.api-sports.io/football/players/47358.png', NULL),
(348, 32767, 8, 'Diogo', 'da Costa Silva', '1995-01-11', 'Brazil', '186 cm', '77 kg', 'https://media-3.api-sports.io/football/players/68053.png', NULL),
(349, 32767, 8, 'Andrew', 'da Silva Ventura', '2001-07-01', 'Brazil', '', '', 'https://media-3.api-sports.io/football/players/80528.png', NULL),
(350, 32767, 8, 'Žiga', 'Frelih', '1998-02-06', 'Slovenia', '197 cm', '90 kg', 'https://media-3.api-sports.io/football/players/108460.png', NULL),
(351, 32767, 8, 'Mizuki', 'Arai', '1997-04-14', 'Japan', '170 cm', '64 kg', 'https://media-3.api-sports.io/football/players/109197.png', NULL),
(352, 32767, 8, 'João Caiado', 'Vaz Dias', '1999-04-20', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/129773.png', NULL),
(353, 32767, 8, 'Brian', 'Rocha Araújo', '2000-04-29', 'Portugal', '188 cm', '78 kg', 'https://media.api-sports.io/football/players/129778.png', NULL),
(354, 32767, 8, 'Manuel Alberto', 'Cunha Lopes', '2000-05-29', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/129779.png', NULL),
(355, 32767, 8, 'André Filipe', 'Rio Liberal', '2002-08-02', 'Portugal', '181 cm', '', 'https://media-3.api-sports.io/football/players/130248.png', NULL),
(356, 32767, 8, 'José Carlos', 'Teixeira Lopes dos Reis Gonçal', '1998-07-31', 'Portugal', '177 cm', '77 kg', 'https://media-3.api-sports.io/football/players/142024.png', NULL),
(357, 32767, 8, 'Boubacar Rafael', 'Neto Hanne', '1999-02-26', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/152962.png', NULL),
(358, 32767, 8, 'Danilo Filipe', 'Melo Veiga', '2002-09-25', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/161702.png', NULL),
(359, 32767, 8, 'Guilherme', 'Silva Souza', '2001-06-12', 'Brazil', '190 cm', '', 'https://media.api-sports.io/football/players/351387.png', NULL),
(360, 32767, 8, 'Daniel', 'Simões Silva', '2004-03-10', 'Portugal', '185 cm', '80 kg', 'https://media-3.api-sports.io/football/players/394407.png', NULL),
(361, 3438, 20, 'Manconi', 'Soriano Mané', '1996-04-03', 'Guinea-Bissau', '187 cm', '80 kg', 'https://media.api-sports.io/football/players/3438.png', NULL),
(362, 9663, 20, 'Mateus', 'Pasinato', '1992-06-28', 'Brazil', '192 cm', '86 kg', 'https://media-3.api-sports.io/football/players/9663.png', NULL),
(363, 10164, 20, 'Rafael', 'Santos de Sousa', '1998-02-02', 'Brazil', '184 cm', '72 kg', 'https://media.api-sports.io/football/players/10164.png', NULL),
(364, 32767, 20, 'Fábio José', 'Ferreira Pacheco', '1988-05-26', 'Portugal', '180 cm', '72 kg', 'https://media.api-sports.io/football/players/41128.png', NULL),
(365, 32767, 20, 'André Luís', 'Silva de Aguiar', '1994-03-09', 'Brazil', '184 cm', '78 kg', 'https://media-3.api-sports.io/football/players/41430.png', NULL),
(366, 32767, 20, 'David', 'Carneiro Dias Resende Bruno', '1992-02-14', 'Portugal', '175 cm', '67 kg', 'https://media.api-sports.io/football/players/41436.png', NULL),
(367, 32767, 20, 'João Pedro', 'Gomes Camacho', '1994-06-23', 'Portugal', '171 cm', '66 kg', 'https://media-3.api-sports.io/football/players/41477.png', NULL),
(368, 32767, 20, 'Lawrence', 'Ofori', '1998-06-28', 'Ghana', '181 cm', '75 kg', 'https://media.api-sports.io/football/players/41500.png', NULL),
(369, 32767, 20, 'Hugo', 'Domingos Gomes', '1995-01-04', 'Brazil', '187 cm', '82 kg', 'https://media-3.api-sports.io/football/players/41540.png', NULL),
(370, 32767, 20, 'Luís Carlos', 'Rocha Rodrigues', '1986-08-13', 'Portugal', '186 cm', '85 kg', 'https://media-3.api-sports.io/football/players/41546.png', NULL),
(371, 32767, 20, 'Walterson', 'Silva', '1994-12-28', 'Brazil', '180 cm', '72 kg', 'https://media-3.api-sports.io/football/players/41562.png', NULL),
(372, 32767, 20, 'Godfried Ayesu', 'Owusu Frimpong', '1999-04-21', 'Netherlands', '180 cm', '', 'https://media-3.api-sports.io/football/players/41569.png', NULL),
(373, 32767, 20, 'Pedro Miguel', 'Santos Amador', '1998-12-18', 'Portugal', '181 cm', '73 kg', 'https://media-3.api-sports.io/football/players/41967.png', NULL),
(374, 32767, 20, 'Gonçalo Baptista', 'Franco', '2000-11-17', 'Portugal', '176 cm', '68 kg', 'https://media-3.api-sports.io/football/players/68441.png', NULL),
(375, 32767, 20, 'Kobamelo', 'Kodisang', '1999-08-28', 'South Africa', '169 cm', '66 kg', 'https://media.api-sports.io/football/players/98971.png', NULL),
(376, 32767, 20, 'Madson', 'de Souza Silva', '1999-08-26', 'Brazil', '164 cm', '67 kg', 'https://media-3.api-sports.io/football/players/106418.png', NULL),
(377, 32767, 20, 'Pedro Miguel', 'Santos Aparício', '1995-08-22', 'Portugal', '171 cm', '64 kg', 'https://media-3.api-sports.io/football/players/142131.png', NULL),
(378, 32767, 20, 'Alan', 'de Souza Guimarães', '2000-03-08', 'Brazil', '161 cm', '63 kg', 'https://media.api-sports.io/football/players/195110.png', NULL),
(379, 32767, 20, 'Sérgio', 'Dutra Alves', '2002-03-22', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/197731.png', NULL),
(380, 32767, 20, 'Lucas', 'de Freitas Molarinho Chagas', '2001-01-20', 'Brazil', '184 cm', '75 kg', 'https://media-3.api-sports.io/football/players/286962.png', NULL),
(381, 3434, 26, 'Rui Suleimane', 'Camara Dabó', '1994-10-05', 'Guinea-Bissau', '191 cm', '83 kg', 'https://media-3.api-sports.io/football/players/3434.png', NULL),
(382, 32767, 26, 'Jonata', 'de Oliveira Bastos', '1997-11-26', 'Brazil', '188 cm', '75 kg', 'https://media-3.api-sports.io/football/players/41626.png', NULL),
(383, 32767, 26, 'Nuno Miguel', 'Gomes da Silva', '1997-08-03', 'Portugal', '186 cm', '78 kg', 'https://media-3.api-sports.io/football/players/41792.png', NULL),
(384, 32767, 26, 'Rodrigo', 'Da Rocha Borges', '1998-08-05', 'Portugal', '188 cm', '72 kg', 'https://media.api-sports.io/football/players/41962.png', NULL),
(385, 32767, 26, 'Miguel Ângelo', 'Moreira Magalhães', '1999-04-19', 'Portugal', '174 cm', '58 kg', 'https://media.api-sports.io/football/players/41995.png', NULL),
(386, 32767, 26, 'Welesson', 'Barreto Borges', '1995-09-22', 'Brazil', '178 cm', '80 kg', 'https://media.api-sports.io/football/players/54154.png', NULL),
(387, 32767, 26, 'Michel', 'Barbosa de Lima', '1997-05-12', 'Brazil', '186 cm', '87 kg', 'https://media-3.api-sports.io/football/players/54874.png', NULL),
(388, 32767, 26, 'Filipe', 'da Silva Alves', '1991-08-13', 'Brazil', '', '', 'https://media.api-sports.io/football/players/77827.png', NULL),
(389, 32767, 26, 'Jaime Alexandrino', 'Gomes Pinto', '1997-09-28', 'Portugal', '', '', 'https://media-3.api-sports.io/football/players/104439.png', NULL),
(390, 32767, 26, 'Vítor Hugo', 'Cruz Rocha', '1996-06-08', 'Portugal', '180 cm', '71 kg', 'https://media.api-sports.io/football/players/107525.png', NULL),
(391, 32767, 26, 'Pedro', 'Pinho Marques', '1998-03-18', 'Portugal', '183 cm', '79 kg', 'https://media-3.api-sports.io/football/players/116490.png', NULL),
(392, 32767, 26, 'Duarte Jorge', 'Gomes Duarte', '1987-08-27', 'Portugal', '176 cm', '66 kg', 'https://media.api-sports.io/football/players/116556.png', NULL),
(393, 32767, 26, 'Gonçalo', 'Lima Pereira Pimenta', '1996-08-01', 'Portugal', '180 cm', '75 kg', 'https://media-3.api-sports.io/football/players/119596.png', NULL),
(394, 32767, 26, 'Miguel Ângelo', 'Marques Pinto Pereira', '1999-01-31', 'Portugal', '178 cm', '70 kg', 'https://media-3.api-sports.io/football/players/141295.png', NULL),
(395, 32767, 26, 'Ibrahima', 'Kalil Guirassy', '1998-10-14', 'France', '190 cm', '80 kg', 'https://media.api-sports.io/football/players/141764.png', NULL),
(396, 32767, 26, 'José Manuel', 'Albergaria Costa Leite', '1999-09-01', 'Portugal', '173 cm', '68 kg', 'https://media-3.api-sports.io/football/players/141889.png', NULL),
(397, 32767, 26, 'Volnei', 'Feltes', '2000-04-15', 'Brazil', '188 cm', '75 kg', 'https://media-3.api-sports.io/football/players/277165.png', NULL),
(398, 32767, 26, 'José Marcelo', 'Ferreira Marques', '1998-08-31', 'Portugal', '', '', 'https://media.api-sports.io/football/players/279208.png', NULL),
(399, 32767, 26, 'Pedro Miguel', 'Rodrigues Graça', '1998-09-16', 'Portugal', '', '', 'https://media.api-sports.io/football/players/279301.png', NULL),
(400, 32767, 26, 'Sérgio Miguel', 'Lobo Araújo', '1999-12-01', 'Portugal', '155 cm', '44 kg', 'https://media-3.api-sports.io/football/players/279580.png', NULL),
(401, 10991, 22, 'Nuno Miguel', 'Adro Tomás', '1995-09-15', 'Portugal', '184 cm', '78 kg', 'https://media.api-sports.io/football/players/10991.png', NULL),
(402, 32767, 22, 'Rúben Alexandre', 'Gomes Oliveira', '1994-12-14', 'Portugal', '170 cm', '70 kg', 'https://media-3.api-sports.io/football/players/41336.png', NULL),
(403, 32767, 22, 'Henrique', 'Gelain Custódio', '1995-01-05', 'Brazil', '179 cm', '81 kg', 'https://media-3.api-sports.io/football/players/41352.png', NULL),
(404, 32767, 22, 'Azougha', 'Tembeng Abenego', '1991-09-13', 'Cameroon', '188 cm', '80 kg', 'https://media.api-sports.io/football/players/41449.png', NULL),
(405, 32767, 22, 'Patrick', 'Machado Ferreira', '1998-11-23', 'Brazil', '175 cm', '65 kg', 'https://media-3.api-sports.io/football/players/69198.png', NULL),
(406, 32767, 22, 'Dopanga Loockman Trova', 'Boni', '1999-12-21', 'Burkina Faso', '185 cm', '84 kg', 'https://media.api-sports.io/football/players/123731.png', NULL),
(407, 32767, 22, 'Brian', 'Saramago', '1998-11-09', 'USA', '178 cm', '72 kg', 'https://media-3.api-sports.io/football/players/171135.png', NULL),
(408, 32767, 22, 'Diogo João', 'Regala Figueiredo Tavares', '1998-02-19', 'Portugal', '184 cm', '72 kg', 'https://media-3.api-sports.io/football/players/179524.png', NULL),
(409, 32767, 22, 'Tomás Pais', 'Neto Sarmento Castro', '1999-03-13', 'Portugal', '181 cm', '', 'https://media-3.api-sports.io/football/players/192353.png', NULL),
(410, 32767, 22, 'Danny', 'Agostinho Henriques', '1997-07-29', 'Netherlands', '185 cm', '82 kg', 'https://media-3.api-sports.io/football/players/196329.png', NULL),
(411, 32767, 22, 'Francisco José', 'Coelho Teixeira', '1998-04-26', 'Portugal', '177 cm', '73 kg', 'https://media-3.api-sports.io/football/players/278621.png', NULL),
(412, 32767, 22, 'Álvaro Raul', 'Sofrimento Ramalho', '1999-01-20', 'Portugal', '188 cm', '81 kg', 'https://media-3.api-sports.io/football/players/279445.png', NULL),
(413, 32767, 22, 'Jorge Miguel', 'Lopes Xavier', '2001-05-19', 'Portugal', '186 cm', '75 kg', 'https://media-3.api-sports.io/football/players/279447.png', NULL),
(414, 32767, 22, 'Edgar Patrício', 'Franco Pacheco', '2000-06-23', 'Portugal', '171 cm', '68 kg', 'https://media-3.api-sports.io/football/players/279449.png', NULL),
(415, 32767, 22, 'Braima', 'Embaló Sambú', '2001-03-20', 'Portugal', '', '', 'https://media.api-sports.io/football/players/281150.png', NULL),
(416, 32767, 22, 'Dylan Ayrton', 'Garcia Silva', '1999-02-10', 'Cape Verde', '194 cm', '', 'https://media-3.api-sports.io/football/players/283578.png', NULL),
(417, 32767, 22, 'Martim Rafael', 'Coelho Coxixo', '2003-10-22', 'Portugal', '', '', 'https://media.api-sports.io/football/players/296161.png', NULL),
(418, 32767, 22, 'Jefferson', 'Souza do Nascimento', '2001-10-06', 'Brazil', '172 cm', '72 kg', 'https://media-3.api-sports.io/football/players/305822.png', NULL),
(419, 32767, 22, 'José Gonçalo', 'Macedo Tabuaço', '2001-03-11', 'Portugal', '188 cm', '', 'https://media-3.api-sports.io/football/players/323798.png', NULL),
(420, 32767, 22, 'Samuel', 'Gomes Lobato', '2001-10-19', 'Portugal', '184 cm', '', 'https://media-3.api-sports.io/football/players/378332.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seasons`
--

CREATE TABLE `seasons` (
  `id` smallint(6) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seasons`
--

INSERT INTO `seasons` (`id`, `name`) VALUES
(1, '2022/2023'),
(2, '2021/2022'),
(3, '2020/2021');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` smallint(6) NOT NULL,
  `league_id` smallint(6) NOT NULL,
  `name` text NOT NULL,
  `code` text NOT NULL,
  `logo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `league_id`, `name`, `code`, `logo`) VALUES
(1, 1, 'Benfica', 'BEN', 'https://media-3.api-sports.io/football/teams/211.png'),
(2, 1, 'Portimonense', 'POR', 'https://media-3.api-sports.io/football/teams/216.png'),
(3, 1, 'Boavista', 'BOA', 'https://media-3.api-sports.io/football/teams/222.png'),
(4, 1, 'Guimaraes', 'GUI', 'https://media-3.api-sports.io/football/teams/224.png'),
(5, 1, 'Sporting CP', 'SPO', 'https://media-3.api-sports.io/football/teams/228.png'),
(6, 1, 'Arouca', 'ARO', 'https://media-3.api-sports.io/football/teams/240.png'),
(7, 1, 'Casa Pia', 'CAS', 'https://media-3.api-sports.io/football/teams/4716.png'),
(8, 1, 'GIL Vicente', 'VIC', 'https://media-3.api-sports.io/football/teams/762.png'),
(9, 1, 'Vizela', 'VIZ', 'https://media-3.api-sports.io/football/teams/810.png'),
(10, 1, 'FC Porto', 'POR', 'https://media.api-sports.io/football/teams/212.png'),
(11, 1, 'Maritimo', 'MAR', 'https://media.api-sports.io/football/teams/214.png'),
(12, 1, 'SC Braga', 'BRA', 'https://media.api-sports.io/football/teams/217.png'),
(13, 1, 'Chaves', 'CHA', 'https://media.api-sports.io/football/teams/223.png'),
(14, 1, 'Rio Ave', 'RIO', 'https://media.api-sports.io/football/teams/226.png'),
(15, 1, 'Santa Clara', 'SAN', 'https://media.api-sports.io/football/teams/227.png'),
(16, 1, 'Estoril', 'EST', 'https://media.api-sports.io/football/teams/230.png'),
(17, 1, 'Pacos Ferreira', 'FER', 'https://media.api-sports.io/football/teams/234.png'),
(18, 1, 'Famalicao', 'FAM', 'https://media.api-sports.io/football/teams/242.png'),
(19, 2, 'Feirense', 'FEI', 'https://media-3.api-sports.io/football/teams/213.png'),
(20, 2, 'Moreirense', 'MOR', 'https://media.api-sports.io/football/teams/215.png'),
(21, 2, 'Tondela', 'TON', 'https://media.api-sports.io/football/teams/218.png'),
(22, 2, 'Belenenses', 'BEL', 'https://media-3.api-sports.io/football/teams/221.png'),
(23, 2, 'Nacional', 'NAC', 'https://media-3.api-sports.io/football/teams/225.png'),
(24, 2, 'Benfica B', 'BEN', 'https://media.api-sports.io/football/teams/229.png'),
(25, 2, 'Farense', 'FAR', 'https://media.api-sports.io/football/teams/231.png'),
(26, 2, 'Oliveirense', 'OLI', 'https://media-3.api-sports.io/football/teams/233.png'),
(27, 2, 'Penafiel', 'PEN', 'https://media.api-sports.io/football/teams/235.png'),
(28, 2, 'SC Covilha', 'COV', 'https://media.api-sports.io/football/teams/236.png'),
(29, 2, 'Academico Viseu', 'ACA', 'https://media.api-sports.io/football/teams/238.png'),
(30, 2, 'FC Porto B', 'POR', 'https://media.api-sports.io/football/teams/243.png'),
(31, 2, 'Leixoes', 'LEI', 'https://media-3.api-sports.io/football/teams/244.png'),
(32, 2, 'Mafra', 'MAF', 'https://media.api-sports.io/football/teams/245.png'),
(33, 2, 'Vilafranquense', 'VIL', 'https://media-3.api-sports.io/football/teams/4717.png'),
(34, 2, 'Torreense', 'TOR', 'https://media.api-sports.io/football/teams/4799.png'),
(35, 2, 'Trofense', 'TRO', 'https://media.api-sports.io/football/teams/4801.png'),
(36, 2, 'Estrela', 'EST', 'https://media-3.api-sports.io/football/teams/15130.png'),
(37, 3, 'Benfica', 'BEN', 'https://media-3.api-sports.io/football/teams/211.png'),
(38, 3, 'FC Porto', 'POR', 'https://media.api-sports.io/football/teams/212.png'),
(39, 3, 'Maritimo', 'MAR', 'https://media.api-sports.io/football/teams/214.png'),
(40, 3, 'Moreirense', 'MOR', 'https://media-3.api-sports.io/football/teams/215.png'),
(41, 3, 'Portimonense', 'POR', 'https://media.api-sports.io/football/teams/216.png'),
(42, 3, 'SC Braga', 'BRA', 'https://media-3.api-sports.io/football/teams/217.png'),
(43, 3, 'Tondela', 'TON', 'https://media.api-sports.io/football/teams/218.png'),
(44, 3, 'Belenenses', 'BEL', 'https://media-3.api-sports.io/football/teams/221.png'),
(45, 3, 'Boavista', 'BOA', 'https://media-3.api-sports.io/football/teams/222.png'),
(46, 3, 'Chaves', 'CHA', 'https://media-3.api-sports.io/football/teams/223.png'),
(47, 3, 'Guimaraes', 'GUI', 'https://media.api-sports.io/football/teams/224.png'),
(48, 3, 'Santa Clara', 'SAN', 'https://media-3.api-sports.io/football/teams/227.png'),
(49, 3, 'Sporting CP', 'SPO', 'https://media.api-sports.io/football/teams/228.png'),
(50, 3, 'Estoril', 'EST', 'https://media-3.api-sports.io/football/teams/230.png'),
(51, 3, 'Pacos Ferreira', 'FER', 'https://media-3.api-sports.io/football/teams/234.png'),
(52, 3, 'Arouca', 'ARO', 'https://media-3.api-sports.io/football/teams/240.png'),
(53, 3, 'Famalicao', 'FAM', 'https://media-3.api-sports.io/football/teams/242.png'),
(54, 3, 'GIL Vicente', 'VIC', 'https://media.api-sports.io/football/teams/762.png'),
(55, 3, 'Vizela', 'VIZ', 'https://media.api-sports.io/football/teams/810.png'),
(56, 4, 'Feirense', 'FEI', 'https://media-3.api-sports.io/football/teams/213.png'),
(57, 4, 'Chaves', 'CHA', 'https://media-3.api-sports.io/football/teams/223.png'),
(58, 4, 'Nacional', 'NAC', 'https://media-3.api-sports.io/football/teams/225.png'),
(59, 4, 'Rio Ave', 'RIO', 'https://media-3.api-sports.io/football/teams/226.png'),
(60, 4, 'Benfica B', 'BEN', 'https://media.api-sports.io/football/teams/229.png'),
(61, 4, 'Farense', 'FAR', 'https://media.api-sports.io/football/teams/231.png'),
(62, 4, 'Penafiel', 'PEN', 'https://media-3.api-sports.io/football/teams/235.png'),
(63, 4, 'SC Covilha', 'COV', 'https://media.api-sports.io/football/teams/236.png'),
(64, 4, 'Varzim', 'VAR', 'https://media-3.api-sports.io/football/teams/237.png'),
(65, 4, 'Academico Viseu', 'ACA', 'https://media.api-sports.io/football/teams/238.png'),
(66, 4, 'Academica', 'ACA', 'https://media-3.api-sports.io/football/teams/239.png'),
(67, 4, 'FC Porto B', 'POR', 'https://media-3.api-sports.io/football/teams/243.png'),
(68, 4, 'Leixoes', 'LEI', 'https://media.api-sports.io/football/teams/244.png'),
(69, 4, 'Mafra', 'MAF', 'https://media-3.api-sports.io/football/teams/245.png'),
(70, 4, 'Casa Pia', 'CAS', 'https://media-3.api-sports.io/football/teams/4716.png'),
(71, 4, 'Vilafranquense', 'VIL', 'https://media.api-sports.io/football/teams/4717.png'),
(72, 4, 'Alverca', 'ALV', 'https://media-3.api-sports.io/football/teams/4724.png'),
(73, 4, 'Trofense', 'TRO', 'https://media-3.api-sports.io/football/teams/4801.png'),
(74, 4, 'Estrela', 'EST', 'https://media-3.api-sports.io/football/teams/15130.png'),
(75, 5, 'Benfica', 'BEN', 'https://media-3.api-sports.io/football/teams/211.png'),
(76, 5, 'FC Porto', 'POR', 'https://media-3.api-sports.io/football/teams/212.png'),
(77, 5, 'Maritimo', 'MAR', 'https://media.api-sports.io/football/teams/214.png'),
(78, 5, 'Moreirense', 'MOR', 'https://media.api-sports.io/football/teams/215.png'),
(79, 5, 'Portimonense', 'POR', 'https://media.api-sports.io/football/teams/216.png'),
(80, 5, 'SC Braga', 'BRA', 'https://media-3.api-sports.io/football/teams/217.png'),
(81, 5, 'Tondela', 'TON', 'https://media-3.api-sports.io/football/teams/218.png'),
(82, 5, 'Belenenses', 'BEL', 'https://media.api-sports.io/football/teams/221.png'),
(83, 5, 'Boavista', 'BOA', 'https://media-3.api-sports.io/football/teams/222.png'),
(84, 5, 'Guimaraes', 'GUI', 'https://media-3.api-sports.io/football/teams/224.png'),
(85, 5, 'Nacional', 'NAC', 'https://media-3.api-sports.io/football/teams/225.png'),
(86, 5, 'Rio Ave', 'RIO', 'https://media-3.api-sports.io/football/teams/226.png'),
(87, 5, 'Santa Clara', 'SAN', 'https://media-3.api-sports.io/football/teams/227.png'),
(88, 5, 'Sporting CP', 'SPO', 'https://media.api-sports.io/football/teams/228.png'),
(89, 5, 'Farense', 'FAR', 'https://media.api-sports.io/football/teams/231.png'),
(90, 5, 'Pacos Ferreira', 'FER', 'https://media-3.api-sports.io/football/teams/234.png'),
(91, 5, 'Arouca', 'ARO', 'https://media.api-sports.io/football/teams/240.png'),
(92, 5, 'Famalicao', 'FAM', 'https://media.api-sports.io/football/teams/242.png'),
(93, 5, 'GIL Vicente', 'VIC', 'https://media-3.api-sports.io/football/teams/762.png'),
(94, 6, 'Feirense', 'FEI', 'https://media-3.api-sports.io/football/teams/213.png'),
(95, 6, 'Chaves', 'CHA', 'https://media-3.api-sports.io/football/teams/223.png'),
(96, 6, 'Benfica B', 'BEN', 'https://media.api-sports.io/football/teams/229.png'),
(97, 6, 'Estoril', 'EST', 'https://media.api-sports.io/football/teams/230.png'),
(98, 6, 'Oliveirense', 'OLI', 'https://media.api-sports.io/football/teams/233.png'),
(99, 6, 'Penafiel', 'PEN', 'https://media.api-sports.io/football/teams/235.png'),
(100, 6, 'SC Covilha', 'COV', 'https://media.api-sports.io/football/teams/236.png'),
(101, 6, 'Varzim', 'VAR', 'https://media.api-sports.io/football/teams/237.png'),
(102, 6, 'Academico Viseu', 'ACA', 'https://media-3.api-sports.io/football/teams/238.png'),
(103, 6, 'Academica', 'ACA', 'https://media.api-sports.io/football/teams/239.png'),
(104, 6, 'Arouca', 'ARO', 'https://media.api-sports.io/football/teams/240.png'),
(105, 6, 'Cova De Piedade', 'COV', 'https://media-3.api-sports.io/football/teams/241.png'),
(106, 6, 'FC Porto B', 'POR', 'https://media-3.api-sports.io/football/teams/243.png'),
(107, 6, 'Leixoes', 'LEI', 'https://media-3.api-sports.io/football/teams/244.png'),
(108, 6, 'Mafra', 'MAF', 'https://media-3.api-sports.io/football/teams/245.png'),
(109, 6, 'Vizela', 'VIZ', 'https://media-3.api-sports.io/football/teams/810.png'),
(110, 6, 'Casa Pia', 'CAS', 'https://media-3.api-sports.io/football/teams/4716.png'),
(111, 6, 'Vilafranquense', 'VIL', 'https://media.api-sports.io/football/teams/4717.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leagues`
--
ALTER TABLE `leagues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `leagues`
--
ALTER TABLE `leagues`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=421;

--
-- AUTO_INCREMENT for table `seasons`
--
ALTER TABLE `seasons`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

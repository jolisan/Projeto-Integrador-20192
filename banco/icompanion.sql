-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 30-Out-2019 às 05:55
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `icompanion`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cobranca`
--

DROP TABLE IF EXISTS `cobranca`;
CREATE TABLE IF NOT EXISTS `cobranca` (
  `id_cobranca` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_match` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `valor_cobranca` float NOT NULL DEFAULT '0',
  `data_cobranca` date DEFAULT NULL,
  `forma_pagamento` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cobranca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cobranca_erro`
--

DROP TABLE IF EXISTS `cobranca_erro`;
CREATE TABLE IF NOT EXISTS `cobranca_erro` (
  `id_cobranca_erro` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_match` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `valor_cobrado` float NOT NULL DEFAULT '0',
  `data_ocorrencia` date DEFAULT NULL,
  `forma_pagamento` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `motivo` varchar(90) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_cobranca_erro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `colaborador`
--

DROP TABLE IF EXISTS `colaborador`;
CREATE TABLE IF NOT EXISTS `colaborador` (
  `id_colaborador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL DEFAULT '',
  `sobrenome` varchar(45) NOT NULL DEFAULT '',
  `cpf` varchar(45) NOT NULL DEFAULT '',
  `rg` varchar(45) NOT NULL DEFAULT '',
  `data_aniversario` date DEFAULT NULL,
  `data_entrada` date DEFAULT NULL,
  `email` varchar(90) NOT NULL DEFAULT '',
  `senha` varchar(200) NOT NULL DEFAULT '',
  `id_endereco` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `id_telefone` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `saldo` float NOT NULL DEFAULT '0',
  `fotoperfil` varchar(150) NOT NULL DEFAULT 'https://i.imgur.com/2s9gA6V.png',
  PRIMARY KEY (`id_colaborador`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `colaborador`
--

INSERT INTO `colaborador` (`id_colaborador`, `nome`, `sobrenome`, `cpf`, `rg`, `data_aniversario`, `data_entrada`, `email`, `senha`, `id_endereco`, `id_telefone`, `saldo`, `fotoperfil`) VALUES
(1, 'Esther', 'Castro', '15240608369', '192705507', '1957-06-05', '2019-10-30', 'estherandreiasaracastro-91@pobox.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 0, 'https://i.imgur.com/xq5ambl.png'),
(2, 'Maria', 'Madalena', '17775648890', '156489638', '1997-06-30', '2019-10-30', 'mariamadalena@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2, 2, 0, 'https://i.imgur.com/JtaFqQm.png'),
(3, 'Julia', 'Guedes', '07774115960', '159876458', '1989-08-12', '2019-10-30', 'juliaguedes@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 3, 3, 0, 'https://i.imgur.com/QcsCnrB.png'),
(4, 'Saco', 'Depao', '45685245620', '156789456', '1999-04-12', '2019-10-30', 'sacodepaonacara@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 4, 4, 0, 'https://i.imgur.com/ALC4YFz.png'),
(5, 'Joana', 'Maria', '08995612350', '156982368', '1967-10-15', '2019-10-30', 'namoradadepique@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 5, 5, 0, 'https://i.imgur.com/bhnsuCj.png'),
(6, 'Tatiana', 'Mariano', '18649568450', '156826456', '1977-07-30', '2019-10-30', 'maedepedro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 6, 6, 0, 'https://i.imgur.com/xFTdtd3.png'),
(7, 'Isabella', 'Barbosa', '15946245580', '179456123', '1988-12-08', '2019-10-30', 'maedepike@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 7, 7, 0, 'https://i.imgur.com/MCEuWOb.png'),
(8, 'Maria', 'Janaina', '05564548820', '115685507', '1988-11-05', '2019-10-30', 'mariajanaina12@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 8, 8, 0, 'https://i.imgur.com/dBp72q0.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
  `id_endereco` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rua` varchar(90) NOT NULL DEFAULT '',
  `numero` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cep` varchar(45) NOT NULL DEFAULT '',
  `complemento` varchar(45) NOT NULL DEFAULT '',
  `cidade` varchar(45) NOT NULL DEFAULT '',
  `estado` varchar(2) NOT NULL DEFAULT '',
  `pais` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `rua`, `numero`, `cep`, `complemento`, `cidade`, `estado`, `pais`) VALUES
(1, 'Rua Maria Alves', 12, '\r\n40435-885\r\n', 'Ao lado da padaria', 'Salvador', 'BA', 'Brasil'),
(2, 'Avenida Nelson Dórea', 754, ' 40327-175', ' Liberdade', ' Salvador', 'BA', 'Brasil'),
(3, 'Rua Valor novaes', 12, ' 41290-695', 'padaria', 'Salvador', 'BA', 'Brasil'),
(4, 'Avenida Cearense', 33, ' 40327-175', 'casa', 'Salvador', 'BA', 'Brasil'),
(5, 'Travessa Sá Pinto', 87, '40327-175', 'santos', 'Salvador', 'BA', 'Brasil'),
(6, 'Rua Itajuá', 12, '40327-175', 'mercadinho sao jose', 'Salvador', 'BA', 'Brasil'),
(7, 'Rua Jasmim do Cerrado', 75, '40327-175', 'dentista', 'Salvador', 'BA', 'Brasil'),
(8, 'Avenida Angélica', 6, '40327-175', 'yes', 'Salvador', 'BA', 'Brasil');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gostos`
--

DROP TABLE IF EXISTS `gostos`;
CREATE TABLE IF NOT EXISTS `gostos` (
  `id_gostos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `categoria_filme` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comida_preferida` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bebida_preferida` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `estilo_musical` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lazer` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `animal_preferido` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_gostos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `gosto_pessoa`
--

DROP TABLE IF EXISTS `gosto_pessoa`;
CREATE TABLE IF NOT EXISTS `gosto_pessoa` (
  `id_gosto_pessoa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tipo_pessoa` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `id_gosto` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_gosto_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_match`
--

DROP TABLE IF EXISTS `lista_match`;
CREATE TABLE IF NOT EXISTS `lista_match` (
  `id_lista_match` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `id_colaborador` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_lista_match`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `lista_match`
--

INSERT INTO `lista_match` (`id_lista_match`, `id_usuario`, `id_colaborador`) VALUES
(1, 1, 4),
(2, 1, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `match`
--

DROP TABLE IF EXISTS `match`;
CREATE TABLE IF NOT EXISTS `match` (
  `id_match` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `id_colaborador` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` date DEFAULT NULL,
  `valor` float NOT NULL DEFAULT '0',
  `nome_encontro` varchar(90) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  PRIMARY KEY (`id_match`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `match`
--

INSERT INTO `match` (`id_match`, `id_usuario`, `id_colaborador`, `data`, `valor`, `nome_encontro`, `descricao`) VALUES
(1, 1, 4, '2019-10-30', 0, 'Encontro com saco', 'Finalmente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

DROP TABLE IF EXISTS `telefone`;
CREATE TABLE IF NOT EXISTS `telefone` (
  `id_telefone` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ddi` varchar(3) NOT NULL DEFAULT '',
  `ddd` varchar(5) NOT NULL DEFAULT '',
  `telefone` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `telefone`
--

INSERT INTO `telefone` (`id_telefone`, `ddi`, `ddd`, `telefone`) VALUES
(1, '55', '71', '987124511'),
(2, '55', '71', '987062290'),
(3, '55', '71', '944155346'),
(4, '55', '71', '962298489'),
(5, '55', '71', '936402387'),
(6, '55', '71', '984669074'),
(7, '55', '71', '993486037'),
(8, '55', '71', '987931964');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL DEFAULT '',
  `sobrenome` varchar(45) NOT NULL DEFAULT '',
  `cpf` varchar(45) NOT NULL DEFAULT '',
  `rg` varchar(45) NOT NULL DEFAULT '',
  `data_aniversario` date DEFAULT NULL,
  `data_entrada` date DEFAULT NULL,
  `email` varchar(90) NOT NULL DEFAULT '',
  `senha` varchar(200) NOT NULL DEFAULT '',
  `id_endereco` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `id_telefone` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `saldo` float NOT NULL DEFAULT '0',
  `fotoperfil` varchar(150) NOT NULL DEFAULT 'https://i.imgur.com/2s9gA6V.png',
  PRIMARY KEY (`id_usuario`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `sobrenome`, `cpf`, `rg`, `data_aniversario`, `data_entrada`, `email`, `senha`, `id_endereco`, `id_telefone`, `saldo`, `fotoperfil`) VALUES
(1, 'Alex', 'Barna', '', '', NULL, '2019-10-30', 'alex@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 0, 37000, 'https://i.imgur.com/35VL5yv.png');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

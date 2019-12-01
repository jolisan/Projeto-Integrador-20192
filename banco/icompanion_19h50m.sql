-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 01-Dez-2019 às 22:49
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
-- Estrutura da tabela `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
CREATE TABLE IF NOT EXISTS `avaliacao` (
  `id_avaliacao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nota_avaliacao` int(5) DEFAULT '5',
  `data_avaliacao` date DEFAULT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `fk_usuario_avaliacao` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `id_usuario`) VALUES
(1, 17),
(2, 18),
(3, 19),
(4, 20),
(5, 21),
(6, 22),
(7, 37),
(8, 38),
(9, 39),
(10, 40);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cobranca`
--

DROP TABLE IF EXISTS `cobranca`;
CREATE TABLE IF NOT EXISTS `cobranca` (
  `id_cobranca` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `valor_cobranca` float NOT NULL DEFAULT '0',
  `data_cobranca` date DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `id_combinacoes` int(10) UNSIGNED NOT NULL,
  `id_cobranca_erro` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id_cobranca`),
  KEY `fk_id_combinacoes_cobranca` (`id_combinacoes`),
  KEY `fk_cobranca_erro` (`id_cobranca_erro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cobranca_erro`
--

DROP TABLE IF EXISTS `cobranca_erro`;
CREATE TABLE IF NOT EXISTS `cobranca_erro` (
  `id_cobranca_erro` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `valor_cobrado` float NOT NULL DEFAULT '0',
  `data_ocorrencia` date DEFAULT NULL,
  `motivo` varchar(90) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_cobranca_erro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `colaborador`
--

DROP TABLE IF EXISTS `colaborador`;
CREATE TABLE IF NOT EXISTS `colaborador` (
  `id_colaborador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_colaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `colaborador`
--

INSERT INTO `colaborador` (`id_colaborador`, `id_usuario`) VALUES
(1, 9),
(2, 10),
(3, 11),
(4, 12),
(5, 13),
(6, 14),
(7, 15),
(8, 16),
(9, 18);

-- --------------------------------------------------------

--
-- Estrutura da tabela `combinacoes`
--

DROP TABLE IF EXISTS `combinacoes`;
CREATE TABLE IF NOT EXISTS `combinacoes` (
  `id_combinacoes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `valor` float NOT NULL DEFAULT '0',
  `nome_encontro` varchar(90) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `id_colaborador` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_combinacoes`),
  KEY `fk_cliente` (`id_cliente`),
  KEY `fk_colaborador_comb` (`id_colaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `combinacoes`
--

INSERT INTO `combinacoes` (`id_combinacoes`, `data`, `valor`, `nome_encontro`, `descricao`, `id_cliente`, `id_colaborador`) VALUES
(1, '2019-11-30', 5, 'Jogar bola', 'Bater aquele baba maroto', 5, 1),
(2, '2019-11-30', 2, 'Jogar volei', 'Bater aquele voleizao', 5, 2),
(3, '2019-11-30', 1, 'Reuniao do PI', 'Reunir pra terminar o PI 1', 5, 3),
(4, '2019-11-30', 3, 'Trocar ideia', 'Bater aquele papo', 5, 4),
(5, '2019-11-30', 4, 'Ainda nao sei', 'to pensando', 5, 5),
(6, '2019-11-30', 3, 'Andar de bike', 'Rolezao de bike', 5, 6),
(7, '2019-11-30', 2, 'Bar', 'Tomar uma no bar ', 5, 7),
(8, '2019-11-30', 7, 'Cinema', 'Assistir vingadores ', 5, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
  `id_endereco` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `rua` varchar(90) NOT NULL DEFAULT '',
  `numero` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cep` varchar(45) NOT NULL DEFAULT '',
  `complemento` varchar(45) NOT NULL DEFAULT '',
  `cidade` varchar(45) NOT NULL DEFAULT '',
  `estado` varchar(2) NOT NULL DEFAULT '',
  `pais` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_endereco`),
  KEY `fk_id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `id_usuario`, `rua`, `numero`, `cep`, `complemento`, `cidade`, `estado`, `pais`) VALUES
(1, 9, 'Rua Maria Alves', 12, '\r\n40435-885\r\n', 'Ao lado da padaria', 'Salvador', 'BA', 'Brasil'),
(2, 10, 'Avenida Nelson Dórea', 754, ' 40327-175', ' Liberdade', ' Salvador', 'BA', 'Brasil'),
(3, 21, 'Rua Valor novaes', 12, ' 41290-695', 'padaria', 'SalvadoX', 'BK', 'Brasil'),
(4, 12, 'Avenida Cearense', 33, ' 40327-175', 'casa', 'Salvador', 'BA', 'Brasil'),
(5, 13, 'Travessa Sá Pinto', 87, '40327-175', 'santos', 'Salvador', 'BA', 'Brasil'),
(6, 14, 'Rua Itajuá', 12, '40327-175', 'mercadinho sao jose', 'Salvador', 'BA', 'Brasil'),
(7, 15, 'Rua Jasmim do Cerrado', 75, '40327-175', 'dentista', 'Salvador', 'BA', 'Brasil'),
(8, 16, 'Avenida Angélica', 6, '40327-175', 'yes', 'Salvador', 'BA', 'Brasil'),
(9, 17, 'Rua Travessa Avestruz', 122, '69901-176', 'Perto dali', 'Rio Branco', 'AC', 'Brasil'),
(10, 18, 'Rua Abacaxi', 7564, ' 69901-043', ' Morada do Sol', ' Rio Branco', 'AC', 'Brasil'),
(11, 19, 'Travessa Augusto Borges', 126, ' 68743-625', 'Caiçara', 'Castanhal', 'PA', 'Brasil'),
(12, 33, 'Travessa Coronel Bonifácio', 336, ' 59025-560', 'Cidade Alta', 'Natal', 'RN', 'Brasil'),
(13, 33, 'Rua G', 87, '77423-050', 'Waldir Lins I', 'Gurupi', 'TO', 'Brasil'),
(14, 11, 'Rua Colio', 37, '86706-208', 'Jardim do Café', 'Arapongas', 'PR', 'Brasil'),
(15, 38, '', 0, '', '', '', '', ''),
(16, 39, '', 0, '', '', '', '', ''),
(17, 40, '', 0, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gostos`
--

DROP TABLE IF EXISTS `gostos`;
CREATE TABLE IF NOT EXISTS `gostos` (
  `id_gostos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `categoria_filme` varchar(50) DEFAULT NULL,
  `comida_preferida` varchar(50) DEFAULT NULL,
  `bebida_preferida` varchar(50) DEFAULT NULL,
  `estilo_musical` varchar(50) DEFAULT NULL,
  `lazer` varchar(50) DEFAULT NULL,
  `animal_preferido` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_gostos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `gostos_usuario`
--

DROP TABLE IF EXISTS `gostos_usuario`;
CREATE TABLE IF NOT EXISTS `gostos_usuario` (
  `id_gostos_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `id_gostos` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_gostos_usuario`),
  KEY `fk_gostos` (`id_gostos`),
  KEY `fk_usuario_gostos` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
CREATE TABLE IF NOT EXISTS `mensagem` (
  `id_mensagem` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `conteudo` varchar(150) NOT NULL DEFAULT '',
  `data_ocorrencia` date DEFAULT NULL,
  `id_usuario_envio` int(10) UNSIGNED DEFAULT NULL,
  `id_usuario_recebe` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id_mensagem`),
  KEY `fk_usuario_envio` (`id_usuario_envio`),
  KEY `fk_usuario_recebe` (`id_usuario_recebe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_combinacoes`
--

DROP TABLE IF EXISTS `pedidos_combinacoes`;
CREATE TABLE IF NOT EXISTS `pedidos_combinacoes` (
  `id_pedidos_combinacoes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_colaborador` int(11) NOT NULL,
  `valor` float NOT NULL DEFAULT '0',
  `descricao` text,
  PRIMARY KEY (`id_pedidos_combinacoes`),
  KEY `fk_colaborador_combinacoes` (`id_colaborador`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedidos_combinacoes`
--

INSERT INTO `pedidos_combinacoes` (`id_pedidos_combinacoes`, `id_usuario`, `id_colaborador`, `valor`, `descricao`) VALUES
(1, 21, 4, 0, NULL),
(2, 21, 2, 0, NULL),
(3, 21, 3, 0, NULL),
(4, 21, 5, 0, NULL),
(5, 21, 9, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

DROP TABLE IF EXISTS `telefone`;
CREATE TABLE IF NOT EXISTS `telefone` (
  `id_telefone` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `ddi` varchar(3) NOT NULL DEFAULT '',
  `ddd` varchar(5) NOT NULL DEFAULT '',
  `telefone` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `telefone`
--

INSERT INTO `telefone` (`id_telefone`, `id_usuario`, `ddi`, `ddd`, `telefone`) VALUES
(1, 21, '55', '71', '987124522'),
(2, 20, '55', '71', '987062290'),
(3, 12, '55', '71', '944155346'),
(4, 10, '55', '71', '962298489'),
(5, 11, '55', '71', '936402387'),
(6, 18, '55', '71', '984669074'),
(7, 13, '55', '71', '993486037'),
(8, 9, '55', '71', '987931964'),
(9, 39, '', '', ''),
(10, 40, '', '', '');

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
  `saldo` float NOT NULL DEFAULT '0',
  `fotoperfil` varchar(150) NOT NULL DEFAULT 'https://i.imgur.com/2s9gA6V.png',
  `tipo_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `sobrenome`, `cpf`, `rg`, `data_aniversario`, `data_entrada`, `email`, `senha`, `saldo`, `fotoperfil`, `tipo_usuario`) VALUES
(9, 'Esther', 'Castro', '15240608369', '192705507', '1957-06-05', '2019-10-30', 'estherandreiasaracastro-91@pobox.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/xq5ambl.png', 1),
(10, 'Maria', 'Madalena', '17775648890', '156489638', '1997-06-30', '2019-10-30', 'mariamadalena@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/JtaFqQm.png', 1),
(11, 'Julia', 'Guedes', '07774115960', '159876458', '1989-08-12', '2019-10-30', 'juliaguedes@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/QcsCnrB.png', 0),
(12, 'Saco', 'Depao', '45685245620', '156789456', '1999-04-12', '2019-10-30', 'sacodepaonacara@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/ALC4YFz.png', 0),
(13, 'Joana', 'Maria', '08995612350', '156982368', '1967-10-15', '2019-10-30', 'namoradadepique@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/bhnsuCj.png', 0),
(14, 'Tatiana', 'Mariano', '18649568450', '156826456', '1977-07-30', '2019-10-30', 'maedepedro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/xFTdtd3.png', 0),
(15, 'Isabella', 'Barbosa', '15946245580', '179456123', '1988-12-08', '2019-10-30', 'maedepike@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/MCEuWOb.png', 0),
(16, 'Maria', 'Janaina', '05564548820', '115685507', '1988-11-05', '2019-10-30', 'mariajanaina12@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/dBp72q0.png', 0),
(17, 'Alfonso', 'Martinez', '129.787.360-20', '15.213.082-2', '1957-06-05', '2019-10-30', 'alfonso@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0),
(18, 'Jolisan', 'Vinicius', '487.903.320-08', '30.978.180-2', '1997-06-30', '2019-10-30', 'jolisan@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0),
(19, 'Joao', 'Sledz', '698.687.190-20', '25.118.759-7', '1989-08-12', '2019-10-30', 'sledz@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0),
(20, 'Pedro', 'Monnerat', '908.847.080-47', '49.284.233-4', '1999-04-12', '2019-10-30', 'pedro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0),
(21, 'Alex', 'Boanerges', '292.900.770-26', '43.770.284-4', '1967-10-15', '2019-10-30', 'alex@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 333, 'https://i.imgur.com/2s9gA6V.png', 0),
(22, 'Marcos', 'Lapa', '210.612.030-34', '41.460.811-2', '1977-07-30', '2019-10-30', 'lapa@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0),
(32, 'teste', 'vsf', '', '', NULL, '2019-11-30', 'comecuzinho@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 1),
(33, 'juliana', 'alves', '', '', NULL, '2019-11-30', 'juliana@gmail.com', '4b2c4ccbe88baa6bb4d1a3271a6ad633', 0, 'https://i.imgur.com/2s9gA6V.png', 1),
(34, 'marcos', 'teste', '', '', NULL, '2019-11-30', 'TESTES@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0),
(35, 'joao', 'auves', '', '', NULL, '2019-11-30', 'joao9@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0),
(36, 'marcelo', 'marcelo', '', '', NULL, '2019-11-30', 'marcelod444444@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0),
(37, 'yuri', 'alves', '', '', NULL, '2019-11-30', 'yuri@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0),
(38, 'cabesa', 'deguidao', '', '', NULL, '2019-12-01', 'cabesa@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0),
(39, 'paulo', 'fora', '', '', NULL, '2019-12-01', 'paulo@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0),
(40, 'sdiahsdi', 'ijdaojdsao', '', '', NULL, '2019-12-01', 'ocjkaodjoas@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 1);

--
-- Acionadores `usuario`
--
DROP TRIGGER IF EXISTS `add_endereco`;
DELIMITER $$
CREATE TRIGGER `add_endereco` AFTER INSERT ON `usuario` FOR EACH ROW INSERT INTO endereco (id_usuario) VALUES (new.id_usuario)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `add_telefone`;
DELIMITER $$
CREATE TRIGGER `add_telefone` AFTER INSERT ON `usuario` FOR EACH ROW INSERT INTO telefone (id_usuario) VALUES (new.id_usuario)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `inserir_id_cliente`;
DELIMITER $$
CREATE TRIGGER `inserir_id_cliente` AFTER INSERT ON `usuario` FOR EACH ROW INSERT INTO cliente (id_usuario) VALUES ( new.id_usuario)
$$
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk_usuario_avaliacao` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `cobranca`
--
ALTER TABLE `cobranca`
  ADD CONSTRAINT `fk_cobranca_erro` FOREIGN KEY (`id_cobranca_erro`) REFERENCES `cobranca_erro` (`id_cobranca_erro`),
  ADD CONSTRAINT `fk_id_combinacoes_cobranca` FOREIGN KEY (`id_combinacoes`) REFERENCES `combinacoes` (`id_combinacoes`);

--
-- Limitadores para a tabela `combinacoes`
--
ALTER TABLE `combinacoes`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `fk_colaborador_comb` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id_colaborador`);

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `gostos_usuario`
--
ALTER TABLE `gostos_usuario`
  ADD CONSTRAINT `fk_gostos` FOREIGN KEY (`id_gostos`) REFERENCES `gostos` (`id_gostos`),
  ADD CONSTRAINT `fk_usuario_gostos` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD CONSTRAINT `fk_usuario_envio` FOREIGN KEY (`id_usuario_envio`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `fk_usuario_recebe` FOREIGN KEY (`id_usuario_recebe`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

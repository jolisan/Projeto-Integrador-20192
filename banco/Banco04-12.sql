-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Dez-2019 às 16:13
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `icompanion`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `PC_InserirCombinacaoChecandoIdade` (IN `Valor1` FLOAT, IN `NomeEncontro` VARCHAR(100), IN `Descricaoo` VARCHAR(100), IN `IdCliente` INT, IN `IdColaborador` INT)  BEGIN

    DECLARE Idade INT;
    DECLARE Maior INT;
    SET Idade = (SELECT YEAR(CURRENT_DATE) - YEAR(data_aniversario) FROM usuario WHERE id_usuario = (SELECT usuario.id_usuario FROM usuario INNER JOIN cliente ON(cliente.id_usuario = usuario.id_usuario) WHERE cliente.id_cliente = IdCliente));
    SET Maior = If( Idade > 18, 1, 0);
    CASE Maior
      WHEN 1 THEN INSERT INTO combinacoes ( data, valor, nome_encontro, descricao,id_cliente, id_colaborador) VALUES (CURRENT_DATE, Valor1, NomeEncontro, Descricaoo, IdCliente, IdColaborador);
      WHEN 0 THEN ROLLBACK;
      ELSE
        BEGIN
        END;
    END CASE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id_avaliacao` int(10) UNSIGNED NOT NULL,
  `nota_avaliacao` int(5) DEFAULT 5,
  `data_avaliacao` date DEFAULT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(10, 40),
(11, 41),
(12, 42),
(13, 43),
(14, 44),
(15, 45),
(16, 46),
(17, 47);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cobranca`
--

CREATE TABLE `cobranca` (
  `id_cobranca` int(10) UNSIGNED NOT NULL,
  `valor_cobranca` float NOT NULL DEFAULT 0,
  `data_cobranca` date DEFAULT NULL,
  `forma_pagamento` varchar(15) DEFAULT NULL,
  `id_combinacoes` int(10) UNSIGNED NOT NULL,
  `id_cobranca_erro` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cobranca_erro`
--

CREATE TABLE `cobranca_erro` (
  `id_cobranca_erro` int(10) UNSIGNED NOT NULL,
  `valor_cobrado` float NOT NULL DEFAULT 0,
  `data_ocorrencia` date DEFAULT NULL,
  `motivo` varchar(90) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `colaborador`
--

CREATE TABLE `colaborador` (
  `id_colaborador` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(9, 18),
(10, 43),
(11, 44),
(12, 45),
(13, 46),
(14, 47);

-- --------------------------------------------------------

--
-- Estrutura da tabela `combinacoes`
--

CREATE TABLE `combinacoes` (
  `id_combinacoes` int(10) UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `valor` float NOT NULL DEFAULT 0,
  `nome_encontro` varchar(90) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `id_colaborador` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `combinacoes`
--

INSERT INTO `combinacoes` (`id_combinacoes`, `data`, `valor`, `nome_encontro`, `descricao`, `id_cliente`, `id_colaborador`) VALUES
(1, '2019-11-30', 200, 'Jogar bola', 'Bater aquele baba maroto', 5, 2),
(2, '2019-11-30', 250, 'Jogar volei', 'Bater aquele voleizao', 5, 9),
(3, '2019-11-30', 3, 'Reuniao do PI', 'Reunir pra terminar o PI 1', 5, 4),
(4, '2019-11-30', 4, 'Trocar ideia', 'Bater aquele papo', 5, 5),
(5, '2019-11-30', 5, 'Ainda nao sei', 'to pensando', 1, 2),
(6, '2019-11-30', 6, 'Andar de bike', 'Rolezao de bike', 1, 1),
(7, '2019-11-30', 7, 'Bar', 'Tomar uma no bar ', 1, 8),
(8, '2019-11-30', 100, 'Cinema', 'Assistir vingadores ', 1, 4),
(16, '2019-12-04', 555, 'dsadasda', 'dsadasda', 2, 1),
(17, '2019-12-04', 22222, 'testasdasdasd', 'testasdasdasd', 2, 4),
(19, '2019-12-04', 222, 'Eai mano', 'Eai mano', 2, 3),
(20, '2019-12-04', 321, 'N sei', 'test 4', 6, 3),
(21, '2019-12-04', 555, 'Test1233', 'Cabss', 6, 6),
(22, '2019-12-04', 512, 'ASDDDD', 'asdassss', 6, 4),
(23, '2019-12-04', 222, 'Tsss', 'ssssss', 6, 5),
(24, '2019-12-04', 421, 'bssdd', 'ssss', 5, 7);

--
-- Acionadores `combinacoes`
--
DELIMITER $$
CREATE TRIGGER `tg_adicionaSaldo` AFTER INSERT ON `combinacoes` FOR EACH ROW UPDATE usuario SET usuario.saldo = usuario.saldo + new.valor WHERE usuario.id_usuario = (SELECT k.id_usuario FROM colaborador k INNER JOIN usuario u ON (k.id_usuario = u.id_usuario) WHERE k.id_colaborador = new.id_colaborador)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tg_deleta_pedidomatch` AFTER INSERT ON `combinacoes` FOR EACH ROW DELETE FROM pedidos_combinacoes WHERE pedidos_combinacoes.id_colaborador = new.id_colaborador AND pedidos_combinacoes.id_usuario = (SELECT usuario.id_usuario FROM usuario INNER JOIN cliente ON (cliente.id_usuario = usuario.id_usuario) WHERE cliente.id_cliente = new.id_cliente)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tg_removeSaldo` AFTER INSERT ON `combinacoes` FOR EACH ROW UPDATE usuario SET usuario.saldo = usuario.saldo - new.valor WHERE usuario.id_usuario = (SELECT c.id_usuario FROM cliente c INNER JOIN usuario u ON (C.id_usuario = u.id_usuario) WHERE c.id_cliente = new.id_cliente)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `rua` varchar(90) NOT NULL DEFAULT '',
  `numero` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cep` varchar(45) NOT NULL DEFAULT '',
  `complemento` varchar(45) NOT NULL DEFAULT '',
  `cidade` varchar(45) NOT NULL DEFAULT '',
  `estado` varchar(2) NOT NULL DEFAULT '',
  `pais` varchar(45) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `id_usuario`, `rua`, `numero`, `cep`, `complemento`, `cidade`, `estado`, `pais`) VALUES
(1, 9, 'Rua Maria Alves', 12, '\r\n40435-885\r\n', 'Ao lado da padaria', 'Salvador', 'BA', 'Brasil'),
(2, 10, 'Avenida Nelson DoreaTTT', 7541, ' 40327-200', 'Teste', 'Salvador', 'BA', 'EUA'),
(3, 11, 'Rua Valor novaes', 0, ' 41290-692', 'padaria', 'Salvador', 'BA', 'Brasil'),
(4, 12, 'Avenida Cearense', 33, ' 40327-175', 'casa', 'Salvador', 'BA', 'Brasil'),
(5, 13, 'Travessa Sá Pinto', 87, '40327-175', 'santos', 'Salvador', 'BA', 'Brasil'),
(6, 14, 'Rua Itajuá', 12, '40327-175', 'mercadinho sao jose', 'Salvador', 'BA', 'Brasil'),
(7, 15, 'Rua Jasmim do Cerrado', 75, '40327-175', 'dentista', 'Salvador', 'BA', 'Brasil'),
(8, 16, 'Avenida Angélica', 6, '40327-175', 'yes', 'Salvador', 'BA', 'Brasil'),
(9, 17, 'Rua Travessa Avestruz', 122, '69901-176', 'Perto dali', 'Rio Branco', 'AC', 'Brasil'),
(10, 18, 'Rua Abacaxi', 7564, ' 69901-043', ' Morada do Sol', ' Rio Branco', 'AC', 'Brasil'),
(11, 20, 'Travessa Augusto Borges', 126, ' 68743-625', 'Caiçara', 'Castanhal', 'PA', 'Brasil'),
(12, 33, 'Travessa Coronel Bonifácio', 336, ' 59025-560', 'Cidade Alta', 'Natal', 'RN', 'Brasil'),
(13, 33, 'Rua G', 87, '77423-050', 'Waldir Lins I', 'Gurupi', 'TO', 'Brasil'),
(14, 21, 'Travessa Colio', 12, '86706-208', 'Jardim do Cafe', 'Salvador', 'BA', 'Brasil'),
(15, 38, '', 0, '', '', '', '', ''),
(16, 39, '', 0, '', '', '', '', ''),
(17, 40, '', 0, '', '', '', '', ''),
(18, 41, '', 0, '', '', '', '', ''),
(19, 42, '', 0, '', '', '', '', ''),
(20, 43, '', 0, '', '', '', '', ''),
(21, 44, '', 0, '', '', '', '', ''),
(22, 45, '', 0, '', '', '', '', ''),
(23, 46, '', 0, '', '', '', '', ''),
(24, 47, '', 0, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gostos`
--

CREATE TABLE `gostos` (
  `id_gostos` int(10) UNSIGNED NOT NULL,
  `categoria_filme` varchar(50) DEFAULT NULL,
  `comida_preferida` varchar(50) DEFAULT NULL,
  `bebida_preferida` varchar(50) DEFAULT NULL,
  `estilo_musical` varchar(50) DEFAULT NULL,
  `lazer` varchar(50) DEFAULT NULL,
  `animal_preferido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `gostos_usuario`
--

CREATE TABLE `gostos_usuario` (
  `id_gostos_usuario` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_gostos` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

CREATE TABLE `mensagem` (
  `id_mensagem` int(10) UNSIGNED NOT NULL,
  `conteudo` varchar(150) NOT NULL DEFAULT '',
  `data_ocorrencia` date DEFAULT NULL,
  `id_usuario_envio` int(10) UNSIGNED DEFAULT NULL,
  `id_usuario_recebe` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `mensagem`
--

INSERT INTO `mensagem` (`id_mensagem`, `conteudo`, `data_ocorrencia`, `id_usuario_envio`, `id_usuario_recebe`) VALUES
(1, 'OlÃ¡ tudo bom?', '2019-12-02', 21, 9),
(2, 'TESTE', '2019-12-02', 21, 12),
(3, 'TUDO BOM', '2019-12-02', 21, 9),
(4, 'COMO VAI', '2019-12-02', 21, 9),
(5, 'TUDO BOM??????????????????', '2019-12-02', 10, 21),
(6, '', '2019-12-03', 10, 11),
(7, '', '2019-12-03', 21, 9),
(8, '', '2019-12-03', 21, 9),
(9, '', '2019-12-03', 21, 9),
(10, '', '2019-12-03', 21, 9),
(11, 'Eai meu peixe', '2019-12-04', 10, 21),
(12, '', '2019-12-04', 10, 21),
(13, 'Eai moça', '2019-12-04', 21, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_combinacoes`
--

CREATE TABLE `pedidos_combinacoes` (
  `id_pedidos_combinacoes` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_colaborador` int(11) NOT NULL,
  `valor` float NOT NULL DEFAULT 0,
  `descricao` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `id_telefone` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `ddi` varchar(3) NOT NULL DEFAULT '',
  `ddd` varchar(5) NOT NULL DEFAULT '',
  `telefone` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `telefone`
--

INSERT INTO `telefone` (`id_telefone`, `id_usuario`, `ddi`, `ddd`, `telefone`) VALUES
(1, 9, '55', '71', '987124522'),
(2, 10, '55', '33', '98706111111111'),
(3, 11, '55', '71', '944155346'),
(4, 12, '55', '71', '962298000'),
(5, 13, '55', '71', '936402387'),
(6, 14, '55', '71', '984669074'),
(7, 15, '55', '71', '993486037'),
(8, 20, '55', '71', '987931964'),
(9, 21, '55', '71', '912341234'),
(10, 40, '', '', ''),
(11, 41, '', '', ''),
(12, 42, '', '', ''),
(13, 43, '', '', ''),
(14, 44, '', '', ''),
(15, 45, '', '', ''),
(16, 46, '', '', ''),
(17, 47, '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `nome` varchar(45) NOT NULL DEFAULT '',
  `sobrenome` varchar(45) NOT NULL DEFAULT '',
  `cpf` varchar(45) NOT NULL DEFAULT '',
  `rg` varchar(45) NOT NULL DEFAULT '',
  `data_aniversario` date DEFAULT NULL,
  `data_entrada` date DEFAULT NULL,
  `email` varchar(90) NOT NULL DEFAULT '',
  `senha` varchar(200) NOT NULL DEFAULT '',
  `saldo` float NOT NULL DEFAULT 0,
  `fotoperfil` varchar(150) NOT NULL DEFAULT 'https://i.imgur.com/2s9gA6V.png',
  `tipo_usuario` int(11) NOT NULL,
  `descricaoUsuario` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `sobrenome`, `cpf`, `rg`, `data_aniversario`, `data_entrada`, `email`, `senha`, `saldo`, `fotoperfil`, `tipo_usuario`, `descricaoUsuario`) VALUES
(9, 'Esther', 'Castro', '15240608369', '192705507', '1957-06-05', '2019-10-30', 'estherandreiasaracastro-91@pobox.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/xq5ambl.png', 1, ''),
(10, 'Maria', 'Madalena', '45685245620', '15648963682', '1989-06-30', '2019-10-30', 'mariamadalena@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 3, 'https://i.imgur.com/JtaFqQm.png', 1, 'Eai pessoal'),
(11, 'Julia', 'Guedes', '07774115960', '159876458', '1989-08-12', '2019-10-30', 'juliaguedes@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 321, 'https://i.imgur.com/QcsCnrB.png', 1, ''),
(12, 'Saco', 'Depao', '45685245620', '156789456', '1999-04-12', '2019-10-30', 'sacodepaonacara@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 512, 'https://i.imgur.com/ALC4YFz.png', 1, ''),
(13, 'Joana', 'Maria', '08995612350', '156982368', '1967-10-15', '2019-10-30', 'namoradadepique@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 222, 'https://i.imgur.com/bhnsuCj.png', 1, ''),
(14, 'Tatiana', 'Mariano', '18649568450', '156826456', '1977-07-30', '2019-10-30', 'maedepedro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 555, 'https://i.imgur.com/xFTdtd3.png', 1, ''),
(15, 'Isabella', 'Barbosa', '15946245580', '179456123', '1988-12-08', '2019-10-30', 'maedepike@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 421, 'https://i.imgur.com/MCEuWOb.png', 1, ''),
(16, 'Maria', 'Janaina', '05564548820', '115685507', '1988-11-05', '2019-10-30', 'mariajanaina12@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/dBp72q0.png', 1, ''),
(17, 'Alfonso', 'Martinez', '129.787.360-20', '15.213.082-2', '1957-06-05', '2019-10-30', 'alfonso@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 1, ''),
(18, 'Jolisan', 'Vinicius', '487.903.320-08', '30.978.180-2', '1997-06-30', '2019-10-30', 'jolisan@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0, ''),
(19, 'Joao', 'Sledz', '698.687.190-20', '25.118.759-7', '1989-08-12', '2019-10-30', 'sledz@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0, ''),
(20, 'Pedro', 'Monnerat', '908.847.080-47', '49.284.233-4', '1999-04-12', '2019-10-30', 'pedro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0, ''),
(21, 'Alex', 'Boanerges', '292.900.770-55', '43.770.284-5', '1960-10-13', '2019-10-30', 'alex@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', -310, 'https://i.imgur.com/35VL5yv.png', 0, 'Sou Alex, Amante do futebol nato, hehe!!'),
(22, 'Marcos', 'Lapa', '210.612.030-34', '41.460.811-2', '1977-07-30', '2019-10-30', 'lapa@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', -1610, 'https://i.imgur.com/2s9gA6V.png', 0, ''),
(32, 'teste', 'vsf', '', '', NULL, '2019-11-30', 'comecuzinho@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 1, ''),
(33, 'juliana', 'alves', '', '', NULL, '2019-11-30', 'juliana@gmail.com', '4b2c4ccbe88baa6bb4d1a3271a6ad633', 0, 'https://i.imgur.com/2s9gA6V.png', 1, ''),
(34, 'marcos', 'teste', '', '', NULL, '2019-11-30', 'TESTES@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0, ''),
(35, 'joao', 'auves', '', '', NULL, '2019-11-30', 'joao9@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0, ''),
(36, 'marcelo', 'marcelo', '', '', NULL, '2019-11-30', 'marcelod444444@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0, ''),
(37, 'yuri', 'alves', '', '', NULL, '2019-11-30', 'yuri@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0, ''),
(38, 'cabesa', 'deguidao', '', '', NULL, '2019-12-01', 'cabesa@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0, ''),
(39, 'paulo', 'fora', '', '', NULL, '2019-12-01', 'paulo@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0, ''),
(40, 'sdiahsdi', 'ijdaojdsao', '', '', NULL, '2019-12-01', 'ocjkaodjoas@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 1, ''),
(41, 'Joao', 'Alves', '', '', NULL, '2019-12-02', 'joao99@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0, ''),
(42, 'RAFAELA', 'VELUDO', '', '', NULL, '2019-12-03', 'rafaela@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 1, ''),
(43, 'PAULETE', 'ALVES', '', '', NULL, '2019-12-03', 'paulete@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 1, ''),
(44, 'janaina', 'alves', '', '', '2019-12-03', '2019-12-03', 'janaina@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 1, ''),
(45, 'colaborador', 'sobrenome', '', '', '2019-12-03', '2019-12-03', 'colaboradora@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 1, ''),
(46, 'testenome', 'testesobrenome', '', '', '2019-12-03', '2019-12-03', 'testeemail@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 'https://i.imgur.com/2s9gA6V.png', 0, ''),
(47, 'ssdadas', 'dasdasd', '', '', '1111-12-12', '2019-12-03', 'asdasdasda@ggggg.com', '64687450b702fa37f85855f56e562c0c', 0, 'https://i.imgur.com/2s9gA6V.png', 1, '');

--
-- Acionadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `add_endereco` AFTER INSERT ON `usuario` FOR EACH ROW INSERT INTO endereco (id_usuario) VALUES (new.id_usuario)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `add_telefone` AFTER INSERT ON `usuario` FOR EACH ROW INSERT INTO telefone (id_usuario) VALUES (new.id_usuario)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inserir_id_cliente` AFTER INSERT ON `usuario` FOR EACH ROW INSERT INTO cliente (id_usuario) VALUES ( new.id_usuario)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tg_insereColaborador` AFTER INSERT ON `usuario` FOR EACH ROW INSERT INTO colaborador (id_usuario) VALUES (new.id_usuario)
$$
DELIMITER ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD KEY `fk_usuario_avaliacao` (`id_usuario`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `cobranca`
--
ALTER TABLE `cobranca`
  ADD PRIMARY KEY (`id_cobranca`),
  ADD KEY `fk_id_combinacoes_cobranca` (`id_combinacoes`),
  ADD KEY `fk_cobranca_erro` (`id_cobranca_erro`);

--
-- Índices para tabela `cobranca_erro`
--
ALTER TABLE `cobranca_erro`
  ADD PRIMARY KEY (`id_cobranca_erro`);

--
-- Índices para tabela `colaborador`
--
ALTER TABLE `colaborador`
  ADD PRIMARY KEY (`id_colaborador`);

--
-- Índices para tabela `combinacoes`
--
ALTER TABLE `combinacoes`
  ADD PRIMARY KEY (`id_combinacoes`),
  ADD KEY `fk_cliente` (`id_cliente`),
  ADD KEY `fk_colaborador_comb` (`id_colaborador`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `fk_id_usuario` (`id_usuario`);

--
-- Índices para tabela `gostos`
--
ALTER TABLE `gostos`
  ADD PRIMARY KEY (`id_gostos`);

--
-- Índices para tabela `gostos_usuario`
--
ALTER TABLE `gostos_usuario`
  ADD PRIMARY KEY (`id_gostos_usuario`),
  ADD KEY `fk_gostos` (`id_gostos`),
  ADD KEY `fk_usuario_gostos` (`id_usuario`);

--
-- Índices para tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD PRIMARY KEY (`id_mensagem`),
  ADD KEY `fk_usuario_envio` (`id_usuario_envio`),
  ADD KEY `fk_usuario_recebe` (`id_usuario_recebe`);

--
-- Índices para tabela `pedidos_combinacoes`
--
ALTER TABLE `pedidos_combinacoes`
  ADD PRIMARY KEY (`id_pedidos_combinacoes`),
  ADD KEY `fk_colaborador_combinacoes` (`id_colaborador`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`id_telefone`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id_avaliacao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `cobranca`
--
ALTER TABLE `cobranca`
  MODIFY `id_cobranca` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cobranca_erro`
--
ALTER TABLE `cobranca_erro`
  MODIFY `id_cobranca_erro` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `colaborador`
--
ALTER TABLE `colaborador`
  MODIFY `id_colaborador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `combinacoes`
--
ALTER TABLE `combinacoes`
  MODIFY `id_combinacoes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `gostos`
--
ALTER TABLE `gostos`
  MODIFY `id_gostos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `gostos_usuario`
--
ALTER TABLE `gostos_usuario`
  MODIFY `id_gostos_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mensagem`
--
ALTER TABLE `mensagem`
  MODIFY `id_mensagem` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `pedidos_combinacoes`
--
ALTER TABLE `pedidos_combinacoes`
  MODIFY `id_pedidos_combinacoes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `telefone`
--
ALTER TABLE `telefone`
  MODIFY `id_telefone` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Restrições para despejos de tabelas
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

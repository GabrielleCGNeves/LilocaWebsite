-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Set-2022 às 21:09
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: 'lilocapersonalizados'
--
CREATE DATABASE IF NOT EXISTS 'lilocapersonalizados' DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE 'lilocapersonalizados';

-- --------------------------------------------------------

--
-- Estrutura da tabela 'alimentos'
--

CREATE TABLE 'alimentos' (
  'Produtos_idProdutos' int(10) UNSIGNED NOT NULL,
  'unidade' int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela 'alimentos'
--

INSERT INTO 'alimentos' ('Produtos_idProdutos', 'unidade') VALUES
(7, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela 'bebida'
--

CREATE TABLE 'bebida' (
  'Produtos_idProdutos' int(10) UNSIGNED NOT NULL,
  'mililitros' float DEFAULT NULL,
  'marca' varchar(255) DEFAULT NULL,
  'embalagem' varchar(255) DEFAULT NULL,
  'quantidade' int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela 'bebida'
--

INSERT INTO 'bebida' ('Produtos_idProdutos', 'mililitros', 'marca', 'embalagem', 'quantidade') VALUES
(5, 350, 'Coca-Cola', 'Lata', 20),
(6, 2000, 'Coca-Cola', 'Garrafa Grande', 18);

-- --------------------------------------------------------

--
-- Estrutura da tabela 'cliente'
--

CREATE TABLE 'cliente' (
  'idCliente' int(11) NOT NULL,
  'nome' varchar(255) DEFAULT NULL,
  'telefone' varchar(255) DEFAULT NULL,
  'email' varchar(255) DEFAULT NULL,
  'cpf' varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela 'cliente'
--

INSERT INTO 'cliente' ('idCliente', 'nome', 'telefone', 'email', 'cpf') VALUES
(1, 'César Diego Rezende', '11991839547', 'cesardiegorezende@andrepires.com.br', '81450235808'),
(2, 'Vicente Carlos Eduardo Vicente Lopes', '11986575690', 'vicente.carlos.lopes@cafefrossard.com', '40679516808'),
(3, 'Antônio Kaua', '11996880433', 'kauabatista545@hotmail.com', '36727776849');

-- --------------------------------------------------------

--
-- Estrutura da tabela 'docesalgados'
--

CREATE TABLE 'docesalgados' (
  'Produtos_idProdutos' int(10) UNSIGNED NOT NULL,
  'centos' float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela 'docesalgados'
--

INSERT INTO 'docesalgados' ('Produtos_idProdutos', 'centos') VALUES
(2, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela 'festa'
--

CREATE TABLE 'festa' (
  'idFesta' int(10) UNSIGNED NOT NULL,
  'Cliente_idCliente' int(11) NOT NULL,
  'dataDaFesta' datetime DEFAULT NULL,
  'aniversariante' varchar(255) DEFAULT NULL,
  'idade' int(10) UNSIGNED DEFAULT NULL,
  'tema' varchar(255) DEFAULT NULL,
  'cores' varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela 'festa'
--

INSERT INTO 'festa' ('idFesta', 'Cliente_idCliente', 'dataDaFesta', 'aniversariante', 'idade', 'tema', 'cores') VALUES
(1, 1, '2022-09-22 00:00:00', 'Luna Tereza Novaes', 50, 'Fantasia', 'vermelho'),
(2, 3, '2022-09-25 00:00:00', 'Caio Iago', 12, 'Minecraft', 'verde'),
(3, 2, '2022-10-08 00:00:00', 'Lucas Buzzo', 20, 'Roblox', 'roxo');

-- --------------------------------------------------------

--
-- Estrutura da tabela 'itens'
--

CREATE TABLE 'itens' (
  'Produtos_idProdutos' int(10) UNSIGNED NOT NULL,
  'quantidade' int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela 'itens'
--

INSERT INTO 'itens' ('Produtos_idProdutos', 'quantidade') VALUES
(1, 20),
(13, 20),
(14, 20),
(12, 20),
(3, 34);

-- --------------------------------------------------------

--
-- Estrutura da tabela 'pedido'
--

CREATE TABLE 'pedido' (
  'idPedido' int(10) UNSIGNED NOT NULL,
  'Festa_idFesta' int(10) UNSIGNED NOT NULL,
  'dataPed' datetime DEFAULT NULL,
  'tipoDeEntrega' varchar(255) DEFAULT NULL,
  'endDeEntrega' varchar(255) DEFAULT NULL,
  'prazoDeEntrega' datetime DEFAULT NULL,
  'frete' double DEFAULT NULL,
  'sinal' double DEFAULT NULL,
  'restante' double DEFAULT NULL,
  'dataDeEntrega' datetime DEFAULT NULL,
  'total' double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela 'pedido'
--

INSERT INTO 'pedido' ('idPedido', 'Festa_idFesta', 'dataPed', 'tipoDeEntrega', 'endDeEntrega', 'prazoDeEntrega', 'frete', 'sinal', 'restante', 'dataDeEntrega', 'total') VALUES
(1, 1, '2022-09-02 00:00:00', 'retirada', 'Rua da Goiaba', '2022-09-20 00:00:00', 0, 106.85, 106.85, '2022-09-20 00:00:00', 213.7),
(2, 2, '2022-09-05 00:00:00', 'entrega', 'Rua do Abacate', '2022-09-24 00:00:00', 20, 112.6, 112.6, '2022-09-22 00:00:00', 245.2),
(3, 1, '2022-09-04 00:00:00', 'retirada', 'Rua da Goiaba', '2022-09-20 00:00:00', 0, 44.55, 44.55, '2022-09-20 00:00:00', 89.1);

-- --------------------------------------------------------

--
-- Estrutura da tabela 'pedido_has_produtos'
--

CREATE TABLE 'pedido_has_produtos' (
  'Pedido_idPedido' int(10) UNSIGNED NOT NULL,
  'Produtos_idProdutos' int(10) UNSIGNED NOT NULL,
  'quantidade' int(10) UNSIGNED DEFAULT NULL,
  'valorQtd' double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela 'pedido_has_produtos'
--

INSERT INTO 'pedido_has_produtos' ('Pedido_idPedido', 'Produtos_idProdutos', 'quantidade', 'valorQtd') VALUES
(1, 2, 2, 160),
(1, 6, 2, 24),
(2, 1, 2, 2),
(2, 4, 2, 140),
(2, 8, 4, 83.2),
(3, 7, 3, 29.7);

-- --------------------------------------------------------

--
-- Estrutura da tabela 'produtos'
--

CREATE TABLE 'produtos' (
  'idProdutos' int(10) UNSIGNED NOT NULL,
  'item' varchar(255) DEFAULT NULL,
  'valorUnit' double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela 'produtos'
--

INSERT INTO 'produtos' ('idProdutos', 'item', 'valorUnit') VALUES
(1, 'Pacote de balões 50 un', 1),
(2, 'Docinhos', 80),
(3, 'Marshmallow 250g', 14.99),
(4, 'Salgadinhos', 70),
(5, 'Coca-Cola 350ml', 3),
(6, 'Coca-Cola 2l', 12),
(7, 'Mini Sanduiche', 9.9),
(8, 'Toalha de Papel Colorida', 20.8),
(9, 'Bolo de Prestígio', 75),
(10, 'Bolo Trufado', 100),
(11, 'Torta Holandesa', 120),
(12, 'Copos Descartáveis 50 un', 18.99),
(13, 'Pratos Descartáveis 50 un', 16.99),
(14, 'Talheres Descartáveis 50 un', 15.99);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela 'alimentos'
--
ALTER TABLE 'alimentos'
  ADD KEY 'Alimentos_FKIndex1' ('Produtos_idProdutos');

--
-- Índices para tabela 'bebida'
--
ALTER TABLE 'bebida'
  ADD KEY 'Bebida_FKIndex1' ('Produtos_idProdutos');

--
-- Índices para tabela 'cliente'
--
ALTER TABLE 'cliente'
  ADD PRIMARY KEY ('idCliente');

--
-- Índices para tabela 'docesalgados'
--
ALTER TABLE 'docesalgados'
  ADD KEY 'DoceSalgados_FKIndex1' ('Produtos_idProdutos');

--
-- Índices para tabela 'festa'
--
ALTER TABLE 'festa'
  ADD PRIMARY KEY ('idFesta'),
  ADD KEY 'Festa_FKIndex1' ('Cliente_idCliente');

--
-- Índices para tabela 'itens'
--
ALTER TABLE 'itens'
  ADD KEY 'Table_09_FKIndex1' ('Produtos_idProdutos');

--
-- Índices para tabela 'pedido'
--
ALTER TABLE 'pedido'
  ADD PRIMARY KEY ('idPedido'),
  ADD KEY 'Pedido_FKIndex1' ('Festa_idFesta');

--
-- Índices para tabela 'pedido_has_produtos'
--
ALTER TABLE 'pedido_has_produtos'
  ADD KEY 'Pedido_has_Produtos_FKIndex1' ('Pedido_idPedido'),
  ADD KEY 'Pedido_has_Produtos_FKIndex2' ('Produtos_idProdutos');

--
-- Índices para tabela 'produtos'
--
ALTER TABLE 'produtos'
  ADD PRIMARY KEY ('idProdutos');

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela 'cliente'
--
ALTER TABLE 'cliente'
  MODIFY 'idCliente' int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela 'festa'
--
ALTER TABLE 'festa'
  MODIFY 'idFesta' int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela 'pedido'
--
ALTER TABLE 'pedido'
  MODIFY 'idPedido' int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela 'produtos'
--
ALTER TABLE 'produtos'
  MODIFY 'idProdutos' int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela 'alimentos'
--
ALTER TABLE 'alimentos'
  ADD CONSTRAINT 'alimentos_ibfk_1' FOREIGN KEY ('Produtos_idProdutos') REFERENCES 'produtos' ('idProdutos') ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela 'bebida'
--
ALTER TABLE 'bebida'
  ADD CONSTRAINT 'bebida_ibfk_1' FOREIGN KEY ('Produtos_idProdutos') REFERENCES 'produtos' ('idProdutos') ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela 'docesalgados'
--
ALTER TABLE 'docesalgados'
  ADD CONSTRAINT 'docesalgados_ibfk_1' FOREIGN KEY ('Produtos_idProdutos') REFERENCES 'produtos' ('idProdutos') ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela 'festa'
--
ALTER TABLE 'festa'
  ADD CONSTRAINT 'festa_ibfk_1' FOREIGN KEY ('Cliente_idCliente') REFERENCES 'cliente' ('idCliente') ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela 'itens'
--
ALTER TABLE 'itens'
  ADD CONSTRAINT 'itens_ibfk_1' FOREIGN KEY ('Produtos_idProdutos') REFERENCES 'produtos' ('idProdutos') ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela 'pedido'
--
ALTER TABLE 'pedido'
  ADD CONSTRAINT 'pedido_ibfk_1' FOREIGN KEY ('Festa_idFesta') REFERENCES 'festa' ('idFesta') ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela 'pedido_has_produtos'
--
ALTER TABLE 'pedido_has_produtos'
  ADD CONSTRAINT 'pedido_has_produtos_ibfk_1' FOREIGN KEY ('Pedido_idPedido') REFERENCES 'pedido' ('idPedido') ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT 'pedido_has_produtos_ibfk_2' FOREIGN KEY ('Produtos_idProdutos') REFERENCES 'produtos' ('idProdutos') ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

DELIMITER $$
CREATE PROCEDURE `Consultar_Pedido`(IN `id` INT)
BEGIN

SELECT `aniversariante`, `dataPed`, `tipoDeEntrega`, `endDeEntrega`, `prazoDeEntrega`, `frete`, `sinal`, `restante`, `dataDeEntrega`, `total` 
FROM `pedido` 
INNER JOIN festa 
WHERE `Festa_idFesta`=`idFesta` AND `idPedido`=id;

END$$
DELIMITER ;

-- // ----------------------------------------------------------------------------------------------------------------------// --

DELIMITER $$
CREATE PROCEDURE `Consultar_PedidoProduto`(IN `id` INT)
BEGIN

SELECT item, `quantidade`, `valorQtd` 
FROM pedido_has_produtos 
INNER JOIN produtos 
WHERE pedido_has_produtos.Produtos_idProdutos=produtos.idProdutos AND pedido_has_produtos.Pedido_idPedido = id;

END$$
DELIMITER ;

-- // ----------------------------------------------------------------------------------------------------------------------// --

DELIMITER $$
CREATE PROCEDURE `Inclui_Pedido`(IN `idFesta` INT, IN `tipo` VARCHAR(225), IN `endereco` VARCHAR(255), IN `prazo` DATETIME, IN `frete` DOUBLE, IN `sinal` DOUBLE, OUT `LastID` INT)
BEGIN

INSERT INTO `pedido`(`Festa_idFesta`, `dataPed`, `tipoDeEntrega`, `endDeEntrega`, `prazoDeEntrega`, `frete`, `sinal`, `restante`, `dataDeEntrega`, `total`) VALUES (idFesta, CURRENT_DATE(), tipo, endereco, prazo, frete, sinal, sinal, null, frete + (sinal * 2));

SET LastID = LAST_INSERT_ID();

END$$
DELIMITER ;

-- // ----------------------------------------------------------------------------------------------------------------------// --

DELIMITER $$
CREATE PROCEDURE `Inclui_PedidoProduto`(IN `idPed` INT, IN `idProd` INT, IN `qtd` INT)
BEGIN

SELECT valorUnit INTO @valorProduto FROM produtos WHERE produtos.idProdutos = idProd;

INSERT INTO `pedido_has_produtos`(`Pedido_idPedido`, `Produtos_idProdutos`, `quantidade`, `valorQtd`) VALUES (idPed, idProd, qtd, @valorProduto * qtd);

END$$
DELIMITER ;

-- // ----------------------------------------------------------------------------------------------------------------------// --

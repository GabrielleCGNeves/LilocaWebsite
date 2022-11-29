CREATE DATABASE liloca;
USE liloca;

CREATE TABLE TB_Cliente (
  cli_idCli INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cli_nome VARCHAR(255) NULL,
  cli_telefone VARCHAR(255) NULL,
  cli_email VARCHAR(255) NULL,
  cli_cpf VARCHAR(255) NULL 
);


CREATE TABLE TB_Produto (
  prod_idProd INTEGER UNSIGNED  NOT NULL AUTO_INCREMENT PRIMARY KEY,
  prod_item VARCHAR(255) NULL,
  prod_valorUnit DOUBLE NULL
);


CREATE TABLE TB_Itens (
  prod_idProd INTEGER UNSIGNED  NOT NULL  ,
  quantidade INTEGER UNSIGNED  NULL    ,
INDEX TB_Itens_FKIndex1(prod_idProd),
  FOREIGN KEY(prod_idProd)
    REFERENCES TB_Produto(prod_idProd)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE TB_Festa (
  fes_idFesta INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  cli_idCli INT  NOT NULL  ,
  fes_dataDaFesta DATETIME  NULL  ,
  fes_aniversariante VARCHAR(255)  NULL  ,
  fes_idade INTEGER UNSIGNED  NULL  ,
  fes_tema VARCHAR(255)  NULL  ,
  fes_cores VARCHAR(255)  NULL    ,
PRIMARY KEY(fes_idFesta)  ,
INDEX Evento_FKIndex1(cli_idCli),
  FOREIGN KEY(cli_idCli)
    REFERENCES TB_Cliente(cli_idCli)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE TB_Alimento (
  prod_idProd INTEGER UNSIGNED  NOT NULL  ,
  unidade INTEGER UNSIGNED  NULL    ,
INDEX TB_Alimento_FKIndex1(prod_idProd),
  FOREIGN KEY(prod_idProd)
    REFERENCES TB_Produto(prod_idProd)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE TB_Bebida (
  prod_idProd INTEGER UNSIGNED  NOT NULL  ,
  beb_ml FLOAT  NULL  ,
  beb_marca VARCHAR(255)  NULL  ,
  beb_embalagem VARCHAR(255)  NULL  ,
  beb_qtd INTEGER UNSIGNED  NULL    ,
INDEX TB_Bebida_FKIndex1(prod_idProd),
  FOREIGN KEY(prod_idProd)
    REFERENCES TB_Produto(prod_idProd)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE TB_Aperitivos (
  prod_idProd INTEGER UNSIGNED  NOT NULL  ,
  ape_centos FLOAT  NULL    ,
INDEX TB_Aperitivos_FKIndex1(prod_idProd),
  FOREIGN KEY(prod_idProd)
    REFERENCES TB_Produto(prod_idProd)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE TB_Pedido (
  ped_idPed INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  fes_idFesta INTEGER UNSIGNED  NOT NULL  ,
  ped_dataPed DATETIME  NULL  ,
  ped_tipoDeEntrega VARCHAR(255)  NULL  ,
  ped_endDeEntrega VARCHAR(255)  NULL  ,
  ped_prazoDeEntrega DATETIME  NULL  ,
  ped_frete DOUBLE  NULL  ,
  ped_sinal DOUBLE  NULL  ,
  ped_restante DOUBLE  NULL  ,
  ped_dataDeEntrega DATETIME  NULL  ,
  ped_total DOUBLE  NULL    ,
PRIMARY KEY(ped_idPed)  ,
INDEX TB_Pedido_FKIndex1(fes_idFesta),
  FOREIGN KEY(fes_idFesta)
    REFERENCES TB_Festa(fes_idFesta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE TB_Pedido_Produto (
  ped_idPed INTEGER UNSIGNED  NOT NULL  ,
  prod_idProd INTEGER UNSIGNED  NOT NULL  ,
  pedprod_quantidade INTEGER UNSIGNED  NULL  ,
  pedprod_valorQtd DOUBLE  NULL    ,
PRIMARY KEY(ped_idPed, prod_idProd)  ,
INDEX TB_Pedido_Produto_FKIndex1(ped_idPed)  ,
INDEX TB_Pedido_Produto_FKIndex2(prod_idProd),
  FOREIGN KEY(ped_idPed)
    REFERENCES TB_Pedido(ped_idPed)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(prod_idProd)
    REFERENCES TB_Produto(prod_idProd)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




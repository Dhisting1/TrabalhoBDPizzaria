CREATE SCHEMA `trabalhobd_pizzaria` ;

CREATE TABLE `trabalhobd_pizzaria`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome_cliente` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cliente`)
);
CREATE TABLE `trabalhobd_pizzaria`.`funcionarios` (
  `id_funcionarios` INT NOT NULL AUTO_INCREMENT,
  `nome_funcionarios` VARCHAR(45) NOT NULL,
  `cargo_funcionarios` VARCHAR(45) NOT NULL,
  `data_contratacao` DATETIME NOT NULL,
  PRIMARY KEY (`id_funcionarios`)
);
CREATE TABLE `trabalhobd_pizzaria`.`pizza` (
  `id_pizza` INT NOT NULL AUTO_INCREMENT,
  `nome_pizza` VARCHAR(45) NOT NULL,
  `ingredientes_pizza` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `preco` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`id_pizza`)
);
CREATE TABLE `trabalhobd_pizzaria`.`ingredientes` (
  `id_ingredientes` INT NOT NULL AUTO_INCREMENT,
  `quantidade_ingredientes` INT NOT NULL,
  `nome_ingredientes` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_ingredientes`)
);
CREATE TABLE `trabalhobd_pizzaria`.`pizza_ingredientes` (
  `pizza_id_ingredientes` INT NOT NULL,
  `ingredientes_id_ingredientes` INT NOT NULL,
  CONSTRAINT `fk_pizza_id_pizza`
    FOREIGN KEY (`pizza_id_ingredientes`)
    REFERENCES `trabalhobd_pizzaria`.`pizza` (`id_pizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredientes_id_ingredientes`
    FOREIGN KEY (`ingredientes_id_ingredientes`)
    REFERENCES `trabalhobd_pizzaria`.`ingredientes` (`id_ingredientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
CREATE TABLE `trabalhobd_pizzaria`.`pedidos` (
  `id_pedidos` INT NOT NULL AUTO_INCREMENT,
  `data_pedido` DATETIME NOT NULL,
  `quantidade_pedidos` INT NOT NULL,
  `status_pedido` VARCHAR(45) NOT NULL,
  `cliente_id_cliente` INT NULL,
  `pizza_id_pizza` INT NULL,
  `valor_pedido` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`id_pedidos`),
  CONSTRAINT `fk_cliente_id_cliente`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `trabalhobd_pizzaria`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizza_id_pizza_2`
    FOREIGN KEY (`pizza_id_pizza`)
    REFERENCES `trabalhobd_pizzaria`.`pizza` (`id_pizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
CREATE TABLE `trabalhobd_pizzaria`.`entregas` (
  `id_entregas` INT NOT NULL AUTO_INCREMENT,
  `data_entrega` DATETIME NOT NULL,
  `funcionarios_id_funcionarios` INT NULL,
  `pedidos_id_pedidos` INT NULL,
  PRIMARY KEY (`id_entregas`),
  CONSTRAINT `fk_funcionarios_id_funcionarios`
    FOREIGN KEY (`funcionarios_id_funcionarios`)
    REFERENCES `trabalhobd_pizzaria`.`funcionarios` (`id_funcionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_id_pedido`
    FOREIGN KEY (`pedidos_id_pedidos`)
    REFERENCES `trabalhobd_pizzaria`.`pedidos` (`id_pedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
CREATE TABLE `trabalhobd_pizzaria`.`pagamentos` (
  `id_pagamentos` INT NOT NULL AUTO_INCREMENT,
  `metodo_pagamento` VARCHAR(45) NOT NULL,
  `valor_compra` DECIMAL(2) NOT NULL,
  `data_pagamento` DATETIME NOT NULL,
  `pedido_id_pedido` INT NULL,
  `pizza_id_pizza` INT NULL,
  PRIMARY KEY (`id_pagamentos`),
  CONSTRAINT `fk_pedido_id_pedido_2`
    FOREIGN KEY (`pedido_id_pedido`)
    REFERENCES `trabalhobd_pizzaria`.`pedidos` (`id_pedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizza_id_pizza_3`
    FOREIGN KEY (`pizza_id_pizza`)
    REFERENCES `trabalhobd_pizzaria`.`pizza` (`id_pizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
CREATE TABLE `trabalhobd_pizzaria`.`fornecedor` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `nome_fornecedor` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_fornecedor`)
);
CREATE TABLE `trabalhobd_pizzaria`.`estoque` (
  `id_estoque` INT NOT NULL AUTO_INCREMENT,
  `quantidade_estoque` INT NOT NULL,
  `data_atualizacao` DATETIME NOT NULL,
  `pizza_id_pizza` INT NULL,
  `fornecedor_id_fornecedor` INT NULL,
  PRIMARY KEY (`id_estoque`),
  CONSTRAINT `fk_pizza_id_pizza_4`
    FOREIGN KEY (`pizza_id_pizza`)
    REFERENCES `trabalhobd_pizzaria`.`pizza` (`id_pizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornecedor_id_fornecedor`
    FOREIGN KEY (`fornecedor_id_fornecedor`)
    REFERENCES `trabalhobd_pizzaria`.`fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

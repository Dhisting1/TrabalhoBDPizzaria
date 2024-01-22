CREATE SCHEMA `trabalhobd_pizzaria` ;

CREATE TABLE `trabalhobd_pizzaria`.`pizza` (
  `id_pizza` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `ingrediente` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `preco` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`id_pizza`)
);

CREATE TABLE `trabalhobd_pizzaria`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cliente`)
);

CREATE TABLE `trabalhobd_pizzaria`.`funcionario` (
  `id_funcionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `data_contratacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_funcionario`)
);

CREATE TABLE `trabalhobd_pizzaria`.`fornecedor` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_fornecedor`)
);

CREATE TABLE `trabalhobd_pizzaria`.`ingredientes` (
  `id_ingredientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `quantidade_estoque` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_ingredientes`)
);

CREATE TABLE `trabalhobd_pizzaria`.`pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `data_pedido` DATETIME NOT NULL,
  `quantidade` INT NOT NULL,
  `fk_cliente` INT NOT NULL,
  `fk_pizza` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  CONSTRAINT `fk_id_cliente`
    FOREIGN KEY (`fk_cliente`)
    REFERENCES `trabalhobd_pizzaria`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_pizza`
    FOREIGN KEY (`fk_pizza`)
    REFERENCES `trabalhobd_pizzaria`.`pizza` (`id_pizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `trabalhobd_pizzaria`.`entregas` (
  `id_entregas` INT NOT NULL AUTO_INCREMENT,
  `data_entrega` DATETIME NOT NULL,
  `status_entrega` VARCHAR(10) NOT NULL,
  `fk_pedido` INT NOT NULL,
  `fk_funcionario` INT NOT NULL,
  PRIMARY KEY (`id_entregas`),
  CONSTRAINT `fk_id_pedido`
    FOREIGN KEY (`fk_pedido`)
    REFERENCES `trabalhobd_pizzaria`.`pedido` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_funcionarios`
    FOREIGN KEY (`fk_funcionario`)
    REFERENCES `trabalhobd_pizzaria`.`funcionario` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `trabalhobd_pizzaria`.`pagamentos` (
  `id_pagamentos` INT NOT NULL AUTO_INCREMENT,
  `metodo_pagamento` VARCHAR(45) NOT NULL,
  `valor_compra` DECIMAL(2) NOT NULL,
  `data_pagamento` DATETIME NOT NULL,
  `fk_pedido` INT NULL,
  PRIMARY KEY (`id_pagamentos`),
  CONSTRAINT `fk_id_pedido_pg`
    FOREIGN KEY (`fk_pedido`)
    REFERENCES `trabalhobd_pizzaria`.`pedido` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `trabalhobd_pizzaria`.`estoque` (
  `id_estoque` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT NOT NULL,
  `data_atualizacao` DATETIME NOT NULL,
  `fk_pizza_pizza` INT NULL,
  PRIMARY KEY (`id_estoque`),
  CONSTRAINT `fk_id_pizza_pizza`
    FOREIGN KEY (`id_estoque`)
    REFERENCES `trabalhobd_pizzaria`.`pizza` (`id_pizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `trabalhobd_pizzaria`.`estoque` (
  `id_estoque` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT NOT NULL,
  `data_atualizacao` DATETIME NOT NULL,
  `fk_pizza_pz` INT NOT NULL,
  `fk_fornecedor_fc` INT NOT NULL,
  PRIMARY KEY (`id_estoque`),
  CONSTRAINT `fk_id_pizza_pz`
    FOREIGN KEY (`fk_pizza_pz`)
    REFERENCES `trabalhobd_pizzaria`.`pizza` (`id_pizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_fornecedor_fc`
    FOREIGN KEY (`fk_fornecedor_fc`)
    REFERENCES `trabalhobd_pizzaria`.`fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `trabalhobd_pizzaria`.`pizza_ingredientes` (
  `ingredientes_id_ingredientes` INT NOT NULL,
  `pizza_id_pizza` INT NOT NULL,
  PRIMARY KEY (`ingredientes_id_ingredientes`, `pizza_id_pizza`),
  CONSTRAINT `fk_ingredientes_id_ingredientes`
    FOREIGN KEY (`ingredientes_id_ingredientes`)
    REFERENCES `trabalhobd_pizzaria`.`ingredientes` (`id_ingredientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizza_id_pizza`
    FOREIGN KEY (`pizza_id_pizza`)
    REFERENCES `trabalhobd_pizzaria`.`pizza` (`id_pizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO trabalhobd_pizzaria.cliente (nome, telefone, endereco) VALUES ('João', '999999999', 'Rua 1');
INSERT INTO trabalhobd_pizzaria.cliente (nome, telefone, endereco) VALUES ('Maria', '888888888', 'Rua 2');
INSERT INTO trabalhobd_pizzaria.cliente (nome, telefone, endereco) VALUES ('José', '777777777', 'Rua 3');
INSERT INTO trabalhobd_pizzaria.cliente (nome, telefone, endereco) VALUES ('Ana', '666666666', 'Rua 4');
INSERT INTO trabalhobd_pizzaria.cliente (nome, telefone, endereco) VALUES ('Thaina', '555555555', 'Rua 5');

SELECT * from trabalhobd_pizzaria.cliente;
SELECT * from trabalhobd_pizzaria.entregas;
SELECT * from trabalhobd_pizzaria.estoque;
SELECT * from trabalhobd_pizzaria.fornecedor;
SELECT * from trabalhobd_pizzaria.funcionario;
SELECT * from trabalhobd_pizzaria.ingredientes;
SELECT * from trabalhobd_pizzaria.pagamentos;
SELECT * from trabalhobd_pizzaria.pedido;
SELECT * from trabalhobd_pizzaria.pizza;
SELECT * from trabalhobd_pizzaria.pizza_ingredientes;




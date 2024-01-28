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

INSERT INTO cliente (nome_cliente, telefone, endereco) VALUES ('João', '61 99111-1111', 'Rua 1');
INSERT INTO cliente (nome_cliente, telefone, endereco) VALUES ('Maria', '61 99111-1112', 'Rua 2');
INSERT INTO cliente (nome_cliente, telefone, endereco) VALUES ('José', '61 99111-1113', 'Rua 3');
INSERT INTO cliente (nome_cliente, telefone, endereco) VALUES ('Ana', '61 99111-1114', 'Rua 4');
INSERT INTO cliente (nome_cliente, telefone, endereco) VALUES ('Pedro', '61 99111-1115', 'Rua 5');

-- INSERT NA TABELA FUNCIONARIO
INSERT INTO funcionarios (nome_funcionarios, cargo_funcionarios, data_contratacao) VALUES ('Maria', 'Atendente', '2020-03-02');
INSERT INTO funcionarios (nome_funcionarios, cargo_funcionarios, data_contratacao) VALUES ('Rodrigo', 'Entregador', '2020-03-02');
INSERT INTO funcionarios (nome_funcionarios, cargo_funcionarios, data_contratacao) VALUES ('Guilherme', 'Gerente', '2020-03-02');
INSERT INTO funcionarios (nome_funcionarios, cargo_funcionarios, data_contratacao) VALUES ('João', 'Entregador', '2020-03-02');
INSERT INTO funcionarios (nome_funcionarios, cargo_funcionarios, data_contratacao) VALUES ('Ana', 'Atendente', '2020-03-02');

-- INSERT NA TABELA PIZZA
INSERT INTO pizza (nome_pizza, ingredientes_pizza, descricao, preco) VALUES ('Calabresa', 'Calabresa, Queijo', 'Pizza de Calabresa', 30.00);
INSERT INTO pizza (nome_pizza, ingredientes_pizza, descricao, preco) VALUES ('Frango', 'Frango, Queijo', 'Pizza de Frango', 35.00);
INSERT INTO pizza (nome_pizza, ingredientes_pizza, descricao, preco) VALUES ('Portuguesa', 'Presunto, Queijo, Ovo, Cebola, Tomate', 'Pizza Portuguesa', 40.00);
INSERT INTO pizza (nome_pizza, ingredientes_pizza, descricao, preco) VALUES ('Mussarela', 'Mussarela, Queijo', 'Pizza de Mussarela', 30.00);
INSERT INTO pizza (nome_pizza, ingredientes_pizza, descricao, preco) VALUES ('Marguerita', 'Mussarela, Tomate, Manjericão', 'Pizza Marguerita', 35.00);

-- INSERT NA TABELA INGREDIENTES
INSERT INTO ingredientes (quantidade_ingredientes, nome_ingredientes) VALUES (10, 'Calabresa');
INSERT INTO ingredientes (quantidade_ingredientes, nome_ingredientes) VALUES (20, 'Queijo');
INSERT INTO ingredientes (quantidade_ingredientes, nome_ingredientes) VALUES (10, 'Frango');
INSERT INTO ingredientes (quantidade_ingredientes, nome_ingredientes) VALUES (10, 'Presunto');
INSERT INTO ingredientes (quantidade_ingredientes, nome_ingredientes) VALUES (10, 'Ovo'); 
INSERT INTO ingredientes (quantidade_ingredientes, nome_ingredientes) VALUES (10, 'Cebola');
INSERT INTO ingredientes (quantidade_ingredientes, nome_ingredientes) VALUES (10, 'Tomate');
INSERT INTO ingredientes (quantidade_ingredientes, nome_ingredientes) VALUES (10, 'Mussarela');
INSERT INTO ingredientes (quantidade_ingredientes, nome_ingredientes) VALUES (10, 'Manjericão');

-- INSERT NA TABELA PIZZA_INGREDIENTES
INSERT INTO pizza_ingredientes (pizza_id_ingredientes, ingredientes_id_ingredientes) VALUES (1, 1);
INSERT INTO pizza_ingredientes (pizza_id_ingredientes, ingredientes_id_ingredientes) VALUES (1, 2);
INSERT INTO pizza_ingredientes (pizza_id_ingredientes, ingredientes_id_ingredientes) VALUES (2, 3);
INSERT INTO pizza_ingredientes (pizza_id_ingredientes, ingredientes_id_ingredientes) VALUES (2, 2);
INSERT INTO pizza_ingredientes (pizza_id_ingredientes, ingredientes_id_ingredientes) VALUES (3, 4);
INSERT INTO pizza_ingredientes (pizza_id_ingredientes, ingredientes_id_ingredientes) VALUES (3, 2);
INSERT INTO pizza_ingredientes (pizza_id_ingredientes, ingredientes_id_ingredientes) VALUES (3, 5);
INSERT INTO pizza_ingredientes (pizza_id_ingredientes, ingredientes_id_ingredientes) VALUES (3, 6);
INSERT INTO pizza_ingredientes (pizza_id_ingredientes, ingredientes_id_ingredientes) VALUES (3, 7);
INSERT INTO pizza_ingredientes (pizza_id_ingredientes, ingredientes_id_ingredientes) VALUES (3, 8);

-- INSERT NA TABELA PEDIDOS
INSERT INTO pedidos (data_pedido, quantidade_pedidos, status_pedido, cliente_id_cliente, pizza_id_pizza, valor_pedido) VALUES ('2020-03-02', 1, 'Em andamento', 1, 1, 30.00);
INSERT INTO pedidos (data_pedido, quantidade_pedidos, status_pedido, cliente_id_cliente, pizza_id_pizza, valor_pedido) VALUES ('2020-03-03', 1, 'Em andamento', 2, 2, 35.00);
INSERT INTO pedidos (data_pedido, quantidade_pedidos, status_pedido, cliente_id_cliente, pizza_id_pizza, valor_pedido) VALUES ('2020-03-04', 1, 'Saiu para entrega', 3, 3, 40.00);
INSERT INTO pedidos (data_pedido, quantidade_pedidos, status_pedido, cliente_id_cliente, pizza_id_pizza, valor_pedido) VALUES ('2020-03-05', 1, 'Entregue', 4, 4, 30.00);
INSERT INTO pedidos (data_pedido, quantidade_pedidos, status_pedido, cliente_id_cliente, pizza_id_pizza, valor_pedido) VALUES ('2020-03-06', 1, 'Entregue', 5, 5, 35.00);

-- INSERT NA TABELA ENTREGAS
INSERT INTO entregas (data_entrega, funcionarios_id_funcionarios, pedidos_id_pedidos) VALUES ('2020-03-02', 2, 1);
INSERT INTO entregas (data_entrega, funcionarios_id_funcionarios, pedidos_id_pedidos) VALUES ('2020-03-03', 4, 2);
INSERT INTO entregas (data_entrega, funcionarios_id_funcionarios, pedidos_id_pedidos) VALUES ('2020-03-04', 4, 3);
INSERT INTO entregas (data_entrega, funcionarios_id_funcionarios, pedidos_id_pedidos) VALUES ('2020-03-05', 4, 4);
INSERT INTO entregas (data_entrega, funcionarios_id_funcionarios, pedidos_id_pedidos) VALUES ('2020-03-06', 4, 5);

-- INSERT NA TABELA PAGAMENTOS
INSERT INTO pagamentos (metodo_pagamento, valor_compra, data_pagamento, pedido_id_pedido, pizza_id_pizza) VALUES ('Dinheiro', 30.00, '2020-03-02', 1, 1);
INSERT INTO pagamentos (metodo_pagamento, valor_compra, data_pagamento, pedido_id_pedido, pizza_id_pizza) VALUES ('Dinheiro', 35.00, '2020-03-03', 2, 2);
INSERT INTO pagamentos (metodo_pagamento, valor_compra, data_pagamento, pedido_id_pedido, pizza_id_pizza) VALUES ('Dinheiro', 40.00, '2020-03-04', 3, 3);
INSERT INTO pagamentos (metodo_pagamento, valor_compra, data_pagamento, pedido_id_pedido, pizza_id_pizza) VALUES ('Dinheiro', 30.00, '2020-03-05', 4, 4);
INSERT INTO pagamentos (metodo_pagamento, valor_compra, data_pagamento, pedido_id_pedido, pizza_id_pizza) VALUES ('Dinheiro', 35.00, '2020-03-06', 5, 5);

-- INSERT NA TABELA FORNECEDOR
INSERT INTO fornecedor (nome_fornecedor, telefone, endereco) VALUES ('Fornecedor 1', '61 99111-2221', 'Rua 1');
INSERT INTO fornecedor (nome_fornecedor, telefone, endereco) VALUES ('Fornecedor 2', '61 99221-1112', 'Rua 2');
INSERT INTO fornecedor (nome_fornecedor, telefone, endereco) VALUES ('Fornecedor 3', '61 99331-3323', 'Rua 3');
INSERT INTO fornecedor (nome_fornecedor, telefone, endereco) VALUES ('Fornecedor 4', '61 99441-4444', 'Rua 4');
INSERT INTO fornecedor (nome_fornecedor, telefone, endereco) VALUES ('Fornecedor 5', '61 99551-5555', 'Rua 5');

-- INSERT NA TABELA ESTOQUE
INSERT INTO estoque (quantidade_estoque, data_atualizacao, pizza_id_pizza, fornecedor_id_fornecedor) VALUES (10, '2020-03-02', 1, 1);
INSERT INTO estoque (quantidade_estoque, data_atualizacao, pizza_id_pizza, fornecedor_id_fornecedor) VALUES (20, '2020-03-03', 2, 2);
INSERT INTO estoque (quantidade_estoque, data_atualizacao, pizza_id_pizza, fornecedor_id_fornecedor) VALUES (10, '2020-03-04', 3, 3);
INSERT INTO estoque (quantidade_estoque, data_atualizacao, pizza_id_pizza, fornecedor_id_fornecedor) VALUES (10, '2020-03-05', 4, 4);
INSERT INTO estoque (quantidade_estoque, data_atualizacao, pizza_id_pizza, fornecedor_id_fornecedor) VALUES (10, '2020-03-06', 5, 5);



SELECT * FROM cliente;
SELECT * FROM funcionarios;
SELECT * FROM pizza;
SELECT * FROM ingredientes;
SELECT * FROM pizza_ingredientes;
SELECT * FROM pedidos;
SELECT * FROM entregas;
SELECT * FROM pagamentos;
SELECT * FROM fornecedor;
SELECT * FROM estoque;

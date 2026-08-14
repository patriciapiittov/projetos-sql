CREATE DATABASE mais_moda_store;
USE mais_moda_store;
CREATE TABLE funcionarios (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(155) NOT NULL,
funcao VARCHAR(155) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO funcionarios
(id, nome, funcao)
VALUES ('1', 'Mariana Silva', 'Gerente');

INSERT INTO funcionarios
(nome, funcao)
VALUES ('Carlos Oliveira', 'Caixa'),
('Fernanda Souza', 'Vendedora');

SELECT*FROM funcionarios;

CREATE TABLE Roupas(
id INT NOT NULL AUTO_INCREMENT,
peca VARCHAR(155) NOT NULL,
estoque INT NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO Roupas
(id, peca, estoque)
VALUES ('1', 'Calça','100');

INSERT INTO Roupas
(peca, estoque)
VALUES ('Camiseta', '500'),
('Short', '150'),
('Saia', '20');

SELECT*FROM Roupas;

CREATE TABLE clientes(
id_cliente INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(155) NOT NULL,
CPF CHAR(11) NOT NULL,
PRIMARY KEY (id_cliente)
);

INSERT INTO clientes
(id_cliente, nome, CPF)
VALUES ('1', 'Pedro Santana', '11122233345');

INSERT INTO clientes
(nome, CPF)
VALUES ('Silvana Costa', '98765432100'),
('Bruna Oliveira', '11122233300'),
('Diego Ramalho', '45678912300'),
('Sandra Vieira', '78912345600');

SELECT*FROM clientes;

CREATE TABLE vendas(
id_pedido INT NOT NULL AUTO_INCREMENT,
data_pedido DATETIME NOT NULL,
id_cliente INT NOT NULL,
id_vendedor INT NOT NULL,
PRIMARY KEY (id_pedido),
CONSTRAINT FK_id_cliente FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
CONSTRAINT FK_id_vendedor FOREIGN KEY (id_vendedor) REFERENCES funcionarios (id)
);

CREATE TABLE vendas_produtos(
id_pedido INT NOT NULL,
id_produto INT NOT NULL,
PRIMARY KEY (id_pedido, id_produto),
CONSTRAINT FK_id_pedido FOREIGN KEY (id_pedido) REFERENCES vendas (id_pedido),
CONSTRAINT FK_id_produto FOREIGN KEY (id_produto) REFERENCES Roupas (id)
);

USE mais_moda_store;
ALTER TABLE vendas_produtos ADD quantidade INT NOT NULL;

SHOW TABLES;

SELECT*FROM vendas_produtos;





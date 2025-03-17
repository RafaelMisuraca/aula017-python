CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE clientes(
	id_clientes INT PRIMARY KEY auto_increment,
    nome varchar(42) not null,
    email varchar(42) not null,
	telefone varchar(42) not null
);
INSERT INTO clientes (id_clientes, nome, email, telefone) VALUES
("165238732", "Rafael", "rafaelmisuraca@gmail.com", "85999010273"),
("189273786", "Rodrigo", "rodrigo@gmail.com", "85987342130"),
("012897389", "Yuri", "yuri@gmail.com", "85997276321");
SELECT * FROM clientes;

CREATE TABLE produtos(
	id int primary key auto_increment,
    nome varchar(42) not null,
    preco decimal(10,2) not null,
	categoria enum ("Eletronico", "Escritorio", "Alimentos"),
    estoque int default 0
);
INSERT INTO produtos (id, nome, preco, categoria, estoque) VALUES
("990123453", "Maça","4.90", "Alimentos", "20"),
("123454685", "Banana","12.80", "Alimentos", "5"),
("776348120", "Pêra","7.90", "Alimentos", "30");
SELECT * FROM produtos;

CREATE TABLE pedidos(
	id int primary key auto_increment,
	dia_compra int not null,
    mes_compra int not null,
    ano_compra int not null,
    valor_total decimal(10,2),
    id_clientes int, foreign key (id_clientes) references clientes(id_clientes),
	check (mes_compra >=1 and mes_compra <13)
);

INSERT INTO pedidos (id, dia_compra, mes_compra, ano_compra, valor_total, id_clientes) VALUES
("10902", 10, 02, 2025, 4.90 ,"165238732"),
("10903", 10, 02, 2025, 12.80 ,"189273786"),
("10904", 10, 02, 2025, 7.90 ,"012897389");
SELECT * FROM pedidos;

CREATE TABLE itens_pedidos(
	id INT PRIMARY KEY auto_increment,
    id_pedido int,
    id_produto int,
	quantidade int default 0 ,
	foreign key (id_pedido) references produtos(id),
    foreign key (id_pedido) references pedidos(id)
);


CREATE TABLE forma_pagamento(
	id int primary key auto_increment,
    nome varchar(42) not null
);
CREATE TABLE pagamento(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido int not null,
    id_forma_pagamento int,
    quantidade int,
    	status enum('pendente', 'aprovado', 'recusado'),
    foreign key (id_forma_pagamento) references forma_pagamento(id),

	foreign key (id_pedido) references pedidos(id)
);
drop table pagamento;

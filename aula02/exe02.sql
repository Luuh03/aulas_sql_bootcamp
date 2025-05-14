DROP DATABASE db_pizzaria_legal;

CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias  (
	id bigint PRIMARY KEY AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    tamanho_cm int NOT NULL
);

INSERT INTO tb_categorias (nome, tamanho_cm)
VALUES	("Pequena", 25),
		("Média", 30),
        ("Grande", 35),
        ("Familia", 45),
        ("Doce", 30);

CREATE TABLE tb_pizzas (
	id bigint PRIMARY KEY AUTO_INCREMENT,
    sabor varchar(255) NOT NULL,
    valor decimal(5,2) NOT NULL,
    recheio_borda varchar(255),
    id_categoria bigint,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_pizzas (sabor, valor, recheio_borda, id_categoria)
VALUES	("Calabresa", 39.99, null, 1),
		("Portuguesa", 40.00, null, 1),
        ("Frango c/ catupiry", 50.00, "Catupiry", 2),
        ("Brócolis c/ bacon", 57.00, "Gorgonzola", 2),
        ("4 Queijos", 74.99, "Cheddar", 3),
        ("Peperoni", 79.99, null, 3),
        ("Chocolate", 48.99, "Chocolate", 5),
        ("A moda da Casa", 104.99, "Cream Cheese", 4);

-- retorna todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE valor > 45;

-- retorna todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE valor > 50 AND valor < 100;

-- retorna todas as pizzas que possuam a letra M no atributo nome
SELECT * FROM tb_pizzas WHERE sabor LIKE "%M%";

-- retornaos dados da tabela tb_pizzas com os dados da tabela tb_categorias
SELECT tb_pizzas.id, tb_pizzas.sabor, tb_pizzas.recheio_borda, tb_categorias.nome AS categoria, 
	CONCAT(tb_categorias.tamanho_cm, "cm") AS tamanho, tb_pizzas.valor
FROM tb_pizzas INNER JOIN tb_categorias
WHERE tb_pizzas.id_categoria = tb_categorias.id;

-- unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica
SELECT tb_pizzas.id, tb_pizzas.sabor, tb_pizzas.recheio_borda, tb_categorias.nome AS categoria, 
	CONCAT(tb_categorias.tamanho_cm, "cm") AS tamanho, tb_pizzas.valor
FROM tb_pizzas INNER JOIN tb_categorias
WHERE tb_pizzas.id_categoria = tb_categorias.id
AND tb_pizzas.id_categoria = 2;
DROP DATABASE db_quitanda;

CREATE DATABASE db_quitanda;

USE db_quitanda;

CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");

INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");

INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");

INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");

INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");

INSERT INTO tb_categorias (descricao)
VALUES ("outros");

CREATE TABLE tb_produtos(
	id bigint AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    quantidade int,
    dtvalidade date,
    categoria_id bigint,
    preco decimal,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Modifica as propriedades de uma coluna da tabela
ALTER TABLE tb_produtos MODIFY preco decimal(6, 2);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Tomate", 1105, "2022-03-15", 3.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

/* Como adicionar várias linhas de uma vez
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco)
VALUES  ("Maçã", 1500, "2025-06-12", 10.00),
		("Cenoura", 2000, "2025-07-12", 12.00),
		("Alcafe", 3500, "2025-06-19", 4.00); */

SELECT * FROM tb_produtos;

UPDATE tb_produtos SET preco = 12.49 WHERE id = 1;

SELECT * FROM tb_produtos WHERE id != 3;

SELECT * FROM tb_produtos WHERE id = 3 OR nome = "Maçã";

SELECT * FROM tb_produtos WHERE id = 2 AND nome = "Maçã";

SELECT * FROM tb_produtos WHERE preco > 5.00;

DELETE FROM tb_produtos WHERE id = 4;

-- 1 = liga a segurança || 0 = desliga a segurança
SET SQL_SAFE_UPDATES = 1;

-- Adiciona nova coluna na tabela
ALTER TABLE tb_produtos ADD descricao varchar(255);

-- Exclui coluna da tabela
ALTER TABLE tb_produtos DROP descricao;

-- Altera nome de coluna da tabela (só tem no MySQL, em outros SGBD é diferente)
ALTER TABLE tb_produtos CHANGE nome nome_produto varchar(255);

SELECT * FROM tb_produtos ORDER BY nome;

SELECT * FROM tb_produtos ORDER BY nome DESC;

SELECT * FROM tb_produtos WHERE NOT categoria_id = 1;

SELECT * FROM tb_produtos WHERE preco IN(5, 10, 15);

SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 15;

-- retorna linhas da tabela com data de validade dentro de um período específico
SELECT * FROM tb_produtos WHERE dtvalidade BETWEEN '2022-03-15' AND '2022-03-15' ORDER BY dtvalidade, nome;

-- pesquisa produtos com nome que termina em "ra"
SELECT * FROM tb_produtos WHERE nome LIKE "%ra";

-- pesquisa produtos com nome que começa com "ra"
SELECT * FROM tb_produtos WHERE nome LIKE "ra%";

-- pesquisa produtos com nome que possui em algum lugar "ra"
SELECT * FROM tb_produtos WHERE nome LIKE "%RA%";

-- conta numero de elementos na tb_produtos
SELECT COUNT(*) FROM tb_produtos;

-- conta numeros de itens com categoria_id definido na tb_produtos
SELECT COUNT(categoria_id) FROM tb_produtos;

-- select de soma total de preços da tabela
SELECT SUM(preco) AS soma_preco FROM tb_produtos;

-- select com valor médio de preco na tabela
SELECT AVG(preco) AS media_preco FROM tb_produtos;

-- select com formatação de decimal para reais
SELECT categoria_id, CONCAT('R$ ', FORMAT(AVG(preco), 2, 'pt-BR')) AS media_preco FROM tb_produtos GROUP BY categoria_id;

-- select de data com formação
SELECT nome, DATE_FORMAT(dtvalidade, '%d/%m/%Y') AS data_validade FROM tb_produtos;

-- Select de valores maximos e minimos da tabela na coluna preço
SELECT MAX(preco) AS preco_maximo FROM tb_produtos;
SELECT MIN(preco) AS preco_minimo FROM tb_produtos;

-- inner join

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- left join

SELECT * FROM tb_produtos LEFT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- right join

SELECT * FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

--  Retorna descrição das categorias e preço médio de cada
SELECT tb_categorias.descricao, CONCAT('R$ ', FORMAT(AVG(preco), 2, 'pt-BR')) AS media_preco 
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.descricao;

--  Retorna descrição das categorias e preço médio de cada maior que 5
SELECT tb_categorias.descricao, FORMAT(AVG(preco), 2, 'pt-BR') AS media_preco 
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.descricao
HAVING media_preco > 5;

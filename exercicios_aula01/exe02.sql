DROP DATABASE db_exercicio02;

CREATE DATABASE db_exercicio02;

USE db_exercicio02;

CREATE TABLE tb_produtos (
	id bigint AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255),
	fabricante varchar(255),
    valor decimal(6,2),
	avaliacoes decimal(2,1)
);

-- insere dados na tabela de produtos
INSERT INTO tb_produtos (nome, fabricante, valor, avaliacoes)
VALUES	("Pré venda Nintendo Switch 2", "Nintendo", 4499.90, null),
		("Headset com fio USB", "Logitech", 149.90, 5),
		("SSD NVMe M.2 1TB", "Kingston", 409.99, 4.5),
        ("Monitor Gamer 240hz", "Rise Mode", 1449.99, 4),
        ("Memória RAM 8GB", "Husky Technologies", 109.90, 4.9),
		("Controle DualSense PS5", "Sony", 398.07, 5),
        ("Teclado mecânico Gamer", "Redragon", 169.99, 5),
        ("Lâmpada Smart", "Positivo", 72.84, 2.2);

-- consulta produtos com o valor maior do que 500
SELECT * FROM tb_produtos WHERE valor > 500;

-- consulta produtos com o valor menor do que 500
SELECT * FROM tb_produtos WHERE valor < 500;

-- atualiza registro com cpf 98273462837
UPDATE tb_produtos SET nome = "Nintendo Switch 2", valor = 3899.99, avaliacoes = 4 WHERE id = 1;

-- consulta todos os registros
SELECT * FROM tb_produtos;
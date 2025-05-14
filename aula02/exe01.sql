DROP DATABASE db_generation_game_online;

CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (
	id bigint PRIMARY KEY AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    arma_principal varchar(255) NOT NULL
);

INSERT INTO tb_classes (nome, arma_principal)
VALUES	("Cavaleiro", "Espada longa"),
		("Bardo", "Alaúde"),
        ("Mago", "Grimório"),
        ("Druída", "Cajado"),
        ("Ladino", "Adaga");

CREATE TABLE tb_personagens (
	id bigint PRIMARY KEY AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    id_classe bigint,
    ataque bigint NOT NULL,
    defesa bigint NOT NULL,
    vida bigint NOT NULL,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
);

INSERT INTO tb_personagens (nome, id_classe, ataque, defesa, vida)
VALUES	("Ayana", 1, 3500, 1700, 45),
		("Freddie", 1, 4000, 1800, 40),
        ("Lavender", 5, 5000, 1500, 30),
        ("Colden", 3, 5700, 900, 36),
        ("Rimel", 1, 1800, 2300, 50),
        ("Cristopher", 1, 1600, 2700, 68),
        ("Rocky", 4, 2500, 2700, 74),
        ("Salabim", 2, 1500, 1600, 35);

-- retorna todes os personagens cujo poder de ataque seja maior do que 2000
SELECT * FROM tb_personagens WHERE ataque > 2000;

-- retorna todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000
SELECT * FROM tb_personagens WHERE defesa > 1000 AND defesa < 2000;

-- retorna todes os personagens que possuam a letra C no atributo nome
SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

-- retorna os dados da tabela tb_personagens com os dados da tabela tb_classes
SELECT tb_personagens.id, tb_personagens.nome, tb_classes.nome AS classe, tb_classes.arma_principal AS arma, 
	tb_personagens.ataque, tb_personagens.defesa, tb_personagens.vida
FROM tb_personagens INNER JOIN tb_classes
WHERE tb_personagens.id_classe = tb_classes.id;

-- os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica
SELECT tb_personagens.id, tb_personagens.nome, tb_classes.nome AS classe, tb_classes.arma_principal AS arma, 
	tb_personagens.ataque, tb_personagens.defesa, tb_personagens.vida
FROM tb_personagens INNER JOIN tb_classes
WHERE tb_personagens.id_classe = tb_classes.id 
AND tb_personagens.id_classe = 1;
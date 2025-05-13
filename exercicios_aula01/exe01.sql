DROP DATABASE db_exercicio01;

CREATE DATABASE db_exercicio01;

USE db_exercicio01;

CREATE TABLE tb_cargos (
	id int AUTO_INCREMENT PRIMARY KEY,
    descricao varchar(255)
);

-- insere dados na tabela de cargos
INSERT INTO tb_cargos (descricao)
VALUES	("Dev Junior"),
		("Dev Pleno"),
		("Dev Sênior"),
        ("Segurança"),
        ("CEO");

CREATE TABLE tb_colaboradores (
	cpf varchar(11) PRIMARY KEY,
    nome varchar(255),
	id_cargo int,
    salario decimal(7,2),
	email varchar(255),
    FOREIGN KEY (id_cargo) REFERENCES tb_cargos(id)
);

-- insere dados na tabela de colaboradores
INSERT INTO tb_colaboradores (cpf, nome, id_cargo, salario, email)
VALUES	("12345678901", "Herta da Silva", 5, 30000.00, "th3h3rt4@gmail.com"),
		("64782346231", "Herta da Silva Junior", 3, 15090.00, "little.herta@gmail.com"),
		("98273462837", "Robin Cavalcante", 1, 4500.59, "robin_bird@gmail.com"),
        ("54739902182", "Gallagher Rocha dos Santos", 4, 1990.00, "huntingdog@gmail.com"),
        ("62173837625", "Fugue Teixeira", 2, 6000.00, "the.kitsune@gmail.com");

-- consulta registros de colaboradores com salario maior que 2000
SELECT tb_colaboradores.cpf, tb_colaboradores.nome, tb_cargos.descricao AS cargo, tb_colaboradores.salario, tb_colaboradores.email
FROM tb_colaboradores INNER JOIN tb_cargos
ON tb_colaboradores.id_cargo = tb_cargos.id
WHERE salario > 2000;

-- consulta registros de colaboradores com salario menor que 2000
SELECT tb_colaboradores.cpf, tb_colaboradores.nome, tb_cargos.descricao AS cargo, tb_colaboradores.salario, tb_colaboradores.email
FROM tb_colaboradores INNER JOIN tb_cargos
ON tb_colaboradores.id_cargo = tb_cargos.id
WHERE salario < 2000;

-- atualiza registro com cpf 98273462837
UPDATE tb_colaboradores SET id_cargo = 2, salario = 6000 WHERE cpf = "98273462837";

-- consulta todos os registros
SELECT tb_colaboradores.cpf, tb_colaboradores.nome, tb_cargos.descricao AS cargo, tb_colaboradores.salario, tb_colaboradores.email
FROM tb_colaboradores INNER JOIN tb_cargos
ON tb_colaboradores.id_cargo = tb_cargos.id;
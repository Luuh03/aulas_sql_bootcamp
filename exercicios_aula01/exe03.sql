DROP DATABASE db_exercicio03;

CREATE DATABASE db_exercicio03;

USE db_exercicio03;

CREATE TABLE tb_responsaveis (
	id int AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255),
    telefone varchar(20)
);

-- insere dados na tabela de cargos
INSERT INTO tb_responsaveis (nome, telefone)
VALUES	("Zhongli", "12345678910"),
		("Xianyun", "17263726381"),
		("Ningguang","67387831272"),
        ("Mavuika", "28783829182");

CREATE TABLE tb_alunos (
	ra int AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255),
	turma varchar(2),
    nota decimal(3,1),
	id_responsavel int,
    FOREIGN KEY (id_responsavel) REFERENCES tb_responsaveis(id)
);

-- insere dados na tabela de colaboradores
INSERT INTO tb_alunos (nome, turma, nota, id_responsavel)
VALUES	("Kazuha", "2A", 5.5, 3),
		("Shenhe", "2A", 7.7, 2),
		("Xiao", "3B", 9.5, 1),
        ("Ganyu", "2B", 10, 2),
        ("Yaoyao", "1B", 6.5, 2),
		("Kinich", "3A", 7.7, 4),
        ("Kachina", "1A", 4.2, 4),
        ("Iansan", "1A", 5.7, 4);

-- consulta registros de todes o/a(s) estudantes com a nota maior do que 7.0
SELECT tb_alunos.ra, tb_alunos.nome, tb_alunos.turma, tb_alunos.nota, tb_responsaveis.nome as responsável
FROM tb_alunos INNER JOIN tb_responsaveis
ON tb_alunos.id_responsavel = tb_responsaveis.id
WHERE nota >= 7;

-- consulta registros de todes o/a(s) estudantes com a nota menor do que 7.0
SELECT tb_alunos.ra, tb_alunos.nome, tb_alunos.turma, tb_alunos.nota, tb_responsaveis.nome as responsável
FROM tb_alunos INNER JOIN tb_responsaveis
ON tb_alunos.id_responsavel = tb_responsaveis.id
WHERE nota < 7;

-- atualiza registro com ra 1
UPDATE tb_alunos SET nota = 7.1 WHERE ra = 1;

-- consulta todos os registros
SELECT tb_alunos.ra, tb_alunos.nome, tb_alunos.turma, tb_alunos.nota, tb_responsaveis.nome as responsável
FROM tb_alunos INNER JOIN tb_responsaveis
ON tb_alunos.id_responsavel = tb_responsaveis.id;
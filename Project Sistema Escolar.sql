-- CRIANDO BANCO DE DADOS
CREATE DATABASE sistema_escolar;
-- Visualizando o banco de dados
SHOW DATABASES;
-- Usando a tabela
USE sistema_escolar;
-- Criando as tabelas
CREATE TABLE tb_alunos(
alu_id INT AUTO_INCREMENT PRIMARY KEY,
alu_nome VARCHAR(100) NOT NULL,
alu_data_nasc DATE,
alu_cpf VARCHAR (15) NOT NULL,
alu_logradouro VARCHAR(250),
alu_numero VARCHAR (10),
alu_bairro VARCHAR(100),
alu_cidade VARCHAR(100),
alu_estado CHAR(2),
alu_cep VARCHAR (10)
);
CREATE TABLE tb_professores(
pro_id INT AUTO_INCREMENT PRIMARY KEY,
pro_nome VARCHAR(100) NOT NULL,
pro_telefone VARCHAR(15)
);
CREATE TABLE tb_disciplinas(
dis_id INT AUTO_INCREMENT PRIMARY KEY,
dis_nome_disciplina VARCHAR (50) NOT NULL,
dis_proid INT,
FOREIGN KEY(dis_proid) REFERENCES tb_professores(pro_id)
);
CREATE TABLE tb_turmas(
tur_id INT AUTO_INCREMENT PRIMARY KEY,
tur_nome_turma VARCHAR (50) NOT NULL,
tur_ano_letivo CHAR (4) NOT NULL
);
CREATE TABLE tb_matriculas(
mat_id INT AUTO_INCREMENT PRIMARY KEY,
mat_data_matricula DATE,
mat_aluid INT,
FOREIGN KEY(mat_aluid) REFERENCES tb_alunos(alu_id),
mat_turid INT,
FOREIGN KEY(mat_turid) REFERENCES tb_turmas(tur_id)
);
CREATE TABLE tb_notas(
not_id INT AUTO_INCREMENT PRIMARY KEY,
not_notas DECIMAL (4,2) NOT NULL,
not_bimestre TINYINT NOT NULL CHECK (not_bimestre BETWEEN 1 AND 4),
not_aluid INT,
FOREIGN KEY(not_aluid) REFERENCES tb_alunos(alu_id),
not_disid INT,
FOREIGN KEY(not_disid) REFERENCES tb_disciplinas(dis_id)
);
-- Visualizando as tabelas
SHOW TABLES;
-- Inserindo os dados nas tabelas
INSERT INTO tb_alunos (alu_nome, alu_data_nasc, alu_cpf, alu_logradouro, alu_numero, alu_bairro, alu_cidade, alu_estado, alu_cep) VALUES
('Ana Beatriz Souza', '2008-05-12', '12345678901', 'Rua das Flores', '120', 'Jardim América', 'São Paulo', 'SP', '04567-100'),
('Bruno Henrique Lima', '2007-09-03', '23456789012', 'Av. Central', '45', 'Centro', 'São Paulo', 'SP', '01020-300'),
('Carla Mendes Silva', '2008-11-22', '34567890123', 'Rua do Sol', '78', 'Parque Pinheiros', 'Taboão da Serra', 'SP', '06754-120'),
('Diego Castro Santos', '2009-01-14', '45678901234', 'Rua Esperança', '310', 'Jardim São Luís', 'São Paulo', 'SP', '05813-450'),
('Elisa Moraes Pinto', '2008-03-08', '56789012345', 'Av. Brasil', '200', 'Bela Vista', 'São Paulo', 'SP', '01322-000'),
('Felipe Araujo Costa', '2007-06-25', '67890123456', 'Rua Verde', '99', 'Vila Yara', 'Osasco', 'SP', '06020-200'),
('Gabriela Nunes Rocha', '2009-09-09', '78901234567', 'Rua das Palmeiras', '88', 'Vila Mariana', 'São Paulo', 'SP', '04112-070'),
('Henrique Pires Alves', '2008-10-30', '89012345678', 'Av. Paulista', '900', 'Bela Vista', 'São Paulo', 'SP', '01311-100'),
('Isabela Martins Dias', '2007-02-18', '90123456789', 'Rua Azul', '25', 'Campestre', 'Santo André', 'SP', '09070-050'),
('João Pedro Ribeiro', '2008-07-11', '01234567890', 'Rua Vitória', '180', 'Jardim da Saúde', 'São Paulo', 'SP', '04145-230');
INSERT INTO tb_professores (pro_nome, pro_telefone) VALUES
('Ricardo Oliveira', '11988887777'),
('Fernanda Costa', '11999996666'),
('Paulo Andrade', '11977778888'),
('Juliana Martins', '11966665555'),
('Thiago Souza', '11955554444'),
('Mariana Lopes', '11944443333');
INSERT INTO tb_disciplinas (dis_nome_disciplina, dis_proid) VALUES
('Matemática', 1),
('Português', 2),
('História', 3),
('Geografia', 4),
('Ciências', 5),
('Educação Física', 6),
('Inglês', 2),
('Artes', 4);
ALTER TABLE tb_turmas
ADD tur_turno VARCHAR(10);
INSERT INTO tb_turmas (tur_nome_turma, tur_ano_letivo, tur_turno) VALUES
('8º A', '2024', 'Manhã'),
('8º B', '2024', 'Manhã'),
('9º A', '2024', 'Tarde'),
('9º B', '2024', 'Tarde');
INSERT INTO tb_matriculas (mat_data_matricula, mat_aluid, mat_turid) VALUES
('2024-02-01', 1, 1),
('2024-02-01', 2, 1),
('2024-02-03', 3, 2),
('2024-02-05', 4, 2),
('2024-02-07', 5, 1),
('2024-02-01', 6, 3),
('2024-02-01', 7, 3),
('2024-02-04', 8, 4),
('2024-02-05', 9, 4),
('2024-02-06', 10, 3);
INSERT INTO tb_notas (not_notas, not_bimestre, not_aluid, not_disid) VALUES
(9.50, 1, 1, 1),   -- Ana, Matemática
(8.75, 1, 1, 2),   -- Ana, Português
(9.20, 2, 1, 5),   -- Ana, Ciências
(7.50, 1, 2, 1),   -- Bruno, Matemática
(8.00, 2, 2, 2),   -- Bruno, Português
(8.30, 1, 3, 3),   -- Carla, História
(9.10, 2, 3, 5),   -- Carla, Ciências
(7.80, 1, 4, 4),   -- Diego, Geografia
(8.50, 3, 4, 1),   -- Diego, Matemática
(9.00, 1, 5, 2),   -- Elisa, Português
(9.50, 2, 5, 3),   -- Elisa, História
(10.00, 1, 6, 6),  -- Felipe, Educação Física
(8.40, 2, 6, 1),   -- Felipe, Matemática
(7.90, 1, 7, 2),   -- Gabriela, Português
(8.20, 2, 7, 4),   -- Gabriela, Geografia
(6.75, 1, 8, 1),   -- Henrique, Matemática
(7.30, 2, 8, 5),   -- Henrique, Ciências
(9.10, 1, 9, 3),   -- Isabela, História
(8.80, 3, 9, 2),   -- Isabela, Português
(7.90, 1, 10, 1),  -- João, Matemática
(9.70, 2, 10, 6);  -- João, Educação Física
-- Visualizando os dados inseridos nas tabelas
SHOW TABLES;
-- Consultas
SELECT * FROM tb_alunos;
SELECT * FROM tb_professores;
SELECT * FROM tb_disciplinas;
SELECT * FROM tb_turmas;
SELECT * FROM tb_matriculas;
SELECT * FROM tb_notas;
SELECT 
    a.alu_id AS ID_Aluno,
    a.alu_nome AS Nome_Aluno,
    a.alu_cidade AS Cidade,
    t.tur_nome_turma AS Turma,
    t.tur_ano_letivo AS Ano_Letivo,
    t.tur_turno AS Turno,
    d.dis_nome_disciplina AS Disciplina,
    p.pro_nome AS Professor,
    n.not_notas AS Nota,
    n.not_bimestre AS Bimestre,
    m.mat_data_matricula AS Data_Matricula
FROM tb_notas n
JOIN tb_alunos a ON n.not_aluid = a.alu_id
JOIN tb_disciplinas d ON n.not_disid = d.dis_id
JOIN tb_professores p ON d.dis_proid = p.pro_id
JOIN tb_matriculas m ON a.alu_id = m.mat_aluid
JOIN tb_turmas t ON m.mat_turid = t.tur_id
ORDER BY a.alu_nome, d.dis_nome_disciplina, n.not_bimestre;
CREATE DATABASE db_formula1;
USE db_formula1;

CREATE TABLE td_paises (
    codigo VARCHAR(3) PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE td_equipes (
    sigla VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(100),
    cod_pais VARCHAR(3),
    FOREIGN KEY (cod_pais) REFERENCES td_paises(codigo)
);

CREATE TABLE td_corridas (
    sigla_gp VARCHAR(10) PRIMARY KEY,
    nome_gp VARCHAR(100),
    cod_pais VARCHAR(3),
    qtd_voltas INT,
    FOREIGN KEY (cod_pais) REFERENCES td_paises(codigo)
);

CREATE TABLE td_pilotos (
    numero INT PRIMARY KEY,
    nome VARCHAR(100),
    cod_pais VARCHAR(3),
    sigla_equipe VARCHAR(10),
    FOREIGN KEY (cod_pais) REFERENCES td_paises(codigo),
    FOREIGN KEY (sigla_equipe) REFERENCES td_equipes(sigla)
);

CREATE TABLE td_participantes (
    sigla_gp VARCHAR(10),
    num_piloto INT,
    posicao_largada INT,
    PRIMARY KEY (sigla_gp, num_piloto),
    FOREIGN KEY (sigla_gp) REFERENCES td_corridas(sigla_gp),
    FOREIGN KEY (num_piloto) REFERENCES td_pilotos(numero)
);

INSERT INTO td_paises (codigo, nome) VALUES
('BRA', 'Brasil'), ('GBR', 'Reino Unido'), ('ITA', 'Italia'), ('FRA', 'Franca'),
('ESP', 'Espanha'), ('DEU', 'Alemanha'), ('NLD', 'Paises Baixos'), ('AUS', 'Australia'),
('JPN', 'Japao'), ('CAN', 'Canada'), ('MEX', 'Mexico'), ('USA', 'Estados Unidos'),
('MON', 'Monaco'), ('BEL', 'Belgica'), ('AUT', 'Austria'), ('CHE', 'Suica'),
('SWE', 'Suecia'), ('ARG', 'Argentina'), ('CHN', 'China'), ('IND', 'India');

INSERT INTO td_equipes (sigla, nome, cod_pais) VALUES
('FER', 'Ferrari', 'ITA'), ('MCL', 'McLaren', 'GBR'), ('WIL', 'Williams', 'GBR'),
('MER', 'Mercedes', 'DEU'), ('RED', 'Red Bull', 'AUT'), ('ALP', 'Alpine', 'FRA'),
('AST', 'Aston Martin', 'GBR'), ('HAA', 'Haas', 'USA'), ('SAU', 'Sauber', 'CHE'),
('RBL', 'Racing Bulls', 'ITA'), ('LOT', 'Lotus Racing', 'GBR'), ('BRB', 'Brabham', 'AUS'),
('TYR', 'Tyrrell', 'GBR'), ('JRD', 'Jordan', 'GBR'), ('BEN', 'Benetton', 'ITA'),
('MIN', 'Minardi', 'ITA'), ('PRO', 'Prost', 'FRA'), ('BAR', 'BAR Racing', 'CAN'),
('TOY', 'Toyota Racing', 'JPN'), ('HND', 'Honda Racing', 'JPN');

INSERT INTO td_corridas (sigla_gp, nome_gp, cod_pais, qtd_voltas) VALUES
('BRA', 'Grande Premio de Sao Paulo', 'BRA', 71),
('GBR', 'Grande Premio da Gra-Bretanha', 'GBR', 52),
('ITA', 'Grande Premio da Italia', 'ITA', 53),
('FRA', 'Grande Premio da Franca', 'FRA', 53),
('ESP', 'Grande Premio da Espanha', 'ESP', 66),
('DEU', 'Grande Premio da Alemanha', 'DEU', 67),
('NLD', 'Grande Premio dos Paises Baixos', 'NLD', 72),
('AUS', 'Grande Premio da Australia', 'AUS', 58),
('JPN', 'Grande Premio do Japao', 'JPN', 53),
('CAN', 'Grande Premio do Canada', 'CAN', 70),
('MEX', 'Grande Premio do Mexico', 'MEX', 71),
('USA', 'Grande Premio dos Estados Unidos', 'USA', 56),
('MON', 'Grande Premio de Monaco', 'MON', 78),
('BEL', 'Grande Premio da Belgica', 'BEL', 44),
('AUT', 'Grande Premio da Austria', 'AUT', 71),
('CHE', 'Grande Premio da Suica', 'CHE', 50),
('SWE', 'Grande Premio da Suecia', 'SWE', 55),
('ARG', 'Grande Premio da Argentina', 'ARG', 53),
('CHN', 'Grande Premio da China', 'CHN', 56),
('IND', 'Grande Premio da India', 'IND', 60);

INSERT INTO td_pilotos (numero, nome, cod_pais, sigla_equipe) VALUES
(1, 'Ana Silva', 'BRA', 'FER'), (2, 'Bruno Costa', 'GBR', 'MCL'),
(3, 'Carla Souza', 'ITA', 'WIL'), (4, 'Daniel Oliveira', 'FRA', 'MER'),
(5, 'Eduardo Santos', 'ESP', 'RED'), (6, 'Fernanda Lima', 'DEU', 'ALP'),
(7, 'Gabriel Rocha', 'NLD', 'AST'), (8, 'Helena Martins', 'AUS', 'HAA'),
(9, 'Igor Pereira', 'JPN', 'SAU'), (10, 'Julia Almeida', 'CAN', 'RBL'),
(11, 'Kai Nakamura', 'JPN', 'LOT'), (12, 'Lucas Moreira', 'MEX', 'BRB'),
(13, 'Marina Costa', 'USA', 'TYR'), (14, 'Nicolas Bernard', 'MON', 'JRD'),
(15, 'Olivia Weber', 'BEL', 'BEN'), (16, 'Pedro Ferreira', 'AUT', 'MIN'),
(17, 'Quinn Taylor', 'CHE', 'PRO'), (18, 'Rafael Gomez', 'ARG', 'BAR'),
(19, 'Sofia Chen', 'CHN', 'TOY'), (20, 'Theo Patel', 'IND', 'HND');

INSERT INTO td_participantes (sigla_gp, num_piloto, posicao_largada) VALUES
('BRA', 1, 1), ('GBR', 2, 1), ('ITA', 3, 1), ('FRA', 4, 1),
('ESP', 5, 1), ('DEU', 6, 1), ('NLD', 7, 1), ('AUS', 8, 1),
('JPN', 9, 1), ('CAN', 10, 1), ('MEX', 11, 1), ('USA', 12, 1),
('MON', 13, 1), ('BEL', 14, 1), ('AUT', 15, 1), ('CHE', 16, 1),
('SWE', 17, 1), ('ARG', 18, 1), ('CHN', 19, 1), ('IND', 20, 1);


INSERT INTO td_pilotos (numero, nome, cod_pais, sigla_equipe)
VALUES (21, 'Lucas Ferreira', 'BRA', 'LOT'), (22, 'Mariana Duarte', 'BRA', 'BRB'),
(23, 'Rafael Barbosa', 'BRA', 'TYR'), (24, 'Beatriz Nogueira', 'BRA', 'JRD'),
(25, 'Thiago Carvalho', 'BRA', 'BEN'), (26, 'Giulia Romano', 'ITA', 'MIN'),
(27, 'Matteo Ricci', 'ITA', 'PRO'), (28, 'Chiara Bianchi', 'ITA', 'BAR'),
(29, 'Antoine Lefebvre', 'FRA', 'TOY'), (30, 'Camille Durand', 'FRA', 'HND');

SELECT nome FROM td_paises
WHERE nome LIKE 'B%l';

SELECT nome AS 'Nome' FROM td_pilotos
WHERE cod_pais IN ('BRA', 'ITA', 'FRA');

SELECT nome FROM td_pilotos;

SELECT nome_gp AS 'Grande Prêmio', qtd_voltas AS 'Quantidade de Voltas'
FROM td_corridas;

SELECT nome AS 'Nome', cod_pais AS 'País' FROM td_pilotos;

ALTER TABLE td_pilotos
ADD COLUMN salario DECIMAL(10,2);


UPDATE td_pilotos SET salario = 85000.00  WHERE numero = 1;
UPDATE td_pilotos SET salario = 92000.00  WHERE numero = 2;
UPDATE td_pilotos SET salario = 70000.00  WHERE numero = 3;
UPDATE td_pilotos SET salario = 100000.00 WHERE numero = 4;
UPDATE td_pilotos SET salario = 65000.00  WHERE numero = 5;
UPDATE td_pilotos SET salario = 78000.00  WHERE numero = 6;
UPDATE td_pilotos SET salario = 110000.00 WHERE numero = 7;
UPDATE td_pilotos SET salario = 55000.00  WHERE numero = 8;
UPDATE td_pilotos SET salario = 85000.00  WHERE numero = 9;
UPDATE td_pilotos SET salario = 95000.00  WHERE numero = 10;
UPDATE td_pilotos SET salario = 60000.00  WHERE numero = 11;
UPDATE td_pilotos SET salario = 72000.00  WHERE numero = 12;
UPDATE td_pilotos SET salario = 88000.00  WHERE numero = 13;
UPDATE td_pilotos SET salario = 120000.00 WHERE numero = 14;
UPDATE td_pilotos SET salario = 70000.00  WHERE numero = 15;
UPDATE td_pilotos SET salario = 50000.00  WHERE numero = 16;
UPDATE td_pilotos SET salario = 99000.00  WHERE numero = 17;
UPDATE td_pilotos SET salario = 82000.00  WHERE numero = 18;
UPDATE td_pilotos SET salario = 100000.00 WHERE numero = 19;
UPDATE td_pilotos SET salario = 45000.00  WHERE numero = 20;
UPDATE td_pilotos SET salario = 75000.00  WHERE numero = 21;
UPDATE td_pilotos SET salario = 68000.00  WHERE numero = 22;
UPDATE td_pilotos SET salario = 90000.00  WHERE numero = 23;
UPDATE td_pilotos SET salario = 105000.00 WHERE numero = 24;
UPDATE td_pilotos SET salario = 85000.00  WHERE numero = 25;
UPDATE td_pilotos SET salario = 71000.00  WHERE numero = 26;
UPDATE td_pilotos SET salario = 58000.00  WHERE numero = 27;
UPDATE td_pilotos SET salario = 96000.00  WHERE numero = 28;
UPDATE td_pilotos SET salario = 80000.00  WHERE numero = 29;
UPDATE td_pilotos SET salario = 62000.00  WHERE numero = 30;
 
SELECT nome 
FROM td_pilotos
WHERE salario BETWEEN 70000 AND 100000;

SELECT cod_pais AS 'País', AVG(salario) AS 'Média Salarial'
FROM td_pilotos
GROUP BY cod_pais;

SELECT DISTINCT salario FROM td_pilotos
ORDER BY salario ASC;

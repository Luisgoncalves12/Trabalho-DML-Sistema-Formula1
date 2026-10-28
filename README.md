# Trabalho DML - Banco de Dados Fórmula 1

Trabalho da matéria de Modelagem de Dados (Profa. MsC Josyane Lannes).

A ideia é criar o banco `db_formula1` a partir do cenário da Fórmula 1, popular as tabelas e resolver as queries pedidas no enunciado.

## Arquivos

- `trabalho_formula1.sql`: script com a criação do banco, os inserts, o alter table e as consultas
- `README.md`: este arquivo

## Como rodar

O script foi feito para MySQL. Para executar:

```bash
mysql -u seu_usuario -p < trabalho_formula1.sql
```

Também dá para abrir o arquivo no MySQL Workbench e executar tudo de uma vez. Rodar na ordem em que o script está escrito, porque as tabelas com chave estrangeira dependem das outras já estarem criadas e populadas.

## Tabelas

O banco tem 5 tabelas. O diagrama abaixo mostra como elas se relacionam:

<img width="949" height="533" alt="Captura de tela 2026-10-28 094834" src="https://github.com/user-attachments/assets/871c9801-248a-48a3-a2db-9529d33bb6c9" />


Diagrama de relacionamento do db_formula1

| Tabela | Chave primária | Chaves estrangeiras |
|--------|----------------|---------------------|
| `td_paises` | `codigo` | - |
| `td_equipes` | `sigla` | `cod_pais` -> `td_paises` |
| `td_corridas` | `sigla_gp` | `cod_pais` -> `td_paises` |
| `td_pilotos` | `numero` | `cod_pais` -> `td_paises`, `sigla_equipe` -> `td_equipes` |
| `td_participantes` | (`sigla_gp`, `num_piloto`) | `sigla_gp` -> `td_corridas`, `num_piloto` -> `td_pilotos` |

Colunas:

- `td_paises`: codigo, nome
- `td_equipes`: sigla, nome, cod_pais
- `td_corridas`: sigla_gp, nome_gp, cod_pais, qtd_voltas
- `td_pilotos`: numero, nome, cod_pais, sigla_equipe, salario (adicionada depois com ALTER TABLE)
- `td_participantes`: sigla_gp, num_piloto, posicao_largada

A tabela `td_participantes` é a tabela associativa entre pilotos e corridas (relação N:N), por isso tem chave primária composta.

## Dados inseridos

- 20 países
- 20 equipes
- 20 corridas (GPs)
- 30 pilotos (20 iniciais + 10 inseridos depois)
- 20 participações

Os 10 pilotos extras (números 21 a 30) são para cumprir o mínimo pedido no enunciado: 5 do Brasil, 3 da Itália e 2 da França.

## Queries

### 1. Inserir pelo menos 5 pilotos do Brasil, 3 da Itália e 2 da França

```sql
INSERT INTO td_pilotos (numero, nome, cod_pais, sigla_equipe)
VALUES (21, 'Lucas Ferreira', 'BRA', 'LOT'), ...
```

### 2. Popular todas as tabelas

`INSERT` em todas as tabelas (ver o arquivo `trabalho_formula1.sql`).

### 3. Países que começam com B e terminam com L

```sql
SELECT nome FROM td_paises
WHERE nome LIKE 'B%l';
```

Resultado:

<img width="265" height="188" alt="Resultado da query 3" src="https://github.com/user-attachments/assets/a3ecce0e-ef79-4c92-97a4-a5406c61d3a1" />

### 4. Pilotos do Brasil, Itália e França

```sql
SELECT nome AS 'Nome' FROM td_pilotos
WHERE cod_pais IN ('BRA', 'ITA', 'FRA');
```

Resultado:

<img width="294" height="217" alt="Resultado da query 4" src="https://github.com/user-attachments/assets/48d50905-3a7e-4781-8109-072f5872c1ed" />

### 5. Nome dos pilotos

```sql
SELECT nome FROM td_pilotos;
```

Resultado:

<img width="258" height="196" alt="Resultado da query 5" src="https://github.com/user-attachments/assets/d3bfb0bf-2423-488a-87eb-cef952efde2c" />

### 6. Nome dos GPs e quantidade de voltas (com alias)

```sql
SELECT nome_gp AS 'Grande Prêmio', qtd_voltas AS 'Quantidade de Voltas'
FROM td_corridas;
```

Resultado:

<img width="327" height="319" alt="Resultado da query 6" src="https://github.com/user-attachments/assets/908aaa29-526f-40ca-838c-e0430377d9d1" />

### 7. Nome dos pilotos e seus países

```sql
SELECT nome AS 'Nome', cod_pais AS 'País' FROM td_pilotos;
```

Resultado:

<img width="289" height="312" alt="Resultado da query 7" src="https://github.com/user-attachments/assets/442f09af-8e3a-48b3-b137-5eeb6164f3bd" />

### 8. Inserir o atributo salário na tabela piloto

```sql
ALTER TABLE td_pilotos
ADD COLUMN salario DECIMAL(10,2);
```

### 9. Popular o salário

Um `UPDATE` para cada piloto:

```sql
UPDATE td_pilotos SET salario = 85000.00 WHERE numero = 1;
```

### 10. Pilotos com salário entre 70 e 100 mil

```sql
SELECT nome
FROM td_pilotos
WHERE salario BETWEEN 70000 AND 100000;
```

Resultado:

<img width="226" height="289" alt="Resultado da query 10" src="https://github.com/user-attachments/assets/64c5ac6e-0528-419a-adbf-b7dd64bcd647" />

### 11. Média salarial por país

```sql
SELECT cod_pais AS 'País', AVG(salario) AS 'Média Salarial'
FROM td_pilotos
GROUP BY cod_pais;
```

Resultado:

<img width="248" height="277" alt="Resultado da query 11" src="https://github.com/user-attachments/assets/9defdcc6-1b79-453a-bc9b-5914c60a1c52" />

### 12. Salários diferentes em ordem crescente

```sql
SELECT DISTINCT salario FROM td_pilotos
ORDER BY salario ASC;
```

Resultado:

<img width="219" height="269" alt="Resultado da query 12" src="https://github.com/user-attachments/assets/ba580a5b-03c0-4d91-a0f2-69e7679b02c5" />

## Conceitos usados

- DDL: CREATE DATABASE, CREATE TABLE, ALTER TABLE
- DML: INSERT, UPDATE, SELECT
- Chave primária (simples e composta) e chave estrangeira
- Filtros: WHERE, LIKE, IN, BETWEEN
- Alias com AS
- Função de agregação AVG com GROUP BY
- DISTINCT e ORDER BY

## Observações

- Os nomes dos pilotos e os salários são inventados, só para o trabalho.
- Os nomes de países e GPs foram inseridos sem acento (ex.: `Franca`, `Japao`) para evitar problema de codificação.

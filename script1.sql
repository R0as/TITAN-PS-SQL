CREATE DATABASE exercicio1;

use exercicio1;

CREATE TABLE produtos (
    cod_prod INT(8) NOT NULL,
    loj_prod INT(8) NOT NULL,
    desc_prod CHAR(40),
    dt_inclu_prod DATE,
    preco_prod DECIMAL(8,3),
    PRIMARY KEY (cod_prod, loj_prod)
);
-- exercício 1
INSERT INTO produtos (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod) VALUES (170, 2, 'LEITE CONDENSADO MOCOCA', STR_TO_DATE('30/12/2010', '%d/%m/%Y'), 45.40);
-- para teste
INSERT INTO produtos (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod) VALUES (171, 2, 'REFRIGERANTE COCA COLA', STR_TO_DATE('30/12/2012', '%d/%m/%Y'), 20.00);
INSERT INTO produtos (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod) VALUES (171, 1, 'REFRIGERANTE SPRITE', STR_TO_DATE('30/12/2012', '%d/%m/%Y'), 20.00);
INSERT INTO produtos (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod) VALUES (171, 3, 'COMPUTADOR', STR_TO_DATE('30/12/2012', '%d/%m/%Y'), 99999.99);
INSERT INTO produtos (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod) VALUES (172, 3, 'COMPUTADOR GAMER', STR_TO_DATE('30/12/2012', '%d/%m/%Y'), 99999.99);

SHOW tables;

SELECT * FROM produtos;

-- exercício 2
UPDATE produtos SET preco_prod = 95.40 WHERE cod_prod = 170 AND loj_prod = 2;

-- exercício 3
SELECT * FROM produtos WHERE loj_prod IN (1, 2);

-- exercício 4
SELECT MAX(dt_inclu_prod) AS data_inclusao_mais_recente, MIN(dt_inclu_prod) AS data_inclusao_mais_antiga FROM produtos;

-- exercício 5
SELECT COUNT(*) AS total_registros FROM produtos;

-- exercício 6
SELECT * FROM produtos WHERE desc_prod LIKE 'L%';

-- exercício 7
SELECT loj_prod, SUM(preco_prod) AS total_precos_por_loja FROM produtos GROUP BY loj_prod;

-- exercício 8
SELECT loj_prod, SUM(preco_prod) AS total_precos_por_loja FROM produtos GROUP BY loj_prod HAVING SUM(preco_prod) > 100000;
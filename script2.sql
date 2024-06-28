CREATE DATABASE exercicio2;

use exercicio2;

CREATE TABLE Lojas (
    loj_prod INTEGER(8) PRIMARY KEY,
    desc_loj CHAR(40)
);

CREATE TABLE Produtos (
    Cód_prod INTEGER(8) PRIMARY KEY,
    loj_prod INTEGER(8),
    desc_prod CHAR(40),
    Dt_inclu_prod DATE,
    preco_prod DECIMAL(8,3),
    FOREIGN KEY (loj_prod) REFERENCES Lojas(loj_prod)
);

-- para poder testar
CREATE TABLE Estoque (
    Cód_prod INTEGER(8),
    loj_prod INTEGER(8),
    qtd_prod DECIMAL(15,3),
    PRIMARY KEY (Cód_prod, loj_prod),
    FOREIGN KEY (loj_prod) REFERENCES Produtos(loj_prod)
);

INSERT INTO Lojas (loj_prod, desc_loj) VALUES (1, 'Loja Centro');

INSERT INTO Lojas (loj_prod, desc_loj) VALUES (2, 'Loja Norte');

INSERT INTO Produtos (Cód_prod, loj_prod, desc_prod, Dt_inclu_prod, preco_prod) VALUES (1, 1, 'Produto A', '2023-01-15', 12.50);

INSERT INTO Produtos (Cód_prod, loj_prod, desc_prod, Dt_inclu_prod, preco_prod) VALUES (2, 2, 'Produto B', '2023-02-20', 23.00);

INSERT INTO Produtos (Cód_prod, loj_prod, desc_prod, Dt_inclu_prod, preco_prod) VALUES (3, 2, 'Produto C', '2023-02-20', 23.00);

INSERT INTO Estoque (Cód_prod, loj_prod, qtd_prod) VALUES (1, 1, 50);

INSERT INTO Estoque (Cód_prod, loj_prod, qtd_prod) VALUES (2, 2, 75);

INSERT INTO Estoque (Cód_prod, loj_prod, qtd_prod) VALUES (3001, 1, 10.000);


-- exercício 1
SELECT
 p.loj_prod AS "Código da Loja do Produto",
 l.desc_loj AS "Descrição da Loja",
 p.Cód_prod AS "Código do Produto",
 p.desc_prod AS "Descrição do Produto",
 p.preco_prod AS "Preço do Produto",
 i.qtd_prod AS "Quantidade em Estoque do Produto"
FROM
 Produtos p
JOIN
 Estoque i ON p.Cód_prod = i.Cód_prod AND p.loj_prod = i.loj_prod
JOIN
 Lojas l ON p.loj_prod = l.loj_prod
WHERE
 p.loj_prod = 1;

-- exercício 2
SELECT
 p.Cód_prod AS "Código do Produto",
 p.desc_prod AS "Descrição do Produto",
 p.preco_prod AS "Preço do Produto"
FROM
 Produtos p
LEFT JOIN
 Estoque e ON p.Cód_prod = e.Cód_prod AND p.loj_prod = e.loj_prod
WHERE
 e.Cód_prod IS NULL;

-- exercício 3
SELECT
 e.Cód_prod AS "Código do Produto",
 e.loj_prod AS "Código da Loja",
 e.qtd_prod AS "Quantidade em Estoque"
FROM
 Estoque e
LEFT JOIN
 Produtos p ON e.Cód_prod = p.Cód_prod AND e.loj_prod = p.loj_prod
WHERE
 p.Cód_prod IS NULL;
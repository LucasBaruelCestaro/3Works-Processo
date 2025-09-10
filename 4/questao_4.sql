-- Coloquei o banco da questão 2 junto aqui pra facilitar os testes :)

CREATE DATABASE IF NOT EXISTS banco;
USE banco;

CREATE TABLE IF NOT EXISTS produtos (
    id INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS vendas (
    id INT PRIMARY KEY,
    produto_id INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO produtos (id, nome_produto, preco) VALUES
(1, 'Camisa', 49.90),
(2, 'Sapato', 199.90),
(3, 'Calça', 29.90);

INSERT INTO vendas (id, produto_id, quantidade, data_venda) VALUES
(1, 1, 2, '2024-06-01'),
(2, 2, 1, '2024-06-01'),
(3, 1, 1, '2024-06-02'),
(4, 3, 1, '2024-06-02');


-- Aqui ta a query de fato

CREATE VIEW relatorio_vendas_diarias AS
SELECT
    v.data_venda,
    p.nome_produto,
    SUM(p.preco * v.quantidade) AS total_faturado
FROM
    vendas v
JOIN
    produtos p ON v.produto_id = p.id
GROUP BY
    v.data_venda,
    p.nome_produto;
    
SELECT * FROM relatorio_vendas_diarias;
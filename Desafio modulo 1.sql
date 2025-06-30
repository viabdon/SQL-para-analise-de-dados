-- (Exercício 1) Selecione os nomes de cidade distintas que existem no estado de
-- Minas Gerais em ordem alfabética (dados da tabela sales.customers)
SELECT DISTINCT c.city, c.state
FROM sales.customers AS c
WHERE c.state = 'Minas Gerais' OR c.state = 'MG'
ORDER BY c.city ASC
-- (Exercício 2) Selecione o visit_id das 10 compras mais recentes efetuadas
-- (dados da tabela sales.funnel)
SELECT f.visit_id, f.paid_date
FROM sales.funnel AS f
WHERE f.paid_date IS NOT NULL
ORDER BY f.paid_date DESC
LIMIT 10
-- (Exercício 3) Selecione todos os dados dos 10 clientes com maior score nascidos
-- após 01/01/2000 (dados da tabela sales.customers)
SELECT c.* 
FROM sales.customers AS c
WHERE c.birth_date > '2000-01-01'
ORDER BY c.score DESC
LIMIT 10
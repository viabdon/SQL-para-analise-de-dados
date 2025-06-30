-- (Exercício 1) Calcule quantos salários mínimos 
-- ganha cada cliente da tabela 
-- sales.customers. Selecione as 
-- colunas de: email, income e a
-- coluna calculada "salários mínimos"
-- Considere o salário mínimo igual à R$1200


SELECT c.email, c.income, 
	   (c.income/1200) AS "Salários Mínimos"
FROM sales.customers AS c

-- (Exercício 2) Na query anterior acrescente uma 
-- coluna informando TRUE se o cliente
-- ganha acima de 5 salários mínimos e 
-- FALSE se ganha 4 salários ou menos.
-- Chame a nova coluna de "acima de 4 salários"


SELECT c.email, c.income, 
	   (c.income/1200) AS "salarios_minimos",
	   ((c.income/1200) >= 5) AS "acima de 4 salários"
FROM sales.customers AS c 

-- (Exercício 3) Na query anterior filtre apenas 
-- os clientes que ganham entre
-- 4 e 5 salários mínimos. Utilize o comando BETWEEN

SELECT c.email, c.income, 
	   (c.income/1200) AS "salarios_minimos",
	   ((c.income/1200) >= 5) AS "acima_de_4_salarios"
FROM sales.customers AS c 
WHERE c.income/1200 BETWEEN 4 AND 5

-- (Exercício 4) Selecione o email, cidade e 
-- estado dos clientes que moram no estado de 
-- Minas Gerais e Mato Grosso. 

SELECT c.email, c.city, c.state
FROM sales.customers AS c
WHERE c.state IN ('MG', 'MT')

-- (Exercício 5) Selecine o email, cidade e 
-- estado dos clientes que não 
-- moram no estado de São Paulo.

SELECT c.email, c.city, c.state
FROM sales.customers AS c
WHERE c.state <> 'SP'


-- (Exercício 6) Selecine os nomes das cidade
-- que começam com a letra Z.
-- Dados da tabela temp_table.regions

SELECT r.city
FROM temp_tables.regions AS r
WHERE r.city ILIKE 'Z%'
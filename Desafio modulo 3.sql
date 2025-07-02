-- (Exercício 1) Conte quantos clientes da tabela 
-- sales.customers tem menos de 30 anos

SELECT COUNT(c.customer_id)
FROM sales.customers AS c
WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.birth_date)) < 30;

-- (Exercício 2) Informe a idade do cliente mais velho e mais novo da tabela sales.customers

SELECT c.customer_id, c.birth_date, 
	 ((CURRENT_DATE - c.birth_date) / 365) AS "idade"
FROM sales.customers AS c
WHERE c.birth_date = (SELECT MIN(birth_date) FROM sales.customers)
   OR c.birth_date = (SELECT MAX(birth_date) FROM sales.customers);

-- (Exercício 3) Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possívelmente a resposta contém mais de um cliente)

SELECT c.*
FROM sales.customers AS c
WHERE c.income = (SELECT MAX(income) 
				  FROM sales.customers);


-- (Exercício 4) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca

SELECT p.brand, 
	   COUNT(p.brand) AS "qtd"
FROM sales.products AS p
GROUP BY p.brand
ORDER BY p.brand;

-- (Exercício 5) Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo

SELECT p.brand, p.model_year,
	   COUNT(p.product_id) AS "qtd" 
FROM sales.products AS p
GROUP BY p.brand, 
		 p.model_year
ORDER BY p.brand, 
		 p.model_year;

-- (Exercício 6) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados

SELECT p.brand,
	   COUNT(p.product_id) AS "qtd"
FROM sales.products AS p
GROUP BY p.brand
HAVING COUNT(p.product_id) > 10
ORDER BY p.brand
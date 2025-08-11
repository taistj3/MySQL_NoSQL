---Crie uma consulta para cada consulta do exercício anterior que retorne o numero de registros encontrados pela busca.
CREATE VIEW filmes_e_categorias AS
SELECT f.title AS filme, c.name AS categoria
FROM
    film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
ORDER BY f.title;
SELECT * FROM filmes_e_categorias;
-----------------------------------------------------------------
CREATE VIEW atores_e_filmes AS
SELECT a.first_name AS nome, a.last_name AS sobrenome, f.film_id AS filme
FROM
    actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    JOIN film f ON fa.film_id = f.film_id
ORDER BY f.film_id DESC;
SELECT * FROM atores_e_filmes;
-----------------------------------------------------------------
CREATE VIEW atores_filmes_duracao AS
SELECT a.first_name AS nome,
    a.last_name AS sobrenome,
    COUNT(f.film_id) AS total_filmes
FROM
    actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    JOIN film f ON fa.film_id = f.film_id
WHERE
    f.length > 120
GROUP BY
    a. actor_id,
    a.first_name,
    a.last_name
ORDER BY total_filmes DESC;
SELECT * FROM atores_filmes_duracao;
-----------------------------------------------------------------
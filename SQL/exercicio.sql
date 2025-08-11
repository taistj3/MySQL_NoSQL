--- Faça uma consulta que retorne a lista de filmes e suas categorias correspondentes.
SELECT f.title AS filme, c.name AS categoria
FROM
    film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
ORDER BY f.title;
--- Faça uma consulta que retorne a lista de todos os atores com o número filmes que cada ator participou. Ordene a lista pelo numero de filmes, iniciando pelos atores que mais atuaram.
SELECT a.first_name AS nome, a.last_name AS sobrenome, f.film_id AS filme
FROM
    actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    JOIN film f ON fa.film_id = f.film_id
ORDER BY f.film_id DESC;
--- Faça uma consulta que retorne a lista de atores que atuaram em filmes com mais de duas horas de duração (120min). Ordene a lista pelo numero de filmes que cada ator participou.
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
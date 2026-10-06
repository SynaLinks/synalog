WITH t_2_B AS (SELECT * FROM VALUES
  (1, "Dune", "herbert", 1965, 412, true),
  (2, "Emma", "austen", 1815, 474, false),
  (3, "Ubik", "dick", 1969, 202, true),
  (4, "Kim", "kipling", 1901, 368, false),
  (5, "Solaris", "lem", 1961, 204, true),
  (6, "Persuasion", "austen", 1817, 249, false),
  (7, "Valis", "dick", 1981, 271, true)
AS UNUSED_TABLE_NAME(id, title, author, year, pages, sf)),
t_1_L AS (SELECT
  ARRAY_AGG(STRUCT(B.title AS title, B.year AS year)) AS l
FROM
  t_2_B AS B
WHERE
  (B.author = "dick"))
SELECT
  x_1.title AS title
FROM
  t_1_L AS t_0_L, LATERAL (SELECT explode(t_0_L.l) AS x_1) AS pushkin ORDER BY title NULLS LAST;
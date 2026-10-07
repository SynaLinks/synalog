WITH t_0_E AS (SELECT * FROM VALUES
  (1, "ann", 10, null),
  (2, "bob", 10, 1),
  (3, "cid", 20, 1),
  (4, "dee", null, 2),
  (5, "eve", 30, 3),
  (6, "fay", 20, null)
AS UNUSED_TABLE_NAME(id, name, dept, boss))
SELECT
  E.name AS name
FROM
  t_0_E AS E, LATERAL (SELECT explode(ARRAY(1, 2, 7)) AS x_3) AS pushkin
WHERE
  (E.id = x_3) ORDER BY name NULLS LAST;
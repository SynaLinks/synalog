WITH t_0_E AS (SELECT * FROM VALUES
  (1, 7),
  (2, 8)
AS UNUSED_TABLE_NAME(a, b)),
t_1_L AS (SELECT * FROM VALUES
  (7),
  (8)
AS UNUSED_TABLE_NAME(b))
SELECT
  x_4 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_4) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_E AS E, t_1_L AS L
  WHERE
    (E.a = x_4) AND
    (L.b = E.b)) IS NULL) ORDER BY x NULLS LAST;
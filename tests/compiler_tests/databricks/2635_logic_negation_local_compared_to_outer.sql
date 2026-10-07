WITH t_0_E AS (SELECT * FROM VALUES
  (1, 0),
  (2, 5)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  x_4 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_4) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_E AS E
  WHERE
    (E.b < x_4) AND
    (E.a = x_4)) IS NULL);
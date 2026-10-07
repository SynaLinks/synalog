WITH t_0_E AS (SELECT * FROM VALUES
  (1, 3),
  (2, 9)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  x_4 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_4) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_E AS E
  WHERE
    (E.b > 5) AND
    (E.a = x_4)) IS NULL) ORDER BY x NULLS LAST;
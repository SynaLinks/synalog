WITH t_1_X AS (SELECT * FROM VALUES
  (1),
  (2)
AS UNUSED_TABLE_NAME(x))
SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_X AS t_0_X
  WHERE
    (t_0_X.x = x_3)) IS NULL) ORDER BY x NULLS LAST;
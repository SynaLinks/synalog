WITH t_0_B AS (SELECT * FROM VALUES
  (2),
  (3)
AS UNUSED_TABLE_NAME(x))
SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_3) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_B AS B
  WHERE
    (B.x = x_3) AND
    (x_3 = 2)) IS NULL) ORDER BY x NULLS LAST;
WITH t_0_U AS (SELECT * FROM VALUES
  (1),
  (2)
AS UNUSED_TABLE_NAME(x))
SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_3) AS pushkin
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_U AS U
  WHERE
    (U.x = x_3)) IS NULL);
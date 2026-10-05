WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
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
WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      x_1 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2)) AS x_1) AS pushkin
   UNION ALL
  
    SELECT
      x_3 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(2, 3)) AS x_3) AS pushkin
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_U AS U;
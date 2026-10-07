WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      x_2 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1)) AS x_2) AS pushkin
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_U AS U;
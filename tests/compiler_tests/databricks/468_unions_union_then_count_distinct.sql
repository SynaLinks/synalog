WITH t_1_U AS (SELECT * FROM (
  
    SELECT
      x_4 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2)) AS x_4) AS pushkin
   UNION ALL
  
    SELECT
      x_6 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(2, 3)) AS x_6) AS pushkin
  
) AS UNUSED_TABLE_NAME  ),
t_0_D AS (SELECT
  U.x AS x
FROM
  t_1_U AS U
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;
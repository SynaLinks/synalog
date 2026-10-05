WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      null AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V, LATERAL (SELECT explode(ARRAY(1, 2)) AS x_2) AS pushkin
WHERE
  (V.x = x_2);
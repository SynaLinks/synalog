WITH t_0_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin
   UNION ALL
  
    SELECT
      x_5 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(2, 3)) AS x_5) AS pushkin
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U_MultBodyAggAux.x AS x
FROM
  t_0_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1 ORDER BY x NULLS LAST;
WITH t_0_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_5 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2, 3, 4)) AS x_5) AS pushkin
    WHERE
      (x_5 < 2)
   UNION ALL
  
    SELECT
      x_9 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2, 3, 4)) AS x_9) AS pushkin
    WHERE
      (x_9 > 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U_MultBodyAggAux.x AS x
FROM
  t_0_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1 ORDER BY x NULLS LAST;
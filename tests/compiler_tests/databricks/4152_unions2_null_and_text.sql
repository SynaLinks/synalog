WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS s
   UNION ALL
  
    SELECT
      x_6 AS k,
      CASE WHEN (x_6 = 2) THEN "b" ELSE "c" END AS s
    FROM
      LATERAL (SELECT explode(ARRAY(2, 3)) AS x_6) AS pushkin
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.k AS k,
  U.s AS s
FROM
  t_0_U AS U ORDER BY k NULLS LAST;
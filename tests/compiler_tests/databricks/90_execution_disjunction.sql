SELECT * FROM (
  
    SELECT
      1 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 3, 5)) AS x_3) AS pushkin
    WHERE
      (x_3 = 1)
   UNION ALL
  
    SELECT
      5 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 3, 5)) AS x_3) AS pushkin
    WHERE
      (x_3 = 5)
  
) AS UNUSED_TABLE_NAME  ORDER BY x NULLS LAST ;
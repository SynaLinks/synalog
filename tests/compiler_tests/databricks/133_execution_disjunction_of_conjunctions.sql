SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2, 3, 4)) AS x_3) AS pushkin
    WHERE
      (x_3 > 0) AND
      (x_3 < 2)
   UNION ALL
  
    SELECT
      4 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2, 3, 4)) AS x_3) AS pushkin
    WHERE
      (x_3 = 4)
  
) AS UNUSED_TABLE_NAME  ORDER BY x NULLS LAST ;
SELECT * FROM (
  
    SELECT
      1 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin
    WHERE
      (1 > 5) AND
      (x_3 = 1)
   UNION ALL
  
    SELECT
      1 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin
    WHERE
      (1 < 0) AND
      (x_3 = 1)
  
) AS UNUSED_TABLE_NAME  ;

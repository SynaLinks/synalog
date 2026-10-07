SELECT * FROM (
  
    SELECT
      3 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 3, 7)) AS x_3) AS pushkin
    WHERE
      (3 < 0) AND
      (x_3 = 3)
   UNION ALL
  
    SELECT
      3 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 3, 7)) AS x_3) AS pushkin
    WHERE
      (3 > 1) AND
      (x_3 = 3)
  
) AS UNUSED_TABLE_NAME  ;

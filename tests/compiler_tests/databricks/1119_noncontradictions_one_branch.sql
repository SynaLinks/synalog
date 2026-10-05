SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 5, 9)) AS x_3) AS pushkin
    WHERE
      (x_3 < 3) AND
      (x_3 != 1)
   UNION ALL
  
    SELECT
      x_3 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 5, 9)) AS x_3) AS pushkin
    WHERE
      (x_3 > 7) AND
      (x_3 != 1)
  
) AS UNUSED_TABLE_NAME  ;

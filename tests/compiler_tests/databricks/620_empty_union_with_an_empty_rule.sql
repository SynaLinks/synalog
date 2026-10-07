SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      x_1 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(2)) AS x_1) AS pushkin
    WHERE
      (x_1 > 5)
  
) AS UNUSED_TABLE_NAME  ;
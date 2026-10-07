SELECT * FROM (
  
    SELECT
      x_1 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1, 3)) AS x_1) AS pushkin
   UNION ALL
  
    SELECT
      x_1 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(2, 4)) AS x_1) AS pushkin
  
) AS UNUSED_TABLE_NAME  ORDER BY x NULLS LAST ;
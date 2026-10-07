SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(1)) AS x_3) AS pushkin
   UNION ALL
  
    SELECT
      x_3 AS x
    FROM
      LATERAL (SELECT explode(ARRAY(2)) AS x_3) AS pushkin
  
) AS UNUSED_TABLE_NAME  ORDER BY x NULLS LAST ;
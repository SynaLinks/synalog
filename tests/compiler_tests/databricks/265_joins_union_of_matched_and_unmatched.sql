SELECT * FROM (
  
    SELECT
      x_6 AS id,
      "a" AS v
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2)) AS x_6) AS pushkin
    WHERE
      (1 = x_6)
   UNION ALL
  
    SELECT
      x_3 AS id,
      "none" AS v
    FROM
      LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (x_3 = 1)) IS NULL)
  
) AS UNUSED_TABLE_NAME  ORDER BY id NULLS LAST ;
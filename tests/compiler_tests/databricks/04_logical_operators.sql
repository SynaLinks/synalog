SELECT * FROM (
  
    SELECT
      "and" AS test_name,
      x_5 AS x
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(10 AS BIGINT)), x -> x < 10)) AS x_5) AS pushkin
    WHERE
      ((x_5 > 2) AND (x_5 < 7))
   UNION ALL
  
    SELECT
      "complex" AS test_name,
      x_5 AS x
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(10 AS BIGINT)), x -> x < 10)) AS x_5) AS pushkin
    WHERE
      (((x_5 > 2) AND (x_5 < 4)) OR ((x_5 > 6) AND (x_5 < 9)))
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name NULLS LAST, x NULLS LAST ;
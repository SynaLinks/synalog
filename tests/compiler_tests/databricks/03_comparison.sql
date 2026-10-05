SELECT * FROM (
  
    SELECT
      "equal" AS test_name,
      5 AS x
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_5) AS pushkin
    WHERE
      (5 = x_5)
   UNION ALL
  
    SELECT
      "not_equal" AS test_name,
      x_5 AS x
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_5) AS pushkin
    WHERE
      (x_5 != 5)
   UNION ALL
  
    SELECT
      "less_than" AS test_name,
      x_5 AS x
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_5) AS pushkin
    WHERE
      (x_5 < 5)
   UNION ALL
  
    SELECT
      "in_range" AS test_name,
      x_5 AS x
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_5) AS pushkin
    WHERE
      (x_5 >= 3) AND
      (x_5 <= 7)
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name NULLS LAST, x NULLS LAST ;
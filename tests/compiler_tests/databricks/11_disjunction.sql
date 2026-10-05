WITH t_0_Classification AS (SELECT * FROM (
  
    SELECT
      x_8 AS col0,
      "small" AS col1
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_8) AS pushkin
    WHERE
      (x_8 < 3)
   UNION ALL
  
    SELECT
      x_13 AS col0,
      "medium" AS col1
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_13) AS pushkin
    WHERE
      (x_13 >= 3) AND
      (x_13 < 7)
   UNION ALL
  
    SELECT
      x_18 AS col0,
      "large" AS col1
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, 10), x -> x < 10)) AS x_18) AS pushkin
    WHERE
      (x_18 >= 7)
  
) AS UNUSED_TABLE_NAME  ORDER BY col0 NULLS LAST )
SELECT
  Classification.col0 AS col0,
  Classification.col1 AS col1
FROM
  t_0_Classification AS Classification ORDER BY col0 NULLS LAST;
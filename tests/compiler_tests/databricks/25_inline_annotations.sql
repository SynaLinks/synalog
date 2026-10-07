WITH t_0_P1 AS (SELECT
  (MOD(((x_2) * (17)), NULLIF(39, 0))) AS col0
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(10 AS BIGINT)), x -> x < 10)) AS x_2) AS pushkin ORDER BY col0 NULLS LAST),
t_0_P2 AS (SELECT
  x_5 AS col0
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(20 AS BIGINT)), x -> x < 20)) AS x_5) AS pushkin LIMIT 5),
t_0_P3 AS (SELECT
  x_5 AS col0
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(20 AS BIGINT)), x -> x < 20)) AS x_5) AS pushkin
WHERE
  ((MOD(x_5, NULLIF(2, 0))) = 0) ORDER BY col0 NULLS LAST LIMIT 3)
SELECT * FROM (
  
    SELECT
      "ordered" AS col0,
      P1.col0 AS col1
    FROM
      t_0_P1 AS P1
   UNION ALL
  
    SELECT
      "limited" AS col0,
      P2.col0 AS col1
    FROM
      t_0_P2 AS P2
   UNION ALL
  
    SELECT
      "both" AS col0,
      P3.col0 AS col1
    FROM
      t_0_P3 AS P3
  
) AS UNUSED_TABLE_NAME  ORDER BY col0 NULLS LAST, col1 NULLS LAST ;
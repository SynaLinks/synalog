WITH t_0_Sorted AS (SELECT
  x_5 AS col0
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 20), x -> x < 20)) AS x_5) AS pushkin
WHERE
  ((MOD(x_5, 2)) = 0) ORDER BY col0 NULLS LAST),
t_0_Top5 AS (SELECT
  x_5 AS col0
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 20), x -> x < 20)) AS x_5) AS pushkin ORDER BY col0 NULLS LAST LIMIT 5),
t_0_TopEven AS (SELECT
  x_5 AS col0
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 20), x -> x < 20)) AS x_5) AS pushkin
WHERE
  ((MOD(x_5, 2)) = 0) ORDER BY col0 NULLS LAST LIMIT 3)
SELECT * FROM (
  
    SELECT
      "sorted" AS col0,
      Sorted.col0 AS col1
    FROM
      t_0_Sorted AS Sorted
   UNION ALL
  
    SELECT
      "top5" AS col0,
      Top5.col0 AS col1
    FROM
      t_0_Top5 AS Top5
   UNION ALL
  
    SELECT
      "top_even" AS col0,
      TopEven.col0 AS col1
    FROM
      t_0_TopEven AS TopEven
  
) AS UNUSED_TABLE_NAME  ORDER BY col0 NULLS LAST, col1 NULLS LAST ;
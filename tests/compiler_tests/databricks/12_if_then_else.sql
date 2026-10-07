SELECT
  x_8 AS score,
  CASE WHEN (x_8 >= 12) THEN "A" WHEN (x_8 >= 9) THEN "B" WHEN (x_8 >= 6) THEN "C" WHEN (x_8 >= 3) THEN "D" ELSE "F" END AS letter
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(15 AS BIGINT)), x -> x < 15)) AS x_8) AS pushkin ORDER BY score NULLS LAST;
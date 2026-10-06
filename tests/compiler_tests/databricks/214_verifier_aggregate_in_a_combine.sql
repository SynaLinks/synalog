WITH t_0_Total AS (SELECT
  SUM(x_8) AS t
FROM
  LATERAL (SELECT explode(ARRAY(1, 3)) AS x_8) AS pushkin)
SELECT
  x_5 AS x,
  ((CAST(x_5 AS DOUBLE)) / NULLIF(CAST(Total.t AS DOUBLE), 0)) AS s
FROM
  t_0_Total AS Total, LATERAL (SELECT explode(ARRAY(1, 3)) AS x_5) AS pushkin ORDER BY x NULLS LAST;
WITH t_0_Numbers_Numbers AS (SELECT
  x_3 AS x
FROM
  LATERAL (SELECT explode(ARRAY(1, 2)) AS x_3) AS pushkin ORDER BY x NULLS LAST)
SELECT
  Numbers_Numbers.x AS x
FROM
  t_0_Numbers_Numbers AS Numbers_Numbers;
WITH t_1_Boosted AS (SELECT
  x_8 AS x,
  x_8 * 100 + 1 AS boosted
FROM
  LATERAL (SELECT explode(FILTER(SEQUENCE(0, 5), x -> x < 5)) AS x_8) AS pushkin ORDER BY x NULLS LAST)
SELECT
  t_0_Boosted.x AS x,
  t_0_Boosted.boosted AS boosted
FROM
  t_1_Boosted AS t_0_Boosted ORDER BY x NULLS LAST;
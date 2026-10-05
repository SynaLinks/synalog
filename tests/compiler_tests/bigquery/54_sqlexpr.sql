WITH t_1_Boosted AS (SELECT
  x_8 AS x,
  x_8 * 100 + 1 AS boosted
FROM
  UNNEST(GENERATE_ARRAY(0, 5 - 1)) as x_8 ORDER BY x NULLS LAST)
SELECT
  t_0_Boosted.x AS x,
  t_0_Boosted.boosted AS boosted
FROM
  t_1_Boosted AS t_0_Boosted ORDER BY x NULLS LAST;
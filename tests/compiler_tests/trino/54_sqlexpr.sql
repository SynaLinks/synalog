WITH t_1_Boosted AS (SELECT
  x_8 AS x,
  x_8 * 100 + 1 AS boosted
FROM
  UNNEST(TRANSFORM(FILTER(SEQUENCE(0, 5), x -> x < 5), synalog_e -> ROW(synalog_e))) as pushkin(x_8) ORDER BY x)
SELECT
  t_0_Boosted.x AS x,
  t_0_Boosted.boosted AS boosted
FROM
  t_1_Boosted AS t_0_Boosted ORDER BY x;
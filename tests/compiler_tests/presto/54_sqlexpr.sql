WITH t_0_Boosted AS (SELECT
  x_8 AS x,
  x_8 * 100 + 1 AS boosted
FROM
  UNNEST(SEQUENCE(0, 5 - 1)) as pushkin(x_8) ORDER BY x)
SELECT
  Boosted.x AS x,
  Boosted.boosted AS boosted
FROM
  t_0_Boosted AS Boosted ORDER BY x;
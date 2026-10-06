WITH t_0_Numbers_Numbers AS (SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x)
SELECT
  Numbers_Numbers.x AS x
FROM
  t_0_Numbers_Numbers AS Numbers_Numbers;
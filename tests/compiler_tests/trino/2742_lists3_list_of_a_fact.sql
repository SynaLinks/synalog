WITH t_1_T AS (SELECT
  SUM(x_4) AS t
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_4))
SELECT
  3 AS n,
  t_0_T.t AS t
FROM
  t_1_T AS t_0_T;
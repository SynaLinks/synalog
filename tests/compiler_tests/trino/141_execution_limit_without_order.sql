WITH t_0_Two AS (SELECT
  x_4 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_4) LIMIT 2)
SELECT
  SUM(1) AS n
FROM
  t_0_Two AS Two;
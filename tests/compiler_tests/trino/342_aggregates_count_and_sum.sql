SELECT
  SUM(1) AS n,
  SUM(x_2) AS t,
  MIN(x_2) AS lo,
  MAX(x_2) AS hi,
  AVG(x_2) AS a
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_2);
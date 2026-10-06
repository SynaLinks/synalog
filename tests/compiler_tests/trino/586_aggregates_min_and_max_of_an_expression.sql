SELECT
  MIN(x_2) AS lo,
  MAX(- ((x_2) * (-1))) AS hi
FROM
  UNNEST(TRANSFORM(ARRAY[-3, 1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_2);
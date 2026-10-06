SELECT
  MIN(x_2) AS lo,
  MAX(x_2) AS hi
FROM
  UNNEST(TRANSFORM(ARRAY[4, 1, 9, 7], synalog_e -> ROW(synalog_e))) as pushkin(x_2);
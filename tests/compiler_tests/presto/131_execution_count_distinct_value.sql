SELECT
  COUNT(DISTINCT x_2) AS n
FROM
  UNNEST(TRANSFORM(ARRAY[1, 1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_2);
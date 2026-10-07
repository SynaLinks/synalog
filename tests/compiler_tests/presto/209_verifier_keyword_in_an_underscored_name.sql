SELECT
  SUM(1) AS n
FROM
  UNNEST(TRANSFORM(ARRAY[1, 1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_2) ORDER BY n;
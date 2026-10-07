SELECT
  x_3 AS x,
  (x_3 > 2) AS big
FROM
  UNNEST(TRANSFORM(ARRAY[1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x;
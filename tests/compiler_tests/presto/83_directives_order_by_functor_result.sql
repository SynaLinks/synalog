SELECT
  x_3 AS c
FROM
  UNNEST(TRANSFORM(ARRAY[1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY c DESC;
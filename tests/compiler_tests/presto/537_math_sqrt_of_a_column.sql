SELECT
  x_3 AS x,
  SQRT(x_3) AS r
FROM
  UNNEST(TRANSFORM(ARRAY[4, 9], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x;
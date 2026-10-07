SELECT
  x_7 AS x,
  ((((2) * (x_7))) + (1)) AS y
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_7) ORDER BY x;
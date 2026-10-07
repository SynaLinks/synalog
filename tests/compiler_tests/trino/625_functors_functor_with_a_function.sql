SELECT
  ((x_8) * (x_8)) AS y
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_8) ORDER BY y;
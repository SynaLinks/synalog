SELECT
  ((2) * (((2) * (x_7)))) AS y
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_7) ORDER BY y;
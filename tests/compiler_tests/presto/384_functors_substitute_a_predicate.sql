SELECT
  ((2) * (x_2)) AS y
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_2) ORDER BY y;
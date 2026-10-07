SELECT
  x_7 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_7)
WHERE
  ((x_7 < 2) OR (x_7 > 3)) ORDER BY x;
SELECT
  x_6 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4, 5], synalog_e -> ROW(synalog_e))) as pushkin(x_6), UNNEST(TRANSFORM(ARRAY[3, 4, 5, 6, 7], synalog_e -> ROW(synalog_e))) as pushkin(x_8)
WHERE
  (x_8 = x_6) ORDER BY x;
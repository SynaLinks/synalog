SELECT
  x_2 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[5, 6], synalog_e -> ROW(synalog_e))) as pushkin(x_2), UNNEST(TRANSFORM(ARRAY[5, 6], synalog_e -> ROW(synalog_e))) as pushkin(x_4)
WHERE
  (x_4 = x_2) ORDER BY x;
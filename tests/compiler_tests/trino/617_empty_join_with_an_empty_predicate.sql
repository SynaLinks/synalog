SELECT
  x_4 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_4), UNNEST(TRANSFORM(ARRAY[1], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
WHERE
  (x_6 > 5) AND
  (x_6 = x_4) ORDER BY x;
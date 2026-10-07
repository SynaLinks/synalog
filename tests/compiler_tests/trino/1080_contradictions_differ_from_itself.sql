SELECT
  x_4 AS a
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_4), UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
WHERE
  (x_6 != x_4) AND
  (x_4 = x_6);
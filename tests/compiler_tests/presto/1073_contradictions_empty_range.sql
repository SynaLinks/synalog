SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 7, 12], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 > 10) AND
  (x_3 < 5);
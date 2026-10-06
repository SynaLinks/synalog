SELECT
  1 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (1 != 1.0E0) AND
  (x_3 = 1);
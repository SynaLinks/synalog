SELECT
  2 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 = 2) AND
  (2 = 2.0E0);
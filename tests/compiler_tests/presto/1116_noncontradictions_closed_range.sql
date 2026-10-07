SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[2, 3, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 >= 3) AND
  (x_3 <= 3);
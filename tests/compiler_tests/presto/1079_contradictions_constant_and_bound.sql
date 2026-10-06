SELECT
  2 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (2 > 3) AND
  (x_3 = 2);
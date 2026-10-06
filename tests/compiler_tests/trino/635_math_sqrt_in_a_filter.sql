SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[4, 16], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (SQRT(x_3) > 3);
SELECT
  x_1 AS n
FROM
  UNNEST(TRANSFORM(ARRAY[10, 9], synalog_e -> ROW(synalog_e))) as pushkin(x_1)
WHERE
  ((x_1 > 9) = true);
SELECT
  1 AS k
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 = 1) AND
  (1 = 2);
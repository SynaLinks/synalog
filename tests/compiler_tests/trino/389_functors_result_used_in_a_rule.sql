SELECT
  ((2) * (x_4)) AS y
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_4)
WHERE
  (((2) * (x_4)) > 4);
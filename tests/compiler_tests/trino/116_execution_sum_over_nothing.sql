SELECT
  SUM(x_2) AS t
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_2)
WHERE
  (x_2 > 10);
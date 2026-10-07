SELECT
  x_2 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[], synalog_e -> ROW(synalog_e))) as pushkin(x_2)
WHERE
  (1 = x_2);
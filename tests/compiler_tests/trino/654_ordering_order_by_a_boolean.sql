SELECT
  x_3 AS x,
  (x_3 > 3) AS big
FROM
  UNNEST(TRANSFORM(ARRAY[5, 1], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY big;
SELECT
  x_3 AS x,
  (POW(x_3, 2)) AS p
FROM
  UNNEST(TRANSFORM(ARRAY[2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x;
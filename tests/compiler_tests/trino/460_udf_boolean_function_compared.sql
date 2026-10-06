SELECT
  x_6 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
WHERE
  (true = ((MOD(x_6, NULLIF(2, 0))) = 0)) ORDER BY x;
SELECT
  x_7 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_7)
WHERE
  (((MOD(x_7, NULLIF(2, 0))) = 0) AND (x_7 > 2));
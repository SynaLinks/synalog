SELECT
  x_1 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, null, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_1)
WHERE
  (x_1 IS NOT null) ORDER BY x;
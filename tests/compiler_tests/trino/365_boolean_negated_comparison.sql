SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  NOT (x_3 > 2) ORDER BY x;
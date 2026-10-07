SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  NOT (CONTAINS(ARRAY[1, 1], x_3)) ORDER BY x;
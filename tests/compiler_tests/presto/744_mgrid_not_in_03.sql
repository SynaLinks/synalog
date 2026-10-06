SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[5, 6], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  NOT (CONTAINS(ARRAY[5, 6], x_3)) ORDER BY x;
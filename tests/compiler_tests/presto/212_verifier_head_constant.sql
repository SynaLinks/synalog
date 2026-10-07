SELECT
  x_1 AS x,
  'one' AS label
FROM
  UNNEST(TRANSFORM(ARRAY[1], synalog_e -> ROW(synalog_e))) as pushkin(x_1);
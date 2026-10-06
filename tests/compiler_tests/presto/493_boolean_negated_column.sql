SELECT
  x_6 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
WHERE
  NOT (x_6 > 2);
SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (((x_3) + (1)) > x_3) ORDER BY x;
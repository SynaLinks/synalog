SELECT
  x_6 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
WHERE
  (((x_6) * (x_6)) > 5) ORDER BY x;
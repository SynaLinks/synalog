SELECT
  x_3 AS x,
  CASE WHEN (x_3 = 1) THEN 'one' WHEN (x_3 = 2) THEN 'two' ELSE 'many' END AS w
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x;
SELECT
  x_6 AS x,
  CASE WHEN (x_6 > 2) THEN 'big' ELSE 'small' END AS w
FROM
  UNNEST(TRANSFORM(ARRAY[1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_6) ORDER BY x;
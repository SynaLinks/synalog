SELECT
  x_4 AS x,
  CASE WHEN (x_4 > 100) THEN 'large' WHEN (x_4 > 10) THEN 'medium' ELSE 'small' END AS size
FROM
  UNNEST(TRANSFORM(ARRAY[1, 50, 500], synalog_e -> ROW(synalog_e))) as pushkin(x_4) ORDER BY x;
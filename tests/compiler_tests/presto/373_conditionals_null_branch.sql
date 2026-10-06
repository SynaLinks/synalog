SELECT
  x_3 AS x,
  CASE WHEN (x_3 < 2) THEN 'small' ELSE null END AS w
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x;
SELECT
  x_3 AS x,
  CASE WHEN (x_3 > 0) THEN 1.5E0 ELSE 2 END AS y
FROM
  UNNEST(TRANSFORM(ARRAY[-1, 1], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x;
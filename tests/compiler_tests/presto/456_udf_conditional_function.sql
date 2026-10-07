SELECT
  x_7 AS x,
  CASE WHEN (x_7 > 0) THEN 1 WHEN (x_7 < 0) THEN -1 ELSE 0 END AS s
FROM
  UNNEST(TRANSFORM(ARRAY[-2, 0, 5], synalog_e -> ROW(synalog_e))) as pushkin(x_7) ORDER BY x;
SELECT
  CASE WHEN (x_7 < 0) THEN -1 ELSE 1 END AS s,
  x_7 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[5, -5], synalog_e -> ROW(synalog_e))) as pushkin(x_7) ORDER BY x;
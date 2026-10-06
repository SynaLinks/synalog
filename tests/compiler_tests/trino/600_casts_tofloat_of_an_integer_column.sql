SELECT
  x_3 AS x,
  (CAST(CAST(x_3 AS DOUBLE) AS DOUBLE) / NULLIF(2, 0)) AS h
FROM
  UNNEST(TRANSFORM(ARRAY[1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x;
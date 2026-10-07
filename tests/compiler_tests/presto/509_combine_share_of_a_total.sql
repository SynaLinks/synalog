SELECT
  x_4 AS x,
  (CAST(x_4 AS DOUBLE) / NULLIF((SELECT
  SUM(x_7) AS logica_value
FROM
  UNNEST(TRANSFORM(ARRAY[1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_7)), 0)) AS s
FROM
  UNNEST(TRANSFORM(ARRAY[1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_4) ORDER BY x;
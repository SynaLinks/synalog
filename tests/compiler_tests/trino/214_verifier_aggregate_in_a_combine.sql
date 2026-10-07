WITH t_0_Total AS (SELECT
  SUM(x_8) AS t
FROM
  UNNEST(TRANSFORM(ARRAY[1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_8))
SELECT
  x_5 AS x,
  (CAST(CAST(x_5 AS DOUBLE) AS DOUBLE) / NULLIF(CAST(Total.t AS DOUBLE), 0)) AS s
FROM
  t_0_Total AS Total, UNNEST(TRANSFORM(ARRAY[1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_5) ORDER BY x;
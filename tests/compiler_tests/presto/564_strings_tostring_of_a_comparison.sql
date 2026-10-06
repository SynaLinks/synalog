SELECT
  x_3 AS x,
  CAST((x_3 > 2) AS VARCHAR) AS t
FROM
  UNNEST(TRANSFORM(ARRAY[1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY x;
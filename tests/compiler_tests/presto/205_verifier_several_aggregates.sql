SELECT
  x_5 AS c,
  SUM(x_6) AS total,
  SUM(1) AS n,
  MAX(x_6) AS top,
  MIN(x_6) AS low
FROM
  UNNEST(TRANSFORM(ARRAY['a', 'b'], synalog_e -> ROW(synalog_e))) as pushkin(x_5), UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
GROUP BY 1 ORDER BY c;
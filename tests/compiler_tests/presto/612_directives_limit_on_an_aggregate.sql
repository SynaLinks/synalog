SELECT
  x_3 AS g,
  SUM(1) AS n
FROM
  UNNEST(TRANSFORM(ARRAY['a', 'a', 'b', 'c', 'c', 'c'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
GROUP BY 1 ORDER BY n desc LIMIT 2;
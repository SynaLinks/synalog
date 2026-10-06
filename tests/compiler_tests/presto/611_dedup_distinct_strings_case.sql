SELECT
  x_3 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['a', 'A', 'a'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
GROUP BY 1 ORDER BY s;
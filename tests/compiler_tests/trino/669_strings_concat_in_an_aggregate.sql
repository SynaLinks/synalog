SELECT
  x_3 AS s,
  MAX((CONCAT(x_3, '!'))) AS t
FROM
  UNNEST(TRANSFORM(ARRAY['b', 'a'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
GROUP BY 1 ORDER BY s;
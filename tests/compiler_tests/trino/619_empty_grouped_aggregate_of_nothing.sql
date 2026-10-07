SELECT
  x_5 AS g,
  SUM(x_6) AS t
FROM
  UNNEST(TRANSFORM(ARRAY['a'], synalog_e -> ROW(synalog_e))) as pushkin(x_5), UNNEST(TRANSFORM(ARRAY[1], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
WHERE
  (x_6 > 5)
GROUP BY 1 ORDER BY g;
SELECT
  x_3 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['b', 'a', 'c'], synalog_e -> ROW(synalog_e))) as pushkin(x_3) ORDER BY s DESC;
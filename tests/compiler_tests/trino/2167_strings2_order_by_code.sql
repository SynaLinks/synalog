SELECT
  x_1 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['b', 'B', 'a', 'A', '_', '1', 'é', 'ab', 'aB'], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY s;
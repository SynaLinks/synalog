SELECT
  SUM(1) AS n
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_3), UNNEST(TRANSFORM(ARRAY['a', 'b', 'c'], synalog_e -> ROW(synalog_e))) as pushkin(x_5);
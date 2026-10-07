SELECT
  COUNT(DISTINCT x_2) AS n
FROM
  UNNEST(TRANSFORM(ARRAY['x', 'y', 'x'], synalog_e -> ROW(synalog_e))) as pushkin(x_2);
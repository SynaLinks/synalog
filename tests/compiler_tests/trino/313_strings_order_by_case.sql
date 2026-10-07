SELECT
  x_1 AS w
FROM
  UNNEST(TRANSFORM(ARRAY['b', 'A', 'a', 'B'], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY w;
SELECT
  x_2 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['b', 'c'], synalog_e -> ROW(synalog_e))) as pushkin(x_2), UNNEST(TRANSFORM(ARRAY['a', 'b'], synalog_e -> ROW(synalog_e))) as pushkin(x_4)
WHERE
  (x_4 = x_2);
SELECT
  x_3 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['a', 'b', 'c'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 > 'a') AND
  (x_3 < 'c');
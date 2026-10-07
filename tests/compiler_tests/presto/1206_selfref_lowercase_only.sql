SELECT
  x_1 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['a', 'B', 'c'], synalog_e -> ROW(synalog_e))) as pushkin(x_1)
WHERE
  (x_1 = LOWER(x_1)) ORDER BY s;
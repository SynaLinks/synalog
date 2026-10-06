SELECT
  'a' AS s
FROM
  UNNEST(TRANSFORM(ARRAY['a', 'A'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 = 'a');
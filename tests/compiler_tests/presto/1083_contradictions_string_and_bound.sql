SELECT
  'a' AS s
FROM
  UNNEST(TRANSFORM(ARRAY['a', 'b'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  ('a' > 'b') AND
  (x_3 = 'a');
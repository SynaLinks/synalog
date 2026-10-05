SELECT
  'a' AS s
FROM
  UNNEST(ARRAY['a', 'b']) as pushkin(x_3)
WHERE
  ('a' > 'b') AND
  (x_3 = 'a');
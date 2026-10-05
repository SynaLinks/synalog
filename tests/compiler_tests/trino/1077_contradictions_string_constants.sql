SELECT
  'a' AS s
FROM
  UNNEST(ARRAY['a', 'b']) as pushkin(x_3)
WHERE
  (x_3 = 'a') AND
  ('a' = 'b');
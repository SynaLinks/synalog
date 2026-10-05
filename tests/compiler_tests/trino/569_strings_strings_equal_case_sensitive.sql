SELECT
  'a' AS s
FROM
  UNNEST(ARRAY['a', 'A']) as pushkin(x_3)
WHERE
  (x_3 = 'a');
SELECT
  x_2 AS s
FROM
  UNNEST(ARRAY['b', 'c']) as pushkin(x_2), UNNEST(ARRAY['a', 'b']) as pushkin(x_4)
WHERE
  (x_4 = x_2);
SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY['apple', 'banana']) as pushkin(x_1) ORDER BY s;
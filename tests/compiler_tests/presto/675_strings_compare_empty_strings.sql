SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY['a', '']) as pushkin(x_1) ORDER BY s;
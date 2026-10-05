SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY['apple', 'banana', 'blue', 'cab']) as pushkin(x_1) ORDER BY s;
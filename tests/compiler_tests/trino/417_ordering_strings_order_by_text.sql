SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY['9', '10']) as pushkin(x_1) ORDER BY s;
SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY['ant', 'zag', 'bee', 'bar']) as pushkin(x_1) ORDER BY s desc;
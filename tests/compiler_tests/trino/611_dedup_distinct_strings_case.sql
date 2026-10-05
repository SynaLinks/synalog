SELECT
  x_3 AS s
FROM
  UNNEST(ARRAY['a', 'A', 'a']) as pushkin(x_3)
GROUP BY 1 ORDER BY s;
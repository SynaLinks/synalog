SELECT
  x_3 AS g,
  SUM(1) AS n
FROM
  UNNEST(ARRAY['a', 'a', 'b', 'c']) as pushkin(x_3)
GROUP BY 1 ORDER BY g;
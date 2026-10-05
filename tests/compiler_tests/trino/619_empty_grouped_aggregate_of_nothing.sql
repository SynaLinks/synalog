SELECT
  x_5 AS g,
  SUM(x_6) AS t
FROM
  UNNEST(ARRAY['a']) as pushkin(x_5), UNNEST(ARRAY[1]) as pushkin(x_6)
WHERE
  (x_6 > 5)
GROUP BY 1 ORDER BY g;
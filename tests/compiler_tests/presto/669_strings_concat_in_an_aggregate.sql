SELECT
  x_3 AS s,
  MAX((CONCAT(x_3, '!'))) AS t
FROM
  UNNEST(ARRAY['b', 'a']) as pushkin(x_3)
GROUP BY 1 ORDER BY s;
SELECT
  x_5 AS c,
  SUM(x_6) AS total,
  SUM(1) AS n,
  MAX(x_6) AS top,
  MIN(x_6) AS low
FROM
  UNNEST(ARRAY['a', 'b']) as pushkin(x_5), UNNEST(ARRAY[1, 2]) as pushkin(x_6)
GROUP BY 1 ORDER BY c;
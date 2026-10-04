SELECT
  COUNT(DISTINCT x_2) AS n
FROM
  UNNEST(ARRAY['x', 'y', 'x']) as pushkin(x_2);
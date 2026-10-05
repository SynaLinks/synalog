SELECT
  x_7 AS n,
  (CONCAT(element_at(transform(filter(ARRAY[x_7], v -> v IS NOT NULL), v -> format('%s', v)), 1), CASE WHEN (x_7 = 1) THEN 'st' WHEN (x_7 = 2) THEN 'nd' ELSE 'th' END)) AS o
FROM
  UNNEST(ARRAY[1, 2, 4]) as pushkin(x_7) ORDER BY n;
SELECT
  x_11 AS x,
  ((x_11) * (2)) AS doubled
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5]) as pushkin(x_11)
WHERE
  (x_11 > 0) ORDER BY x;
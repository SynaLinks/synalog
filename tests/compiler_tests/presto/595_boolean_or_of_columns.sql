SELECT
  x_7 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4]) as pushkin(x_7)
WHERE
  ((x_7 < 2) OR (x_7 > 3)) ORDER BY x;
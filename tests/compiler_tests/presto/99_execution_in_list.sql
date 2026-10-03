SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4]) as pushkin(x_3)
WHERE
  (CONTAINS(ARRAY[2, 4], x_3)) ORDER BY x;
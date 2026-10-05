SELECT
  x_15 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5, 6, 7, 8]) as pushkin(x_15)
WHERE
  (x_15 != 6) AND
  (x_15 != 5) AND
  (x_15 != 4) AND
  (x_15 != 3) AND
  (x_15 != 2) AND
  (x_15 != 1) ORDER BY x;
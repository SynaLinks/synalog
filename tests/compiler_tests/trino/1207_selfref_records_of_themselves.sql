SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[0, 1, 2, 4]) as pushkin(x_3)
WHERE
  (x_3 = ((x_3) * (x_3))) ORDER BY x;

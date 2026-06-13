SELECT
  x_6 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5]) as x_6, UNNEST(ARRAY[3, 4, 5, 6, 7]) as x_8
WHERE
  (x_8 = x_6) ORDER BY x;
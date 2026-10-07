SELECT
  x_2 AS x
FROM
  UNNEST(ARRAY[4]) as x_2, UNNEST(ARRAY[1, 2, 3]) as x_4
WHERE
  (x_4 = x_2) ORDER BY x;
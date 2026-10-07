SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 10]) as x_3
WHERE
  ((x_3 > 1) AND ((x_3 < 4) OR (x_3 = 10))) ORDER BY x;
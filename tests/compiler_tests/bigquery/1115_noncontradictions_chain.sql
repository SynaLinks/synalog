SELECT
  x_7 AS a,
  x_9 AS b,
  x_11 AS c
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_11, UNNEST(ARRAY[1, 2, 3]) as x_7, UNNEST(ARRAY[1, 2, 3]) as x_9
WHERE
  (x_7 < x_9) AND
  (x_9 < x_11);
SELECT
  x_5 AS a
FROM
  UNNEST(ARRAY[1, 2]) as x_5, UNNEST(ARRAY[1, 2]) as x_7, UNNEST(ARRAY[1, 2]) as x_9
WHERE
  (x_5 < x_7) AND
  (x_7 < x_9) AND
  (x_9 < x_5);
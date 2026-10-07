SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  (x_3 < 1.5) AND
  (x_3 > 1.5);
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_3
WHERE
  (x_3 != 1) AND
  (x_3 != 2);
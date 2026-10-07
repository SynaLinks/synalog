SELECT
  1 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  (1 != 1.0) AND
  (x_3 = 1);
SELECT
  2.0 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  (x_3 = 2.0);
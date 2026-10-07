SELECT
  x_6 AS x
FROM
  UNNEST(ARRAY[1, 3]) as x_6
WHERE
  (true = (x_6 > 2));
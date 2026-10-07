SELECT
  1 AS k
FROM
  UNNEST(ARRAY[1, 2]) as x_3
WHERE
  (x_3 = 1) AND
  (1 = 2);
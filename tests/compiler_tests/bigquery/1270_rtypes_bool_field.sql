SELECT
  x_1 AS n
FROM
  UNNEST(ARRAY[10, 9]) as x_1
WHERE
  ((x_1 > 9) = true);
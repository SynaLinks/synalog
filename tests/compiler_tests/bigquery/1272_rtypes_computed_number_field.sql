SELECT
  ((2) * (x_1)) AS n
FROM
  UNNEST(ARRAY[100, 9, 10]) as x_1 ORDER BY n;
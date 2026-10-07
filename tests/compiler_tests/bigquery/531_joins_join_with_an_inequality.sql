SELECT
  x_5 AS a,
  x_7 AS b
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_5, UNNEST(ARRAY[1, 2, 3]) as x_7
WHERE
  (x_7 > x_5) ORDER BY a, b;
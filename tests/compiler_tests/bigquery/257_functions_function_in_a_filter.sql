SELECT
  x_6 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4]) as x_6
WHERE
  (((x_6) * (x_6)) > 5) ORDER BY x;
SELECT
  x_4 AS x
FROM
  UNNEST(ARRAY[1, 2]) as x_4, UNNEST(ARRAY[1]) as x_6
WHERE
  (x_6 > 5) AND
  (x_6 = x_4) ORDER BY x;
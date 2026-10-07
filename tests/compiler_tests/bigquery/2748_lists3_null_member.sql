SELECT
  x_1 AS x
FROM
  UNNEST(ARRAY[1, null, 3]) as x_1
WHERE
  (x_1 IS NOT null) ORDER BY x;
SELECT
  x_3 AS x,
  SQRT(x_3) AS r
FROM
  UNNEST(ARRAY[4, 9]) as pushkin(x_3) ORDER BY x;
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2]) as pushkin(x_3)
WHERE
  (((x_3) + (1)) > x_3) ORDER BY x;
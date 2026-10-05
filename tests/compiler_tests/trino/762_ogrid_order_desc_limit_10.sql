SELECT
  x_1 AS x
FROM
  UNNEST(ARRAY[5, 3, 9, 1, 7]) as pushkin(x_1) ORDER BY x desc LIMIT 10;
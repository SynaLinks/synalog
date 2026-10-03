SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as pushkin(x_3) ORDER BY x LIMIT 1;
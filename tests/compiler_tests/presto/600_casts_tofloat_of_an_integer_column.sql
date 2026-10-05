SELECT
  x_3 AS x,
  (CAST(CAST(x_3 AS DOUBLE) AS DOUBLE) / (2)) AS h
FROM
  UNNEST(ARRAY[1, 3]) as pushkin(x_3) ORDER BY x;
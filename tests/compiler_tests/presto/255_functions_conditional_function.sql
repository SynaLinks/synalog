SELECT
  SIGN(x_4) AS s,
  x_4 AS x
FROM
  UNNEST(ARRAY[5, -5]) as pushkin(x_4) ORDER BY x;
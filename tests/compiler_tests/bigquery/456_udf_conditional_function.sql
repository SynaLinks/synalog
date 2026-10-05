SELECT
  x_3 AS x,
  SIGN(x_3) AS s
FROM
  UNNEST(ARRAY[-2, 0, 5]) as x_3 ORDER BY x;
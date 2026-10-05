SELECT
  x_3 AS x,
  (MOD(x_3, 3)) AS r
FROM
  UNNEST(ARRAY[-7, 7]) as x_3 ORDER BY x;
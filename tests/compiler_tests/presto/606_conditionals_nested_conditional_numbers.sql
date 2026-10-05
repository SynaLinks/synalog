SELECT
  x_3 AS x,
  CASE WHEN (x_3 < 0) THEN 0 WHEN (x_3 > 10) THEN 10 ELSE x_3 END AS c
FROM
  UNNEST(ARRAY[-5, 5, 15]) as pushkin(x_3) ORDER BY x;
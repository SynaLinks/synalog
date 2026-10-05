SELECT
  CASE WHEN (x_7 < 0) THEN -1 ELSE 1 END AS s,
  x_7 AS x
FROM
  UNNEST(ARRAY[5, -5]) as pushkin(x_7) ORDER BY x;
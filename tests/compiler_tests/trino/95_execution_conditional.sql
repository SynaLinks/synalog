SELECT
  x_4 AS x,
  CASE WHEN (x_4 < 0) THEN 'neg' WHEN (x_4 = 0) THEN 'zero' ELSE 'pos' END AS s
FROM
  UNNEST(ARRAY[3, -2, 0]) as pushkin(x_4) ORDER BY x;
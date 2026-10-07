SELECT
  x_6 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4]) as x_6
WHERE
  (true = ((MOD(x_6, NULLIF(2, 0))) = 0)) ORDER BY x NULLS LAST;
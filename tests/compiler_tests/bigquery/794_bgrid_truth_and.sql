SELECT
  x_5 AS x,
  x_7 AS y
FROM
  UNNEST(ARRAY[0, 1]) as x_5, UNNEST(ARRAY[0, 1]) as x_7
WHERE
  ((x_5 = 1) AND (x_7 = 1)) ORDER BY x, y;
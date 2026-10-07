SELECT
  x_5 AS n,
  x_3 AS i
FROM
  UNNEST(ARRAY[1, 2]) as x_5, UNNEST(GENERATE_ARRAY(0, x_5 - 1)) as x_3 ORDER BY n, i;
SELECT
  x_4 AS x,
  ((x_4) / ((SELECT
  SUM(x_8) AS logica_value
FROM
  UNNEST(ARRAY[1, 3]) as x_8))) AS s
FROM
  UNNEST(ARRAY[1, 3]) as x_4 ORDER BY x;
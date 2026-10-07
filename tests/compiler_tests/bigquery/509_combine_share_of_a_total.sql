SELECT
  x_4 AS x,
  ((x_4) / NULLIF((SELECT
  SUM(x_7) AS logica_value
FROM
  UNNEST(ARRAY[1, 3]) as x_7), 0)) AS s
FROM
  UNNEST(ARRAY[1, 3]) as x_4 ORDER BY x NULLS LAST;
SELECT
  x_4 AS x,
  (CAST(x_4 AS DOUBLE) / ((SELECT
  SUM(x_7) AS logica_value
FROM
  UNNEST(ARRAY[1, 3]) as pushkin(x_7)))) AS s
FROM
  UNNEST(ARRAY[1, 3]) as pushkin(x_4) ORDER BY x;
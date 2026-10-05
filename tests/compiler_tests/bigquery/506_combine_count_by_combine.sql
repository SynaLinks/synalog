SELECT
  (SELECT
  SUM(1) AS logica_value
FROM
  UNNEST(ARRAY[5, 6, 7]) as x_5) AS n;
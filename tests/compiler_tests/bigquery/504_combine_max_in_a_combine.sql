SELECT
  (SELECT
  MAX(x_5) AS logica_value
FROM
  UNNEST(ARRAY[4, 9, 2]) as x_5) AS m;
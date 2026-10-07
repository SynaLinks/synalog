SELECT
  (SELECT
  SUM(x_5) AS logica_value
FROM
  UNNEST(ARRAY[1]) as x_5
WHERE
  (x_5 > 5)) AS t;
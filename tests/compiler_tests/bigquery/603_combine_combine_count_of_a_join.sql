SELECT
  (SELECT
  SUM(1) AS logica_value
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_6, UNNEST(ARRAY[2, 3, 4]) as x_8
WHERE
  (x_8 = x_6)) AS n;
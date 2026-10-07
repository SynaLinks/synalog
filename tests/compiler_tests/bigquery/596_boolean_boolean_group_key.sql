SELECT
  (x_2 > 3) AS big,
  SUM(1) AS n
FROM
  UNNEST(ARRAY[1, 2, 5]) as x_2
GROUP BY big ORDER BY big;
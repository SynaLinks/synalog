SELECT
  x_5 AS g,
  SUM(x_6) AS t
FROM
  UNNEST(ARRAY["a"]) as x_5, UNNEST(ARRAY[1]) as x_6
WHERE
  (x_6 > 5)
GROUP BY g ORDER BY g;
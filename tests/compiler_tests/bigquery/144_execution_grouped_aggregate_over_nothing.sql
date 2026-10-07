SELECT
  x_5 AS k,
  SUM(x_6) AS t
FROM
  UNNEST(ARRAY["a"]) as x_5, UNNEST(ARRAY[1, 2]) as x_6
WHERE
  (x_6 > 10)
GROUP BY k;
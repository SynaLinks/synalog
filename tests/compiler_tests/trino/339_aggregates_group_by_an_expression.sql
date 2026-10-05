SELECT
  (MOD(x_2, 2)) AS k,
  SUM(1) AS n
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5]) as pushkin(x_2)
GROUP BY 1 ORDER BY k;
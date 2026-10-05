SELECT
  CASE WHEN (x_6 > 5) THEN 'big' ELSE 'small' END AS s,
  SUM(1) AS n
FROM
  UNNEST(ARRAY[1, 7, 9]) as pushkin(x_6)
GROUP BY 1 ORDER BY s;
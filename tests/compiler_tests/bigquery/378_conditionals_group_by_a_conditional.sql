SELECT
  CASE WHEN (x_2 > 5) THEN "big" ELSE "small" END AS size,
  SUM(1) AS n
FROM
  UNNEST(ARRAY[1, 2, 3, 10, 20]) as x_2
GROUP BY size ORDER BY size;
SELECT
  x_7 AS n,
  (CAST(x_7 AS STRING) || CASE WHEN (x_7 = 1) THEN "st" WHEN (x_7 = 2) THEN "nd" ELSE "th" END) AS o
FROM
  UNNEST(ARRAY[1, 2, 4]) as x_7 ORDER BY n;
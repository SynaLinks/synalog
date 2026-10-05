SELECT
  x_7 AS n,
  (CONCAT(CAST(x_7 AS VARCHAR), CASE WHEN (x_7 = 1) THEN 'st' WHEN (x_7 = 2) THEN 'nd' ELSE 'th' END)) AS o
FROM
  UNNEST(ARRAY[1, 2, 4]) as pushkin(x_7) ORDER BY n;
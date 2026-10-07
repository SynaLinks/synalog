SELECT
  x_3 AS x,
  CASE WHEN (x_3 = 1) THEN "one" WHEN (x_3 = 2) THEN "two" ELSE "many" END AS w
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_3 ORDER BY x;
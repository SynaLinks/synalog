SELECT
  x_6 AS x,
  CASE WHEN (x_6 > 2) THEN "big" ELSE "small" END AS w
FROM
  UNNEST(ARRAY[1, 3]) as x_6 ORDER BY x;
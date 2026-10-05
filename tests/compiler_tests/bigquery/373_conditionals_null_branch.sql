SELECT
  x_3 AS x,
  CASE WHEN (x_3 < 2) THEN "small" ELSE null END AS w
FROM
  UNNEST(ARRAY[1, 2]) as x_3 ORDER BY x;
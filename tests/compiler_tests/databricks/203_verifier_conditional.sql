SELECT
  x_4 AS x,
  CASE WHEN (x_4 > 100) THEN "large" WHEN (x_4 > 10) THEN "medium" ELSE "small" END AS size
FROM
  explode(ARRAY(1, 50, 500)) AS pushkin(x_4) ORDER BY x;
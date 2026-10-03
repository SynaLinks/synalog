SELECT
  x_4 AS x,
  CASE WHEN (x_4 < 0) THEN - x_4 ELSE x_4 END AS a
FROM
  explode(ARRAY(2, -3)) AS pushkin(x_4) ORDER BY x;
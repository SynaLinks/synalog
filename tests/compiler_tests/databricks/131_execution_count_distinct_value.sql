SELECT
  APPROX_COUNT_DISTINCT(x_2) AS n
FROM
  explode(ARRAY(1, 1, 2)) AS pushkin(x_2);
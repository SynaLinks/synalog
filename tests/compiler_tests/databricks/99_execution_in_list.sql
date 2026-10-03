SELECT
  x_3 AS x
FROM
  explode(ARRAY(1, 2, 3, 4)) AS pushkin(x_3)
WHERE
  (ARRAY_CONTAINS(ARRAY(2, 4), x_3)) ORDER BY x;
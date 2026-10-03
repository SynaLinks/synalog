SELECT
  x_1 AS x
FROM
  explode(SEQUENCE(0, 3 - 1)) AS pushkin(x_1) ORDER BY x;
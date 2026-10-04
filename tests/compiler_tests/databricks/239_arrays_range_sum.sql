SELECT
  SUM(x_0) AS t
FROM
  explode(SEQUENCE(0, 5 - 1)) AS pushkin(x_0);
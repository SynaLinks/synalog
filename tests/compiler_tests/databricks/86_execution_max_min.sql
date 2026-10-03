SELECT
  MIN(x_2) AS lo,
  MAX(x_2) AS hi
FROM
  explode(ARRAY(4, 1, 9, 7)) AS pushkin(x_2);
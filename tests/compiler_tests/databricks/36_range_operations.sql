SELECT
  x_7 AS x,
  ((x_7) * (x_7)) AS squared
FROM
  explode(GENERATE_ARRAY(0, 5 - 1)) AS pushkin(x_7)
WHERE
  (x_7 > 1) ORDER BY x;
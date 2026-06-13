SELECT
  x_11 AS x,
  ((x_11) * (x_11)) AS sq
FROM
  explode(SEQUENCE(0, 5 - 1)) AS pushkin(x_11) ORDER BY x;
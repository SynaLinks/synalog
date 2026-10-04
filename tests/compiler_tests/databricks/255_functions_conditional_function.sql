SELECT
  SIGN(x_4) AS s,
  x_4 AS x
FROM
  explode(ARRAY(5, -5)) AS pushkin(x_4) ORDER BY x;
SELECT
  x_1 AS x
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_1) ORDER BY x desc;
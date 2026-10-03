WITH t_0_Numbers_Numbers AS (SELECT
  x_3 AS x
FROM
  explode(ARRAY(1, 2)) AS pushkin(x_3) ORDER BY x)
SELECT
  Numbers_Numbers.x AS x
FROM
  t_0_Numbers_Numbers AS Numbers_Numbers;
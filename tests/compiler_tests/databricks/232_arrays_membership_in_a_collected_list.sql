WITH t_0_L AS (SELECT
  ARRAY_AGG(x_8) AS l
FROM
  explode(ARRAY(1, 3)) AS pushkin(x_8))
SELECT
  x_3 AS x
FROM
  t_0_L AS L, explode(L.l) AS pushkin(x_3), explode(ARRAY(1, 2, 3)) AS pushkin(x_5)
WHERE
  (x_5 = x_3) ORDER BY x;
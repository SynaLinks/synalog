WITH t_0_L AS (SELECT
  ARRAY_AGG(x_3) AS l
FROM
  explode(ARRAY(1, 1, 2)) AS pushkin(x_3))
SELECT
  SIZE(L.l) AS n
FROM
  t_0_L AS L;
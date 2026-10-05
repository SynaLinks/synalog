WITH t_0_C AS (SELECT
  x_4 AS g,
  SUM(1) AS n
FROM
  UNNEST(ARRAY['a', 'a', 'a', 'b', 'c', 'c']) as pushkin(x_4)
GROUP BY 1)
SELECT
  MAX(C.n) AS m
FROM
  t_0_C AS C;
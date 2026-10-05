WITH t_0_D AS (SELECT
  x_4 AS s
FROM
  UNNEST(ARRAY['a', 'a ']) as pushkin(x_4)
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;
WITH t_0_D AS (SELECT
  x_4 AS s
FROM
  UNNEST(ARRAY["a", "a "]) as x_4
GROUP BY s)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;
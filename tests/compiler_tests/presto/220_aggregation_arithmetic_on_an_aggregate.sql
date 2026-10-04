WITH t_0_T AS (SELECT
  SUM(x_4) AS t
FROM
  UNNEST(ARRAY[1, 2, 3]) as pushkin(x_4))
SELECT
  ((T.t) * (2)) AS d
FROM
  t_0_T AS T;
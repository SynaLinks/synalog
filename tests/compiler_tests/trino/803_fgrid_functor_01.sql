WITH t_0_T0 AS (SELECT
  SUM(x_4) AS t
FROM
  UNNEST(ARRAY[1, 2, 3]) as pushkin(x_4))
SELECT
  T0.t AS t
FROM
  t_0_T0 AS T0;
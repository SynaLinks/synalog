WITH t_0_T0 AS (SELECT
  MAX(x_4) AS t
FROM
  UNNEST(ARRAY[4, 5]) as pushkin(x_4))
SELECT
  T0.t AS t
FROM
  t_0_T0 AS T0;
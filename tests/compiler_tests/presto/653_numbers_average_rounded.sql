WITH t_1_A AS (SELECT
  AVG(x_3) AS a
FROM
  UNNEST(ARRAY[1, 2, 4]) as pushkin(x_3))
SELECT
  ROUND(t_0_A.a, 2) AS r
FROM
  t_1_A AS t_0_A;
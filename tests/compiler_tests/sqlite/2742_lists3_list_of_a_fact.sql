WITH t_1_T AS (SELECT
  SUM(x_4.value) AS t
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_4)
SELECT
  3 AS n,
  t_0_T.t AS t
FROM
  t_1_T AS t_0_T;
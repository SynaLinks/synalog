WITH t_0_T AS (SELECT
  SUM(x_4.value) AS t
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_4)
SELECT
  ((T.t) * (2)) AS d
FROM
  t_0_T AS T;
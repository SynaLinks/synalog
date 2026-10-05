WITH t_1_A AS (SELECT
  AVG(x_3.value) AS a
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 4)) as x_3)
SELECT
  ROUND(t_0_A.a, 2) AS r
FROM
  t_1_A AS t_0_A;
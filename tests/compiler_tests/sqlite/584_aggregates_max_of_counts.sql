WITH t_0_C AS (SELECT
  x_4.value AS g,
  SUM(1) AS n
FROM
  JSON_EACH(JSON_ARRAY('a', 'a', 'a', 'b', 'c', 'c')) as x_4
GROUP BY x_4.value)
SELECT
  MAX(C.n) AS m
FROM
  t_0_C AS C;
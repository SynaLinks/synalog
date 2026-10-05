WITH t_0_D AS (SELECT
  x_4.value AS s
FROM
  JSON_EACH(JSON_ARRAY('a', 'a ')) as x_4
GROUP BY x_4.value)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;
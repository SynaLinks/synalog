SELECT
  SUM(1) AS n,
  SUM(x_2.value) AS t,
  MIN(x_2.value) AS lo,
  MAX(x_2.value) AS hi,
  AVG(x_2.value) AS a
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_2;
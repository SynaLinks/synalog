SELECT
  SUM(x_2.value) AS t
FROM
  JSON_EACH(JSON_ARRAY(0.1, 0.2, 0.3)) as x_2;
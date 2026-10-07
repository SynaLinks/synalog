SELECT
  x_3.value AS x,
  (x_3.value > 3) AS big
FROM
  JSON_EACH(JSON_ARRAY(5, 1)) as x_3 ORDER BY big;
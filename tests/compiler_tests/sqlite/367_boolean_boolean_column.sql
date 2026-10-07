SELECT
  x_3.value AS x,
  (x_3.value > 2) AS big
FROM
  JSON_EACH(JSON_ARRAY(1, 3)) as x_3 ORDER BY x;
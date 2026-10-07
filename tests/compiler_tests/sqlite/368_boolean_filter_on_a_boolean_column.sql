SELECT
  x_6.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 3)) as x_6
WHERE
  (true = (x_6.value > 2));
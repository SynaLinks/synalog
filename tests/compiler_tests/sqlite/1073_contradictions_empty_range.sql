SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 7, 12)) as x_3
WHERE
  (x_3.value > 10) AND
  (x_3.value < 5);
SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(2, 3, 4)) as x_3
WHERE
  (x_3.value >= 3) AND
  (x_3.value <= 3);
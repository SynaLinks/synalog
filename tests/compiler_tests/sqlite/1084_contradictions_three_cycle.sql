SELECT
  x_5.value AS a
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_5, JSON_EACH(JSON_ARRAY(1, 2)) as x_7, JSON_EACH(JSON_ARRAY(1, 2)) as x_9
WHERE
  (x_5.value < x_7.value) AND
  (x_7.value < x_9.value) AND
  (x_9.value < x_5.value);
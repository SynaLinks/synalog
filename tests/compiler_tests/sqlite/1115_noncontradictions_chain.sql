SELECT
  x_7.value AS a,
  x_9.value AS b,
  x_11.value AS c
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_11, JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_7, JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_9
WHERE
  (x_7.value < x_9.value) AND
  (x_9.value < x_11.value);
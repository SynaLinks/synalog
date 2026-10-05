SELECT
  x_4.value AS a
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_4, JSON_EACH(JSON_ARRAY(1, 2)) as x_6
WHERE
  (x_6.value != x_4.value) AND
  (x_4.value = x_6.value);
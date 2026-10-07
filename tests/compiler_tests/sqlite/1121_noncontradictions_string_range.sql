SELECT
  x_3.value AS s
FROM
  JSON_EACH(JSON_ARRAY('a', 'b', 'c')) as x_3
WHERE
  (x_3.value > 'a') AND
  (x_3.value < 'c');
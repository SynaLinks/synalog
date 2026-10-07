SELECT
  x_2.value AS s
FROM
  JSON_EACH(JSON_ARRAY('b', 'c')) as x_2, JSON_EACH(JSON_ARRAY('a', 'b')) as x_4
WHERE
  (x_4.value = x_2.value);
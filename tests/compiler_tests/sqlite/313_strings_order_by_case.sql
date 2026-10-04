SELECT
  x_1.value AS w
FROM
  JSON_EACH(JSON_ARRAY('b', 'A', 'a', 'B')) as x_1 ORDER BY w;
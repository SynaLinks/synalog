SELECT
  x_3.value AS s
FROM
  JSON_EACH(JSON_ARRAY('b', 'a', 'c')) as x_3 ORDER BY s DESC;
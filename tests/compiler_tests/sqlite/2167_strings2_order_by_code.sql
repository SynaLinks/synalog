SELECT
  x_1.value AS s
FROM
  JSON_EACH(JSON_ARRAY('b', 'B', 'a', 'A', '_', '1', 'é', 'ab', 'aB')) as x_1 ORDER BY s;
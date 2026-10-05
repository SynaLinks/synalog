SELECT
  x_1.value AS s
FROM
  JSON_EACH(JSON_ARRAY('9', '10')) as x_1 ORDER BY s;
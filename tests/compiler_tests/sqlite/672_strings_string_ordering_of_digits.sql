SELECT
  x_1.value AS s
FROM
  JSON_EACH(JSON_ARRAY('2', '10', '1')) as x_1 ORDER BY s;
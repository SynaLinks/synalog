SELECT
  x_1.value AS s
FROM
  JSON_EACH(JSON_ARRAY('apple', 'banana', 'blue', 'cab')) as x_1 ORDER BY s;
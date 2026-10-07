SELECT
  x_1.value AS s
FROM
  JSON_EACH(JSON_ARRAY('''; DROP TABLE t; --', 'other')) as x_1
WHERE
  (x_1.value != 'other');
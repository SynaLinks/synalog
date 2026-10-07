SELECT
  x_1.value AS s
FROM
  JSON_EACH(JSON_ARRAY('{x}; DROP', 'other')) as x_1
WHERE
  (x_1.value != 'other');
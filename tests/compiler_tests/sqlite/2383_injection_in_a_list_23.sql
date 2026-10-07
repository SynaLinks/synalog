SELECT
  x_1.value AS s
FROM
  JSON_EACH(JSON_ARRAY('0x27 OR 1', 'other')) as x_1
WHERE
  (x_1.value != 'other');
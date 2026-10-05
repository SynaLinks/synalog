SELECT
  x_1.value AS s
FROM
  JSON_EACH(JSON_ARRAY('a', 'B', 'c')) as x_1
WHERE
  (x_1.value = LOWER(x_1.value)) ORDER BY s;
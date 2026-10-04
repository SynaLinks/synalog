SELECT
  x_3.value AS w
FROM
  JSON_EACH(JSON_ARRAY('abc', 'ABC')) as x_3
WHERE
  (x_3.value LIKE 'abc') ORDER BY w;
SELECT
  x_3.value AS s
FROM
  JSON_EACH(JSON_ARRAY('abc', 'abcd')) as x_3
WHERE
  (x_3.value LIKE 'abc');
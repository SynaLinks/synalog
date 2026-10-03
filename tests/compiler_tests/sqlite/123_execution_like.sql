SELECT
  x_3.value AS w
FROM
  JSON_EACH(JSON_ARRAY('apple', 'banana', 'apricot')) as x_3
WHERE
  (x_3.value LIKE 'ap%') ORDER BY w;
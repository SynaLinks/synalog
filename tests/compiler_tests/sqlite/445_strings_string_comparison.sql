SELECT
  x_3.value AS w
FROM
  JSON_EACH(JSON_ARRAY('apple', 'pear')) as x_3
WHERE
  (x_3.value < 'banana');
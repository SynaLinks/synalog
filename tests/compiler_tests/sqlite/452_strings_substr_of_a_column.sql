SELECT
  SUBSTR(x_2.value, 1, 2) AS p
FROM
  JSON_EACH(JSON_ARRAY('apple', 'pear')) as x_2 ORDER BY p;
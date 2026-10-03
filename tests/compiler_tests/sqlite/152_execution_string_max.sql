SELECT
  MAX(x_2.value) AS n
FROM
  JSON_EACH(JSON_ARRAY('apple', 'pear', 'fig')) as x_2;
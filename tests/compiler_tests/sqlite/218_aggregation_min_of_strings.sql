SELECT
  MIN(x_2.value) AS m
FROM
  JSON_EACH(JSON_ARRAY('pear', 'apple', 'fig')) as x_2;
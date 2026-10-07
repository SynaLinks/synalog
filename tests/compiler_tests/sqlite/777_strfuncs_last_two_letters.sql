SELECT
  x_3.value AS w,
  SUBSTR(x_3.value, ((LENGTH(x_3.value)) - (1)), 2) AS l
FROM
  JSON_EACH(JSON_ARRAY('Apple', 'kiwi', 'Banana')) as x_3 ORDER BY w;
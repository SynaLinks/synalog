SELECT
  x_3.value AS w,
  SUBSTR(x_3.value, 1, 1) AS f
FROM
  JSON_EACH(JSON_ARRAY('Apple', 'kiwi', 'Banana')) as x_3 ORDER BY w;
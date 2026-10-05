SELECT
  x_3.value AS w,
  LOWER(x_3.value) AS u
FROM
  JSON_EACH(JSON_ARRAY('Apple', 'kiwi', 'Banana')) as x_3 ORDER BY w;
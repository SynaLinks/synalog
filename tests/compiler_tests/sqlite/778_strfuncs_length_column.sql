SELECT
  x_3.value AS w,
  LENGTH(x_3.value) AS n
FROM
  JSON_EACH(JSON_ARRAY('Apple', 'kiwi', 'Banana')) as x_3 ORDER BY w;
SELECT
  x_3.value AS w
FROM
  JSON_EACH(JSON_ARRAY('Apple', 'kiwi', 'Banana')) as x_3
WHERE
  (x_3.value LIKE '%na' ESCAPE '\');

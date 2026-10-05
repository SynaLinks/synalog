SELECT
  x_3.value AS w
FROM
  JSON_EACH(JSON_ARRAY('cat', 'cart', 'scat', 'Cat', 'ct', 'c_t')) as x_3
WHERE
  (x_3.value LIKE '%a%') ORDER BY w;
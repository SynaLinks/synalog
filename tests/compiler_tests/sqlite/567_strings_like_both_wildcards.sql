SELECT
  x_3.value AS w
FROM
  JSON_EACH(JSON_ARRAY('cake', 'bakery', 'cookie')) as x_3
WHERE
  (x_3.value LIKE '%a_e%' ESCAPE '\') ORDER BY w NULLS LAST;

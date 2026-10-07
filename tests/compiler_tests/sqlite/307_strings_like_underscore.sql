SELECT
  x_3.value AS w
FROM
  JSON_EACH(JSON_ARRAY('abc', 'abbc', 'ac')) as x_3
WHERE
  (x_3.value LIKE 'a_c' ESCAPE '\') ORDER BY w NULLS LAST;

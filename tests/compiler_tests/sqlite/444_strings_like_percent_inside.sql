SELECT
  x_3.value AS w
FROM
  JSON_EACH(JSON_ARRAY('abc', 'axyzc', 'abd')) as x_3
WHERE
  (x_3.value LIKE 'a%c' ESCAPE '\') ORDER BY w NULLS LAST;

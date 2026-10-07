SELECT
  'a' AS s
FROM
  JSON_EACH(JSON_ARRAY('a', 'A')) as x_3
WHERE
  (x_3.value = 'a');
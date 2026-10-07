SELECT
  'a' AS s
FROM
  JSON_EACH(JSON_ARRAY('a', 'b')) as x_3
WHERE
  ('a' > 'b') AND
  (x_3.value = 'a');
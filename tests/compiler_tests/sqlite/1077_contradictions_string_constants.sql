SELECT
  'a' AS s
FROM
  JSON_EACH(JSON_ARRAY('a', 'b')) as x_3
WHERE
  (x_3.value = 'a') AND
  ('a' = 'b');
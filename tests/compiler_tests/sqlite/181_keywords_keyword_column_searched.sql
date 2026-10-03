SELECT
  x_1.value AS "group"
FROM
  JSON_EACH(JSON_ARRAY('a', 'b')) as x_1 ORDER BY "group";
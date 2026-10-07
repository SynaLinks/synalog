SELECT
  UPPER(x_4.value) AS u
FROM
  JSON_EACH(JSON_ARRAY('a', 'b')) as x_4 ORDER BY u;
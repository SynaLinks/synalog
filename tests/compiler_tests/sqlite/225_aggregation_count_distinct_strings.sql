SELECT
  COUNT(DISTINCT x_2.value) AS n
FROM
  JSON_EACH(JSON_ARRAY('x', 'y', 'x')) as x_2;
SELECT
  SUM(1) AS n
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3, JSON_EACH(JSON_ARRAY('a', 'b', 'c')) as x_5;
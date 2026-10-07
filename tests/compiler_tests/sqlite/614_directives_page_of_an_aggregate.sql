SELECT
  x_3.value AS g,
  SUM(1) AS n
FROM
  JSON_EACH(JSON_ARRAY('a', 'a', 'b', 'c')) as x_3
GROUP BY x_3.value ORDER BY g;
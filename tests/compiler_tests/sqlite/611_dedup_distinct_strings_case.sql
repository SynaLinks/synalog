SELECT
  x_3.value AS s
FROM
  JSON_EACH(JSON_ARRAY('a', 'A', 'a')) as x_3
GROUP BY x_3.value ORDER BY s;
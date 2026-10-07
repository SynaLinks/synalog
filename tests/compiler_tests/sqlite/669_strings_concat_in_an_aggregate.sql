SELECT
  x_3.value AS s,
  MAX(((x_3.value) || ('!'))) AS t
FROM
  JSON_EACH(JSON_ARRAY('b', 'a')) as x_3
GROUP BY x_3.value ORDER BY s;
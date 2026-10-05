SELECT
  x_5.value AS g,
  SUM(x_6.value) AS t
FROM
  JSON_EACH(JSON_ARRAY('a')) as x_5, JSON_EACH(JSON_ARRAY(1)) as x_6
WHERE
  (x_6.value > 5)
GROUP BY x_5.value ORDER BY g;
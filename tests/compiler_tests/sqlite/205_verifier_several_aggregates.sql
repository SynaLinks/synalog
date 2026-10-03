SELECT
  x_5.value AS c,
  SUM(x_6.value) AS total,
  SUM(1) AS n,
  MAX(x_6.value) AS top,
  MIN(x_6.value) AS low
FROM
  JSON_EACH(JSON_ARRAY('a', 'b')) as x_5, JSON_EACH(JSON_ARRAY(1, 2)) as x_6
GROUP BY x_5.value ORDER BY c;
SELECT
  x_3.value AS t,
  JSON_ARRAY_LENGTH(SPLIT(x_3.value, ',')) AS n
FROM
  JSON_EACH(JSON_ARRAY('a,b', 'c')) as x_3 ORDER BY t;
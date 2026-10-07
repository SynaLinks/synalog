SELECT
  x_1.value AS p
FROM
  JSON_EACH(SPLIT('c,a,b', ',')) as x_1 ORDER BY p;
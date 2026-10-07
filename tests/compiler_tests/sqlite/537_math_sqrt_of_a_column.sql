SELECT
  x_3.value AS x,
  SQRT(x_3.value) AS r
FROM
  JSON_EACH(JSON_ARRAY(4, 9)) as x_3 ORDER BY x;
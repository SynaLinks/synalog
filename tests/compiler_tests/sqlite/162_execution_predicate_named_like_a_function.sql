SELECT
  x_7.value AS x,
  ABS(x_7.value) AS y,
  100 AS z
FROM
  JSON_EACH(JSON_ARRAY(2, -3)) as x_11, JSON_EACH(JSON_ARRAY(2, -3)) as x_7
WHERE
  (x_7.value = x_11.value) ORDER BY x;
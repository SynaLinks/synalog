SELECT
  x_15.value AS x,
  ((x_15.value) * (2)) AS doubled,
  ((x_15.value) * (x_15.value)) AS squared
FROM
  JSON_EACH(JSON_ARRAY(2, 3, 4)) as x_15 ORDER BY x;
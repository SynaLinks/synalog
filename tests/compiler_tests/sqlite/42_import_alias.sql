SELECT
  x_15.value AS x,
  ((x_15.value) * (2)) AS doubled,
  ((x_15.value) * (x_15.value)) AS squared
FROM
  JSON_EACH(JSON_ARRAY(5, 6, 7)) as x_15 ORDER BY x;
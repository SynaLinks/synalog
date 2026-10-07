SELECT
  x_7.value AS x,
  ((x_7.value) + (1)) AS y
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_7 ORDER BY x;
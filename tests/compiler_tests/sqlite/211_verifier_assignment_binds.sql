SELECT
  x_2.value AS x,
  ((x_2.value) * (2)) AS y
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_2 ORDER BY x;
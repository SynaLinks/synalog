SELECT
  ((x_8.value) * (x_8.value)) AS y
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_8 ORDER BY y;
SELECT
  x_1.value AS x,
  - x_1.value AS y
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_1 ORDER BY y;
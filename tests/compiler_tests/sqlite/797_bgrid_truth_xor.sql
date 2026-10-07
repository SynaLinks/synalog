SELECT
  x_5.value AS x,
  x_7.value AS y
FROM
  JSON_EACH(JSON_ARRAY(0, 1)) as x_5, JSON_EACH(JSON_ARRAY(0, 1)) as x_7
WHERE
  ((x_5.value = 1) != (x_7.value = 1)) ORDER BY x, y;
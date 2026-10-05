SELECT
  x_1.value AS x
FROM
  JSON_EACH(JSON_ARRAY(5, 3, 9, 1, 7)) as x_1 ORDER BY x;
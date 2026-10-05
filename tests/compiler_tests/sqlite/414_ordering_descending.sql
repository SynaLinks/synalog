SELECT
  x_1.value AS x
FROM
  JSON_EACH(JSON_ARRAY(2, 3, 1)) as x_1 ORDER BY x desc;
SELECT
  x_1.value AS x,
  'one' AS label
FROM
  JSON_EACH(JSON_ARRAY(1)) as x_1;
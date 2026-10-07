SELECT
  x_3.value AS x,
  CASE WHEN (x_3.value = 1) THEN 'one' WHEN (x_3.value = 2) THEN 'two' ELSE 'many' END AS w
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_3 ORDER BY x;
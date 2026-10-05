SELECT
  x_4.value AS x,
  (CAST(x_4.value AS REAL) / ((SELECT
  SUM(MagicalEntangle(x_9.value, x_7.value)) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_7, JSON_EACH(JSON_ARRAY(1, 3)) as x_9))) AS s
FROM
  JSON_EACH(JSON_ARRAY(1, 3)) as x_4 ORDER BY x NULLS LAST;
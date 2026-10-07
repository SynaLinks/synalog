SELECT
  x_3.value AS x,
  CASE WHEN (x_3.value < 0) THEN 0 WHEN (x_3.value > 10) THEN 10 ELSE x_3.value END AS c
FROM
  JSON_EACH(JSON_ARRAY(-5, 5, 15)) as x_3 ORDER BY x;
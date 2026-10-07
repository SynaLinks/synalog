SELECT
  x_3.value AS x,
  CASE WHEN (((x_3.value > 1) AND (x_3.value < 4)) OR (x_3.value = 10)) THEN 1 ELSE 0 END AS y
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 10)) as x_3 ORDER BY x;
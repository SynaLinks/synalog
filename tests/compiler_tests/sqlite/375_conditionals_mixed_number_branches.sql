SELECT
  x_3.value AS x,
  CASE WHEN (x_3.value > 0) THEN 1.5 ELSE 2 END AS y
FROM
  JSON_EACH(JSON_ARRAY(-1, 1)) as x_3 ORDER BY x;
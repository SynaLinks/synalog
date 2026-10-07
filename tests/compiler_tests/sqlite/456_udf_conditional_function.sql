SELECT
  x_7.value AS x,
  CASE WHEN (x_7.value > 0) THEN 1 WHEN (x_7.value < 0) THEN -1 ELSE 0 END AS s
FROM
  JSON_EACH(JSON_ARRAY(-2, 0, 5)) as x_7 ORDER BY x NULLS LAST;
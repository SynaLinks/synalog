SELECT
  x_3.value AS x,
  (((x_3.value) - (3) * CAST((x_3.value) / NULLIF(3, 0) AS INTEGER))) AS r
FROM
  JSON_EACH(JSON_ARRAY(-7, 7)) as x_3 ORDER BY x NULLS LAST;
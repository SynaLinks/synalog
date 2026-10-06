SELECT
  x_6.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4)) as x_6
WHERE
  (true = ((((x_6.value) - (2) * CAST((x_6.value) / NULLIF(2, 0) AS INTEGER))) = 0)) ORDER BY x NULLS LAST;
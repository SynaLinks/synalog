SELECT
  x_3.value AS x,
  (CASE (x_3.value > 2) WHEN 1 THEN 'true' WHEN 0 THEN 'false' END) AS t
FROM
  JSON_EACH(JSON_ARRAY(1, 3)) as x_3 ORDER BY x NULLS LAST;
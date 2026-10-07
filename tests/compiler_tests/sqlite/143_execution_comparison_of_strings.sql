SELECT
  x_3.value AS d
FROM
  JSON_EACH(JSON_ARRAY('2026-01-05', '2026-03-01')) as x_3
WHERE
  (x_3.value < '2026-02-01');
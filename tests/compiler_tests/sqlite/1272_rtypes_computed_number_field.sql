SELECT
  ((2) * (x_1.value)) AS n
FROM
  JSON_EACH(JSON_ARRAY(100, 9, 10)) as x_1 ORDER BY n;
SELECT
  x_1.value AS n
FROM
  JSON_EACH(JSON_ARRAY(100, 9, 10)) as x_1
WHERE
  (x_1.value > 9) ORDER BY n;
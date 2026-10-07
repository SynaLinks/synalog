SELECT
  x_1.value AS n
FROM
  JSON_EACH(JSON_ARRAY(10, 9)) as x_1
WHERE
  ((x_1.value > 9) = true);
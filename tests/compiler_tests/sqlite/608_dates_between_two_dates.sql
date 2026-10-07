SELECT
  x_3.value AS d
FROM
  JSON_EACH(JSON_ARRAY('2024-01-31', '2024-02-15', '2024-03-01')) as x_3
WHERE
  (x_3.value >= '2024-02-01') AND
  (x_3.value < '2024-03-01');
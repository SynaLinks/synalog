SELECT
  SUM(x_2.value) AS t
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_2
WHERE
  (x_2.value > 10);
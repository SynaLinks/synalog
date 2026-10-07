SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 10)) as x_3
WHERE
  ((x_3.value > 1) AND ((x_3.value < 4) OR (x_3.value = 10))) ORDER BY x;
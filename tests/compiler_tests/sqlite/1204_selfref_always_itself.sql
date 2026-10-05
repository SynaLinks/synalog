SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(0, 1, 2, 4)) as x_3
WHERE
  (x_3.value = ((((2) * (x_3.value))) - (x_3.value))) ORDER BY x;
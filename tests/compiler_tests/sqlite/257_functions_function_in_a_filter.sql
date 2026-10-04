SELECT
  x_6.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4)) as x_6
WHERE
  (((x_6.value) * (x_6.value)) > 5) ORDER BY x;
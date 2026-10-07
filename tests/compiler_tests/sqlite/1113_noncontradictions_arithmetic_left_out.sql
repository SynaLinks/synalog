SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3
WHERE
  (((x_3.value) + (1)) > x_3.value) ORDER BY x;
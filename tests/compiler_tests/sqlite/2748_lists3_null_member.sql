SELECT
  x_1.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, null, 3)) as x_1
WHERE
  (x_1.value IS NOT null) ORDER BY x;
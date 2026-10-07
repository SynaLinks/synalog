SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(4, 16)) as x_3
WHERE
  (SQRT(x_3.value) > 3);
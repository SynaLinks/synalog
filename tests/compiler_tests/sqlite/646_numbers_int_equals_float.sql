SELECT
  2.0 AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3
WHERE
  (x_3.value = 2.0);
SELECT
  2 AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_3
WHERE
  (x_3.value = 2) AND
  (2 = 2.0);
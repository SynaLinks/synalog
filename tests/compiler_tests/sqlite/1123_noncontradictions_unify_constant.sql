SELECT
  2 AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3
WHERE
  (2 > 1) AND
  (x_3.value = 2);
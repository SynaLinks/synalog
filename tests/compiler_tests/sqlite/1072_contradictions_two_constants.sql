SELECT
  1 AS k
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3
WHERE
  (x_3.value = 1) AND
  (1 = 2);
SELECT
  x_7.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4)) as x_7
WHERE
  ((((x_7.value) % (2)) = 0) AND (x_7.value > 2));
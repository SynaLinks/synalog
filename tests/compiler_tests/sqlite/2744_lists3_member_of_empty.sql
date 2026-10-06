SELECT
  x_2.value AS x
FROM
  JSON_EACH(JSON_ARRAY()) as x_2
WHERE
  (1 = x_2.value);
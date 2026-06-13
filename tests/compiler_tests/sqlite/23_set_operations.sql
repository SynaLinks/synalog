SELECT
  x_6.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5)) as x_6, JSON_EACH(JSON_ARRAY(3, 4, 5, 6, 7)) as x_8
WHERE
  (x_8.value = x_6.value) ORDER BY x;
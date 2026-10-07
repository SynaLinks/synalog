SELECT
  x_2.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_2, JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_4
WHERE
  (x_4.value = x_2.value) ORDER BY x;
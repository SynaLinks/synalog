SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3, JSON_EACH(JSON_ARRAY(1, 2)) as x_6
WHERE
  (2 = x_6.value) ORDER BY x;
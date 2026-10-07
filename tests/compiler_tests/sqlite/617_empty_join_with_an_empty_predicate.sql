SELECT
  x_4.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_4, JSON_EACH(JSON_ARRAY(1)) as x_6
WHERE
  (x_6.value > 5) AND
  (x_6.value = x_4.value) ORDER BY x;
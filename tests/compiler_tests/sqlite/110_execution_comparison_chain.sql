SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5)) as x_3
WHERE
  (x_3.value > 2) AND
  (x_3.value <= 4) ORDER BY x;
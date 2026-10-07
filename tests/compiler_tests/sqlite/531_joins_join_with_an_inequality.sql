SELECT
  x_5.value AS a,
  x_7.value AS b
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_5, JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_7
WHERE
  (x_7.value > x_5.value) ORDER BY a, b;
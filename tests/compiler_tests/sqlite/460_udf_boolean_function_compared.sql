SELECT
  x_6.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4)) as x_6
WHERE
  (true = (((x_6.value) % (2)) = 0)) ORDER BY x;
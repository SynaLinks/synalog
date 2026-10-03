SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4)) as x_3
WHERE
  (IN_LIST(x_3.value, JSON_ARRAY(2, 4))) ORDER BY x;
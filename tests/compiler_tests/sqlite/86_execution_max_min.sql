SELECT
  MIN(x_2.value) AS lo,
  MAX(x_2.value) AS hi
FROM
  JSON_EACH(JSON_ARRAY(4, 1, 9, 7)) as x_2;
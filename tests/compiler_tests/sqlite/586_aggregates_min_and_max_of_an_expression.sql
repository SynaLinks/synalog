SELECT
  MIN(x_2.value) AS lo,
  MAX(- ((x_2.value) * (-1))) AS hi
FROM
  JSON_EACH(JSON_ARRAY(-3, 1, 3)) as x_2;
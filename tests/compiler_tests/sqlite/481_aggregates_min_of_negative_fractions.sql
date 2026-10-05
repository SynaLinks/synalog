SELECT
  MIN(x_2.value) AS m
FROM
  JSON_EACH(JSON_ARRAY(-1.5, -2.5, 0.5)) as x_2;
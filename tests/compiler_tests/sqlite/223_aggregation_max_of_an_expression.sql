SELECT
  MAX(((x_2.value) * (x_2.value))) AS m
FROM
  JSON_EACH(JSON_ARRAY(1, -3, 2)) as x_2;
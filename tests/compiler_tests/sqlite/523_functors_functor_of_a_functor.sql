SELECT
  ((2) * (((2) * (x_7.value)))) AS y
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_7 ORDER BY y;
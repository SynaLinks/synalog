SELECT
  ((2) * (x_2.value)) AS y
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_2 ORDER BY y desc;
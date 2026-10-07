SELECT
  SUM(((x_5.value) * (x_5.value))) AS t
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_5;
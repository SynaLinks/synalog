SELECT
  AVG(x_2.value) AS m
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4)) as x_2;
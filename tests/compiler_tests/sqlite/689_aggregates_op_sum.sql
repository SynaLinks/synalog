SELECT
  SUM(x_2.value) AS v
FROM
  JSON_EACH(JSON_ARRAY(4, 1, 7, 1)) as x_2;
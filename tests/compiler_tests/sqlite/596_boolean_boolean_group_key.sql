SELECT
  (x_2.value > 3) AS big,
  SUM(1) AS n
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 5)) as x_2
GROUP BY (x_2.value > 3) ORDER BY big;
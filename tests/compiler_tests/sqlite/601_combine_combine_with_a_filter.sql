SELECT
  (SELECT
  SUM(MagicalEntangle(x_6.value, x_4.value)) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_4, JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_6
WHERE
  (x_6.value > 1)) AS t;
SELECT
  (SELECT
  SUM(MagicalEntangle(1, x_5.value)) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_5, JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_7, JSON_EACH(JSON_ARRAY(2, 3, 4)) as x_9
WHERE
  (x_9.value = x_7.value)) AS n;
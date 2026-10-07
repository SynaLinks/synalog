SELECT
  (SELECT
  MAX(MagicalEntangle(x_6.value, x_4.value)) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_4, JSON_EACH(JSON_ARRAY(4, 9, 2)) as x_6) AS m;
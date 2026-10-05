SELECT
  (SELECT
  SUM(MagicalEntangle(1, x_4.value)) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_4, JSON_EACH(JSON_ARRAY(5, 6, 7)) as x_6) AS n;
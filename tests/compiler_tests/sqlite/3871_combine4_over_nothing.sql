SELECT
  (SELECT
  SUM(MagicalEntangle(1, x_4.value)) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_4
WHERE
  (1 > 5)) AS s,
  (SELECT
  MAX(MagicalEntangle(1, x_7.value)) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_7
WHERE
  (1 > 5)) AS m;
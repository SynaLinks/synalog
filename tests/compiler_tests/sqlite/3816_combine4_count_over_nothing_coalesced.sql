SELECT
  COALESCE((SELECT
  SUM(MagicalEntangle(1, x_3.value)) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_3
WHERE
  (1 > 5)), 0) AS n;
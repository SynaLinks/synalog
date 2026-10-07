SELECT
  SUM(x_2.value) AS t
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_2
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_5.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_5
  WHERE
    (x_2.value = 2)) IS NULL);
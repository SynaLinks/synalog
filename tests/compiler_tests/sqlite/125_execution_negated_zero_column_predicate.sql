SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_5.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_5, JSON_EACH(JSON_ARRAY(1, 2)) as x_8
  WHERE
    (2 = x_8.value)) IS NULL);
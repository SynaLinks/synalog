SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_6.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_6, JSON_EACH(JSON_ARRAY(0)) as x_8
  WHERE
    (x_8.value > 1) AND
    (x_3.value = x_8.value)) IS NULL) ORDER BY x;
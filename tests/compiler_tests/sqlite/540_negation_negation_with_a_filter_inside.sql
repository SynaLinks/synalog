SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_3
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_6.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_10, JSON_EACH(JSON_ARRAY(0)) as x_6
  WHERE
    (x_3.value > 2) AND
    (x_3.value = x_10.value)) IS NULL) ORDER BY x;
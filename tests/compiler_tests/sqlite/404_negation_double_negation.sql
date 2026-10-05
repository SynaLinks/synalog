WITH t_0_NotB AS (SELECT
  x_10.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_10
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_13.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_13
  WHERE
    (x_10.value = 2)) IS NULL))
SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_6.value)) AS logica_value
  FROM
    t_0_NotB AS NotB, JSON_EACH(JSON_ARRAY(0)) as x_6
  WHERE
    (NotB.x = x_3.value)) IS NULL);
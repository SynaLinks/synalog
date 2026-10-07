WITH t_2_NotA AS (SELECT
  x_17.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_17
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_20.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_20
  WHERE
    (x_17.value = 1)) IS NULL)),
t_0_NotNotA AS (SELECT
  x_10.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_10
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_13.value)) AS logica_value
  FROM
    t_2_NotA AS NotA, JSON_EACH(JSON_ARRAY(0)) as x_13
  WHERE
    (NotA.x = x_10.value)) IS NULL))
SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_6.value)) AS logica_value
  FROM
    t_0_NotNotA AS NotNotA, JSON_EACH(JSON_ARRAY(0)) as x_6
  WHERE
    (NotNotA.x = x_3.value)) IS NULL);
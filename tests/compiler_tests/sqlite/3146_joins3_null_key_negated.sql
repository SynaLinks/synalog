SELECT
  1 AS a
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_5.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_5
  WHERE
    (null = null)) IS NULL);
SELECT
  SUM(1) AS n
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_1.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_1) IS NULL);
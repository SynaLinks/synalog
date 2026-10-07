SELECT
  1 AS a
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (null = null)) IS NULL);
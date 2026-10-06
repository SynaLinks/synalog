SELECT
  1 AS a,
  2 AS b
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (null = null);
SELECT
  1 AS a,
  2 AS b,
  3 AS c
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (null = null);
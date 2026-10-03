SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (ABS(((0.1) + (((0.2) - (0.3))))) < 0.000001);
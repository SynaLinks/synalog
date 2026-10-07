SELECT
  1 AS x
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  (ABS(((0.1E0) + (((0.2E0) - (0.3E0))))) < 0.000001E0);
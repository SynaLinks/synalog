SELECT
  "a" AS k,
  MIN(7) AS v
FROM
  (SELECT 'singleton' as s) as unused_singleton
GROUP BY 1;
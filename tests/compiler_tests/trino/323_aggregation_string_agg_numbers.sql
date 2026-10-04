SELECT
  (CASE WHEN COUNT(7) > 0 THEN ARRAY_JOIN(ARRAY_AGG(CAST(7 AS VARCHAR)), ',') END) AS s
FROM
  (SELECT 'singleton' as s) as unused_singleton;
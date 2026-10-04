SELECT
  (CASE WHEN COUNT(7) > 0 THEN ARRAY_JOIN(COLLECT_LIST(CAST(7 AS STRING)), ',') END) AS s
FROM
  (SELECT 'singleton' as s) as unused_singleton;
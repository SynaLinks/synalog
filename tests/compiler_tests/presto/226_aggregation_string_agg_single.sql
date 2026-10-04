SELECT
  (CASE WHEN COUNT('only') > 0 THEN ARRAY_JOIN(ARRAY_AGG(CAST('only' AS VARCHAR)), ',') END) AS s
FROM
  (SELECT 'singleton' as s) as unused_singleton;
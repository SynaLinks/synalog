SELECT
  (CASE WHEN COUNT("only") > 0 THEN ARRAY_JOIN(COLLECT_LIST(CAST("only" AS STRING)), ',') END) AS s
FROM
  (SELECT 'singleton' as s) as unused_singleton;
SELECT
  STRING_AGG(CAST("only" AS STRING), ',') AS s
FROM
  (SELECT 'singleton' as s) as unused_singleton;
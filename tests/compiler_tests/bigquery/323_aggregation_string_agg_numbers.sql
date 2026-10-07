SELECT
  STRING_AGG(CAST(7 AS STRING), ',') AS s
FROM
  (SELECT 'singleton' as s) as unused_singleton;